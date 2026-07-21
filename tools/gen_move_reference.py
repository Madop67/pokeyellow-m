#!/usr/bin/env python3
"""
Generate docs/move_reference.md from the repository's data files.

A standalone per-move reference (companion to docs/pokemon_reference.md and
docs/trainer_reference.md): every move's type, category, power, accuracy,
PP, TM/HM slot, and a human-readable description of its secondary effect —
including the exact proc chance for chance-based side effects, which is
hardcoded below from the handlers in engine/battle/effects.asm since that
number isn't stored in the move data table itself.

Reuses the parsers in gen_pokemon_docs.py, so rerun both after changing any
move data:  python3 tools/gen_move_reference.py
"""
import os
import gen_pokemon_docs as pk

REPO = pk.REPO
OUT = os.path.join(REPO, "docs", "move_reference.md")

STAT_NAME = {
    "ATTACK": "Attack", "DEFENSE": "Defense", "SPEED": "Speed",
    "SPECIAL": "Sp. Atk/Sp. Def", "ACCURACY": "accuracy", "EVASION": "evasion",
}

# proc chance for each *_SIDE_EFFECTn, from the BattleRandom rolls in
# engine/battle/effects.asm (not stored in data/moves/moves.asm itself)
SIDE_EFFECT_CHANCE = {
    ("POISON", "1"): 20, ("POISON", "2"): 40,
    ("BURN", "1"): 10, ("BURN", "2"): 30,
    ("FREEZE", "1"): 10, ("FREEZE", "2"): 30,
    ("PARALYZE", "1"): 10, ("PARALYZE", "2"): 30,
    ("FLINCH", "1"): 10, ("FLINCH", "2"): 30,
}
STAT_DOWN_SIDE_CHANCE = 33  # ATTACK/DEFENSE/SPEED/SPECIAL_DOWN_SIDE_EFFECT, effects.asm
CONFUSION_SIDE_CHANCE = 10  # CONFUSION_SIDE_EFFECT, effects.asm

# effects with a fixed, hand-written description rather than a derivable one
EFFECT_TEXT = {
    "NO_ADDITIONAL_EFFECT": "",
    "POISON_EFFECT": "Poisons the target.",
    "PARALYZE_EFFECT": "Paralyzes the target.",
    "SLEEP_EFFECT": "Puts the target to sleep.",
    "CONFUSION_EFFECT": "Confuses the target.",
    "DRAIN_HP_EFFECT": "User recovers HP equal to half the damage dealt.",
    "EXPLODE_EFFECT": "User faints after attacking.",
    "DREAM_EATER_EFFECT": "Only works on a sleeping target; user heals by half the damage dealt.",
    "MIRROR_MOVE_EFFECT": "Uses whichever move the target last used.",
    "CONVERSION_EFFECT": "User becomes the type of one of its own moves.",
    "HAZE_EFFECT": "Resets every stat stage on the field to 0.",
    "BIDE_EFFECT": "User endures two turns, then unleashes double the damage taken.",
    "THRASH_PETAL_DANCE_EFFECT": "User attacks for 2-3 turns in a row, then becomes confused.",
    "SWITCH_AND_TELEPORT_EFFECT": "Forces the target to switch out, or lets the user swap out/flee.",
    "TWO_TO_FIVE_ATTACKS_EFFECT": "Hits 2-5 times in one turn.",
    "SLEEP_EFFECT": "Puts the target to sleep.",
    "OHKO_EFFECT": "One-hit knockout if it hits.",
    "CHARGE_EFFECT": "User charges on the first turn, attacks on the second.",
    "SUPER_FANG_EFFECT": "Always deals damage equal to half the target's current HP.",
    "SPECIAL_DAMAGE_EFFECT": "Deals fixed/level-based damage, independent of Attack or Sp. Atk.",
    "TRAPPING_EFFECT": "Traps the target for several turns, dealing damage each turn.",
    "FLY_EFFECT": "User is airborne and dodges most attacks on the first turn.",
    "ATTACK_TWICE_EFFECT": "Hits twice in one turn.",
    "JUMP_KICK_EFFECT": "User takes crash damage if the attack misses.",
    "MIST_EFFECT": "Protects the user's stats from being lowered for 5 turns.",
    "FOCUS_ENERGY_EFFECT": "Sharply raises the user's critical-hit rate.",
    "RECOIL_EFFECT": "User takes recoil damage equal to a portion of the damage dealt.",
    "HEAL_EFFECT": "User restores its own HP.",
    "TRANSFORM_EFFECT": "User transforms into the target, copying its stats, types, and moves.",
    "LIGHT_SCREEN_EFFECT": "Halves incoming Special damage for 5 turns.",
    "REFLECT_EFFECT": "Halves incoming Physical damage for 5 turns.",
    "SUBSTITUTE_EFFECT": "User creates a decoy that absorbs hits until broken.",
    "HYPER_BEAM_EFFECT": "User must recharge (skip its next turn) after attacking.",
    "RAGE_EFFECT": "User's Attack rises each time it's hit while this move is active.",
    "MIMIC_EFFECT": "Copies the target's last-used move.",
    "METRONOME_EFFECT": "Uses a random move.",
    "LEECH_SEED_EFFECT": "Saps HP from the target to the user each turn.",
    "SPLASH_EFFECT": "Does nothing.",
    "DISABLE_EFFECT": "Disables one of the target's known moves for several turns.",
    "PAY_DAY_EFFECT": "Scatters coins (trainer battles only).",
    "SWIFT_EFFECT": "Never misses.",
    "TWINEEDLE_EFFECT": "Hits twice; each hit has a chance to poison.",
}


