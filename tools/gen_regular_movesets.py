#!/usr/bin/env python3
"""
Generate competitive "boss-lite" movesets for every *regular* trainer battle
and write them into data/trainers/special_moves.asm.

Phase 4 of the trainer overhaul (see docs/trainer_overhaul_phase4.html). Boss
trainers (gym leaders / Elite Four / Champion / rival) and the two hand-authored
vanilla-quirk blocks (Bug Catcher #15, Youngster #14) are preserved verbatim;
everything else is (re)generated here.

Doctrine, per non-boss / non-Unused Pokemon, using only moves legal for the
species at its level (level-1 learnset + level-up moves <= level + TM/HM pool):
  1. best STAB damaging move in the mon's stronger attacking category
  2. best off-type coverage damaging move
  3. next-best damaging move (often a 2nd STAB / 2nd coverage)
  4. one good stat/status utility move if available and >=2 damaging moves kept,
     otherwise another damaging move
Mons whose entire legal pool is < 4 moves (Caterpie/Metapod/Weedle/Kakuna/
Magikarp) are exempt and keep their engine default.

Overrides are emitted *surgically*: only slots that differ from the engine's
default WriteMonMoves output, laid out to preserve kept default moves in place,
so the SpecialTrainerMoves table stays as small as possible.

Reuses the parsers in gen_pokemon_docs.py / gen_trainer_docs.py. Rerun after
changing trainer, move, or Pokemon data:  python3 tools/gen_regular_movesets.py
"""
import os, re
import gen_pokemon_docs as pk
import gen_trainer_docs as td

REPO = pk.REPO
OUT = os.path.join(REPO, "data", "trainers", "special_moves.asm")

BOSS = {"BROCK", "MISTY", "LT_SURGE", "ERIKA", "KOGA", "SABRINA", "BLAINE",
        "GIOVANNI", "LORELEI", "BRUNO", "AGATHA", "LANCE",
        "RIVAL1", "RIVAL2", "RIVAL3", "PROF_OAK"}
# hand-authored blocks kept verbatim (class_const, trainer_id)
PRESERVE_IDS = {("BUG_CATCHER", 15), ("YOUNGSTER", 14)}

# ------------------------------------------------------------ move helpers
def is_damaging(mv, moves):
    m = moves.get(mv)
    return (bool(m) and m["power"] > 0 and m["cat"] in ("Physical", "Special")
            and m["effect"] != "EXPLODE_EFFECT")  # never auto-pick self-KO

def power_cap(level):
    """level-appropriate ceiling so low-level mons don't get 120-power TMs."""
    for lv, cap in ((15, 60), (22, 75), (30, 85), (38, 95), (46, 110)):
        if level <= lv:
            return cap
    return 130

UTIL_THRESHOLD = 50   # ignore weak single-stage -1 debuffs (Leer/Growl/Tail Whip)

def util_score(mv, moves, phys):
    """desirability of a stat/status utility move; <=0 means 'not worth a slot'."""
    e = moves[mv]["effect"]
    tbl = {
        "SLEEP_EFFECT": 95,
        "ATTACK_UP2_EFFECT": 90 if phys else 40,
        "SPECIAL_UP2_EFFECT": 90 if not phys else 40,
        "SPEED_UP2_EFFECT": 85,
        "PARALYZE_EFFECT": 80,
        "DEFENSE_DOWN2_EFFECT": 70 if phys else 45,
        "ATTACK_UP1_EFFECT": 65 if phys else 28,
        "SPECIAL_UP1_EFFECT": 65 if not phys else 28,
        "LEECH_SEED_EFFECT": 60,
        "ACCURACY_DOWN1_EFFECT": 55,
        "CONFUSION_EFFECT": 50,
        "DEFENSE_UP2_EFFECT": 48,
        "POISON_EFFECT": 46,
        "DEFENSE_DOWN1_EFFECT": 44,
        "SPEED_DOWN1_EFFECT": 40,
        "ATTACK_DOWN1_EFFECT": 36,
        "DEFENSE_UP1_EFFECT": 34,
    }
    return tbl.get(e, -1)

def natural_pool(mon, level):
    """moves the mon learns by level-up at/below its level (thematic pool)."""
    pool = set(mon["lvl1"])
    for lvl, mv in mon["learnset"]:
        if lvl <= level:
            pool.add(mv)
    return pool

def legal_pool(mon, level):
    return natural_pool(mon, level) | set(mon["tms"])

