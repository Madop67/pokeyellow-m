#!/usr/bin/env python3
"""
Generate docs/pokemon_reference.md from the repository's data files.

Everything except the hand-written intro and the curated static/gift
encounter notes is parsed straight from the source of truth:
base stats, EV yields, evolutions, learnsets, TM/HM compatibility,
move data (with categories), the type chart, wild encounter tables,
fishing tables, and in-game trades.

Rerun after changing any of those files:  python3 tools/gen_pokemon_docs.py
"""
import os, re, sys
from collections import defaultdict

REPO = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
OUT = os.path.join(REPO, "docs", "pokemon_reference.md")

def read(path):
    with open(os.path.join(REPO, path)) as f:
        return f.read()

def norm(name):
    return name.lower().replace("_", "").replace("'", "").replace(".", "")

# ---------------------------------------------------------------- types
TYPE_DISPLAY = {
    "NORMAL": "Normal", "FIGHTING": "Fighting", "FLYING": "Flying",
    "POISON": "Poison", "GROUND": "Ground", "ROCK": "Rock", "BUG": "Bug",
    "GHOST": "Ghost", "STEEL": "Steel", "FIRE": "Fire", "WATER": "Water",
    "GRASS": "Grass", "ELECTRIC": "Electric", "PSYCHIC_TYPE": "Psychic",
    "ICE": "Ice", "DRAGON": "Dragon", "DARK": "Dark", "FAIRY": "Fairy",
    "STELLAR": "Stellar", "SOUND": "Sound", "LIGHT": "Light",
    "TYPELESS": "???", "BIRD": "Bird",
}
TYPE_ORDER = ["NORMAL", "FIGHTING", "FLYING", "POISON", "GROUND", "ROCK",
              "BUG", "GHOST", "STEEL", "FIRE", "WATER", "GRASS", "ELECTRIC",
              "PSYCHIC_TYPE", "ICE", "DRAGON", "DARK", "FAIRY", "STELLAR",
              "SOUND", "LIGHT", "TYPELESS"]
TYPE_ABBR = {"NORMAL": "NOR", "FIGHTING": "FIG", "FLYING": "FLY",
             "POISON": "POI", "GROUND": "GRD", "ROCK": "RCK", "BUG": "BUG",
             "GHOST": "GHO", "STEEL": "STL", "FIRE": "FIR", "WATER": "WTR",
             "GRASS": "GRS", "ELECTRIC": "ELE", "PSYCHIC_TYPE": "PSY",
             "ICE": "ICE", "DRAGON": "DRG", "DARK": "DRK", "FAIRY": "FAI",
             "STELLAR": "STE", "SOUND": "SND", "LIGHT": "LGT", "TYPELESS": "???"}

def parse_type_chart():
    chart = {}
    for m in re.finditer(r"\tdb (\w+),\s*(\w+),\s*(\w+)",
                         read("data/types/type_matchups.asm")):
        atk, dfn, eff = m.groups()
        sym = {"SUPER_EFFECTIVE": "2", "NOT_VERY_EFFECTIVE": "½",
               "NO_EFFECT": "0"}[eff]
        chart[(atk, dfn)] = sym
    return chart

# ---------------------------------------------------------------- moves
def parse_moves():
    """id -> dict(constant, name, effect, power, type, acc, pp, category)"""
    moves = {}
    rows = re.findall(
        r"\tmove (\w+),\s*(\w+),\s*(\d+),\s*(\w+),\s*(\d+),\s*(\d+)",
        read("data/moves/moves.asm"))
    names = re.findall(r'\tli "([^"]+)"', read("data/moves/names.asm"))
    cats = re.findall(r"\tdb (CAT_\w+)\s*; (\w+)", read("data/moves/categories.asm"))
    assert len(rows) == len(names) == len(cats), (len(rows), len(names), len(cats))
    for i, (const, effect, power, mtype, acc, pp) in enumerate(rows):
        assert cats[i][1] == const, (cats[i][1], const)
        moves[const] = {
            "id": i + 1,
            "name": names[i].title().replace("'S", "'s"),
            "effect": effect,
            "power": int(power),
            "type": mtype,
            "acc": int(acc),
            "pp": int(pp),
            "cat": {"CAT_PHYSICAL": "Physical", "CAT_SPECIAL": "Special",
                    "CAT_STATUS": "Status"}[cats[i][0]],
        }
    return moves

