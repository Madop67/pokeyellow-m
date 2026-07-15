#!/usr/bin/env python3
"""
Generate docs/move_overhaul_plan.md — the design document for the complete
move-list overhaul of this fork.

This script is the single source of truth for the *plan*: it holds the new
move roster, the disposition of every vanilla move, and the rules used to
rebuild all 151 learnsets and TM/HM sets from the repository's current data.
It validates every design constraint before writing the doc.

Run:  python3 tools/gen_move_overhaul_plan.py
"""
import os, re, sys
from collections import defaultdict

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(REPO, "docs", "move_overhaul_plan.md")

def read(path):
    with open(os.path.join(REPO, path)) as f:
        return f.read()

def norm(name):
    return name.lower().replace("_", "").replace("'", "").replace(".", "")

TYPE_DISPLAY = {
    "NORMAL": "Normal", "FIGHTING": "Fighting", "FLYING": "Flying",
    "POISON": "Poison", "GROUND": "Ground", "ROCK": "Rock", "BUG": "Bug",
    "GHOST": "Ghost", "STEEL": "Steel", "FIRE": "Fire", "WATER": "Water",
    "GRASS": "Grass", "ELECTRIC": "Electric", "PSYCHIC_TYPE": "Psychic",
    "ICE": "Ice", "DRAGON": "Dragon", "DARK": "Dark", "FAIRY": "Fairy",
    "STELLAR": "Stellar", "SOUND": "Sound", "LIGHT": "Light",
    "TYPELESS": "???",
}
# the 20 attacking types that must have full band coverage
GRID_TYPES = ["NORMAL", "FIGHTING", "FLYING", "POISON", "GROUND", "ROCK",
              "BUG", "GHOST", "STEEL", "FIRE", "WATER", "GRASS", "ELECTRIC",
              "PSYCHIC_TYPE", "ICE", "DRAGON", "DARK", "FAIRY", "SOUND", "LIGHT"]

# ------------------------------------------------------------------ parsing
def parse_current_moves():
    moves = {}
    rows = re.findall(
        r"\tmove (\w+),\s*(\w+),\s*(\d+),\s*(\w+),\s*(\d+),\s*(\d+)",
        read("data/moves/moves.asm"))
    names = re.findall(r'\tli "([^"]+)"', read("data/moves/names.asm"))
    cats = re.findall(r"\tdb (CAT_\w+)\s*; (\w+)", read("data/moves/categories.asm"))
    assert len(rows) == len(names) == len(cats) == 165
    for i, (const, effect, power, mtype, acc, pp) in enumerate(rows):
        assert cats[i][1] == const
        moves[const] = dict(
            id=i + 1, name=names[i].title().replace("'S", "'s"),
            effect=effect, power=int(power), type=mtype, acc=int(acc),
            pp=int(pp),
            cat={"CAT_PHYSICAL": "P", "CAT_SPECIAL": "S", "CAT_STATUS": "T"}[cats[i][0]])
    return moves

def parse_tmhm_map():
    text = read("constants/item_constants.asm")
    hms = re.findall(r"\tadd_hm (\w+)", text)
    tms = re.findall(r"\tadd_tm (\w+)", text)
    out = {}
    for i, mv in enumerate(tms, 1):
        out[mv] = "TM%02d" % i
    for i, mv in enumerate(hms, 1):
        out[mv] = "HM%02d" % i
    return out, tms, hms

SPECIAL_NAMES = {"nidoranf": "Nidoran♀", "nidoranm": "Nidoran♂",
                 "mrmime": "Mr. Mime", "farfetchd": "Farfetch'd"}

def parse_pokemon():
    order = re.findall(r'INCLUDE "([^"]+)"', read("data/pokemon/base_stats.asm"))
    assert len(order) == 151
    evotext = read("data/pokemon/evos_moves.asm")
    mons = []
    for dex, path in enumerate(order, 1):
        text = read(path)
        key = norm(os.path.basename(path)[:-4])
        stats = re.search(
            r"\tdb\s+(\d+),\s+(\d+),\s+(\d+),\s+(\d+),\s+(\d+),\s+(\d+)", text)
        hp, atk, dfn, spd, spa, sdf = (int(x) for x in stats.groups())
        types = re.search(r"\tdb (\w+), (\w+) ; type", text).groups()
        lvl1 = re.search(r"\tdb (.+) ; level 1 learnset", text).group(1)
        lvl1 = [m.strip() for m in lvl1.split(",") if m.strip() != "NO_MOVE"]
        tm_block = re.search(r"\ttmhm([^;]*); end", text, re.S)
        tms = re.findall(r"\b([A-Z][A-Z0-9_]+)\b", tm_block.group(1)) if tm_block else []
        mons.append(dict(
            dex=dex, key=key, name=SPECIAL_NAMES.get(key, key.capitalize()),
            stats=(hp, atk, dfn, spd, spa, sdf), types=types,
            lvl1=lvl1, tms=tms, learnset=[], evolutions=[], evolves_from=[]))
    bykey = {m["key"]: m for m in mons}
    for label, body in re.findall(
            r"^(\w+)EvosMoves:\n(.*?)\n(?=\w+EvosMoves:|\Z)", evotext, re.M | re.S):
        key = norm(label)
        if key not in bykey:
            continue
        mon = bykey[key]
        evo_part, moves_part = body.split("; Learnset")
        for em in re.finditer(r"\tdb EVOLVE_(\w+), (.+)", evo_part):
            kind, args = em.groups()
            args = [a.strip() for a in args.split(",")]
            target = args[1] if kind != "ITEM" else args[2]
            mon["evolutions"].append(target)
        for lm in re.finditer(r"\tdb (\d+), (\w+)", moves_part):
            mon["learnset"].append((int(lm.group(1)), lm.group(2)))
    for mon in mons:
        for target in mon["evolutions"]:
            bykey[norm(target)]["evolves_from"].append(mon["key"])
    return mons, bykey

# ------------------------------------------------------------------ new roster
# Band definitions (damage categories requested by the design):
#   WP/WS  weak      35–50 BP, 100% acc, no secondary effect
#   MP/MS  moderate  50–70 BP, 100% acc, may have secondary effect
#   SP/SS  strong    90 BP, 100% acc (small 10% riders allowed where they ARE
#                    the move's identity, e.g. the elemental punches)
#   XP/XS  strongest 110–130 BP, 85% acc, may have secondary effect/drawback
BANDS = {
    "WP": ("Weak Physical", 35, 50, 100), "MP": ("Moderate Physical", 50, 70, 100),
    "SP": ("Strong Physical", 90, 90, 100), "XP": ("Strongest Physical", 110, 130, 85),
    "WS": ("Weak Special", 35, 50, 100), "MS": ("Moderate Special", 50, 70, 100),
    "SS": ("Strong Special", 90, 90, 100), "XS": ("Strongest Special", 110, 130, 85),
}

NO_FX = "NO_ADDITIONAL_EFFECT"

