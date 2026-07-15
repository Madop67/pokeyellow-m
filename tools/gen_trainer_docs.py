#!/usr/bin/env python3
"""
Generate docs/trainer_reference.md from the repository's data files.

Lists every trainer in the game (not just bosses): their class, location,
party, each Pokemon's level and types, and the exact moveset each Pokemon
will use in battle. Movesets are computed the same way the engine builds
them: start from the species' level-1 learnset, apply level-up moves up to
the Pokemon's level (WriteMonMoves in engine/pokemon/evos_moves.asm), then
apply any per-slot overrides from data/trainers/special_moves.asm.

Reuses the parsers in gen_pokemon_docs.py, so rerun both after changing any
Pokemon/move/trainer data:  python3 tools/gen_trainer_docs.py
"""
import os, re
import gen_pokemon_docs as pk

REPO = pk.REPO
OUT = os.path.join(REPO, "docs", "trainer_reference.md")

# ------------------------------------------------------------ class names
def parse_class_names():
    """class constant -> display name, in trainer-constant order."""
    consts = re.findall(r"trainer_const (\w+)", pk.read("constants/trainer_constants.asm"))
    consts = [c for c in consts if c != "NOBODY"]
    names = re.findall(r'\tli "([^"]+)"', pk.read("data/trainers/names.asm"))
    assert len(consts) == len(names), (len(consts), len(names))
    fixes = {
        "LT.SURGE": "Lt. Surge", "PROF.OAK": "Prof. Oak",
        "JR.TRAINER♂": "Jr. Trainer♂", "JR.TRAINER♀": "Jr. Trainer♀",
        "POKéMANIAC": "Poké Maniac",
        "COOLTRAINER♂": "Cooltrainer♂", "COOLTRAINER♀": "Cooltrainer♀",
    }
    disp = {}
    for const, nm in zip(consts, names):
        disp[const] = fixes.get(nm, nm.title())
    # UNUSED_JUGGLER and JUGGLER both read "JUGGLER"; disambiguate the unused one
    disp["UNUSED_JUGGLER"] = "Juggler (unused class)"
    # the rival's name is chosen at runtime; label the three stages clearly
    disp["RIVAL1"] = "Rival (early)"
    disp["RIVAL2"] = "Rival (Silph/mid)"
    disp["RIVAL3"] = "Rival (Champion)"
    return consts, disp

# ------------------------------------------------------------ special moves
def parse_special_moves():
    """(class_const, trainer_id) -> {mon_pos: {move_slot: MOVE_CONST}}"""
    text = pk.read("data/trainers/special_moves.asm")
    overrides = {}
    cur = None
    for raw in text.splitlines():
        line = raw.split(";", 1)[0].strip()
        m = re.match(r"db\s+(.+)$", line)
        if not m:
            continue
        toks = [t.strip() for t in m.group(1).split(",")]
        if toks == ["-1"]:
            break
        if len(toks) == 1:            # "db 0" - end of a trainer block
            cur = None
            continue
        if not toks[0].lstrip("-").isdigit():  # header: "db CLASS, id"
            cur = (toks[0], int(toks[1]))
            overrides.setdefault(cur, {})
            continue
        pos, slot, move = int(toks[0]), int(toks[1]), toks[2]  # move line
        overrides[cur].setdefault(pos, {})[slot] = move
    return overrides

# ------------------------------------------------------------ parties
def parse_parties():
    """ordered list of (class_label, [party, ...]); party = (location, [(lvl, species), ...])"""
    text = pk.read("data/trainers/parties.asm")
    # class data order follows the TrainerDataPointers table (== constant order)
    ptr_order = re.findall(r"\tdw (\w+)Data\b", text)
    parts = re.split(r"(?m)^(\w+)Data:\n", text)
    bodies = {}
    for i in range(1, len(parts), 2):
        bodies[parts[i]] = parts[i + 1]

    classes = []
    for label in ptr_order:
        body = bodies.get(label, "")
        parties = []
        location = ""
        for raw in body.splitlines():
            if raw.startswith(("TrainerDataPointers", "\tdw", "\ttable_width")):
                continue
            stripped = raw.strip()
            if stripped.startswith(";"):
                location = stripped.lstrip("; ").rstrip()
                continue
            m = re.match(r"db\s+(.+)$", stripped)
            if not m:
                continue
            data, _, inline = m.group(1).partition(";")
            loc = inline.strip() if inline.strip() else location
            toks = [t.strip() for t in data.split(",") if t.strip() != ""]
            if toks and toks[-1] == "0":
                toks = toks[:-1]
            if not toks:
                continue
            mons = []
            if toks[0] == "$FF":
                it = toks[1:]
                for j in range(0, len(it) - 1, 2):
                    mons.append((int(it[j]), it[j + 1]))
            else:
                lvl = int(toks[0])
                for sp in toks[1:]:
                    mons.append((lvl, sp))
            parties.append((loc, mons))
        classes.append((label, parties))
    return classes