# changes made relative to vanilla Yellow, keyed by move constant
MOVE_CHANGE_NOTES = {
    "KARATE_CHOP": "retyped Normal → Fighting",
    "GUST": "retyped Normal → Flying",
    "SAND_ATTACK": "retyped Normal → Ground",
    "BITE": "retyped Normal → Dark",
    "GROWL": "retyped Normal → Sound",
    "ROAR": "retyped Normal → Sound",
    "SING": "retyped Normal → Sound",
    "SUPERSONIC": "retyped Normal → Sound",
    "SONICBOOM": "retyped Normal → Sound",
    "SCREECH": "retyped Normal → Sound",
    "AURORA_BEAM": "retyped Ice → Light",
    "SWIFT": "retyped Normal → Light",
    "FLASH": "retyped Normal → Light",
    "STRUGGLE": "retyped Normal → ??? (typeless; no STAB, hits Ghosts)",
    "PSYCHIC_M": "side effect now lowers Sp. Def (was Special)",
    "AMNESIA": "now raises Sp. Def (was Special)",
    "COUNTER": "now counters any physical move (was Normal/Fighting only)",
}

HIGH_CRIT = {"KARATE_CHOP", "RAZOR_LEAF", "CRABHAMMER", "SLASH",
              "STONE_EDGE", "NIGHT_SLASH"}

# ---------------------------------------------------------------- TM/HM
def parse_tmhm():
    """move constant -> 'TM01' / 'HM01'"""
    text = read("constants/item_constants.asm")
    hms = re.findall(r"\tadd_hm (\w+)", text)
    tms = re.findall(r"\tadd_tm (\w+)", text)
    out = {}
    for i, mv in enumerate(tms, 1):
        out[mv] = "TM%02d" % i
    for i, mv in enumerate(hms, 1):
        out[mv] = "HM%02d" % i
    return out

# ---------------------------------------------------------------- pokemon
SPECIAL_NAMES = {
    "nidoranf": "Nidoran♀", "nidoranm": "Nidoran♂",
    "mrmime": "Mr. Mime", "farfetchd": "Farfetch'd",
}

TYPE_CHANGE_NOTES = {
    "clefairy": "was Normal", "clefable": "was Normal",
    "jigglypuff": "was Normal", "wigglytuff": "was Normal",
    "mrmime": "was pure Psychic",
    "magnemite": "was pure Electric", "magneton": "was pure Electric",
    "staryu": "was pure Water", "starmie": "was Water/Psychic",
}

