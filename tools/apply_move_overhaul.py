#!/usr/bin/env python3
"""
Apply the move overhaul described by gen_move_overhaul_plan.py /
docs/move_overhaul_plan.md to the game data.

Regenerates:
  constants/move_constants.asm     (new ids, ANIM_* aliases, trimmed special anims)
  constants/item_constants.asm     (new add_tm list)
  data/moves/{moves,names,categories,animations,sfx,grammar,field_moves}.asm
  data/battle_anims/special_effects.asm  (move consts -> ANIM_*)
  data/battle/critical_hit_moves.asm
  data/trainers/special_moves.asm  (cut moves remapped)
  data/pokemon/evos_moves.asm      (new learnsets)
  data/pokemon/base_stats/*.asm    (level-1 moves + tmhm lists)
  scripts//data//engine TM_* item constant renames (slot-preserving)

Surviving vanilla moves keep their move ids. Animation/sound tables keep
rows 1-165 in vanilla order; ANIM_<VANILLA_MOVE> constants name those rows.

Run: python3 tools/apply_move_overhaul.py
"""
import os, re, sys
sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
from gen_move_overhaul_plan import build_plan, read, REPO, GRID, EXTRAS, HIGH_CRIT

def write(path, text):
    with open(os.path.join(REPO, path), "w") as f:
        f.write(text)
    print("wrote", path)

plan = build_plan()
cur = plan["cur_moves"]          # vanilla move data (const -> dict with id)
new = plan["new_moves"]          # new roster (const -> dict)
mons = plan["mons"]
cut_map = plan["cut_map"]
NEW_TMS, NEW_HMS = plan["new_tms"], plan["new_hms"]

vanilla_order = [c for c, m in sorted(cur.items(), key=lambda kv: kv[1]["id"])]
assert len(vanilla_order) == 165, (
    "apply_move_overhaul.py must run against the PRE-overhaul data files. "
    "Restore them first, e.g.:\n"
    "  git checkout <pre-overhaul-commit> -- constants/move_constants.asm "
    "constants/item_constants.asm data/moves data/battle_anims/special_effects.asm "
    "data/battle/critical_hit_moves.asm data/trainers/special_moves.asm "
    "data/pokemon/evos_moves.asm data/pokemon/base_stats")

# ------------------------------------------------------------- id assignment
survivors = [c for c in vanilla_order if c in new]
cut_ids = sorted(cur[c]["id"] for c in vanilla_order if c not in new)
new_consts = [c for c, *_ in GRID if c not in cur]     # in grid order
assert all(c in new for c in new_consts)

move_id = {c: cur[c]["id"] for c in survivors}
free = list(cut_ids)
# Pin FORCE_PALM (animation: MEGA_PUNCH) to Mega Punch's old slot 5: the
# battle core plays animation id 5 as a generic screen-shake
# (ASSERT ANIMATIONTYPE_SHAKE_SCREEN_HORIZONTALLY_LIGHT == FORCE_PALM), so
# that slot must keep pointing at MegaPunchAnim.
assert cur["MEGA_PUNCH"]["id"] == 5 and 5 in free
move_id["FORCE_PALM"] = 5
free.remove(5)
overflow_id = 166
for c in new_consts:
    if c == "FORCE_PALM":
        continue
    if free:
        move_id[c] = free.pop(0)
    else:
        move_id[c] = overflow_id
        overflow_id += 1
assert len(move_id) == len(new)
by_id = {v: k for k, v in move_id.items()}
NUM_MOVES = max(move_id.values())
assert NUM_MOVES == len(new) == 225

# ------------------------------------------------------------- vanilla names
raw_names = re.findall(r'\tli "([^"]+)"', read("data/moves/names.asm"))
assert len(raw_names) == 165
vanilla_name = {vanilla_order[i]: raw_names[i] for i in range(165)}

def move_name(c):
    if c in vanilla_name:
        return vanilla_name[c]
    n = new[c]["name"].upper()
    assert len(n) <= 12, n
    return n