# ------------------------------------------------------------ moveset calc
def default_moves(mon, level):
    """replicate WriteMonMoves: level-1 learnset, then level-up moves <= level."""
    slots = [m for m in mon["lvl1"]][:4]
    for lvl, mv in mon["learnset"]:
        if lvl > level:
            break
        if mv in slots:
            continue
        if len(slots) < 4:
            slots.append(mv)
        else:
            slots.pop(0)
            slots.append(mv)
    return slots

def moveset(mon, level, ov):
    """list of (move_const or None, is_override) for the 4 slots."""
    base = default_moves(mon, level)
    out = []
    for s in range(1, 5):
        if ov and s in ov:
            out.append((ov[s], True))
        elif s - 1 < len(base):
            out.append((base[s - 1], False))
        else:
            out.append((None, False))
    return out

# ------------------------------------------------------------ rendering
def species_name(bykey, const):
    mon = bykey.get(pk.norm(const))
    return mon["name"] if mon else const.title()

def type_of(bykey, const):
    mon = bykey.get(pk.norm(const))
    if not mon:
        return "?"
    t1, t2 = mon["types"]
    d = pk.TYPE_DISPLAY
    return d[t1] if t1 == t2 else "%s/%s" % (d[t1], d[t2])

def move_cell(moves, slots):
    parts = []
    for const, is_ov in slots:
        if const is None or const == "NO_MOVE":
            continue
        nm = moves[const]["name"] if const in moves else const.title()
        parts.append("**%s**" % nm if is_ov else nm)
    return " · ".join(parts) if parts else "—"

INTRO = """\
# Pokémon Chromatic Yellow — Trainer Reference

Every trainer battle in the game: class, location, party, and the exact
moveset each Pokémon uses. This complements `pokemon_reference.md` (which
covers species, learnsets, and moves).

**How movesets are computed.** Each Pokémon starts from its species'
level-1 learnset, then learns level-up moves up to its own level (the
`WriteMonMoves` routine), keeping the most recent four. Boss trainers and a
few others then override individual slots via
`data/trainers/special_moves.asm`. In the tables below, a move in **bold**
is one of those explicit overrides; the rest are the level-up default.

Generated from the game data by `tools/gen_trainer_docs.py` — do not
hand-edit; rerun that script after changing trainer, move, or Pokémon data.
"""

def levels_summary(mons):
    lvls = sorted({lv for lv, _ in mons})
    if len(lvls) == 1:
        return "Lv %d" % lvls[0]
    return "Lv %d–%d" % (lvls[0], lvls[-1])

def main():
    moves = pk.parse_moves()
    tmhm = pk.parse_tmhm()
    _, bykey = pk.parse_pokemon(moves, tmhm)

    consts, disp = parse_class_names()
    overrides = parse_special_moves()
    classes = parse_parties()

    # map each class label (parties order) to its constant (constant order)
    label_to_const = dict(zip([lbl for lbl, _ in classes], consts))

    BOSS = {"BROCK", "MISTY", "LT_SURGE", "ERIKA", "KOGA", "SABRINA",
            "BLAINE", "GIOVANNI", "LORELEI", "BRUNO", "AGATHA", "LANCE",
            "RIVAL3"}

    out = [INTRO]

    # table of contents
    out.append("## Trainer classes\n")
    total = 0
    toc = []
    for label, parties in classes:
        if not parties:
            continue
        const = label_to_const[label]
        total += len(parties)
        star = " ⭐" if const in BOSS else ""
        toc.append("- **%s**%s — %d battle%s" %
                   (disp[const], star, len(parties), "" if len(parties) == 1 else "s"))
    out.append("%d trainer battles across %d classes "
               "(⭐ = boss with fully-specified movesets).\n" %
               (total, len(toc)))
    out.extend(toc)
    out.append("")

    for label, parties in classes:
        if not parties:
            continue
        const = label_to_const[label]
        star = " ⭐" if const in BOSS else ""
        out.append("\n---\n")
        out.append("## %s%s\n" % (disp[const], star))
        for tid, (loc, mons) in enumerate(parties, 1):
            ov_all = overrides.get((const, tid), {})
            head = "### %s #%d" % (disp[const], tid)
            if loc:
                head += " — %s" % loc
            out.append(head)
            out.append("_%s · %d Pokémon_\n" % (levels_summary(mons), len(mons)))
            out.append("| # | Pokémon | Lv | Types | Moves |")
            out.append("|---|---------|----|-------|-------|")
            for pos, (lvl, sp) in enumerate(mons, 1):
                mon = bykey.get(pk.norm(sp))
                if mon:
                    slots = moveset(mon, lvl, ov_all.get(pos))
                    cell = move_cell(moves, slots)
                else:
                    cell = "—"
                out.append("| %d | %s | %d | %s | %s |" %
                           (pos, species_name(bykey, sp), lvl,
                            type_of(bykey, sp), cell))
            out.append("")

    with open(OUT, "w") as f:
        f.write("\n".join(out) + "\n")
    print("wrote %s (%d lines, %d battles)" % (OUT, len(out), total))

if __name__ == "__main__":
    main()