def parse_pokemon(moves, tmhm_map):
    order = re.findall(r'INCLUDE "([^"]+)"', read("data/pokemon/base_stats.asm"))
    assert len(order) == 151
    evs = re.findall(
        r"\tev_yield\s+(\d+),\s+(\d+),\s+(\d+),\s+(\d+),\s+(\d+)\s*; (\w+)",
        read("data/pokemon/ev_yields.asm"))
    assert len(evs) == 151
    evotext = read("data/pokemon/evos_moves.asm")

    mons = []
    for dex, path in enumerate(order, 1):
        text = read(path)
        key = norm(os.path.basename(path)[:-4])
        name = SPECIAL_NAMES.get(key, key.capitalize())
        stats = re.search(
            r"\tdb\s+(\d+),\s+(\d+),\s+(\d+),\s+(\d+),\s+(\d+),\s+(\d+)", text)
        hp, atk, dfn, spd, spa, sdf = (int(x) for x in stats.groups())
        types = re.search(r"\tdb (\w+), (\w+) ; type", text).groups()
        catch = int(re.search(r"\tdb (\d+) ; catch rate", text).group(1))
        bexp = int(re.search(r"\tdb (\d+) ; base exp", text).group(1))
        lvl1 = re.search(r"\tdb (.+) ; level 1 learnset", text).group(1)
        lvl1 = [m.strip() for m in lvl1.split(",") if m.strip() != "NO_MOVE"]
        growth = re.search(r"\tdb (\w+) ; growth rate", text).group(1)
        growth = growth.replace("GROWTH_", "").replace("_", " ").title()
        tm_block = re.search(r"\ttmhm([^;]*); end", text, re.S)
        tms = re.findall(r"\b([A-Z][A-Z0-9_]+)\b", tm_block.group(1)) if tm_block else []
        mons.append({
            "dex": dex, "key": key, "name": name,
            "stats": (hp, atk, dfn, spd, spa, sdf),
            "types": types, "catch": catch, "bexp": bexp,
            "lvl1": lvl1, "growth": growth, "tms": tms,
            "ev": tuple(int(x) for x in evs[dex - 1][:5]),
            "evolutions": [], "evolves_from": [], "learnset": [],
            "wild": [], "fishing": [], "trades": [], "notes": [],
        })
    bykey = {m["key"]: m for m in mons}

    # evolutions + learnsets
    for label, body in re.findall(
            r"^(\w+)EvosMoves:\n(.*?)\n(?=\w+EvosMoves:|\Z)", evotext, re.M | re.S):
        key = norm(label)
        if key not in bykey:
            continue  # MissingNo etc.
        mon = bykey[key]
        evo_part, moves_part = body.split("; Learnset")
        for em in re.finditer(r"\tdb EVOLVE_(\w+), (.+)", evo_part):
            kind, args = em.groups()
            args = [a.strip() for a in args.split(",")]
            if kind == "LEVEL":
                mon["evolutions"].append(("Level %s" % args[0], args[1]))
            elif kind == "ITEM":
                item = args[0].replace("_", " ").title().replace("Moon Stone", "Moon Stone")
                mon["evolutions"].append((item, args[2]))
            elif kind == "TRADE":
                mon["evolutions"].append(("Trade", args[1]))
        for lm in re.finditer(r"\tdb (\d+), (\w+)", moves_part):
            mon["learnset"].append((int(lm.group(1)), lm.group(2)))

    for mon in mons:
        for how, target in mon["evolutions"]:
            bykey[norm(target)]["evolves_from"].append((how, mon["name"]))

    return mons, bykey

# ---------------------------------------------------------------- wild data
MAP_NAME_FIXES = {
    "MT MOON": "Mt. Moon", "DIGLETTS CAVE": "Diglett's Cave",
    "POKEMON TOWER": "Pokémon Tower", "POKEMON MANSION": "Pokémon Mansion",
}

def pretty_map(const):
    s = const.replace("_", " ")
    s = re.sub(r"\bB(\d)F\b", r"B\1F", s)
    words = []
    for w in s.split():
        if re.fullmatch(r"B?\d+F?|\d+", w):
            words.append(w)
        else:
            words.append(w.title())
    s = " ".join(words)
    for k, v in MAP_NAME_FIXES.items():
        s = s.replace(k.title(), v)
    s = re.sub(r"Route (\d+)", r"Route \1", s)
    return s

def parse_wild(bykey):
    gw = read("data/wild/grass_water.asm")
    label_maps = defaultdict(list)
    for m in re.finditer(r"\tdw (\w+)\s*; (\w+)", gw):
        label, mapname = m.groups()
        if label != "NothingWildMons" and mapname != "unused":
            label_maps[label].append(pretty_map(mapname))

    mapdir = os.path.join(REPO, "data/wild/maps")
    for fn in sorted(os.listdir(mapdir)):
        text = read("data/wild/maps/" + fn)
        for label, body in re.findall(r"(\w+WildMons):(.*?)(?=\n\w+WildMons:|\Z)",
                                      text, re.S):
            if label not in label_maps:
                continue
            for kind in ("grass", "water"):
                block = re.search(
                    r"def_%s_wildmons (\d+).*?end_%s_wildmons" % (kind, kind),
                    body, re.S)
                if not block or block.group(1) == "0":
                    continue
                slots = re.findall(r"\tdb\s+(\d+), (\w+)", block.group(0))
                per_species = defaultdict(list)
                for lvl, species in slots:
                    per_species[species].append(int(lvl))
                for species, levels in per_species.items():
                    mon = bykey[norm(species)]
                    for mapname in label_maps[label]:
                        mon["wild"].append((mapname, kind, min(levels), max(levels)))

    # fishing
    for lvl, species in re.findall(r"\tdb (\d+), (\w+)", read("data/wild/good_rod.asm")):
        bykey[norm(species)]["fishing"].append(("any water", "Good Rod", int(lvl)))
    bykey["magikarp"]["fishing"].append(("any water", "Old Rod", 5))
    for line in re.findall(r"\tdb (\w+(?:, \w+, \d+){4})", read("data/wild/super_rod.asm")):
        parts = [p.strip() for p in line.split(",")]
        mapname = pretty_map(parts[0])
        for i in range(1, 9, 2):
            bykey[norm(parts[i])]["fishing"].append((mapname, "Super Rod", int(parts[i + 1])))