# (const, display name, type, band, power, acc, pp, effect, anim source, origin)
# origin: "vanilla" (kept, possibly retuned), "repurposed" (vanilla name, new role),
#         "new" (new move using an existing vanilla animation)
GRID = [
    # ---- NORMAL
    ("TACKLE",       "Tackle",       "NORMAL", "WP", 40, 100, 35, NO_FX, "TACKLE", "vanilla"),
    ("HEADBUTT",     "Headbutt",     "NORMAL", "MP", 65, 100, 25, "FLINCH_SIDE_EFFECT2", "HEADBUTT", "vanilla"),
    ("STRENGTH",     "Strength",     "NORMAL", "SP", 90, 100, 15, NO_FX, "STRENGTH", "vanilla"),
    ("DOUBLE_EDGE",  "Double-Edge",  "NORMAL", "XP", 120, 85, 10, "RECOIL_EFFECT", "DOUBLE_EDGE", "vanilla"),
    ("RAZOR_WIND",   "Razor Wind",   "NORMAL", "WS", 40, 100, 30, NO_FX, "RAZOR_WIND", "repurposed"),
    ("TRI_ATTACK",   "Tri Attack",   "NORMAL", "MS", 65, 100, 25, NO_FX, "TRI_ATTACK", "vanilla"),
    ("SPIRAL_BEAM",  "Spiral Beam",  "NORMAL", "SS", 90, 100, 15, NO_FX, "AURORA_BEAM", "new"),
    ("HYPER_BEAM",   "Hyper Beam",   "NORMAL", "XS", 120, 85, 5, NO_FX, "HYPER_BEAM", "vanilla"),
    # ---- FIGHTING
    ("KARATE_CHOP",  "Karate Chop",  "FIGHTING", "WP", 50, 100, 30, NO_FX, "KARATE_CHOP", "vanilla"),
    ("LOW_KICK",     "Low Kick",     "FIGHTING", "MP", 60, 100, 25, "FLINCH_SIDE_EFFECT2", "LOW_KICK", "vanilla"),
    ("HI_JUMP_KICK", "Hi Jump Kick", "FIGHTING", "SP", 90, 100, 15, NO_FX, "HI_JUMP_KICK", "vanilla"),
    ("SUBMISSION",   "Submission",   "FIGHTING", "XP", 120, 85, 10, "RECOIL_EFFECT", "SUBMISSION", "vanilla"),
    ("VACUUM_WAVE",  "Vacuum Wave",  "FIGHTING", "WS", 40, 100, 35, NO_FX, "GUST", "new"),
    ("FORCE_PALM",   "Force Palm",   "FIGHTING", "MS", 60, 100, 25, "PARALYZE_SIDE_EFFECT1", "MEGA_PUNCH", "new"),
    ("AURA_SPHERE",  "Aura Sphere",  "FIGHTING", "SS", 90, 100, 15, NO_FX, "AURORA_BEAM", "new"),
    ("FOCUS_BLAST",  "Focus Blast",  "FIGHTING", "XS", 120, 85, 5, "SPECIAL_DOWN_SIDE_EFFECT", "EGG_BOMB", "new"),
    # ---- FLYING
    ("PECK",         "Peck",         "FLYING", "WP", 40, 100, 35, NO_FX, "PECK", "vanilla"),
    ("WING_ATTACK",  "Wing Attack",  "FLYING", "MP", 60, 100, 25, NO_FX, "WING_ATTACK", "vanilla"),
    ("DRILL_PECK",   "Drill Peck",   "FLYING", "SP", 90, 100, 15, NO_FX, "DRILL_PECK", "vanilla"),
    ("FLY",          "Fly",          "FLYING", "XP", 120, 85, 10, NO_FX, "FLY", "vanilla"),
    ("GUST",         "Gust",         "FLYING", "WS", 40, 100, 35, NO_FX, "GUST", "vanilla"),
    ("AIR_CUTTER",   "Air Cutter",   "FLYING", "MS", 60, 100, 25, NO_FX, "RAZOR_WIND", "new"),
    ("AIR_SLASH",    "Air Slash",    "FLYING", "SS", 90, 100, 15, "FLINCH_SIDE_EFFECT1", "RAZOR_WIND", "new"),
    ("HURRICANE",    "Hurricane",    "FLYING", "XS", 120, 85, 5, "CONFUSION_SIDE_EFFECT", "WHIRLWIND", "new"),
    # ---- POISON
    ("POISON_STING", "Poison Sting", "POISON", "WP", 40, 100, 35, NO_FX, "POISON_STING", "vanilla"),
    ("CROSS_POISON", "Cross Poison", "POISON", "MP", 65, 100, 25, "POISON_SIDE_EFFECT1", "SLASH", "new"),
    ("POISON_JAB",   "Poison Jab",   "POISON", "SP", 90, 100, 15, NO_FX, "POISON_STING", "new"),
    ("GUNK_SHOT",    "Gunk Shot",    "POISON", "XP", 120, 85, 5, "POISON_SIDE_EFFECT2", "SLUDGE", "new"),
    ("ACID",         "Acid",         "POISON", "WS", 40, 100, 30, NO_FX, "ACID", "vanilla"),
    ("SLUDGE",       "Sludge",       "POISON", "MS", 65, 100, 20, "POISON_SIDE_EFFECT2", "SLUDGE", "vanilla"),
    ("SLUDGE_BOMB",  "Sludge Bomb",  "POISON", "SS", 90, 100, 15, "POISON_SIDE_EFFECT1", "SLUDGE", "new"),
    ("SLUDGE_WAVE",  "Sludge Wave",  "POISON", "XS", 120, 85, 5, "POISON_SIDE_EFFECT1", "SURF", "new"),
    # ---- GROUND
    ("BONE_CLUB",    "Bone Club",    "GROUND", "WP", 45, 100, 30, NO_FX, "BONE_CLUB", "vanilla"),
    ("BULLDOZE",     "Bulldoze",     "GROUND", "MP", 60, 100, 25, "SPEED_DOWN_SIDE_EFFECT", "EARTHQUAKE", "new"),
    ("EARTHQUAKE",   "Earthquake",   "GROUND", "SP", 90, 100, 15, NO_FX, "EARTHQUAKE", "vanilla"),
    ("DIG",          "Dig",          "GROUND", "XP", 120, 85, 10, NO_FX, "DIG", "vanilla"),
    ("MUD_SLAP",     "Mud-Slap",     "GROUND", "WS", 40, 100, 35, NO_FX, "SAND_ATTACK", "new"),
    ("MUD_BOMB",     "Mud Bomb",     "GROUND", "MS", 65, 100, 20, "DEFENSE_DOWN_SIDE_EFFECT", "EGG_BOMB", "new"),
    ("EARTH_POWER",  "Earth Power",  "GROUND", "SS", 90, 100, 15, "SPECIAL_DOWN_SIDE_EFFECT", "FISSURE", "new"),
    ("FISSURE",      "Fissure",      "GROUND", "XS", 120, 85, 5, NO_FX, "FISSURE", "repurposed"),
    # ---- ROCK
    ("ROCK_THROW",   "Rock Throw",   "ROCK", "WP", 45, 100, 30, NO_FX, "ROCK_THROW", "vanilla"),
    ("ROCK_SLIDE",   "Rock Slide",   "ROCK", "MP", 65, 100, 20, "FLINCH_SIDE_EFFECT2", "ROCK_SLIDE", "vanilla"),
    ("STONE_EDGE",   "Stone Edge",   "ROCK", "SP", 90, 100, 15, NO_FX, "ROCK_SLIDE", "new"),
    ("HEAD_SMASH",   "Head Smash",   "ROCK", "XP", 120, 85, 5, "RECOIL_EFFECT", "SKULL_BASH", "new"),
    ("ROCK_BLAST",   "Rock Blast",   "ROCK", "WS", 45, 100, 30, NO_FX, "ROCK_THROW", "new"),
    ("ANCIENTPOWER", "Ancientpower", "ROCK", "MS", 60, 100, 25, NO_FX, "ROCK_SLIDE", "new"),
    ("POWER_GEM",    "Power Gem",    "ROCK", "SS", 90, 100, 15, NO_FX, "AURORA_BEAM", "new"),
    ("METEOR_BEAM",  "Meteor Beam",  "ROCK", "XS", 120, 85, 5, NO_FX, "HYPER_BEAM", "new"),
    # ---- BUG
    ("FURY_CUTTER",  "Fury Cutter",  "BUG", "WP", 40, 100, 35, NO_FX, "SLASH", "new"),
    ("LEECH_LIFE",   "Leech Life",   "BUG", "MP", 60, 100, 20, "DRAIN_HP_EFFECT", "LEECH_LIFE", "vanilla"),
    ("X_SCISSOR",    "X-Scissor",    "BUG", "SP", 90, 100, 15, NO_FX, "CUT", "new"),
    ("MEGAHORN",     "Megahorn",     "BUG", "XP", 120, 85, 5, NO_FX, "HORN_ATTACK", "new"),
    ("INFESTATION",  "Infestation",  "BUG", "WS", 40, 100, 35, NO_FX, "LEECH_LIFE", "new"),
    ("SILVER_WIND",  "Silver Wind",  "BUG", "MS", 60, 100, 25, NO_FX, "GUST", "new"),
    ("BUG_BUZZ",     "Bug Buzz",     "BUG", "SS", 90, 100, 15, "SPECIAL_DOWN_SIDE_EFFECT", "SUPERSONIC", "new"),
    ("LOCUST_STORM", "Locust Storm", "BUG", "XS", 120, 85, 5, NO_FX, "PIN_MISSILE", "new"),
    # ---- GHOST
    ("ASTONISH",     "Astonish",     "GHOST", "WP", 40, 100, 35, NO_FX, "NIGHT_SHADE", "new"),
    ("LICK",         "Lick",         "GHOST", "MP", 60, 100, 25, "PARALYZE_SIDE_EFFECT2", "LICK", "vanilla"),
    ("SHADOW_CLAW",  "Shadow Claw",  "GHOST", "SP", 90, 100, 15, NO_FX, "SLASH", "new"),
    ("SHADOW_FORCE", "Shadow Force", "GHOST", "XP", 120, 85, 10, NO_FX, "DIG", "new"),
    ("OMINOUS_WIND", "Ominous Wind", "GHOST", "WS", 40, 100, 30, NO_FX, "MIST", "new"),
    ("HEX",          "Hex",          "GHOST", "MS", 65, 100, 20, NO_FX, "NIGHT_SHADE", "new"),
    ("SHADOW_BALL",  "Shadow Ball",  "GHOST", "SS", 90, 100, 15, "SPECIAL_DOWN_SIDE_EFFECT", "EGG_BOMB", "new"),
    ("SPIRIT_BLAST", "Spirit Blast", "GHOST", "XS", 120, 85, 5, NO_FX, "DREAM_EATER", "new"),
    # ---- STEEL
    ("METAL_CLAW",   "Metal Claw",   "STEEL", "WP", 50, 100, 30, NO_FX, "SCRATCH", "new"),
    ("IRON_HEAD",    "Iron Head",    "STEEL", "MP", 65, 100, 20, "FLINCH_SIDE_EFFECT2", "HEADBUTT", "new"),
    ("METEOR_MASH",  "Meteor Mash",  "STEEL", "SP", 90, 100, 15, NO_FX, "COMET_PUNCH", "new"),
    ("IRON_TAIL",    "Iron Tail",    "STEEL", "XP", 120, 85, 5, "DEFENSE_DOWN_SIDE_EFFECT", "SLAM", "new"),
    ("METAL_SHARD",  "Metal Shard",  "STEEL", "WS", 40, 100, 35, NO_FX, "POISON_STING", "new"),
    ("MIRROR_SHOT",  "Mirror Shot",  "STEEL", "MS", 65, 100, 20, NO_FX, "AURORA_BEAM", "new"),
    ("FLASH_CANNON", "Flash Cannon", "STEEL", "SS", 90, 100, 15, "SPECIAL_DOWN_SIDE_EFFECT", "SOLARBEAM", "new"),
    ("STEEL_BEAM",   "Steel Beam",   "STEEL", "XS", 120, 85, 5, "RECOIL_EFFECT", "HYPER_BEAM", "new"),
    # ---- FIRE
    ("FLAME_CHARGE", "Flame Charge", "FIRE", "WP", 50, 100, 30, NO_FX, "EMBER", "new"),
    ("FIRE_FANG",    "Fire Fang",    "FIRE", "MP", 65, 100, 20, "BURN_SIDE_EFFECT1", "BITE", "new"),
    ("FIRE_PUNCH",   "Fire Punch",   "FIRE", "SP", 90, 100, 15, "BURN_SIDE_EFFECT1", "FIRE_PUNCH", "vanilla"),
    ("FLARE_BLITZ",  "Flare Blitz",  "FIRE", "XP", 120, 85, 10, "RECOIL_EFFECT", "FIRE_BLAST", "new"),
    ("EMBER",        "Ember",        "FIRE", "WS", 40, 100, 30, NO_FX, "EMBER", "vanilla"),
    ("FLAME_BURST",  "Flame Burst",  "FIRE", "MS", 65, 100, 20, "BURN_SIDE_EFFECT1", "FIRE_SPIN", "new"),
    ("FLAMETHROWER", "Flamethrower", "FIRE", "SS", 90, 100, 15, "BURN_SIDE_EFFECT1", "FLAMETHROWER", "vanilla"),
    ("FIRE_BLAST",   "Fire Blast",   "FIRE", "XS", 120, 85, 5, "BURN_SIDE_EFFECT2", "FIRE_BLAST", "vanilla"),
    # ---- WATER
    ("AQUA_JET",     "Aqua Jet",     "WATER", "WP", 40, 100, 35, NO_FX, "BUBBLE", "new"),
    ("RAZOR_SHELL",  "Razor Shell",  "WATER", "MP", 65, 100, 20, "DEFENSE_DOWN_SIDE_EFFECT", "CLAMP", "new"),
    ("WATERFALL",    "Waterfall",    "WATER", "SP", 90, 100, 15, NO_FX, "WATERFALL", "vanilla"),
    ("CRABHAMMER",   "Crabhammer",   "WATER", "XP", 120, 85, 5, NO_FX, "CRABHAMMER", "vanilla"),
    ("WATER_GUN",    "Water Gun",    "WATER", "WS", 40, 100, 30, NO_FX, "WATER_GUN", "vanilla"),
    ("BUBBLEBEAM",   "Bubblebeam",   "WATER", "MS", 65, 100, 20, "SPEED_DOWN_SIDE_EFFECT", "BUBBLEBEAM", "vanilla"),
    ("SURF",         "Surf",         "WATER", "SS", 90, 100, 15, NO_FX, "SURF", "vanilla"),
    ("HYDRO_PUMP",   "Hydro Pump",   "WATER", "XS", 120, 85, 5, NO_FX, "HYDRO_PUMP", "vanilla"),
    # ---- GRASS
    ("VINE_WHIP",    "Vine Whip",    "GRASS", "WP", 45, 100, 30, NO_FX, "VINE_WHIP", "vanilla"),
    ("RAZOR_LEAF",   "Razor Leaf",   "GRASS", "MP", 60, 100, 25, NO_FX, "RAZOR_LEAF", "vanilla"),
    ("LEAF_BLADE",   "Leaf Blade",   "GRASS", "SP", 90, 100, 15, NO_FX, "SLASH", "new"),
    ("WOOD_HAMMER",  "Wood Hammer",  "GRASS", "XP", 120, 85, 10, "RECOIL_EFFECT", "SLAM", "new"),
    ("LEAFAGE",      "Leafage",      "GRASS", "WS", 40, 100, 35, NO_FX, "RAZOR_LEAF", "new"),
    ("MEGA_DRAIN",   "Mega Drain",   "GRASS", "MS", 60, 100, 15, "DRAIN_HP_EFFECT", "MEGA_DRAIN", "vanilla"),
    ("ENERGY_BALL",  "Energy Ball",  "GRASS", "SS", 90, 100, 15, "SPECIAL_DOWN_SIDE_EFFECT", "MEGA_DRAIN", "new"),
    ("SOLARBEAM",    "Solarbeam",    "GRASS", "XS", 120, 85, 5, NO_FX, "SOLARBEAM", "vanilla"),
    # ---- ELECTRIC
    ("NUZZLE",       "Nuzzle",       "ELECTRIC", "WP", 40, 100, 35, NO_FX, "THUNDERSHOCK", "new"),
    ("SPARK",        "Spark",        "ELECTRIC", "MP", 65, 100, 20, "PARALYZE_SIDE_EFFECT1", "THUNDERSHOCK", "new"),
    ("THUNDERPUNCH", "Thunderpunch", "ELECTRIC", "SP", 90, 100, 15, "PARALYZE_SIDE_EFFECT1", "THUNDERPUNCH", "vanilla"),
    ("WILD_CHARGE",  "Wild Charge",  "ELECTRIC", "XP", 120, 85, 10, "RECOIL_EFFECT", "THUNDERBOLT", "new"),
    ("THUNDERSHOCK", "Thundershock", "ELECTRIC", "WS", 40, 100, 30, NO_FX, "THUNDERSHOCK", "vanilla"),
    ("SHOCK_WAVE",   "Shock Wave",   "ELECTRIC", "MS", 60, 100, 20, "SWIFT_EFFECT", "THUNDERBOLT", "new"),
    ("THUNDERBOLT",  "Thunderbolt",  "ELECTRIC", "SS", 90, 100, 15, "PARALYZE_SIDE_EFFECT1", "THUNDERBOLT", "vanilla"),
    ("THUNDER",      "Thunder",      "ELECTRIC", "XS", 120, 85, 5, "PARALYZE_SIDE_EFFECT1", "THUNDER", "vanilla"),
    # ---- PSYCHIC
    ("MIND_SPIKE",   "Mind Spike",   "PSYCHIC_TYPE", "WP", 40, 100, 35, NO_FX, "PSYWAVE", "new"),
    ("PSYCHO_CUT",   "Psycho Cut",   "PSYCHIC_TYPE", "MP", 65, 100, 20, NO_FX, "RAZOR_WIND", "new"),
    ("ZEN_HEADBUTT", "Zen Headbutt", "PSYCHIC_TYPE", "SP", 90, 100, 15, "FLINCH_SIDE_EFFECT1", "HEADBUTT", "new"),
    ("MIND_CRUSH",   "Mind Crush",   "PSYCHIC_TYPE", "XP", 120, 85, 5, NO_FX, "PSYCHIC_M", "new"),
    ("CONFUSION",    "Confusion",    "PSYCHIC_TYPE", "WS", 50, 100, 30, NO_FX, "CONFUSION", "vanilla"),
    ("PSYBEAM",      "Psybeam",      "PSYCHIC_TYPE", "MS", 65, 100, 20, "CONFUSION_SIDE_EFFECT", "PSYBEAM", "vanilla"),
    ("PSYCHIC_M",    "Psychic",      "PSYCHIC_TYPE", "SS", 90, 100, 15, "SPECIAL_DOWN_SIDE_EFFECT", "PSYCHIC_M", "vanilla"),
    ("PSYCHO_BOOST", "Psycho Boost", "PSYCHIC_TYPE", "XS", 120, 85, 5, NO_FX, "PSYCHIC_M", "new"),
    # ---- ICE
    ("ICE_SHARD",    "Ice Shard",    "ICE", "WP", 40, 100, 35, NO_FX, "ICE_BEAM", "new"),
    ("ICE_FANG",     "Ice Fang",     "ICE", "MP", 65, 100, 20, "FREEZE_SIDE_EFFECT1", "BITE", "new"),
    ("ICE_PUNCH",    "Ice Punch",    "ICE", "SP", 90, 100, 15, "FREEZE_SIDE_EFFECT1", "ICE_PUNCH", "vanilla"),
    ("ICICLE_CRASH", "Icicle Crash", "ICE", "XP", 120, 85, 10, "FLINCH_SIDE_EFFECT1", "ROCK_SLIDE", "new"),
    ("POWDER_SNOW",  "Powder Snow",  "ICE", "WS", 40, 100, 35, NO_FX, "MIST", "new"),
    ("ICY_WIND",     "Icy Wind",     "ICE", "MS", 60, 100, 20, "SPEED_DOWN_SIDE_EFFECT", "HAZE", "new"),
    ("ICE_BEAM",     "Ice Beam",     "ICE", "SS", 90, 100, 15, "FREEZE_SIDE_EFFECT1", "ICE_BEAM", "vanilla"),
    ("BLIZZARD",     "Blizzard",     "ICE", "XS", 120, 85, 5, "FREEZE_SIDE_EFFECT1", "BLIZZARD", "vanilla"),
    # ---- DRAGON
    ("DRAGON_TAIL",  "Dragon Tail",  "DRAGON", "WP", 45, 100, 30, NO_FX, "SLAM", "new"),
    ("DRAGON_CLAW",  "Dragon Claw",  "DRAGON", "MP", 65, 100, 20, NO_FX, "FURY_SWIPES", "new"),
    ("DRAGON_RUSH",  "Dragon Rush",  "DRAGON", "SP", 90, 100, 15, NO_FX, "TAKE_DOWN", "new"),
    ("OUTRAGE",      "Outrage",      "DRAGON", "XP", 120, 85, 10, "THRASH_PETAL_DANCE_EFFECT", "THRASH", "new"),
    ("TWISTER",      "Twister",      "DRAGON", "WS", 40, 100, 30, NO_FX, "FIRE_SPIN", "new"),
    ("DRAGONBREATH", "Dragonbreath", "DRAGON", "MS", 60, 100, 20, "PARALYZE_SIDE_EFFECT1", "DRAGON_RAGE", "new"),
    ("DRAGON_PULSE", "Dragon Pulse", "DRAGON", "SS", 90, 100, 15, NO_FX, "DRAGON_RAGE", "new"),
    ("DRACO_METEOR", "Draco Meteor", "DRAGON", "XS", 130, 85, 5, NO_FX, "SKY_ATTACK", "new"),
    # ---- DARK
    ("PURSUIT",      "Pursuit",      "DARK", "WP", 40, 100, 35, NO_FX, "QUICK_ATTACK", "new"),
    ("BITE",         "Bite",         "DARK", "MP", 60, 100, 25, "FLINCH_SIDE_EFFECT1", "BITE", "vanilla"),
    ("CRUNCH",       "Crunch",       "DARK", "SP", 90, 100, 15, "DEFENSE_DOWN_SIDE_EFFECT", "HYPER_FANG", "new"),
    ("NIGHT_SLASH",  "Night Slash",  "DARK", "XP", 120, 85, 10, NO_FX, "SLASH", "new"),
    ("SNARL",        "Snarl",        "DARK", "WS", 40, 100, 30, NO_FX, "GROWL", "new"),
    ("NIGHT_RAY",    "Night Ray",    "DARK", "MS", 65, 100, 20, NO_FX, "NIGHT_SHADE", "new"),
    ("DARK_PULSE",   "Dark Pulse",   "DARK", "SS", 90, 100, 15, "FLINCH_SIDE_EFFECT1", "PSYWAVE", "new"),
    ("DARK_STORM",   "Dark Storm",   "DARK", "XS", 120, 85, 5, NO_FX, "THUNDER", "new"),
    # ---- FAIRY
    ("PIXIE_STRIKE", "Pixie Strike", "FAIRY", "WP", 40, 100, 35, NO_FX, "DOUBLESLAP", "new"),
    ("SPIRIT_BREAK", "Spirit Break", "FAIRY", "MP", 65, 100, 20, "SPECIAL_DOWN_SIDE_EFFECT", "MEGA_PUNCH", "new"),
    ("PLAY_ROUGH",   "Play Rough",   "FAIRY", "SP", 90, 100, 15, "ATTACK_DOWN_SIDE_EFFECT", "FURY_SWIPES", "new"),
    ("STAR_SMASH",   "Star Smash",   "FAIRY", "XP", 120, 85, 5, NO_FX, "SKULL_BASH", "new"),
    ("FAIRY_WIND",   "Fairy Wind",   "FAIRY", "WS", 40, 100, 30, NO_FX, "MIST", "new"),
    ("DRAIN_KISS",   "Drain Kiss",   "FAIRY", "MS", 60, 100, 20, "DRAIN_HP_EFFECT", "LOVELY_KISS", "new"),
    ("DAZZLE_GLEAM", "Dazzle Gleam", "FAIRY", "SS", 90, 100, 15, NO_FX, "FLASH", "new"),
    ("MOONBLAST",    "Moonblast",    "FAIRY", "XS", 120, 85, 5, "SPECIAL_DOWN_SIDE_EFFECT", "AURORA_BEAM", "new"),
    # ---- SOUND
    ("ECHO_JAB",     "Echo Jab",     "SOUND", "WP", 40, 100, 35, NO_FX, "POUND", "new"),
    ("SONIC_SLAM",   "Sonic Slam",   "SOUND", "MP", 65, 100, 20, "FLINCH_SIDE_EFFECT1", "SLAM", "new"),
    ("ECHO_CRASH",   "Echo Crash",   "SOUND", "SP", 90, 100, 15, NO_FX, "BODY_SLAM", "new"),
    ("SONIC_SMASH",  "Sonic Smash",  "SOUND", "XP", 120, 85, 5, NO_FX, "EXPLOSION", "new"),
    ("SONICBOOM",    "Sonicboom",    "SOUND", "WS", 40, 100, 30, NO_FX, "SONICBOOM", "repurposed"),
    ("ROUND_M",      "Round",        "SOUND", "MS", 60, 100, 25, NO_FX, "SING", "new"),  # ROUND is an rgbasm keyword
    ("HYPER_VOICE",  "Hyper Voice",  "SOUND", "SS", 90, 100, 15, NO_FX, "ROAR", "new"),
    ("BOOMBURST",    "Boomburst",    "SOUND", "XS", 120, 85, 5, NO_FX, "SELFDESTRUCT", "new"),
    # ---- LIGHT
    ("GLOW_PUNCH",   "Glow Punch",   "LIGHT", "WP", 40, 100, 35, NO_FX, "COMET_PUNCH", "new"),
    ("FLASH_KICK",   "Flash Kick",   "LIGHT", "MP", 65, 100, 20, NO_FX, "ROLLING_KICK", "new"),
    ("PRISM_BLADE",  "Prism Blade",  "LIGHT", "SP", 90, 100, 15, NO_FX, "SLASH", "new"),
    ("NOVA_STRIKE",  "Nova Strike",  "LIGHT", "XP", 120, 85, 5, NO_FX, "SELFDESTRUCT", "new"),
    ("LIGHT_RAY",    "Light Ray",    "LIGHT", "WS", 40, 100, 30, NO_FX, "FLASH", "new"),
    ("AURORA_BEAM",  "Aurora Beam",  "LIGHT", "MS", 65, 100, 20, "ATTACK_DOWN_SIDE_EFFECT", "AURORA_BEAM", "vanilla"),
    ("PHOTON_BEAM",  "Photon Beam",  "LIGHT", "SS", 90, 100, 15, NO_FX, "AURORA_BEAM", "new"),
    ("SUPERNOVA",    "Supernova",    "LIGHT", "XS", 120, 85, 5, NO_FX, "EXPLOSION", "new"),
]