# ------------------------------------------------------------- anim labels
anim_text = read("data/moves/animations.asm")
ptr_rows = re.findall(r"\tdw (\w+)", anim_text)
assert len(ptr_rows) == 202
anim_label = {vanilla_order[i]: ptr_rows[i] for i in range(165)}

# special anims kept (const name, pointer label, comment) — drops the 10
# verified-unused ids: ANIM_A8, ANIM_B2..ANIM_B9, ANIM_BB
SPECIAL_ANIMS = [
    ("SHOWPIC_ANIM",             "ShowPicAnim",          ""),
    ("STATUS_AFFECTED_ANIM",     "EnemyFlashAnim",       ""),
    ("ENEMY_HUD_SHAKE_ANIM",     "EnemyHUDShakeAnim",    ""),
    ("TRADE_BALL_DROP_ANIM",     "TradeBallDropAnim",    ""),
    ("TRADE_BALL_SHAKE_ANIM",    "TradeBallAppear1Anim", ""),
    ("TRADE_BALL_TILT_ANIM",     "TradeBallAppear2Anim", ""),
    ("TRADE_BALL_POOF_ANIM",     "TradeBallPoofAnim",    ""),
    ("XSTATITEM_ANIM",           "XStatItemAnim",        "use X Attack/Defense/Speed/Special"),
    ("XSTATITEM_DUPLICATE_ANIM", "XStatItemAnim",        "enemy variant (XSTATITEM_ANIM + 1)"),
    ("SHRINKING_SQUARE_ANIM",    "ShrinkingSquareAnim",  ""),
    ("ANIM_B1",                  "ShrinkingSquareAnim",  "enemy variant (SHRINKING_SQUARE_ANIM + 1)"),
    ("BURN_PSN_ANIM",            "PoisonAnim",           "plays when a monster is burned or poisoned"),
    ("SLP_PLAYER_ANIM",          "SleepPlayerAnim",      ""),
    ("SLP_ANIM",                 "SleepEnemyAnim",       "sleeping monster"),
    ("CONF_PLAYER_ANIM",         "ConfusedPlayerAnim",   ""),
    ("CONF_ANIM",                "ConfusedEnemyAnim",    "confused monster"),
    ("SLIDE_DOWN_ANIM",          "SlideDownAnim",        ""),
    ("TOSS_ANIM",                "BallTossAnim",         "toss Poké Ball"),
    ("SHAKE_ANIM",               "BallShakeAnim",        "shaking Poké Ball when catching monster"),
    ("POOF_ANIM",                "BallPoofAnim",         "puff of smoke"),
    ("BLOCKBALL_ANIM",           "BallBlockAnim",        "trainer knocks away Poké Ball"),
    ("GREATTOSS_ANIM",           "GreatTossAnim",        "toss Great Ball"),
    ("ULTRATOSS_ANIM",           "UltraTossAnim",        "toss Ultra Ball or Master Ball"),
    ("SHAKE_SCREEN_ANIM",        "ShakeScreenAnim",      ""),
    ("HIDEPIC_ANIM",             "HidePicAnim",          "monster disappears"),
    ("ROCK_ANIM",                "ThrowRockAnim",        "throw rock"),
    ("BAIT_ANIM",                "ThrowBaitAnim",        "throw bait"),
]
assert NUM_MOVES + len(SPECIAL_ANIMS) <= 254

# ===================================================== constants/move_constants.asm
L = []
L.append("; move ids")
L.append("; indexes for:")
L.append("; - Moves (see data/moves/moves.asm)")
L.append("; - MoveNames (see data/moves/names.asm)")
L.append("; - MoveCategories (see data/moves/categories.asm)")
L.append("; NOTE: AttackAnimationPointers and MoveSoundTable rows 1-165 remain in")
L.append("; the ORIGINAL (vanilla) move order and are addressed with the ANIM_*")
L.append("; constants defined at the bottom of this file, NOT with move ids.")
L.append("\tconst_def")
L.append("\tconst NO_MOVE      ; 00")
width = max(len(by_id[i]) for i in range(1, NUM_MOVES + 1))
for i in range(1, NUM_MOVES + 1):
    L.append("\tconst %-*s ; %02x" % (width, by_id[i], i))