# ------------------------------------------------------------ doctrine
def choose_moves(mon, level, moves):
    """return an ordered list of up to 4 move consts for this mon.

    Natural (level-up) moves are strongly preferred over TMs so sets stay
    thematic and level-appropriate; TMs fill gaps or supply a missing
    STAB/coverage. All damaging picks respect a level-based power cap (STAB
    is always guaranteed even if its only option is over the cap)."""
    natural = {mv for mv in natural_pool(mon, level) if mv in moves}
    full = {mv for mv in legal_pool(mon, level) if mv in moves}
    tm_only = full - natural
    atk, spa = mon["stats"][1], mon["stats"][4]
    phys = atk >= spa
    types = {mon["types"][0], mon["types"][1]}
    cap = power_cap(level)

    def dscore(mv):
        m = moves[mv]
        stab = m["type"] in types
        catmatch = (m["cat"] == "Physical") == phys
        nat = mv in natural
        return (min(m["power"], cap) + (25 if stab else 0)
                + (12 if catmatch else 0) + (40 if nat else 0))

    def dmg_from(src, capped=True):
        out = [mv for mv in src if is_damaging(mv, moves)
               and (not capped or moves[mv]["power"] <= cap)]
        out.sort(key=lambda mv: (-dscore(mv), mv))
        return out

    picks = []
    capped_dmg = dmg_from(natural) + dmg_from(tm_only)

    # 1) STAB — natural first, then TM. Only reach past the level cap for STAB if
    # the mon has no capped damaging move at all (else a capped move is better).
    def best_stab(cands):
        s = [mv for mv in cands if moves[mv]["type"] in types]
        return s[0] if s else None
    stab = best_stab(dmg_from(natural)) or best_stab(dmg_from(tm_only))
    if not stab and not capped_dmg:
        stab = best_stab(dmg_from(full, capped=False))
    if stab:
        picks.append(stab)

    # 2) coverage — best off-type damaging, natural first
    covered = {moves[m]["type"] for m in picks}
    for src in (dmg_from(natural), dmg_from(tm_only)):
        got = next((mv for mv in src if mv not in picks
                    and moves[mv]["type"] not in covered), None)
        if got:
            picks.append(got)
            break

    # 3) next-best damaging, natural first
    for src in (dmg_from(natural), dmg_from(tm_only)):
        for mv in src:
            if len(picks) >= 3:
                break
            if mv not in picks:
                picks.append(mv)
    picks = picks[:3]

    # 4) one meaningful utility move (natural preferred), if offense intact
    def utils_from(src):
        u = [mv for mv in src if mv not in picks
             and util_score(mv, moves, phys) >= UTIL_THRESHOLD]
        u.sort(key=lambda mv: (-util_score(mv, moves, phys), mv))
        return u
    ndmg = sum(1 for p in picks if is_damaging(p, moves))
    if ndmg >= 2 and len(picks) < 4:
        util = next(iter(utils_from(natural) or utils_from(tm_only)), None)
        if util:
            picks.append(util)

    # fill remaining slots. Prefer capped moves — damage first, then any legal
    # move (even a weak status move) — over an over-cap "nuke"; only reach past
    # the cap as a last resort, so low-level mons keep level-appropriate sets.
    def capped_any(src):
        return [mv for mv in src if moves.get(mv, {}).get("power", 0) <= cap]
    for src in (dmg_from(natural), dmg_from(tm_only),
                capped_any(sorted(natural)), capped_any(sorted(tm_only)),
                dmg_from(full, capped=False), sorted(natural), sorted(tm_only)):
        for mv in src:
            if len(picks) >= 4:
                break
            if mv not in picks:
                picks.append(mv)
    return picks[:4]

def assign_slots(default, target):
    """place `target` moves into 4 slots, keeping default moves that survive in
    their original slot, to minimise the diff vs. the engine default.
    returns final[0..3] (move const or None)."""
    d = len(default)
    final = [None, None, None, None]
    for k in range(4):
        dk = default[k] if k < d else None
        if dk is not None and dk in target:
            final[k] = dk
    need = [m for m in target if m not in default]
    empties = [k for k in range(4) if final[k] is None]
    empties.sort(key=lambda k: (k < d, k))  # originally-empty slots first
    for m in need:
        if empties:
            final[empties.pop(0)] = m
    return final

# ------------------------------------------------------------ file surgery
BLOCK_HEAD = re.compile(r"^\s*db\s+([A-Z_][A-Z0-9_]*)\s*,\s*(\d+)\s*$")