# Signature moves kept outside the band grid (unique mechanics / classics).
# (const, name, type, cat, power, acc, pp, effect, anim, note)
EXTRAS = [
    ("CUT",          "Cut",          "NORMAL",   "P", 50, 100, 30, NO_FX, "CUT",
     "HM01 field move; weak-band Normal physical"),
    ("QUICK_ATTACK", "Quick Attack", "NORMAL",   "P", 40, 100, 30, NO_FX, "QUICK_ATTACK",
     "weak-band Normal physical (kept for flavor)"),
    ("SLASH",        "Slash",        "NORMAL",   "P", 65, 100, 20, NO_FX, "SLASH",
     "moderate-band Normal physical, high crit rate"),
    ("PAY_DAY",      "Pay Day",      "NORMAL",   "P", 40, 100, 20, "PAY_DAY_EFFECT", "PAY_DAY",
     "money on hit (kept for its unique effect)"),
    ("EXPLOSION",    "Explosion",    "NORMAL",   "P", 170, 100, 5, "EXPLODE_EFFECT", "EXPLOSION",
     "user faints (unique effect)"),
    ("COUNTER",      "Counter",      "FIGHTING", "P", 1, 100, 20, NO_FX, "COUNTER",
     "returns 2× damage from any physical move (fork-modernized; kept)"),
    ("SEISMIC_TOSS", "Seismic Toss", "FIGHTING", "P", 1, 100, 20, "SPECIAL_DAMAGE_EFFECT", "SEISMIC_TOSS",
     "fixed damage = user level"),
    ("NIGHT_SHADE",  "Night Shade",  "GHOST",    "S", 1, 100, 15, "SPECIAL_DAMAGE_EFFECT", "NIGHT_SHADE",
     "fixed damage = user level"),
    ("SWIFT",        "Swift",        "LIGHT",    "S", 60, 100, 20, "SWIFT_EFFECT", "SWIFT",
     "never misses (kept for its unique effect)"),
]