L.append("")
L.append("DEF NUM_ATTACKS EQU const_value - 1")
L.append("")
L.append("DEF CANNOT_MOVE EQU $ff")
L.append("")
L.append("\t; Special battle animation ids (share the id space with moves).")
L.append("\t; The unused ids ANIM_A8, ANIM_B2-ANIM_B9 and ANIM_BB were removed")
L.append("\t; to make room for the expanded move list.")
for const, _label, comment in SPECIAL_ANIMS:
    L.append("\tconst %s%s" % (const, (" ; " + comment) if comment else ""))
L.append("")
L.append("DEF NUM_ATTACK_ANIMS EQU const_value - 1")
L.append("")
L.append("; Animation-script/sound ids: the animation SCRIPTS (and MoveSoundTable)")
L.append("; keep the original games' 165 entries in vanilla move order. These")
L.append("; constants are used by the battle_anim sound bytes in")
L.append("; data/moves/animations.asm. Which script a MOVE plays is decided by")
L.append("; its row in AttackAnimationPointers (indexed by move id).")
for i, c in enumerate(vanilla_order, 1):
    L.append("DEF ANIM_%-*s EQU $%02X" % (width, c, i))
L.append("")
L.append("DEF NUM_MOVE_ANIMS EQU ANIM_STRUGGLE ; number of MoveSoundTable rows")
write("constants/move_constants.asm", "\n".join(L) + "\n")

# ===================================================== data/moves/moves.asm
CAT = {"P": "CAT_PHYSICAL", "S": "CAT_SPECIAL", "T": "CAT_STATUS"}
L = ["MACRO move",
     "\tdb \\1 ; animation (must equal the move's own id: this byte is copied",
     "\t      ; into wPlayerMoveNum/wEnemyMoveNum by ReadMove. The animation a",
     "\t      ; move actually plays is its AttackAnimationPointers row.)",
     "\tdb \\2 ; effect",
     "\tdb \\3 ; power",
     "\tdb \\4 ; type",
     "\tdb \\5 percent ; accuracy",
     "\tdb \\6 ; pp",
     '\tASSERT \\6 <= 40, "PP must be 40 or less"',
     "ENDM",
     "",
     "Moves:",
     "; Characteristics of each move.",
     "\ttable_width MOVE_LENGTH"]
for i in range(1, NUM_MOVES + 1):
    c = by_id[i]
    mv = new[c]
    if mv["cat"] == "T":
        eff, power, mtype, acc, pp = (cur[c]["effect"], 0, cur[c]["type"],
                                      cur[c]["acc"], cur[c]["pp"])
    else:
        eff, power, mtype, acc, pp = (mv["effect"], mv["power"], mv["type"],
                                      mv["acc"], mv["pp"])
    L.append("\tmove %-*s %-27s %3d, %-13s %3d, %2d" % (
        width + 1, c + ",", eff + ",", power, mtype + ",", acc, pp))
L.append("\tassert_table_length NUM_ATTACKS")
write("data/moves/moves.asm", "\n".join(L) + "\n")

# ===================================================== data/moves/names.asm
L = ["MoveNames::",
     '\t; in-battle "used <move name>!" text can only fit 12 (MOVE_NAME_LENGTH - 2) characters',
     "\tlist_start MOVE_NAME_LENGTH - 2"]
for i in range(1, NUM_MOVES + 1):
    L.append('\tli "%s"' % move_name(by_id[i]))
L.append("\tassert_list_length NUM_ATTACKS")
write("data/moves/names.asm", "\n".join(L) + "\n")

# ===================================================== data/moves/categories.asm
L = ["MoveCategories:",
     "; Damage category of each move (modern physical/special split, Gen 4+).",
     "; Indexed by move id - 1. Status moves never reach the damage formula,",
     "; so their entries are informational.",
     "\ttable_width 1"]