def parse_trades(bykey):
    for m in re.finditer(
            r'\tnpctrade (\w+),\s*(\w+),\s*\w+,\s*"([^"]+)"\s*; (used in (\w+)|unused)',
            read("data/events/trades.asm")):
        give, get, nick, note, mapname = m.groups()
        if mapname:
            bykey[norm(get)]["trades"].append(
                "In-game trade: give %s, receive “%s” (%s)"
                % (bykey[norm(give)]["name"], nick, pretty_map(mapname)))

# curated one-off encounters (Yellow-specific; not derivable from data tables)
STATIC_NOTES = {
    "pikachu": "Starter Pokémon from Professor Oak (Pallet Town).",
    "bulbasaur": "Gift in the house beside the Cerulean City Pokémon Center (requires a happy Pikachu).",
    "charmander": "Gift from a trainer on Route 24.",
    "squirtle": "Gift from Officer Jenny in Vermilion City (after defeating Lt. Surge).",
    "lapras": "Gift on Silph Co. 7F.",
    "eevee": "Gift on the Celadon Mansion rooftop (back stairs).",
    "hitmonlee": "Choice reward at the Saffron City Fighting Dojo.",
    "hitmonchan": "Choice reward at the Saffron City Fighting Dojo.",
    "magikarp": "Sold by the salesman at the Route 4 Pokémon Center.",
    "abra": "Celadon Game Corner prize.",
    "vulpix": "Celadon Game Corner prize.",
    "wigglytuff": "Celadon Game Corner prize.",
    "scyther": "Celadon Game Corner prize.",
    "pinsir": "Celadon Game Corner prize.",
    "porygon": "Celadon Game Corner prize.",
    "omanyte": "Revived from the Helix Fossil (Mt. Moon) at the Cinnabar Lab.",
    "kabuto": "Revived from the Dome Fossil (Mt. Moon) at the Cinnabar Lab.",
    "aerodactyl": "Revived from the Old Amber (Pewter Museum) at the Cinnabar Lab.",
    "snorlax": "Static encounter on Route 12 and Route 16 (requires the Poké Flute).",
    "articuno": "Static encounter in Seafoam Islands B4F.",
    "zapdos": "Static encounter at the Power Plant.",
    "moltres": "Static encounter on Victory Road 2F.",
    "mewtwo": "Static encounter in Cerulean Cave (after entering the Hall of Fame).",
    "mew": "Not obtainable in normal gameplay (event distribution only).",
}