def split_existing():
    """return (header_text, {(class,id): raw_block_text}, footer_text)."""
    text = pk.read("data/trainers/special_moves.asm")
    lines = text.splitlines()
    # header: up through the 'SpecialTrainerMoves:' label line
    hi = next(i for i, l in enumerate(lines) if l.strip() == "SpecialTrainerMoves:")
    header = "\n".join(lines[:hi + 1])
    footer = "\tdb -1 ; end"
    blocks = {}
    i = hi + 1
    cur_key, cur = None, []
    for l in lines[i:]:
        if l.strip() == "db -1 ; end" or l.strip() == "db -1":
            break
        m = BLOCK_HEAD.match(l)
        if m:
            if cur_key is not None:
                blocks[cur_key] = "\n".join(cur).rstrip("\n")
            cur_key = (m.group(1), int(m.group(2)))
            cur = [l]
        elif cur_key is not None:
            cur.append(l)
    if cur_key is not None:
        blocks[cur_key] = "\n".join(cur).rstrip("\n")
    return header, blocks, footer

def gen_block(const, tid, mons, moves, bykey):
    """generate a raw special_moves block for a regular trainer, or None."""
    lines_out = []
    for pos, (lvl, sp) in enumerate(mons, 1):
        mon = bykey.get(pk.norm(sp))
        if not mon:
            continue
        pool = legal_pool(mon, lvl)
        if len(pool) < 4:            # exempt: can't reach 4 legal moves
            continue
        default = td.default_moves(mon, lvl)
        target = choose_moves(mon, lvl, moves)
        if len(target) < 4:
            continue
        if set(target) == set(default):
            continue                 # already optimal, no override needed
        final = assign_slots(default, target)
        for slot in range(4):
            dk = default[slot] if slot < len(default) else None
            if final[slot] is not None and final[slot] != dk:
                lines_out.append("\tdb %d, %d, %s" % (pos, slot + 1, final[slot]))
    if not lines_out:
        return None
    return "\tdb %s, %d\n%s\n\tdb 0" % (const, tid, "\n".join(lines_out))

def main():
    moves = pk.parse_moves()
    tmhm = pk.parse_tmhm()
    _, bykey = pk.parse_pokemon(moves, tmhm)
    consts, _ = td.parse_class_names()
    classes = td.parse_parties()
    label_to_const = dict(zip([l for l, _ in classes], consts))
    const_order = {c: i for i, c in enumerate(consts)}

    header, existing, footer = split_existing()

    # start from preserved (boss + quirk) blocks
    out_blocks = {}
    for key, raw in existing.items():
        cls, _tid = key
        if cls in BOSS or key in PRESERVE_IDS:
            out_blocks[key] = raw

    stats = {"mons": 0, "changed_mons": 0, "overrides": 0, "blocks": 0, "exempt": 0}
    for label, parties in classes:
        const = label_to_const[label]
        if const in BOSS:
            continue
        for tid, (loc, mons) in enumerate(parties, 1):
            if loc == "Unused":
                continue
            if (const, tid) in PRESERVE_IDS:
                continue
            blk = gen_block(const, tid, mons, moves, bykey)
            for lvl, sp in mons:
                mon = bykey.get(pk.norm(sp))
                if not mon:
                    continue
                stats["mons"] += 1
                if len(legal_pool(mon, lvl)) < 4:
                    stats["exempt"] += 1
            if blk:
                out_blocks[(const, tid)] = blk
                stats["blocks"] += 1
                stats["overrides"] += blk.count("\n\tdb ") + 1 - 1  # rough; recomputed below

    # order blocks by (class order, trainer id)
    ordered = sorted(out_blocks.items(),
                     key=lambda kv: (const_order.get(kv[0][0], 999), kv[0][1]))
    body = "\n\n".join(raw for _, raw in ordered)
    text = header + "\n\n" + body + "\n\n" + footer + "\n"

    # accurate override-line count
    ov_lines = sum(1 for _, raw in ordered for l in raw.splitlines()
                   if re.match(r"\s*db\s+\d+\s*,\s*\d+\s*,", l))
    est_bytes = sum(len(raw.splitlines()) - 1 for _, raw in ordered) + 3

    with open(OUT, "w") as f:
        f.write(text)
    print("wrote %s" % OUT)
    print("  blocks: %d   override lines: %d   ~table bytes: %d"
          % (len(ordered), ov_lines, est_bytes * 3 // 3))
    print("  non-boss mons scanned: %d   exempt (pool<4): %d"
          % (stats["mons"], stats["exempt"]))

if __name__ == "__main__":
    main()