for i in range(1, NUM_MOVES + 1):
    c = by_id[i]
    L.append("\tdb %-12s ; %s" % (CAT[new[c]["cat"]], c))
L.append("\tassert_table_length NUM_ATTACKS")
write("data/moves/categories.asm", "\n".join(L) + "\n")

# ===================================================== data/moves/animations.asm
lines = anim_text.split("\n")
# find the pointer table span
start = lines.index("AttackAnimationPointers:")
assert lines[start + 1].strip() == "table_width 2"
first_assert = next(i for i, l in enumerate(lines) if "assert_table_length NUM_ATTACKS" in l)
second_assert = next(i for i, l in enumerate(lines) if "assert_table_length NUM_ATTACK_ANIMS" in l)
body = lines[second_assert + 1:]

out = lines[:start + 2]
out.append("\t; Indexed by MOVE id. New moves point at the vanilla animation")
out.append("\t; script they reuse.")
for i in range(1, NUM_MOVES + 1):
    c = by_id[i]
    out.append("\tdw %s ; %s" % (anim_label[new[c]["anim"]], c))
out.append("\tassert_table_length NUM_ATTACKS")
for const, label, comment in SPECIAL_ANIMS:
    out.append("\tdw %s ; %s" % (label, const))
out.append("\tassert_table_length NUM_ATTACK_ANIMS")
out.extend(body)
text = "\n".join(out)
# battle_anim's first byte is an animation-space id: rename move consts -> ANIM_*
vanset = set(vanilla_order)
text = re.sub(r"(\tbattle_anim )([A-Z][A-Z0-9_]*)",
              lambda m: m.group(1) + ("ANIM_" + m.group(2) if m.group(2) in vanset else m.group(2)),
              text)
write("data/moves/animations.asm", text)

# ===================================================== data/moves/sfx.asm
sfx_lines = read("data/moves/sfx.asm").split("\n")
hdr_end = next(i for i, l in enumerate(sfx_lines) if "; ID, pitch mod, tempo mod" in l)
rows = [l for l in sfx_lines if l.startswith("\tdb ")]
# 165 move rows + 1 trailing default row
move_rows, default_row = rows[:165], rows[165]
L = sfx_lines[:hdr_end + 1]
L.append("\t; Indexed by ANIM_* animation-script id (the battle_anim sound byte),")
L.append("\t; NOT by move id — the 165 rows stay in the original move order.")
L.extend(move_rows)
L.append("\tassert_table_length NUM_MOVE_ANIMS")
L.append(default_row)
write("data/moves/sfx.asm", "\n".join(L) + "\n")

# ===================================================== data/moves/grammar.asm
gram = read("data/moves/grammar.asm").split("\n")
def is_cut_grammar_line(l):
    m = re.match(r"\tdb ([A-Z][A-Z0-9_]+)\s*(;.*)?$", l)
    return m and m.group(1) in cur and m.group(1) not in new
L = [l for l in gram if not is_cut_grammar_line(l)]
write("data/moves/grammar.asm", "\n".join(L))

# ===================================================== data/moves/field_moves.asm
fm = read("data/moves/field_moves.asm")
fm = fm.replace("\tdb ANIM_B4,    3, $0C ; unused",
                "\tdb NO_MOVE,    3, $0C ; unused")
write("data/moves/field_moves.asm", fm)

# ===================================================== critical hit moves
L = ["HighCriticalMoves:"]
for c in HIGH_CRIT:
    L.append("\tdb %s" % c)
L.append("\tdb -1 ; end")
write("data/battle/critical_hit_moves.asm", "\n".join(L) + "\n")

# ===================================================== item_constants add_tm list
item_text = read("constants/item_constants.asm")
old_tms = re.findall(r"\tadd_tm (\w+)", item_text)
assert len(old_tms) == 50
tm_block = re.search(r"(DEF TM01 EQU const_value\n)(.*?)(\nASSERT NUM_TMS)", item_text, re.S)
new_block = []
val = 0xC9
namew = max(len(m) for m in NEW_TMS)
for mv in NEW_TMS:
    new_block.append("\tadd_tm %-*s ; $%02X" % (namew, mv, val))
    val += 1