# ---------------------------------------------------------------- output
INTRO = """\
# Pokémon Chromatic Yellow — Pokémon Reference

This document covers all 151 Pokémon as they exist in **Pokémon Chromatic
Yellow**, a ROM hack of Pokémon Yellow that modernizes its combat mechanics
and completely redoes the move list. It is generated from the game data by
`tools/gen_pokemon_docs.py`; rerun that script after changing any data file.

## Summary of mechanics changes vs. vanilla Yellow

- **Type chart** — Full Gen 6+ chart. New types: **Steel**, **Dark**,
  **Fairy**, **Stellar** (neutral vs. everything), **Sound**, **Light**, and
  **???** (typeless, used by Struggle). Ghost hits Psychic, Bug/Poison no
  longer maul each other, Ice is resisted by Fire, etc.
- **Physical/Special split** — every move has its own damage category
  (Gen 4+ assignments; see the move table). Counter now counters any
  physical move.
- **Special stat split** — Sp. Atk and Sp. Def are separate stats with
  modern base values. They share one DV and one EV, as in Gen 2. Amnesia
  raises Sp. Def; Psychic and Acid can lower it. The summary screen shows
  all six stats.
- **EVs** — defeating a Pokémon awards its modern EV yield (1–3 points,
  Sp. Atk + Sp. Def merged into the shared Special EV). Caps: **252 per
  stat, 510 total**. Stat formula: `(2×(Base+DV) + EV/4) × Level/100 + 5`.
  Vitamins give +10 EVs within the caps.
- **DVs** — unchanged (0–15). A DV counts double, so it is equivalent to an
  even modern IV of 0–30.
- **Critical hits** — modern staged rates: 1/24 base, 1/8 for high-crit
  moves (Karate Chop, Razor Leaf, Crabhammer, Slash), 1/2 with Focus
  Energy, guaranteed at stage 3+. Crits deal **1.5×** damage using
  unmodified stats. The Focus Energy bug is fixed.
- **Accuracy** — the Gen 1 "1/256 miss" glitch is fixed: 100%-accuracy
  moves cannot miss (accuracy/evasion stages still apply).
- **Status immunities** — Steel types can't be poisoned; Electric types
  can't be paralyzed.
- **Exp. All** no longer halves the enemy's base stats/catch rate (an
  original quirk); it only halves experience as intended.
- **Complete move overhaul** — the move list was redone from scratch: every
  type has one move in each of eight power bands (weak/moderate/strong/
  strongest × physical/special), all 55 original status moves survive, and
  learnsets/TMs were rebuilt accordingly. Design and rationale:
  `docs/move_overhaul_plan.md`.

"""

def type_str(mon):
    t1, t2 = mon["types"]
    s = TYPE_DISPLAY[t1] if t1 == t2 else "%s/%s" % (TYPE_DISPLAY[t1], TYPE_DISPLAY[t2])
    if mon["key"] in TYPE_CHANGE_NOTES:
        s += " *(%s)*" % TYPE_CHANGE_NOTES[mon["key"]]
    return s

def move_row(const, moves, tmhm_map, level=None):
    mv = moves[const]
    power = str(mv["power"]) if mv["power"] > 1 else ("—" if mv["power"] == 0 else "*")
    note = MOVE_CHANGE_NOTES.get(const, "")
    lead = str(level) if level is not None else tmhm_map.get(const, "?")
    return "| %s | %s | %s | %s | %s | %d%% | %d |%s" % (
        lead, mv["name"], TYPE_DISPLAY[mv["type"]], mv["cat"], power,
        mv["acc"], mv["pp"], (" %s |" % note) if note else " |")