def describe_effect(effect):
    if effect in EFFECT_TEXT:
        return EFFECT_TEXT[effect]

    for stat, key in STAT_NAME.items():
        for n, stages in (("1", "1 stage"), ("2", "2 stages")):
            if effect == "%s_UP%s_EFFECT" % (stat, n):
                return "Raises the user's %s by %s." % (key, stages)
            if effect == "%s_DOWN%s_EFFECT" % (stat, n):
                return "Lowers the target's %s by %s." % (key, stages)
        if effect == "%s_DOWN_SIDE_EFFECT" % stat:
            return "%d%% chance to lower the target's %s by 1 stage." % (
                STAT_DOWN_SIDE_CHANCE, key)

    for status in ("POISON", "BURN", "FREEZE", "PARALYZE", "FLINCH"):
        for n in ("1", "2"):
            if effect == "%s_SIDE_EFFECT%s" % (status, n):
                chance = SIDE_EFFECT_CHANCE[(status, n)]
                verb = {"POISON": "poison", "BURN": "burn", "FREEZE": "freeze",
                        "PARALYZE": "paralyze", "FLINCH": "flinch"}[status]
                return "%d%% chance to %s the target." % (chance, verb)

    if effect == "CONFUSION_SIDE_EFFECT":
        return "%d%% chance to confuse the target." % CONFUSION_SIDE_CHANCE

    return ""  # unrecognized effect constant: leave blank rather than guess


def main():
    moves = pk.parse_moves()
    tmhm_map = pk.parse_tmhm()

    high_crit_names = [mv["name"] for mv in sorted(
        (moves[c] for c in pk.HIGH_CRIT if c in moves), key=lambda mv: mv["id"])]

    out = []
    out.append("# Move Reference\n")
    out.append(
        "Every move in Pokémon Chromatic Yellow (%d total), generated from "
        "`data/moves/moves.asm`, `data/moves/categories.asm`, and "
        "`constants/move_effect_constants.asm`. Category and type reflect "
        "this fork's rebuilt move list (see "
        "[move_overhaul_plan.md](move_overhaul_plan.md)); secondary-effect "
        "chances are hardcoded from the roll logic in "
        "`engine/battle/effects.asm`, since they aren't stored in the move "
        "data table itself. See [pokemon_reference.md](pokemon_reference.md) "
        "for the full type chart and per-Pokémon learnsets.\n" % len(moves)
    )
    out.append(
        "Power `—` = status move (no direct damage); `*` = special-damage "
        "move whose power varies or isn't a flat number. High-critical-hit "
        "moves: %s.\n" % ", ".join(high_crit_names)
    )

    out.append("| # | Move | Type | Category | Power | Acc | PP | TM/HM | Effect | Notes |")
    out.append("|---|------|------|----------|-------|-----|----|----|--------|-------|")
    for const, mv in sorted(moves.items(), key=lambda kv: kv[1]["id"]):
        power = str(mv["power"]) if mv["power"] > 1 else ("—" if mv["power"] == 0 else "*")
        tmhm = tmhm_map.get(const, "")
        effect = describe_effect(mv["effect"])
        note = pk.MOVE_CHANGE_NOTES.get(const, "")
        if const in pk.HIGH_CRIT:
            note = (note + "; " if note else "") + "high crit ratio"
        out.append("| %d | %s | %s | %s | %s | %d%% | %d | %s | %s | %s |" % (
            mv["id"], mv["name"], pk.TYPE_DISPLAY[mv["type"]], mv["cat"], power,
            mv["acc"], mv["pp"], tmhm, effect, note))
    out.append("")

    with open(OUT, "w") as f:
        f.write("\n".join(out))
    print("wrote %s (%d moves)" % (OUT, len(moves)))


if __name__ == "__main__":
    main()