item_text = item_text[:tm_block.start(2)] + "\n".join(new_block) + item_text[tm_block.end(2):]
write("constants/item_constants.asm", item_text)

# TM_* / *_TMNUM renames across the tree (slot-preserving)
renames = {}
for old, newmv in zip(old_tms, NEW_TMS):
    if old != newmv:
        renames["TM_" + old] = "TM_" + newmv
        renames[old + "_TMNUM"] = newmv + "_TMNUM"
if renames:
    pat = re.compile(r"\b(%s)\b" % "|".join(sorted(renames, key=len, reverse=True)))
    for root in ("scripts", "engine", "data", "maps", "home"):
        for dirpath, _dirs, files in os.walk(os.path.join(REPO, root)):
            if "data/moves" in dirpath or "data/pokemon" in dirpath:
                continue
            for fn in files:
                if not fn.endswith(".asm"):
                    continue
                path = os.path.join(dirpath, fn)
                s = open(path).read()
                s2 = pat.sub(lambda m: renames[m.group(1)], s)
                if s2 != s:
                    open(path, "w").write(s2)
                    print("renamed TM constants in", os.path.relpath(path, REPO))

# ===================================================== trainer special moves
sm = read("data/trainers/special_moves.asm")
cutset = {c: t for c, t in cut_map.items() if t}
pat = re.compile(r"\b(%s)\b" % "|".join(cutset))
sm = pat.sub(lambda m: cutset[m.group(1)], sm)
write("data/trainers/special_moves.asm", sm)

# ===================================================== battle anim special effects
# The table is searched with wAnimationID (= move id, or special anim id).
# Rows for cut moves are dropped; new moves that reuse an animation with a
# visual special effect get their own row. Effects that hide the attacker
# (DoExplodeSpecialEffects) are only kept for moves that actually faint the
# user; other reusers get the plain screen flashing instead.
se_rows = re.findall(r"\tanim_special_effect (\w+),\s*(\w+)",
                     read("data/battle_anims/special_effects.asm"))
effect_of = {mv: fx for mv, fx in se_rows}
REUSER_EFFECT = {  # anim source -> effect for new moves reusing it
    "MEGA_PUNCH":   "AnimationFlashScreen",
    "GUILLOTINE":   "AnimationFlashScreen",
    "MEGA_KICK":    "AnimationFlashScreen",
    "HEADBUTT":     "AnimationFlashScreen",
    "GROWL":        "DoGrowlSpecialEffects",
    "DISABLE":      "AnimationFlashScreen",
    "BLIZZARD":     "DoBlizzardSpecialEffects",
    "BUBBLEBEAM":   "AnimationFlashScreen",
    "HYPER_BEAM":   "FlashScreenEveryFourFrameBlocks",
    "THUNDERBOLT":  "FlashScreenEveryEightFrameBlocks",
    "REFLECT":      "AnimationFlashScreen",
    "SELFDESTRUCT": "FlashScreenEveryFourFrameBlocks",  # no user-vanish
    "SPORE":        "FlashScreenEveryFourFrameBlocks",
    "EXPLOSION":    "FlashScreenEveryFourFrameBlocks",  # no user-vanish
    "ROCK_SLIDE":   "DoRockSlideSpecialEffects",
}
L = ["MACRO anim_special_effect",
     "\tdb \\1",
     "\tdw \\2",
     "ENDM",
     "",
     "AnimationIdSpecialEffects:",
     "\t; animation id (= move id or special anim id), effect routine address"]
namew = max(len(c) for c in new) + 1
for i in range(1, NUM_MOVES + 1):
    c = by_id[i]
    if c in effect_of:                       # surviving vanilla move keeps its row
        L.append("\tanim_special_effect %-*s %s" % (namew, c + ",", effect_of[c]))
    elif new[c]["anim"] in REUSER_EFFECT and new[c]["anim"] != c:
        L.append("\tanim_special_effect %-*s %s" % (namew, c + ",", REUSER_EFFECT[new[c]["anim"]]))