HIGH_CRIT = ["KARATE_CHOP", "RAZOR_LEAF", "CRABHAMMER", "SLASH",
             "STONE_EDGE", "NIGHT_SLASH"]

# Disposition of cut vanilla moves: old const -> replacement new const (or None
# to simply drop from learnsets/TM lists with no successor).
CUT_MAP = {
    "POUND": "TACKLE", "DOUBLESLAP": "TACKLE", "COMET_PUNCH": "TACKLE",
    "MEGA_PUNCH": "STRENGTH", "SCRATCH": "TACKLE", "VICEGRIP": "HEADBUTT",
    "GUILLOTINE": None, "BIND": "HEADBUTT", "SLAM": "HEADBUTT",
    "STOMP": "HEADBUTT", "DOUBLE_KICK": "LOW_KICK", "MEGA_KICK": "DOUBLE_EDGE",
    "JUMP_KICK": "HI_JUMP_KICK", "ROLLING_KICK": "LOW_KICK",
    "HORN_ATTACK": "HEADBUTT", "FURY_ATTACK": "TACKLE", "HORN_DRILL": None,
    "BODY_SLAM": "STRENGTH", "WRAP": "TACKLE", "TAKE_DOWN": "DOUBLE_EDGE",
    "THRASH": "DOUBLE_EDGE", "TWINEEDLE": "CROSS_POISON",
    "PIN_MISSILE": "FURY_CUTTER", "ABSORB": "MEGA_DRAIN",
    "PETAL_DANCE": "ENERGY_BALL", "DRAGON_RAGE": "TWISTER",
    "FIRE_SPIN": "FLAME_BURST", "RAGE": "HEADBUTT", "SELFDESTRUCT": "EXPLOSION",
    "EGG_BOMB": "STRENGTH", "SMOG": "SLUDGE", "CLAMP": "RAZOR_SHELL",
    "SKULL_BASH": "DOUBLE_EDGE", "SPIKE_CANNON": "ICE_SHARD",
    "CONSTRICT": "TACKLE", "DREAM_EATER": "PSYCHIC_M", "BARRAGE": "TACKLE",
    "SKY_ATTACK": "FLY", "BUBBLE": "WATER_GUN", "DIZZY_PUNCH": "HEADBUTT",
    "PSYWAVE": "CONFUSION", "FURY_SWIPES": "SLASH", "BONEMERANG": "BULLDOZE",
    "HYPER_FANG": "BITE", "SUPER_FANG": "SLASH", "BIDE": "COUNTER",
}