def main():
    chart = parse_type_chart()
    moves = parse_moves()
    tmhm_map = parse_tmhm()
    mons, bykey = parse_pokemon(moves, tmhm_map)
    parse_wild(bykey)
    parse_trades(bykey)

    out = [INTRO]

    # ---- type chart matrix
    out.append("## Type chart\n")
    out.append("Attacker (rows) vs. defender (columns): `2` = super effective, "
               "`½` = not very effective, `0` = no effect, blank = neutral. "
               "Stellar and ??? are neutral both ways and omitted.\n")
    cols = [t for t in TYPE_ORDER if t not in ("STELLAR", "TYPELESS")]
    out.append("| vs → | " + " | ".join(TYPE_ABBR[t] for t in cols) + " |")
    out.append("|---" * (len(cols) + 1) + "|")
    for atk in cols:
        row = ["**%s**" % TYPE_ABBR[atk]]
        for dfn in cols:
            row.append(chart.get((atk, dfn), ""))
        out.append("| " + " | ".join(row) + " |")
    out.append("")

    # ---- moves table
    out.append("## Moves\n")
    out.append("Power `—` = status move; `*` = set/varies. "
               "High-crit moves: Karate Chop, Razor Leaf, Crabhammer, Slash, "
               "Stone Edge, Night Slash.\n")
    out.append("| # | Move | Type | Category | Power | Acc | PP | Changes |")
    out.append("|---|------|------|----------|-------|-----|----|---------|")
    for const, mv in sorted(moves.items(), key=lambda kv: kv[1]["id"]):
        power = str(mv["power"]) if mv["power"] > 1 else ("—" if mv["power"] == 0 else "*")
        out.append("| %d | %s | %s | %s | %s | %d%% | %d | %s |" % (
            mv["id"], mv["name"], TYPE_DISPLAY[mv["type"]], mv["cat"], power,
            mv["acc"], mv["pp"], MOVE_CHANGE_NOTES.get(const, "")))
    out.append("")

    # ---- pokemon entries
    out.append("## Pokémon\n")
    ev_names = ["HP", "Attack", "Defense", "Speed", "Special (SpA+SpD)"]
    for mon in mons:
        hp, atk, dfn, spd, spa, sdf = mon["stats"]
        out.append("---\n")
        out.append("### #%03d %s — %s\n" % (mon["dex"], mon["name"], type_str(mon)))
        out.append("| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |")
        out.append("|----|--------|---------|-------|---------|---------|-------|")
        out.append("| %d | %d | %d | %d | %d | %d | **%d** |" %
                   (hp, atk, dfn, spd, spa, sdf, hp + atk + dfn + spd + spa + sdf))
        evstr = ", ".join("%d %s" % (v, ev_names[i])
                          for i, v in enumerate(mon["ev"]) if v) or "none"
        out.append("")
        out.append("- **EV yield:** %s" % evstr)
        out.append("- **Catch rate:** %d &nbsp; **Base exp:** %d &nbsp; "
                   "**Growth:** %s" % (mon["catch"], mon["bexp"], mon["growth"]))
        evo_bits = []
        for how, target in mon["evolutions"]:
            evo_bits.append("evolves into **%s** (%s)" % (bykey[norm(target)]["name"], how))
        for how, source in mon["evolves_from"]:
            evo_bits.append("evolves from **%s** (%s)" % (source, how))
        out.append("- **Evolution:** %s" % ("; ".join(evo_bits) if evo_bits else "none"))

        # locations
        locs = []
        seen = set()
        for mapname, kind, lo, hi in sorted(mon["wild"]):
            k = (mapname, kind)
            if k in seen:
                continue
            seen.add(k)
            lv = "Lv.%d" % lo if lo == hi else "Lv.%d–%d" % (lo, hi)
            locs.append("%s (%s, %s)" % (mapname, kind, lv))
        for mapname, rod, lvl in sorted(set(mon["fishing"])):
            locs.append("%s (%s, Lv.%d)" % (mapname, rod, lvl))
        for t in mon["trades"]:
            locs.append(t)
        if mon["key"] in STATIC_NOTES:
            locs.append(STATIC_NOTES[mon["key"]])
        if not locs:
            if mon["evolves_from"]:
                locs.append("Only by evolving %s." %
                            " or ".join(s for _, s in mon["evolves_from"]))
            else:
                locs.append("Not obtainable in this version — trade from another game.")
        out.append("- **Locations:**")
        for loc in locs:
            out.append("  - %s" % loc)

        # learnset
        out.append("\n**Level-up moves**\n")
        out.append("| Lv | Move | Type | Category | Power | Acc | PP | Notes |")
        out.append("|----|------|------|----------|-------|-----|----|-------|")
        for const in mon["lvl1"]:
            out.append(move_row(const, moves, tmhm_map, level=1))
        for level, const in mon["learnset"]:
            out.append(move_row(const, moves, tmhm_map, level=level))

        # TM/HM
        if mon["tms"]:
            tm_list = sorted(mon["tms"], key=lambda c: (tmhm_map.get(c, "Z"),))
            pretty = ["%s %s" % (tmhm_map.get(c, "??"), moves[c]["name"]) for c in tm_list]
            out.append("\n**TM/HM compatibility:** " + ", ".join(pretty))
        else:
            out.append("\n**TM/HM compatibility:** none")
        out.append("")

    with open(OUT, "w") as f:
        f.write("\n".join(out) + "\n")
    print("wrote %s (%d lines)" % (OUT, len(out)))

if __name__ == "__main__":
    main()