for mv, fx in se_rows:                       # special (non-move) anim rows
    if mv.endswith("_ANIM"):
        L.append("\tanim_special_effect %-*s %s" % (namew, mv + ",", fx))
L.append("\tdb -1 ; end")
write("data/battle_anims/special_effects.asm", "\n".join(L) + "\n")

# ===================================================== evos_moves.asm
BAND_RANK = {"WP": 0, "WS": 0, "MP": 1, "MS": 1, "SP": 2, "SS": 2, "XP": 3, "XS": 3}
def l1_split(mon):
    """(base_stats level-1 moves [<=4], overflow level-1 consts)"""
    l1 = [c for lv, c in mon["new_learnset"] if lv == 1]
    attacks = sorted([c for c in l1 if new[c]["cat"] != "T"],
                     key=lambda c: (BAND_RANK.get(new[c]["band"], 1), c))
    status = [c for c in l1 if new[c]["cat"] == "T"]
    ordered = attacks + status
    return ordered[:4], ordered[4:]

evotext = read("data/pokemon/evos_moves.asm")
bykey = {m["key"]: m for m in mons}
def norm(name):
    return name.lower().replace("_", "").replace("'", "").replace(".", "")

def rebuild_block(m):
    label, body = m.group(1), m.group(2)
    key = norm(label)
    if key not in bykey:
        return m.group(0)
    mon = bykey[key]
    evo_part = body.split("; Learnset")[0]
    _base4, overflow = l1_split(mon)
    L = [label + "EvosMoves:", evo_part.rstrip("\n"), "; Learnset"]
    for c in overflow:
        L.append("\tdb 1, %s" % c)
    for lv, c in mon["new_learnset"]:
        if lv > 1:
            L.append("\tdb %d, %s" % (lv, c))
    L.append("\tdb 0")
    return "\n".join(L) + "\n"

evotext = re.sub(r"^(\w+)EvosMoves:\n(.*?)\n(?=\w+EvosMoves:|\Z)",
                 rebuild_block, evotext, flags=re.M | re.S)
write("data/pokemon/evos_moves.asm", evotext)

# ===================================================== base_stats/*.asm
order = re.findall(r'INCLUDE "([^"]+)"', read("data/pokemon/base_stats.asm"))
for path in order:
    key = norm(os.path.basename(path)[:-4])
    mon = bykey[key]
    text = read(path)
    base4, _overflow = l1_split(mon)
    lvl1 = (base4 + ["NO_MOVE"] * 4)[:4]
    text = re.sub(r"\tdb .+ ; level 1 learnset",
                  "\tdb %s ; level 1 learnset" % ", ".join(lvl1), text)
    tmlist = mon["new_tms"]
    if tmlist:
        cellw = max(len(t) for t in tmlist) + 1
        rows = []
        for i in range(0, len(tmlist), 5):
            chunk = tmlist[i:i + 5]
            cells = [("%-*s" % (cellw, t + ",")) for t in chunk]
            rows.append("\t     " + " ".join(cells))
        block = "\n".join(rows)
        block = block[::-1].replace(",", "", 1)[::-1].rstrip()  # drop last comma
        block = "\t; tm/hm learnset\n\ttmhm " + block.lstrip("\t ").replace("\n\t     ", " \\\n\t     ") + "\n\t; end"
    else:
        block = "\t; tm/hm learnset\n\ttmhm\n\t; end"
    text = re.sub(r"\t; tm/hm learnset\n.*?; end", block, text, flags=re.S)
    with open(os.path.join(REPO, path), "w") as f:
        f.write(text)
print("rewrote %d base stats files" % len(order))
print("done: %d moves, NUM_ATTACKS=%d, max id incl anims=%d"
      % (len(new), NUM_MOVES, NUM_MOVES + len(SPECIAL_ANIMS)))