# New TM/HM assignments (slot -> move const). HMs unchanged.
NEW_HMS = ["CUT", "FLY", "SURF", "STRENGTH", "FLASH"]
NEW_TMS = [
    "SLUDGE_BOMB",   # TM01
    "AIR_SLASH",     # TM02
    "SWORDS_DANCE",  # TM03 (vanilla slot)
    "SHADOW_BALL",   # TM04
    "DAZZLE_GLEAM",  # TM05
    "TOXIC",         # TM06 (vanilla slot)
    "STONE_EDGE",    # TM07
    "CRUNCH",        # TM08
    "ENERGY_BALL",   # TM09
    "DOUBLE_EDGE",   # TM10 (vanilla slot)
    "BUBBLEBEAM",    # TM11 (vanilla slot)
    "HYPER_VOICE",   # TM12
    "ICE_BEAM",      # TM13 (vanilla slot)
    "BLIZZARD",      # TM14 (vanilla slot)
    "HYPER_BEAM",    # TM15 (vanilla slot)
    "PAY_DAY",       # TM16 (vanilla slot)
    "AURA_SPHERE",   # TM17
    "COUNTER",       # TM18 (vanilla slot)
    "SEISMIC_TOSS",  # TM19 (vanilla slot)
    "FLAMETHROWER",  # TM20
    "MEGA_DRAIN",    # TM21 (vanilla slot)
    "SOLARBEAM",     # TM22 (vanilla slot)
    "IRON_TAIL",     # TM23
    "THUNDERBOLT",   # TM24 (vanilla slot)
    "THUNDER",       # TM25 (vanilla slot)
    "EARTHQUAKE",    # TM26 (vanilla slot)
    "FISSURE",       # TM27 (vanilla slot, now Ground special nuke)
    "DIG",           # TM28 (vanilla slot)
    "PSYCHIC_M",     # TM29 (vanilla slot)
    "SHOCK_WAVE",    # TM30
    "MIMIC",         # TM31 (vanilla slot)
    "DOUBLE_TEAM",   # TM32 (vanilla slot)
    "REFLECT",       # TM33 (vanilla slot)
    "DARK_PULSE",    # TM34
    "METRONOME",     # TM35 (vanilla slot)
    "FLASH_CANNON",  # TM36
    "PHOTON_BEAM",   # TM37
    "FIRE_BLAST",    # TM38 (vanilla slot)
    "SWIFT",         # TM39 (vanilla slot)
    "X_SCISSOR",     # TM40
    "SOFTBOILED",    # TM41 (vanilla slot)
    "DRAGON_PULSE",  # TM42
    "BUG_BUZZ",      # TM43
    "REST",          # TM44 (vanilla slot)
    "THUNDER_WAVE",  # TM45 (vanilla slot)
    "LIGHT_SCREEN",  # TM46
    "EXPLOSION",     # TM47 (vanilla slot)
    "ROCK_SLIDE",    # TM48 (vanilla slot)
    "TRI_ATTACK",    # TM49 (vanilla slot)
    "SUBSTITUTE",    # TM50 (vanilla slot)
]

# extra per-species TM grants for the brand-new TMs (beyond the automatic
# STAB / remap rules), keyed by TM move const
NEW_TM_EXTRA = {
    "SHADOW_BALL": ["gengar", "haunter", "gastly", "hypno", "drowzee",
                    "mewtwo", "mew", "alakazam", "kadabra", "jynx"],
    "STONE_EDGE": ["machamp", "machoke", "machop", "sandslash", "marowak",
                   "cubone", "primeape", "mankey", "hitmonlee", "hitmonchan",
                   "snorlax", "kangaskhan", "nidoking", "nidoqueen"],
    "CRUNCH": ["gyarados", "arbok", "ekans", "raticate", "growlithe",
               "arcanine", "aerodactyl", "gengar", "snorlax", "dragonite"],
    "IRON_TAIL": ["onix", "rhyhorn", "rhydon", "sandslash", "dragonair",
                  "dragonite", "gyarados", "raichu", "pikachu"],
    "AURA_SPHERE": ["mewtwo", "mew", "hitmonchan", "poliwrath"],
    "DRAGON_PULSE": ["gyarados", "charizard", "aerodactyl", "seadra",
                     "lapras", "arcanine"],
    "HYPER_VOICE": [],   # sound rule below also applies
    "SHOCK_WAVE": [],    # granted alongside Thunderbolt compatibility
    "PHOTON_BEAM": ["mewtwo", "mew", "magneton", "magnemite"],
    "AIR_SLASH": ["charizard", "aerodactyl", "gyarados", "dragonite"],
    "DAZZLE_GLEAM": ["mewtwo", "mew", "alakazam", "kadabra", "abra",
                     "hypno", "jynx", "starmie", "ninetales", "rapidash"],
    "ENERGY_BALL": ["parasect", "paras", "exeggcute", "exeggutor"],
    "FLAMETHROWER": [],
    "SLUDGE_BOMB": [],
    "FLASH_CANNON": [],
    "X_SCISSOR": ["kingler", "krabby", "scyther", "pinsir", "gligar" ],
    "BUG_BUZZ": [],
    "DARK_PULSE": ["gengar", "haunter", "mewtwo"],
    "LIGHT_SCREEN": ["mewtwo", "mew", "alakazam", "kadabra", "abra", "hypno",
                     "drowzee", "starmie", "staryu", "magneton", "magnemite",
                     "chansey", "clefable", "clefairy", "wigglytuff",
                     "jigglypuff", "lapras", "vaporeon", "jolteon", "flareon",
                     "porygon", "articuno", "zapdos", "moltres", "dragonite"],
}

# species that learn no TMs at all (vanilla rule)
NO_TMS = {"caterpie", "metapod", "weedle", "kakuna", "magikarp", "ditto"}

# per-species learnset hand-tuning applied AFTER the automatic rebuild:
# key -> list of (level, const) to force-add
LEARNSET_ADD = {
    "pikachu":   [(26, "SPARK"), (41, "WILD_CHARGE")],
    "raichu":    [(1, "SPARK")],
    "eevee":     [(27, "SWIFT")],
    "ditto":     [],
    "dragonite": [(55, "OUTRAGE")],
    "dragonair": [(45, "DRAGON_RUSH")],
    "dratini":   [(30, "DRAGON_CLAW")],
    "gengar":    [(38, "SHADOW_BALL")],
    "haunter":   [(38, "SHADOW_BALL")],
    "mewtwo":    [(1, "PSYCHO_CUT"), (70, "PSYCHO_BOOST")],
    "mew":       [(30, "PSYCHIC_M")],
    "snorlax":   [(48, "DOUBLE_EDGE")],
    "clefairy":  [(30, "DRAIN_KISS")],
    "clefable":  [(1, "DRAIN_KISS")],
    "jigglypuff": [(29, "ROUND_M")],
    "wigglytuff": [(1, "ROUND_M")],
    "magneton":  [(40, "FLASH_CANNON")],
    "magnemite": [(28, "MIRROR_SHOT")],
    "staryu":    [(28, "LIGHT_RAY")],
    "starmie":   [(1, "LIGHT_RAY")],
    "onix":      [(33, "IRON_HEAD")],
    "scyther":   [(35, "X_SCISSOR")],
    "pinsir":    [(40, "MEGAHORN")],
    "aerodactyl": [(38, "CRUNCH")],
    "gyarados":  [(41, "CRUNCH")],
    "articuno":  [(51, "HURRICANE")],
    "zapdos":    [(51, "HURRICANE")],
    "moltres":   [(51, "HURRICANE")],
    "jynx":      [(39, "DRAIN_KISS")],
    "sandshrew": [(17, "BULLDOZE")],
    "sandslash": [(17, "BULLDOZE"), (47, "EARTHQUAKE")],
    "diglett":   [(19, "BULLDOZE")],
    "dugtrio":   [(19, "BULLDOZE"), (47, "EARTHQUAKE")],
}
# key -> list of consts to remove after rebuild (dedupe/flavor fixes)
LEARNSET_DROP = defaultdict(list)

def stat_lean(mon):
    """'P', 'S', or 'M' (mixed) from base Attack vs Sp. Atk."""
    atk, spa = mon["stats"][1], mon["stats"][4]
    if atk >= spa + 10:
        return "P"
    if spa >= atk + 10:
        return "S"
    return "M"

SPECIAL_LEAN_TYPES = {"FIRE", "WATER", "GRASS", "ELECTRIC", "PSYCHIC_TYPE",
                      "ICE", "DRAGON", "GHOST", "FAIRY", "SOUND", "LIGHT"}

def pick_cat(mon, mtype):
    lean = stat_lean(mon)
    if lean == "M":
        return "S" if mtype in SPECIAL_LEAN_TYPES else "P"
    return lean

def build_plan():
    cur_moves = parse_current_moves()
    cur_tmhm, cur_tms, cur_hms = parse_tmhm_map()
    mons, bykey = parse_pokemon()

    status_consts = [c for c, m in cur_moves.items() if m["cat"] == "T"]
    assert len(status_consts) == 55

    # ---- assemble new roster ------------------------------------------------
    new_moves = {}   # const -> dict
    def add(const, name, mtype, cat, band, power, acc, pp, effect, anim, origin, note=""):
        assert const not in new_moves, "duplicate const %s" % const
        new_moves[const] = dict(name=name, type=mtype, cat=cat, band=band,
                                power=power, acc=acc, pp=pp, effect=effect,
                                anim=anim, origin=origin, note=note)

    grid_index = {}
    for const, name, mtype, band, power, acc, pp, effect, anim, origin in GRID:
        cat = "P" if band[1] == "P" else "S"
        add(const, name, mtype, cat, band, power, acc, pp, effect, anim, origin)
        assert (mtype, band) not in grid_index, "grid slot dup %s %s" % (mtype, band)
        grid_index[(mtype, band)] = const
    for const, name, mtype, cat, power, acc, pp, effect, anim, note in EXTRAS:
        add(const, name, mtype, cat, None, power, acc, pp, effect, anim, "vanilla", note)
    for const in status_consts:
        m = cur_moves[const]
        add(const, m["name"], m["type"], "T", None, 0, m["acc"], m["pp"],
            m["effect"], const, "vanilla", "status move, unchanged")
    add("STRUGGLE", "Struggle", "TYPELESS", "P", None, 50, 100, 10,
        "RECOIL_EFFECT", "STRUGGLE", "vanilla", "last-resort move, unchanged")

    # ---- validations --------------------------------------------------------
    errors = []
    for t in GRID_TYPES:
        for band in BANDS:
            if (t, band) not in grid_index:
                errors.append("missing grid slot %s %s" % (t, band))
    for const, mv in new_moves.items():
        if mv["band"]:
            label, lo, hi, acc = BANDS[mv["band"]]
            if not (lo <= mv["power"] <= hi):
                errors.append("%s power %d outside %s band" % (const, mv["power"], mv["band"]))
            if mv["acc"] != acc:
                errors.append("%s acc %d != %d for band %s" % (const, mv["acc"], acc, mv["band"]))
            if mv["band"] in ("WP", "WS") and mv["effect"] != NO_FX:
                errors.append("%s weak band must have no secondary effect" % const)
        if len(mv["name"]) > 12:
            errors.append("%s name too long: %r" % (const, mv["name"]))
        if mv["pp"] > 40:
            errors.append("%s pp > 40" % const)
        if mv["cat"] != "T" and mv["anim"] not in cur_moves:
            errors.append("%s animation %s is not a vanilla move" % (const, mv["anim"]))
        if mv["effect"] in ("CHARGE_EFFECT", "FLY_EFFECT", "HYPER_BEAM_EFFECT",
                            "RAZOR_WIND_EFFECT"):
            errors.append("%s uses a banned two-turn effect" % const)
    # every vanilla move accounted for
    for const in cur_moves:
        if const not in new_moves and const not in CUT_MAP:
            errors.append("vanilla move %s has no disposition" % const)
    for const, target in CUT_MAP.items():
        if const in new_moves:
            errors.append("cut move %s is also in the roster" % const)
        if target is not None and target not in new_moves:
            errors.append("cut move %s maps to unknown %s" % (const, target))
    # ID budget: total moves + special battle anim ids must fit in one byte,
    # $FF reserved (CANNOT_MOVE). 37 anim ids today, 11 verified unused.
    total = len(new_moves)
    if total + (37 - 11) > 254:
        errors.append("roster of %d moves overflows the 1-byte id space" % total)
    if errors:
        for e in errors:
            print("ERROR:", e)
        sys.exit(1)

    def remap(const):
        if const in new_moves:
            return const
        return CUT_MAP.get(const)

    # ---- rebuild learnsets --------------------------------------------------
    for mon in mons:
        seen = set()
        out = []
        def push(level, const):
            if const and const not in seen:
                seen.add(const)
                out.append((level, const))
        for const in mon["lvl1"]:
            push(1, remap(const))
        for level, const in mon["learnset"]:
            push(level, remap(const))
        for level, const in LEARNSET_ADD.get(mon["key"], []):
            push(level, const)
        for const in LEARNSET_DROP.get(mon["key"], []):
            seen.discard(const)
            out = [(l, c) for l, c in out if c != const]

        # guarantee a level-1 damaging move (except deliberate no-attackers)
        has_l1_attack = any(l == 1 and new_moves[c]["cat"] != "T" for l, c in out)
        if not has_l1_attack and mon["key"] not in ("abra", "ditto", "magikarp"):
            push(1, "TACKLE")

        # STAB ladder completion (deliberate no-attackers keep their joke sets)
        skip_stab = mon["key"] in ("ditto", "magikarp")
        maxlvl = max([l for l, _ in out], default=1)
        is_final = not mon["evolutions"]
        types = [mon["types"][0]] if mon["types"][0] == mon["types"][1] else list(mon["types"])
        for i, t in enumerate(types):
            if t not in GRID_TYPES or skip_stab:
                continue
            cat = pick_cat(mon, t)
            owned_bands = {new_moves[c]["band"] for _, c in out
                           if new_moves[c]["type"] == t}
            weak = grid_index[(t, "W" + cat)]
            mod = grid_index[(t, "M" + cat)]
            strong = grid_index[(t, "S" + cat)]
            if i == 0 and not ({"W" + cat, "WP", "WS"} & owned_bands) \
               and not ({"M" + cat, "MP", "MS", "S" + cat} & owned_bands):
                push(min(10, maxlvl + 2), weak)
            if not ({"M" + cat, "MP", "MS"} & owned_bands) and (is_final or mon["evolves_from"]):
                push(22 if i == 0 else 30, mod)
            if i == 0 and is_final and not ({"S" + cat, "SP", "SS"} & owned_bands):
                lvl = min(52, max(38, maxlvl + 4))
                push(lvl, strong)
        out.sort(key=lambda lc: (lc[0], lc[1]))
        # prune outclassed learns: a damaging move whose band is <= the band of
        # a same-type same-category move already learned at an earlier level
        band_rank = {"W": 0, "M": 1, "S": 2, "X": 3}
        pruned = []
        best = {}  # (type, cat) -> best band rank so far
        for level, const in out:
            mv = new_moves[const]
            if mv["cat"] != "T" and mv["band"]:
                key2 = (mv["type"], mv["cat"])
                rank = band_rank[mv["band"][0]]
                if key2 in best and rank <= best[key2] and level > 1:
                    continue
                best[key2] = max(best.get(key2, -1), rank)
            pruned.append((level, const))
        mon["new_learnset"] = pruned

    # ---- rebuild TM/HM compatibility ---------------------------------------
    tm_slot = {}
    for i, mv in enumerate(NEW_TMS, 1):
        tm_slot[mv] = "TM%02d" % i
    for i, mv in enumerate(NEW_HMS, 1):
        tm_slot[mv] = "HM%02d" % i

    new_tm_moves = set(NEW_TMS) - set(cur_tms)  # brand-new TM assignments
    # Growl excluded: it is near-universal and would make this TM universal
    sound_status = {"ROAR", "SING", "SUPERSONIC", "SCREECH"}

    for mon in mons:
        compat = set()
        # 1. keep vanilla compatibility, remapped, for moves still TM/HM moves
        for const in mon["tms"]:
            m = remap(const)
            if m and m in tm_slot:
                compat.add(m)
        # 2. STAB: grant this species every TM attack of its own types
        types = set(mon["types"])
        for mv in NEW_TMS:
            info = new_moves[mv]
            if info["cat"] != "T" and info["type"] in types:
                compat.add(mv)
        # 3. themed grants for brand-new TMs
        for mv in new_tm_moves:
            if mon["key"] in NEW_TM_EXTRA.get(mv, []):
                compat.add(mv)
        # Hyper Voice: anything that had a sound status move by level
        allmoves = set(mon["lvl1"]) | {c for _, c in mon["learnset"]}
        if allmoves & sound_status:
            compat.add("HYPER_VOICE")
        # Shock Wave rides Thunderbolt compatibility
        if "THUNDERBOLT" in compat:
            compat.add("SHOCK_WAVE")
        # Mew learns every TM/HM (vanilla rule)
        if mon["key"] == "mew":
            compat = set(NEW_TMS) | set(NEW_HMS)
        if mon["key"] in NO_TMS:
            compat = set()
        mon["new_tms"] = sorted(compat, key=lambda c: tm_slot[c])

    return dict(cur_moves=cur_moves, new_moves=new_moves,
                grid_index=grid_index, tm_slot=tm_slot, mons=mons,
                cut_map=CUT_MAP, new_tms=NEW_TMS, new_hms=NEW_HMS,
                high_crit=HIGH_CRIT, status_consts=status_consts)

def main():
    p = build_plan()
    write_doc(p["cur_moves"], p["new_moves"], p["grid_index"],
              p["tm_slot"], p["mons"], p["cut_map"])

def fmt_power(mv):
    if mv["cat"] == "T":
        return "—"
    return str(mv["power"]) if mv["power"] > 1 else "*"

def write_doc(cur_moves, new_moves, grid_index, tm_slot, mons, cut_map):
    L = []
    w = L.append
    w("# Move Overhaul Plan (Complete Move-List Redo)")
    w("")
    w("This is the **design document** for a ground-up redo of this fork's move")
    w("lists — the companion piece to `docs/pokemon_reference.md`, describing the")
    w("*planned* state rather than the current one. It was generated by")
    w("`tools/gen_move_overhaul_plan.py`, which rebuilds every learnset and TM/HM set")
    w("from the repository's current data using the rules below, and validates")
    w("all design constraints. Nothing in the game data has been changed yet.")
    w("")
    w("## Design goals")
    w("")
    w("1. **A complete band grid.** Every one of the 20 attacking types (Stellar")
    w("   and ??? excluded) gets exactly one move in each of eight damage bands:")
    w("")
    w("| Band | Power | Acc | Secondary effect | PP |")
    w("|------|-------|-----|------------------|----|")
    w("| Weak Physical / Weak Special | 35–50 | 100% | none | 30–35 |")
    w("| Moderate Physical / Moderate Special | 50–70 | 100% | allowed | 15–25 |")
    w("| Strong Physical / Strong Special | 90 | 100% | only small 10% riders where they define the move (elemental punches, Ice Beam, …) | 15 |")
    w("| Strongest Physical / Strongest Special | 110–130 | 85% | allowed (incl. recoil drawbacks) | 5–10 |")
    w("")
    w("   That is **160 damaging moves** — a clean, predictable ladder for every")
    w("   type, so every Pokémon can be given sensible STAB at every stage of the")
    w("   game.")
    w("2. **Every vanilla status move survives untouched** (all 55, from Swords")
    w("   Dance to Splash), keeping their fork retypes (Growl→Sound, Flash→Light,")
    w("   Sand-Attack→Ground, …).")
    w("3. **Nine signature moves kept outside the grid** for their unique")
    w("   mechanics or field use: Cut, Quick Attack, Slash, Pay Day, Explosion,")
    w("   Counter, Seismic Toss, Night Shade, Swift. Plus Struggle.")
    w("4. **Only existing animations.** Every new move names a vanilla move whose")
    w("   animation it plays — the `move` macro's first byte is already an")
    w("   animation ID, so this needs no animation-engine work.")
    w("5. **No two-turn moves.** Charge and recharge mechanics are gone: Fly,")
    w("   Dig, Shadow Force, and Solarbeam hit in one turn, and Hyper Beam no")
    w("   longer needs a recharge turn. All five sit at the standard 120 BP /")
    w("   85% strongest-band line, alongside the other drawback-free nukes")
    w("   (Hydro Pump, Megahorn, Crabhammer, …), so no compensating drawback is")
    w("   needed. (Fly and Dig keep their field/HM functions — those are")
    w("   independent of the battle effect.) Outrage's 2–3-turn rampage lock")
    w("   stays: it attacks every turn, so it is a drawback, not a charge.")
    w("6. **Only existing effect handlers.** Every move uses an effect constant")
    w("   that already exists in `constants/move_effect_constants.asm`; no new")
    w("   battle code is required for any move in this plan. The engine's")
    w("   charging-turn code paths simply become unused.")
    w("")
    total = len(new_moves)
    w("**Roster size: %d moves** (160 grid + 9 signature + 55 status + Struggle)." % total)
    w("")
    w("## Engine constraints and budget")
    w("")
    w("- Move IDs, battle-animation IDs, and the special battle animations")
    w("  (`SHOWPIC_ANIM` … `BAIT_ANIM`) share one byte of ID space, and `$FF` is")
    w("  reserved (`CANNOT_MOVE`). Today: 165 moves + 37 special anims.")
    w("- This plan needs %d move IDs + 26 special anims = %d IDs (≤ 254 ✓)," % (total, total + 26))
    w("  after **reclaiming 11 unused special-anim IDs** (`ANIM_A8`, `ANIM_B1`–")
    w("  `ANIM_B9`, `ANIM_BB` — their only reference is an unused row in")
    w("  `data/moves/field_moves.asm`). If any of those turn out to be live, the")
    w("  signature moves list above is the cut line, in reverse order.")
    w("- Move names are limited to **12 characters** (`MOVE_NAME_LENGTH - 2`);")
    w("  every name below fits. PP is capped at 40 by the `move` macro.")
    w("- Vanilla moves that survive **keep their current move IDs**, so the")
    w("  animation pointer table, SFX table, and grammar tables stay valid for")
    w("  them. Cut moves' ID slots are recycled for new moves; the remainder are")
    w("  appended after `STRUGGLE`. The animation pointer table gets one entry")
    w("  per new ID (pointing at the reused animation), keeping the special")
    w("  anims contiguous after `NUM_ATTACKS` exactly as today.")
    w("")
    w("## Implementation checklist")
    w("")
    w("When executing this plan, each new/changed move touches these tables,")
    w("which must stay index-aligned (all asserted by `table_width`/")
    w("`assert_table_length`):")
    w("")
    w("1. `constants/move_constants.asm` — add/rename constants; delete the 11")
    w("   unused anim constants; `NUM_ATTACKS` grows to %d." % total)
    w("2. `data/moves/moves.asm` — stats + effect + **animation byte** (set to the")
    w("   vanilla move's ID listed in the Animation column below).")
    w("3. `data/moves/names.asm` — names (≤12 chars).")
    w("4. `data/moves/categories.asm` — physical/special/status per move.")
    w("5. `data/moves/animations.asm` — add pointer-table entries for new IDs.")
    w("6. `data/moves/sfx.asm` — one row per move; copy the row of the move whose")
    w("   animation is being reused.")
    w("7. `data/moves/grammar.asm` — new moves default to the \"used X!\" set; no")
    w("   change needed unless flavor is wanted.")
    w("8. `constants/item_constants.asm` — the `add_tm` list (TM item↔move map).")
    w("9. `data/pokemon/base_stats/*.asm` — level-1 moves + `tmhm` lists.")
    w("10. `data/pokemon/evos_moves.asm` — level-up learnsets.")
    w("11. `engine/battle/` high-crit table — now: %s." % ", ".join(
        new_moves[c]["name"] for c in HIGH_CRIT))
    w("12. Grep `data/trainers/` and `engine/` for cut move constants (trainer")
    w("    custom movesets, Metronome exclusions, field-move tables) and remap")
    w("    them with the disposition table below.")
    w("13. Rerun `tools/gen_pokemon_docs.py`, then `make -j$(nproc)`.")
    w("")

    # ---- band grid matrix
    w("## The band grid at a glance")
    w("")
    w("| Type | Weak Phys | Mod Phys | Strong Phys | Max Phys | Weak Spec | Mod Spec | Strong Spec | Max Spec |")
    w("|------|-----------|----------|-------------|----------|-----------|----------|-------------|----------|")
    for t in GRID_TYPES:
        row = [TYPE_DISPLAY[t]]
        for band in ("WP", "MP", "SP", "XP", "WS", "MS", "SS", "XS"):
            row.append(new_moves[grid_index[(t, band)]]["name"])
        w("| " + " | ".join(row) + " |")
    w("")

    # ---- full move table
    w("## Full move list")
    w("")
    w("Origin: **vanilla** = kept (possibly retuned), **repurposed** = vanilla")
    w("name in a new role, **new** = new move reusing a vanilla animation.")
    w("High-crit moves: %s." % ", ".join(new_moves[c]["name"] for c in HIGH_CRIT))
    w("")
    w("| Move | Type | Cat | Band | Power | Acc | PP | Effect | Animation | Origin |")
    w("|------|------|-----|------|-------|-----|----|--------|-----------|--------|")
    band_order = {b: i for i, b in enumerate(("WP", "MP", "SP", "XP", "WS", "MS", "SS", "XS"))}
    def sort_key(item):
        const, mv = item
        cat_rank = {"P": 0, "S": 0, "T": 1}[mv["cat"]]
        trank = GRID_TYPES.index(mv["type"]) if mv["type"] in GRID_TYPES else 99
        return (cat_rank, trank, band_order.get(mv["band"], 50), mv["name"])
    for const, mv in sorted(new_moves.items(), key=sort_key):
        eff = mv["effect"].replace("_EFFECT", "").replace("NO_ADDITIONAL", "—")
        anim = cur_moves[mv["anim"]]["name"] if mv["anim"] in cur_moves else "—"
        band = BANDS[mv["band"]][0] if mv["band"] else ("Status" if mv["cat"] == "T" else "Signature")
        cat = {"P": "Physical", "S": "Special", "T": "Status"}[mv["cat"]]
        acc = "%d%%" % mv["acc"]
        w("| %s | %s | %s | %s | %s | %s | %d | %s | %s | %s |" % (
            mv["name"], TYPE_DISPLAY[mv["type"]], cat, band, fmt_power(mv),
            acc, mv["pp"], eff, anim, mv["origin"]))
    w("")

    # ---- disposition table
    w("## Disposition of every vanilla move")
    w("")
    w("| Vanilla move | Fate | Replacement in learnsets/TMs |")
    w("|--------------|------|------------------------------|")
    for const, m in sorted(cur_moves.items(), key=lambda kv: kv[1]["id"]):
        if const in new_moves:
            mv = new_moves[const]
            if mv["cat"] == "T":
                fate = "kept (status)"
            elif mv["origin"] == "repurposed":
                fate = "repurposed — " + (
                    "%s %s, %d BP" % (TYPE_DISPLAY[mv["type"]],
                                      BANDS[mv["band"]][0].lower() if mv["band"] else "signature",
                                      mv["power"]))
            else:
                old = cur_moves[const]
                changes = []
                if old["power"] != mv["power"]:
                    changes.append("%d→%d BP" % (old["power"], mv["power"]))
                if old["acc"] != mv["acc"]:
                    changes.append("%d→%d%% acc" % (old["acc"], mv["acc"]))
                if old["effect"] != mv["effect"]:
                    changes.append("effect changed")
                fate = "kept" + (" (retuned: %s)" % ", ".join(changes) if changes else "")
            repl = "—"
        else:
            target = cut_map[const]
            fate = "cut"
            repl = new_moves[target]["name"] if target else "dropped, no successor"
        w("| %s | %s | %s |" % (m["name"], fate, repl))
    w("")

    # ---- TM/HM list
    w("## TM/HM list")
    w("")
    w("HMs are unchanged (field moves must stay). TM slots kept from vanilla")
    w("where the move survives; freed slots host the new coverage TMs.")
    w("")
    w("| Slot | Move | Type | Cat | Power | Acc |")
    w("|------|------|------|-----|-------|-----|")
    hm_names = ["HM%02d" % i for i in range(1, 6)]
    for i, mv in enumerate(NEW_TMS, 1):
        info = new_moves[mv]
        cat = {"P": "Physical", "S": "Special", "T": "Status"}[info["cat"]]
        w("| TM%02d | %s | %s | %s | %s | %d%% |" % (
            i, info["name"], TYPE_DISPLAY[info["type"]], cat, fmt_power(info), info["acc"]))
    for i, mv in enumerate(NEW_HMS, 1):
        info = new_moves[mv]
        cat = {"P": "Physical", "S": "Special", "T": "Status"}[info["cat"]]
        w("| HM%02d | %s | %s | %s | %s | %d%% |" % (
            i, info["name"], TYPE_DISPLAY[info["type"]], cat, fmt_power(info), info["acc"]))
    w("")

    # ---- learnset rules
    w("## How the learnsets below were built")
    w("")
    w("Rebuilt mechanically from the current data, then hand-tuned:")
    w("")
    w("1. Status moves keep their exact levels (they all still exist).")
    w("2. Every damaging move is remapped through the disposition table")
    w("   (e.g. Body Slam→Strength, Hyper Fang→Crunch, Sky Attack→Fly).")
    w("3. Duplicates introduced by remapping are dropped (first level wins).")
    w("4. **STAB guarantees**, using the species' better attacking stat")
    w("   (Attack vs. Sp. Atk) to pick physical or special:")
    w("   - a damaging move at level 1 (except Abra, Ditto, Magikarp);")
    w("   - its primary type's weak-band move by ~L10 if it has no STAB at all;")
    w("   - a moderate-band STAB for evolved/final forms (~L22 primary, ~L30")
    w("     secondary type);")
    w("   - the strong-band (90 BP) STAB for every final form by ~L38–52.")
    w("   Strongest-band moves are deliberately TM/high-level-only.")
    w("5. Hand additions for flavor (Pikachu's Wild Charge, Gengar's Shadow")
    w("   Ball, legendary birds' Hurricane, …).")
    w("")
    w("Levels shown as `1` are known at level 1 (starting moves). TM/HM")
    w("compatibility = vanilla compatibility remapped + all TMs matching the")
    w("species' own types + themed grants for the brand-new TMs.")
    w("")

    # ---- per-pokemon
    w("## Pokémon: learnsets and TM/HM sets")
    for mon in mons:
        t1, t2 = mon["types"]
        tstr = TYPE_DISPLAY[t1] if t1 == t2 else "%s/%s" % (TYPE_DISPLAY[t1], TYPE_DISPLAY[t2])
        w("")
        w("---")
        w("")
        w("### #%03d %s — %s" % (mon["dex"], mon["name"], tstr))
        w("")
        w("**Level-up moves**")
        w("")
        w("| Lv | Move | Type | Category | Power | Acc | PP |")
        w("|----|------|------|----------|-------|-----|----|")
        for level, const in mon["new_learnset"]:
            mv = new_moves[const]
            cat = {"P": "Physical", "S": "Special", "T": "Status"}[mv["cat"]]
            w("| %d | %s | %s | %s | %s | %d%% | %d |" % (
                level, mv["name"], TYPE_DISPLAY[mv["type"]], cat,
                fmt_power(mv), mv["acc"], mv["pp"]))
        if mon["new_tms"]:
            pretty = ["%s %s" % (tm_slot[c], new_moves[c]["name"]) for c in mon["new_tms"]]
            w("")
            w("**TM/HM compatibility:** " + ", ".join(pretty))
        else:
            w("")
            w("**TM/HM compatibility:** none")

    w("")
    with open(OUT, "w") as f:
        f.write("\n".join(L) + "\n")
    print("wrote %s (%d lines, %d moves)" % (OUT, len(L), len(new_moves)))

if __name__ == "__main__":
    main()
