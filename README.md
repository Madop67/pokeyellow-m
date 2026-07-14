# Pokémon Reference (Modernized Mechanics Edition)

This document covers all 151 Pokémon as they exist in **this fork**, which
modernizes Yellow's combat mechanics. It is generated from the game data by
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


## Type chart

Attacker (rows) vs. defender (columns): `2` = super effective, `½` = not very effective, `0` = no effect, blank = neutral. Stellar and ??? are neutral both ways and omitted.

| vs → | NOR | FIG | FLY | POI | GRD | RCK | BUG | GHO | STL | FIR | WTR | GRS | ELE | PSY | ICE | DRG | DRK | FAI | SND | LGT |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| **NOR** |  |  |  |  |  | ½ |  | 0 | ½ |  |  |  |  |  |  |  |  |  |  |  |
| **FIG** | 2 |  | ½ | ½ |  | 2 | ½ | 0 | 2 |  |  |  |  | ½ | 2 |  | 2 | ½ |  |  |
| **FLY** |  | 2 |  |  |  | ½ | 2 |  | ½ |  |  | 2 | ½ |  |  |  |  |  | ½ |  |
| **POI** |  |  |  | ½ | ½ | ½ |  | ½ | 0 |  |  | 2 |  |  |  |  |  | 2 |  | 2 |
| **GRD** |  |  | 0 | 2 |  | 2 | ½ |  | 2 | 2 |  | ½ | 2 |  |  |  |  |  |  |  |
| **RCK** |  | ½ | 2 |  | ½ |  | 2 |  | ½ | 2 |  |  |  |  | 2 |  |  |  |  |  |
| **BUG** |  | ½ | ½ | ½ |  |  |  | ½ | ½ | ½ |  | 2 |  | 2 |  |  | 2 | ½ |  | 2 |
| **GHO** | 0 |  |  |  |  |  |  | 2 |  |  |  |  |  | 2 |  |  | ½ |  |  |  |
| **STL** |  |  |  |  |  | 2 |  |  | ½ | ½ | ½ |  | ½ |  | 2 |  |  | 2 |  |  |
| **FIR** |  |  |  |  |  | ½ | 2 |  | 2 | ½ | ½ | 2 |  |  | 2 | ½ |  |  |  |  |
| **WTR** |  |  |  |  | 2 | 2 |  |  |  | 2 | ½ | ½ |  |  |  | ½ |  |  | ½ |  |
| **GRS** |  |  | ½ | ½ | 2 | 2 | ½ |  | ½ | ½ | 2 | ½ |  |  |  | ½ |  |  |  |  |
| **ELE** |  |  | 2 |  | 0 |  |  |  |  |  | 2 | ½ | ½ |  |  | ½ |  |  | 2 |  |
| **PSY** |  | 2 |  | 2 |  |  |  |  | ½ |  |  |  |  | ½ |  |  | 0 |  | 2 |  |
| **ICE** |  |  | 2 |  | 2 |  |  |  | ½ | ½ | ½ | 2 |  |  | ½ | 2 |  |  |  |  |
| **DRG** |  |  |  |  |  |  |  |  | ½ |  |  |  |  |  |  | 2 |  | 0 |  |  |
| **DRK** |  | ½ |  |  |  |  |  | 2 |  |  |  |  |  | 2 |  |  | ½ | ½ |  | ½ |
| **FAI** |  | 2 |  | ½ |  |  |  |  | ½ | ½ |  |  |  |  |  | 2 | 2 |  |  | ½ |
| **SND** |  |  |  |  |  | 2 |  |  | ½ |  | 2 | ½ |  |  | 2 |  |  |  | ½ |  |
| **LGT** |  |  |  |  |  |  |  | 2 | ½ |  |  | ½ |  |  |  |  | 2 |  |  | ½ |

## Moves

Power `—` = status move; `*` = set/varies. High-crit moves: Karate Chop, Razor Leaf, Crabhammer, Slash.

| # | Move | Type | Category | Power | Acc | PP | Changes |
|---|------|------|----------|-------|-----|----|---------|
| 1 | Pound | Normal | Physical | 40 | 100% | 35 |  |
| 2 | Karate Chop | Fighting | Physical | 50 | 100% | 25 | retyped Normal → Fighting |
| 3 | Doubleslap | Normal | Physical | 15 | 85% | 10 |  |
| 4 | Comet Punch | Normal | Physical | 18 | 85% | 15 |  |
| 5 | Mega Punch | Normal | Physical | 80 | 85% | 20 |  |
| 6 | Pay Day | Normal | Physical | 40 | 100% | 20 |  |
| 7 | Fire Punch | Fire | Physical | 75 | 100% | 15 |  |
| 8 | Ice Punch | Ice | Physical | 75 | 100% | 15 |  |
| 9 | Thunderpunch | Electric | Physical | 75 | 100% | 15 |  |
| 10 | Scratch | Normal | Physical | 40 | 100% | 35 |  |
| 11 | Vicegrip | Normal | Physical | 55 | 100% | 30 |  |
| 12 | Guillotine | Normal | Physical | * | 30% | 5 |  |
| 13 | Razor Wind | Normal | Special | 80 | 75% | 10 |  |
| 14 | Swords Dance | Normal | Status | — | 100% | 30 |  |
| 15 | Cut | Normal | Physical | 50 | 95% | 30 |  |
| 16 | Gust | Flying | Special | 40 | 100% | 35 | retyped Normal → Flying |
| 17 | Wing Attack | Flying | Physical | 35 | 100% | 35 |  |
| 18 | Whirlwind | Normal | Status | — | 85% | 20 |  |
| 19 | Fly | Flying | Physical | 70 | 95% | 15 |  |
| 20 | Bind | Normal | Physical | 15 | 75% | 20 |  |
| 21 | Slam | Normal | Physical | 80 | 75% | 20 |  |
| 22 | Vine Whip | Grass | Physical | 35 | 100% | 10 |  |
| 23 | Stomp | Normal | Physical | 65 | 100% | 20 |  |
| 24 | Double Kick | Fighting | Physical | 30 | 100% | 30 |  |
| 25 | Mega Kick | Normal | Physical | 120 | 75% | 5 |  |
| 26 | Jump Kick | Fighting | Physical | 70 | 95% | 25 |  |
| 27 | Rolling Kick | Fighting | Physical | 60 | 85% | 15 |  |
| 28 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 29 | Headbutt | Normal | Physical | 70 | 100% | 15 |  |
| 30 | Horn Attack | Normal | Physical | 65 | 100% | 25 |  |
| 31 | Fury Attack | Normal | Physical | 15 | 85% | 20 |  |
| 32 | Horn Drill | Normal | Physical | * | 30% | 5 |  |
| 33 | Tackle | Normal | Physical | 35 | 95% | 35 |  |
| 34 | Body Slam | Normal | Physical | 85 | 100% | 15 |  |
| 35 | Wrap | Normal | Physical | 15 | 85% | 20 |  |
| 36 | Take Down | Normal | Physical | 90 | 85% | 20 |  |
| 37 | Thrash | Normal | Physical | 90 | 100% | 20 |  |
| 38 | Double-Edge | Normal | Physical | 100 | 100% | 15 |  |
| 39 | Tail Whip | Normal | Status | — | 100% | 30 |  |
| 40 | Poison Sting | Poison | Physical | 15 | 100% | 35 |  |
| 41 | Twineedle | Bug | Physical | 25 | 100% | 20 |  |
| 42 | Pin Missile | Bug | Physical | 14 | 85% | 20 |  |
| 43 | Leer | Normal | Status | — | 100% | 30 |  |
| 44 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 45 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 46 | Roar | Sound | Status | — | 100% | 20 | retyped Normal → Sound |
| 47 | Sing | Sound | Status | — | 55% | 15 | retyped Normal → Sound |
| 48 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 49 | Sonicboom | Sound | Special | * | 90% | 20 | retyped Normal → Sound |
| 50 | Disable | Normal | Status | — | 55% | 20 |  |
| 51 | Acid | Poison | Special | 40 | 100% | 30 | side effect now lowers Sp. Def (was Defense) |
| 52 | Ember | Fire | Special | 40 | 100% | 25 |  |
| 53 | Flamethrower | Fire | Special | 95 | 100% | 15 |  |
| 54 | Mist | Ice | Status | — | 100% | 30 |  |
| 55 | Water Gun | Water | Special | 40 | 100% | 25 |  |
| 56 | Hydro Pump | Water | Special | 120 | 80% | 5 |  |
| 57 | Surf | Water | Special | 95 | 100% | 15 |  |
| 58 | Ice Beam | Ice | Special | 95 | 100% | 10 |  |
| 59 | Blizzard | Ice | Special | 120 | 90% | 5 |  |
| 60 | Psybeam | Psychic | Special | 65 | 100% | 20 |  |
| 61 | Bubblebeam | Water | Special | 65 | 100% | 20 |  |
| 62 | Aurora Beam | Light | Special | 65 | 100% | 20 | retyped Ice → Light |
| 63 | Hyper Beam | Normal | Special | 150 | 90% | 5 |  |
| 64 | Peck | Flying | Physical | 35 | 100% | 35 |  |
| 65 | Drill Peck | Flying | Physical | 80 | 100% | 20 |  |
| 66 | Submission | Fighting | Physical | 80 | 80% | 25 |  |
| 67 | Low Kick | Fighting | Physical | 50 | 90% | 20 |  |
| 68 | Counter | Fighting | Physical | * | 100% | 20 | now counters any physical move (was Normal/Fighting only) |
| 69 | Seismic Toss | Fighting | Physical | * | 100% | 20 |  |
| 70 | Strength | Normal | Physical | 80 | 100% | 15 |  |
| 71 | Absorb | Grass | Special | 20 | 100% | 20 |  |
| 72 | Mega Drain | Grass | Special | 40 | 100% | 10 |  |
| 73 | Leech Seed | Grass | Status | — | 90% | 10 |  |
| 74 | Growth | Normal | Status | — | 100% | 40 |  |
| 75 | Razor Leaf | Grass | Physical | 55 | 95% | 25 |  |
| 76 | Solarbeam | Grass | Special | 120 | 100% | 10 |  |
| 77 | Poisonpowder | Poison | Status | — | 75% | 35 |  |
| 78 | Stun Spore | Grass | Status | — | 75% | 30 |  |
| 79 | Sleep Powder | Grass | Status | — | 75% | 15 |  |
| 80 | Petal Dance | Grass | Special | 70 | 100% | 20 |  |
| 81 | String Shot | Bug | Status | — | 95% | 40 |  |
| 82 | Dragon Rage | Dragon | Special | * | 100% | 10 |  |
| 83 | Fire Spin | Fire | Special | 15 | 70% | 15 |  |
| 84 | Thundershock | Electric | Special | 40 | 100% | 30 |  |
| 85 | Thunderbolt | Electric | Special | 95 | 100% | 15 |  |
| 86 | Thunder Wave | Electric | Status | — | 100% | 20 |  |
| 87 | Thunder | Electric | Special | 120 | 70% | 10 |  |
| 88 | Rock Throw | Rock | Physical | 50 | 65% | 15 |  |
| 89 | Earthquake | Ground | Physical | 100 | 100% | 10 |  |
| 90 | Fissure | Ground | Physical | * | 30% | 5 |  |
| 91 | Dig | Ground | Physical | 100 | 100% | 10 |  |
| 92 | Toxic | Poison | Status | — | 85% | 10 |  |
| 93 | Confusion | Psychic | Special | 50 | 100% | 25 |  |
| 94 | Psychic | Psychic | Special | 90 | 100% | 10 | side effect now lowers Sp. Def (was Special) |
| 95 | Hypnosis | Psychic | Status | — | 60% | 20 |  |
| 96 | Meditate | Psychic | Status | — | 100% | 40 |  |
| 97 | Agility | Psychic | Status | — | 100% | 30 |  |
| 98 | Quick Attack | Normal | Physical | 40 | 100% | 30 |  |
| 99 | Rage | Normal | Physical | 20 | 100% | 20 |  |
| 100 | Teleport | Psychic | Status | — | 100% | 20 |  |
| 101 | Night Shade | Ghost | Special | — | 100% | 15 |  |
| 102 | Mimic | Normal | Status | — | 100% | 10 |  |
| 103 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 104 | Double Team | Normal | Status | — | 100% | 15 |  |
| 105 | Recover | Normal | Status | — | 100% | 20 |  |
| 106 | Harden | Normal | Status | — | 100% | 30 |  |
| 107 | Minimize | Normal | Status | — | 100% | 20 |  |
| 108 | Smokescreen | Normal | Status | — | 100% | 20 |  |
| 109 | Confuse Ray | Ghost | Status | — | 100% | 10 |  |
| 110 | Withdraw | Water | Status | — | 100% | 40 |  |
| 111 | Defense Curl | Normal | Status | — | 100% | 40 |  |
| 112 | Barrier | Psychic | Status | — | 100% | 30 |  |
| 113 | Light Screen | Psychic | Status | — | 100% | 30 |  |
| 114 | Haze | Ice | Status | — | 100% | 30 |  |
| 115 | Reflect | Psychic | Status | — | 100% | 20 |  |
| 116 | Focus Energy | Normal | Status | — | 100% | 30 |  |
| 117 | Bide | Normal | Physical | — | 100% | 10 |  |
| 118 | Metronome | Normal | Status | — | 100% | 10 |  |
| 119 | Mirror Move | Flying | Status | — | 100% | 20 |  |
| 120 | Selfdestruct | Normal | Physical | 130 | 100% | 5 |  |
| 121 | Egg Bomb | Normal | Physical | 100 | 75% | 10 |  |
| 122 | Lick | Ghost | Physical | 20 | 100% | 30 |  |
| 123 | Smog | Poison | Special | 20 | 70% | 20 |  |
| 124 | Sludge | Poison | Special | 65 | 100% | 20 |  |
| 125 | Bone Club | Ground | Physical | 65 | 85% | 20 |  |
| 126 | Fire Blast | Fire | Special | 120 | 85% | 5 |  |
| 127 | Waterfall | Water | Physical | 80 | 100% | 15 |  |
| 128 | Clamp | Water | Physical | 35 | 75% | 10 |  |
| 129 | Swift | Light | Special | 60 | 100% | 20 | retyped Normal → Light |
| 130 | Skull Bash | Normal | Physical | 100 | 100% | 15 |  |
| 131 | Spike Cannon | Normal | Physical | 20 | 100% | 15 |  |
| 132 | Constrict | Normal | Physical | 10 | 100% | 35 |  |
| 133 | Amnesia | Psychic | Status | — | 100% | 20 | now raises Sp. Def (was Special) |
| 134 | Kinesis | Psychic | Status | — | 80% | 15 |  |
| 135 | Softboiled | Normal | Status | — | 100% | 10 |  |
| 136 | Hi Jump Kick | Fighting | Physical | 85 | 90% | 20 |  |
| 137 | Glare | Normal | Status | — | 75% | 30 |  |
| 138 | Dream Eater | Psychic | Special | 100 | 100% | 15 |  |
| 139 | Poison Gas | Poison | Status | — | 55% | 40 |  |
| 140 | Barrage | Normal | Physical | 15 | 85% | 20 |  |
| 141 | Leech Life | Bug | Physical | 20 | 100% | 15 |  |
| 142 | Lovely Kiss | Normal | Status | — | 75% | 10 |  |
| 143 | Sky Attack | Flying | Physical | 140 | 90% | 5 |  |
| 144 | Transform | Normal | Status | — | 100% | 10 |  |
| 145 | Bubble | Water | Special | 20 | 100% | 30 |  |
| 146 | Dizzy Punch | Normal | Physical | 70 | 100% | 10 |  |
| 147 | Spore | Grass | Status | — | 100% | 15 |  |
| 148 | Flash | Light | Status | — | 70% | 20 | retyped Normal → Light |
| 149 | Psywave | Psychic | Special | * | 80% | 15 |  |
| 150 | Splash | Normal | Status | — | 100% | 40 |  |
| 151 | Acid Armor | Poison | Status | — | 100% | 40 |  |
| 152 | Crabhammer | Water | Physical | 90 | 85% | 10 |  |
| 153 | Explosion | Normal | Physical | 170 | 100% | 5 |  |
| 154 | Fury Swipes | Normal | Physical | 18 | 80% | 15 |  |
| 155 | Bonemerang | Ground | Physical | 50 | 90% | 10 |  |
| 156 | Rest | Psychic | Status | — | 100% | 10 |  |
| 157 | Rock Slide | Rock | Physical | 75 | 90% | 10 |  |
| 158 | Hyper Fang | Normal | Physical | 80 | 90% | 15 |  |
| 159 | Sharpen | Normal | Status | — | 100% | 30 |  |
| 160 | Conversion | Normal | Status | — | 100% | 30 |  |
| 161 | Tri Attack | Normal | Special | 80 | 100% | 10 |  |
| 162 | Super Fang | Normal | Physical | * | 90% | 10 |  |
| 163 | Slash | Normal | Physical | 70 | 100% | 20 |  |
| 164 | Substitute | Normal | Status | — | 100% | 10 |  |
| 165 | Struggle | ??? | Physical | 50 | 100% | 10 | retyped Normal → ??? (typeless; no STAB, hits Ghosts) |

## Pokémon

---

### #001 Bulbasaur — Grass/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 45 | 49 | 49 | 45 | 65 | 65 | **318** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 64 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Ivysaur** (Level 16)
- **Locations:**
  - Gift in the house beside the Cerulean City Pokémon Center (requires a happy Pikachu).

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 7 | Leech Seed | Grass | Status | — | 90% | 10 | |
| 13 | Vine Whip | Grass | Physical | 35 | 100% | 10 | |
| 20 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 27 | Razor Leaf | Grass | Physical | 55 | 95% | 25 | |
| 34 | Growth | Normal | Status | — | 100% | 40 | |
| 41 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 48 | Solarbeam | Grass | Special | 120 | 100% | 10 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #002 Ivysaur — Grass/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 62 | 63 | 60 | 80 | 80 | **405** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 141 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Venusaur** (Level 32); evolves from **Bulbasaur** (Level 16)
- **Locations:**
  - Only by evolving Bulbasaur.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 1 | Leech Seed | Grass | Status | — | 90% | 10 | |
| 7 | Leech Seed | Grass | Status | — | 90% | 10 | |
| 13 | Vine Whip | Grass | Physical | 35 | 100% | 10 | |
| 22 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 30 | Razor Leaf | Grass | Physical | 55 | 95% | 25 | |
| 38 | Growth | Normal | Status | — | 100% | 40 | |
| 46 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 54 | Solarbeam | Grass | Special | 120 | 100% | 10 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #003 Venusaur — Grass/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 80 | 82 | 83 | 80 | 100 | 100 | **525** |

- **EV yield:** 3 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 208 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Ivysaur** (Level 32)
- **Locations:**
  - Only by evolving Ivysaur.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 1 | Leech Seed | Grass | Status | — | 90% | 10 | |
| 1 | Vine Whip | Grass | Physical | 35 | 100% | 10 | |
| 7 | Leech Seed | Grass | Status | — | 90% | 10 | |
| 13 | Vine Whip | Grass | Physical | 35 | 100% | 10 | |
| 22 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 30 | Razor Leaf | Grass | Physical | 55 | 95% | 25 | |
| 43 | Growth | Normal | Status | — | 100% | 40 | |
| 55 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 65 | Solarbeam | Grass | Special | 120 | 100% | 10 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #004 Charmander — Fire

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 39 | 52 | 43 | 65 | 60 | 50 | **309** |

- **EV yield:** 1 Speed
- **Catch rate:** 45 &nbsp; **Base exp:** 65 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Charmeleon** (Level 16)
- **Locations:**
  - Gift from a trainer on Route 24.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 9 | Ember | Fire | Special | 40 | 100% | 25 | |
| 15 | Leer | Normal | Status | — | 100% | 30 | |
| 22 | Rage | Normal | Physical | 20 | 100% | 20 | |
| 30 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 38 | Flamethrower | Fire | Special | 95 | 100% | 15 | |
| 46 | Fire Spin | Fire | Special | 15 | 70% | 15 | |

**TM/HM compatibility:** HM01 Cut, HM04 Strength, TM01 Mega Punch, TM03 Swords Dance, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM23 Dragon Rage, TM28 Dig, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #005 Charmeleon — Fire

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 58 | 64 | 58 | 80 | 80 | 65 | **405** |

- **EV yield:** 1 Speed, 1 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 142 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Charizard** (Level 36); evolves from **Charmander** (Level 16)
- **Locations:**
  - Only by evolving Charmander.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 1 | Ember | Fire | Special | 40 | 100% | 25 | |
| 9 | Ember | Fire | Special | 40 | 100% | 25 | |
| 15 | Leer | Normal | Status | — | 100% | 30 | |
| 24 | Rage | Normal | Physical | 20 | 100% | 20 | |
| 33 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 42 | Flamethrower | Fire | Special | 95 | 100% | 15 | |
| 56 | Fire Spin | Fire | Special | 15 | 70% | 15 | |

**TM/HM compatibility:** HM01 Cut, HM04 Strength, TM01 Mega Punch, TM03 Swords Dance, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM23 Dragon Rage, TM28 Dig, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #006 Charizard — Fire/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 78 | 84 | 78 | 100 | 109 | 85 | **534** |

- **EV yield:** 3 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 209 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Charmeleon** (Level 36)
- **Locations:**
  - Only by evolving Charmeleon.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 1 | Ember | Fire | Special | 40 | 100% | 25 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 9 | Ember | Fire | Special | 40 | 100% | 25 | |
| 15 | Leer | Normal | Status | — | 100% | 30 | |
| 24 | Rage | Normal | Physical | 20 | 100% | 20 | |
| 36 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 46 | Flamethrower | Fire | Special | 95 | 100% | 15 | |
| 55 | Fire Spin | Fire | Special | 15 | 70% | 15 | |

**TM/HM compatibility:** HM01 Cut, HM02 Fly, HM04 Strength, TM01 Mega Punch, TM03 Swords Dance, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM23 Dragon Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #007 Squirtle — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 44 | 48 | 65 | 43 | 50 | 64 | **314** |

- **EV yield:** 1 Defense
- **Catch rate:** 45 &nbsp; **Base exp:** 66 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Wartortle** (Level 16)
- **Locations:**
  - Gift from Officer Jenny in Vermilion City (after defeating Lt. Surge).

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 8 | Bubble | Water | Special | 20 | 100% | 30 | |
| 15 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 22 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 28 | Withdraw | Water | Status | — | 100% | 40 | |
| 35 | Skull Bash | Normal | Physical | 100 | 100% | 15 | |
| 42 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM28 Dig, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #008 Wartortle — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 59 | 63 | 80 | 58 | 65 | 80 | **405** |

- **EV yield:** 1 Defense, 1 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 143 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Blastoise** (Level 36); evolves from **Squirtle** (Level 16)
- **Locations:**
  - Only by evolving Squirtle.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 1 | Bubble | Water | Special | 20 | 100% | 30 | |
| 8 | Bubble | Water | Special | 20 | 100% | 30 | |
| 15 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 24 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 31 | Withdraw | Water | Status | — | 100% | 40 | |
| 39 | Skull Bash | Normal | Physical | 100 | 100% | 15 | |
| 47 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM28 Dig, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #009 Blastoise — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 79 | 83 | 100 | 78 | 85 | 105 | **530** |

- **EV yield:** 3 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 210 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Wartortle** (Level 36)
- **Locations:**
  - Only by evolving Wartortle.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 1 | Bubble | Water | Special | 20 | 100% | 30 | |
| 1 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 8 | Bubble | Water | Special | 20 | 100% | 30 | |
| 15 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 24 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 31 | Withdraw | Water | Status | — | 100% | 40 | |
| 42 | Skull Bash | Normal | Physical | 100 | 100% | 15 | |
| 52 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #010 Caterpie — Bug

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 45 | 30 | 35 | 45 | 20 | 20 | **195** |

- **EV yield:** 1 HP
- **Catch rate:** 255 &nbsp; **Base exp:** 53 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Metapod** (Level 7)
- **Locations:**
  - Viridianforest (grass, Lv.3–6)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | String Shot | Bug | Status | — | 95% | 40 | |

**TM/HM compatibility:** none

---

### #011 Metapod — Bug

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 50 | 20 | 55 | 30 | 25 | 25 | **205** |

- **EV yield:** 2 Defense
- **Catch rate:** 120 &nbsp; **Base exp:** 72 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Butterfree** (Level 10); evolves from **Caterpie** (Level 7)
- **Locations:**
  - Viridianforest (grass, Lv.4–6)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Harden | Normal | Status | — | 100% | 30 | |
| 7 | Harden | Normal | Status | — | 100% | 30 | |

**TM/HM compatibility:** none

---

### #012 Butterfree — Bug/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 45 | 50 | 70 | 90 | 80 | **395** |

- **EV yield:** 3 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 160 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Metapod** (Level 10)
- **Locations:**
  - Only by evolving Metapod.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 10 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 13 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 14 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 15 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 18 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 23 | Whirlwind | Normal | Status | — | 85% | 20 | |
| 28 | Gust | Flying | Special | 40 | 100% | 35 | retyped Normal → Flying |
| 34 | Psybeam | Psychic | Special | 65 | 100% | 20 | |

**TM/HM compatibility:** HM05 Flash, TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM44 Rest, TM46 Psywave, TM50 Substitute

---

### #013 Weedle — Bug/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 35 | 30 | 50 | 20 | 20 | **195** |

- **EV yield:** 1 Speed
- **Catch rate:** 255 &nbsp; **Base exp:** 52 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Kakuna** (Level 7)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 1 | String Shot | Bug | Status | — | 95% | 40 | |

**TM/HM compatibility:** none

---

### #014 Kakuna — Bug/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 45 | 25 | 50 | 35 | 25 | 25 | **205** |

- **EV yield:** 2 Defense
- **Catch rate:** 120 &nbsp; **Base exp:** 71 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Beedrill** (Level 10); evolves from **Weedle** (Level 7)
- **Locations:**
  - Only by evolving Weedle.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Harden | Normal | Status | — | 100% | 30 | |

**TM/HM compatibility:** none

---

### #015 Beedrill — Bug/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 80 | 40 | 75 | 45 | 80 | **385** |

- **EV yield:** 2 Attack, 1 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 159 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Kakuna** (Level 10)
- **Locations:**
  - Only by evolving Kakuna.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 12 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 16 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 20 | Twineedle | Bug | Physical | 25 | 100% | 20 | |
| 25 | Rage | Normal | Physical | 20 | 100% | 20 | |
| 30 | Pin Missile | Bug | Physical | 14 | 85% | 20 | |
| 35 | Agility | Psychic | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #016 Pidgey — Normal/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 45 | 40 | 56 | 35 | 35 | **251** |

- **EV yield:** 1 Speed
- **Catch rate:** 255 &nbsp; **Base exp:** 55 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Pidgeotto** (Level 18)
- **Locations:**
  - Route 1 (grass, Lv.2–7)
  - Route 11 (grass, Lv.16–18)
  - Route 12 (grass, Lv.28)
  - Route 13 (grass, Lv.28)
  - Route 2 (grass, Lv.3–7)
  - Route 21 (grass, Lv.11–17)
  - Route 24 (grass, Lv.13–17)
  - Route 25 (grass, Lv.13–17)
  - Route 5 (grass, Lv.15–17)
  - Route 6 (grass, Lv.15–17)
  - Route 7 (grass, Lv.20–22)
  - Route 8 (grass, Lv.20–22)
  - Viridianforest (grass, Lv.4–8)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Gust | Flying | Special | 40 | 100% | 35 | retyped Normal → Flying |
| 5 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 12 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 19 | Whirlwind | Normal | Status | — | 85% | 20 | |
| 28 | Wing Attack | Flying | Physical | 35 | 100% | 35 | |
| 36 | Agility | Psychic | Status | — | 100% | 30 | |
| 44 | Mirror Move | Flying | Status | — | 100% | 20 | |

**TM/HM compatibility:** HM02 Fly, TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM43 Sky Attack, TM44 Rest, TM50 Substitute

---

### #017 Pidgeotto — Normal/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 63 | 60 | 55 | 71 | 50 | 50 | **349** |

- **EV yield:** 2 Speed
- **Catch rate:** 120 &nbsp; **Base exp:** 113 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Pidgeot** (Level 36); evolves from **Pidgey** (Level 18)
- **Locations:**
  - Route 11 (grass, Lv.18–20)
  - Route 12 (grass, Lv.28)
  - Route 13 (grass, Lv.28)
  - Route 14 (grass, Lv.30)
  - Route 15 (grass, Lv.32)
  - Route 21 (grass, Lv.15–19)
  - Route 24 (grass, Lv.17)
  - Route 25 (grass, Lv.17)
  - Route 5 (grass, Lv.17)
  - Route 6 (grass, Lv.17)
  - Route 7 (grass, Lv.24)
  - Route 8 (grass, Lv.24)
  - Viridianforest (grass, Lv.9)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Gust | Flying | Special | 40 | 100% | 35 | retyped Normal → Flying |
| 1 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 5 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 12 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 21 | Whirlwind | Normal | Status | — | 85% | 20 | |
| 31 | Wing Attack | Flying | Physical | 35 | 100% | 35 | |
| 40 | Agility | Psychic | Status | — | 100% | 30 | |
| 49 | Mirror Move | Flying | Status | — | 100% | 20 | |

**TM/HM compatibility:** HM02 Fly, TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM43 Sky Attack, TM44 Rest, TM50 Substitute

---

### #018 Pidgeot — Normal/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 83 | 80 | 75 | 91 | 70 | 70 | **469** |

- **EV yield:** 3 Speed
- **Catch rate:** 45 &nbsp; **Base exp:** 172 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Pidgeotto** (Level 36)
- **Locations:**
  - Only by evolving Pidgeotto.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Gust | Flying | Special | 40 | 100% | 35 | retyped Normal → Flying |
| 1 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 1 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 5 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 12 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 21 | Whirlwind | Normal | Status | — | 85% | 20 | |
| 31 | Wing Attack | Flying | Physical | 35 | 100% | 35 | |
| 44 | Agility | Psychic | Status | — | 100% | 30 | |
| 54 | Mirror Move | Flying | Status | — | 100% | 20 | |

**TM/HM compatibility:** HM02 Fly, TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM43 Sky Attack, TM44 Rest, TM50 Substitute

---

### #019 Rattata — Normal

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 30 | 56 | 35 | 72 | 25 | 35 | **253** |

- **EV yield:** 1 Speed
- **Catch rate:** 255 &nbsp; **Base exp:** 57 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Raticate** (Level 20)
- **Locations:**
  - Route 1 (grass, Lv.2–4)
  - Route 10 (grass, Lv.18)
  - Route 11 (grass, Lv.15–17)
  - Route 16 (grass, Lv.23–24)
  - Route 18 (grass, Lv.23–24)
  - Route 2 (grass, Lv.3–4)
  - Route 21 (grass, Lv.13–15)
  - Route 22 (grass, Lv.3)
  - Route 3 (grass, Lv.10–12)
  - Route 4 (grass, Lv.10–12)
  - Route 5 (grass, Lv.14–16)
  - Route 6 (grass, Lv.14–16)
  - Route 7 (grass, Lv.20)
  - Route 8 (grass, Lv.20)
  - Route 9 (grass, Lv.18)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 7 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 14 | Hyper Fang | Normal | Physical | 80 | 90% | 15 | |
| 23 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 34 | Super Fang | Normal | Physical | * | 90% | 10 | |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM14 Blizzard, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #020 Raticate — Normal

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 55 | 81 | 60 | 97 | 50 | 70 | **413** |

- **EV yield:** 2 Speed
- **Catch rate:** 90 &nbsp; **Base exp:** 116 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Rattata** (Level 20)
- **Locations:**
  - Route 10 (grass, Lv.20)
  - Route 11 (grass, Lv.17)
  - Route 16 (grass, Lv.25–26)
  - Route 18 (grass, Lv.25–26)
  - Route 21 (grass, Lv.15)
  - Route 9 (grass, Lv.20)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 1 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 7 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 14 | Hyper Fang | Normal | Physical | 80 | 90% | 15 | |
| 27 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 41 | Super Fang | Normal | Physical | * | 90% | 10 | |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #021 Spearow — Normal/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 60 | 30 | 70 | 31 | 31 | **262** |

- **EV yield:** 1 Speed
- **Catch rate:** 255 &nbsp; **Base exp:** 58 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Fearow** (Level 20)
- **Locations:**
  - Route 16 (grass, Lv.22–23)
  - Route 18 (grass, Lv.22–23)
  - Route 22 (grass, Lv.2–6)
  - Route 3 (grass, Lv.8–12)
  - Route 4 (grass, Lv.8–12)
  - Route 9 (grass, Lv.17)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Peck | Flying | Physical | 35 | 100% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 9 | Leer | Normal | Status | — | 100% | 30 | |
| 15 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 22 | Mirror Move | Flying | Status | — | 100% | 20 | |
| 29 | Drill Peck | Flying | Physical | 80 | 100% | 20 | |
| 36 | Agility | Psychic | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM02 Fly, TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM43 Sky Attack, TM44 Rest, TM50 Substitute

---

### #022 Fearow — Normal/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 90 | 65 | 100 | 61 | 61 | **442** |

- **EV yield:** 2 Speed
- **Catch rate:** 90 &nbsp; **Base exp:** 162 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Spearow** (Level 20)
- **Locations:**
  - Route 16 (grass, Lv.24)
  - Route 17 (grass, Lv.27–29)
  - Route 18 (grass, Lv.24)
  - Route 23 (grass, Lv.40–45)
  - Route 9 (grass, Lv.19)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Peck | Flying | Physical | 35 | 100% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 9 | Leer | Normal | Status | — | 100% | 30 | |
| 15 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 25 | Mirror Move | Flying | Status | — | 100% | 20 | |
| 34 | Drill Peck | Flying | Physical | 80 | 100% | 20 | |
| 43 | Agility | Psychic | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM02 Fly, TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM43 Sky Attack, TM44 Rest, TM50 Substitute

---

### #023 Ekans — Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 35 | 60 | 44 | 55 | 40 | 54 | **288** |

- **EV yield:** 1 Attack
- **Catch rate:** 255 &nbsp; **Base exp:** 62 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Arbok** (Level 22)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 10 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 17 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 24 | Glare | Normal | Status | — | 75% | 30 | |
| 31 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 38 | Acid | Poison | Special | 40 | 100% | 30 | side effect now lowers Sp. Def (was Defense) |

**TM/HM compatibility:** HM04 Strength, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM21 Mega Drain, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #024 Arbok — Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 85 | 69 | 80 | 65 | 79 | **438** |

- **EV yield:** 2 Attack
- **Catch rate:** 90 &nbsp; **Base exp:** 147 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Ekans** (Level 22)
- **Locations:**
  - Only by evolving Ekans.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 1 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 10 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 17 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 27 | Glare | Normal | Status | — | 75% | 30 | |
| 36 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 47 | Acid | Poison | Special | 40 | 100% | 30 | side effect now lowers Sp. Def (was Defense) |

**TM/HM compatibility:** HM04 Strength, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #025 Pikachu — Electric

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 35 | 55 | 30 | 90 | 50 | 50 | **310** |

- **EV yield:** 2 Speed
- **Catch rate:** 190 &nbsp; **Base exp:** 82 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Raichu** (Thunder Stone)
- **Locations:**
  - Starter Pokémon from Professor Oak (Pallet Town).

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Thundershock | Electric | Special | 40 | 100% | 30 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 6 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 8 | Thunder Wave | Electric | Status | — | 100% | 20 | |
| 11 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 15 | Double Team | Normal | Status | — | 100% | 15 | |
| 20 | Slam | Normal | Physical | 80 | 75% | 20 | |
| 26 | Thunderbolt | Electric | Special | 95 | 100% | 15 | |
| 33 | Agility | Psychic | Status | — | 100% | 30 | |
| 41 | Thunder | Electric | Special | 120 | 70% | 10 | |
| 50 | Light Screen | Psychic | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM16 Pay Day, TM17 Submission, TM19 Seismic Toss, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM50 Substitute

---

### #026 Raichu — Electric

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 90 | 55 | 100 | 90 | 80 | **475** |

- **EV yield:** 3 Speed
- **Catch rate:** 75 &nbsp; **Base exp:** 122 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Pikachu** (Thunder Stone)
- **Locations:**
  - Only by evolving Pikachu.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Thundershock | Electric | Special | 40 | 100% | 30 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 1 | Thunder Wave | Electric | Status | — | 100% | 20 | |

**TM/HM compatibility:** HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM16 Pay Day, TM17 Submission, TM19 Seismic Toss, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM50 Substitute

---

### #027 Sandshrew — Ground

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 50 | 75 | 85 | 40 | 20 | 30 | **300** |

- **EV yield:** 1 Defense
- **Catch rate:** 255 &nbsp; **Base exp:** 93 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Sandslash** (Level 22)
- **Locations:**
  - Route 3 (grass, Lv.8–10)
  - Route 4 (grass, Lv.8–10)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 10 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 17 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 24 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 31 | Swift | Light | Special | 60 | 100% | 20 | retyped Normal → Light |
| 38 | Fury Swipes | Normal | Physical | 18 | 80% | 15 | |

**TM/HM compatibility:** HM01 Cut, HM04 Strength, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM17 Submission, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #028 Sandslash — Ground

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 75 | 100 | 110 | 65 | 45 | 55 | **450** |

- **EV yield:** 2 Defense
- **Catch rate:** 90 &nbsp; **Base exp:** 163 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Sandshrew** (Level 22)
- **Locations:**
  - Only by evolving Sandshrew.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 10 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 17 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 27 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 36 | Swift | Light | Special | 60 | 100% | 20 | retyped Normal → Light |
| 47 | Fury Swipes | Normal | Physical | 18 | 80% | 15 | |

**TM/HM compatibility:** HM01 Cut, HM04 Strength, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM17 Submission, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #029 Nidoran♀ — Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 55 | 47 | 52 | 41 | 40 | 40 | **275** |

- **EV yield:** 1 HP
- **Catch rate:** 235 &nbsp; **Base exp:** 59 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Nidorina** (Level 16)
- **Locations:**
  - Route 10 (grass, Lv.17)
  - Route 2 (grass, Lv.4–6)
  - Route 22 (grass, Lv.2–4)
  - Route 9 (grass, Lv.16–18)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 8 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 12 | Double Kick | Fighting | Physical | 30 | 100% | 30 | |
| 17 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 23 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 30 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 38 | Fury Swipes | Normal | Physical | 18 | 80% | 15 | |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM14 Blizzard, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #030 Nidorina — Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 70 | 62 | 67 | 56 | 55 | 55 | **365** |

- **EV yield:** 2 HP
- **Catch rate:** 120 &nbsp; **Base exp:** 117 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Nidoqueen** (Moon Stone); evolves from **Nidoran♀** (Level 16)
- **Locations:**
  - Route 23 (grass, Lv.41–44)
  - Route 9 (grass, Lv.18)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 8 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 12 | Double Kick | Fighting | Physical | 30 | 100% | 30 | |
| 19 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 27 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 36 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 46 | Fury Swipes | Normal | Physical | 18 | 80% | 15 | |

**TM/HM compatibility:** TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #031 Nidoqueen — Poison/Ground

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 90 | 82 | 87 | 76 | 75 | 85 | **495** |

- **EV yield:** 3 HP
- **Catch rate:** 45 &nbsp; **Base exp:** 194 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Nidorina** (Moon Stone)
- **Locations:**
  - Only by evolving Nidorina.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 1 | Body Slam | Normal | Physical | 85 | 100% | 15 | |
| 8 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 12 | Double Kick | Fighting | Physical | 30 | 100% | 30 | |
| 23 | Body Slam | Normal | Physical | 85 | 100% | 15 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM16 Pay Day, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM26 Earthquake, TM27 Fissure, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #032 Nidoran♂ — Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 46 | 57 | 40 | 50 | 40 | 40 | **273** |

- **EV yield:** 1 Attack
- **Catch rate:** 235 &nbsp; **Base exp:** 60 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Nidorino** (Level 16)
- **Locations:**
  - Route 10 (grass, Lv.17)
  - Route 2 (grass, Lv.4–6)
  - Route 22 (grass, Lv.2–4)
  - Route 9 (grass, Lv.16–18)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 8 | Horn Attack | Normal | Physical | 65 | 100% | 25 | |
| 12 | Double Kick | Fighting | Physical | 30 | 100% | 30 | |
| 17 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 23 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 30 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 38 | Horn Drill | Normal | Physical | * | 30% | 5 | |

**TM/HM compatibility:** TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM14 Blizzard, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #033 Nidorino — Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 61 | 72 | 57 | 65 | 55 | 55 | **365** |

- **EV yield:** 2 Attack
- **Catch rate:** 120 &nbsp; **Base exp:** 118 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Nidoking** (Moon Stone); evolves from **Nidoran♂** (Level 16)
- **Locations:**
  - Route 23 (grass, Lv.41–44)
  - Route 9 (grass, Lv.18)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Horn Attack | Normal | Physical | 65 | 100% | 25 | |
| 8 | Horn Attack | Normal | Physical | 65 | 100% | 25 | |
| 12 | Double Kick | Fighting | Physical | 30 | 100% | 30 | |
| 19 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 27 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 36 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 46 | Horn Drill | Normal | Physical | * | 30% | 5 | |

**TM/HM compatibility:** TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #034 Nidoking — Poison/Ground

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 81 | 92 | 77 | 85 | 85 | 75 | **495** |

- **EV yield:** 3 Attack
- **Catch rate:** 45 &nbsp; **Base exp:** 195 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Nidorino** (Moon Stone)
- **Locations:**
  - Only by evolving Nidorino.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Horn Attack | Normal | Physical | 65 | 100% | 25 | |
| 1 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 1 | Thrash | Normal | Physical | 90 | 100% | 20 | |
| 8 | Horn Attack | Normal | Physical | 65 | 100% | 25 | |
| 12 | Double Kick | Fighting | Physical | 30 | 100% | 30 | |
| 23 | Thrash | Normal | Physical | 90 | 100% | 20 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM16 Pay Day, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM26 Earthquake, TM27 Fissure, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #035 Clefairy — Fairy *(was Normal)*

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 70 | 45 | 48 | 35 | 60 | 65 | **323** |

- **EV yield:** 2 HP
- **Catch rate:** 150 &nbsp; **Base exp:** 68 &nbsp; **Growth:** Fast
- **Evolution:** evolves into **Clefable** (Moon Stone)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Pound | Normal | Physical | 40 | 100% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 13 | Sing | Sound | Status | — | 55% | 15 | retyped Normal → Sound |
| 18 | Doubleslap | Normal | Physical | 15 | 85% | 10 | |
| 24 | Minimize | Normal | Status | — | 100% | 20 | |
| 31 | Metronome | Normal | Status | — | 100% | 10 | |
| 39 | Defense Curl | Normal | Status | — | 100% | 40 | |
| 48 | Light Screen | Psychic | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM04 Strength, HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM22 Solarbeam, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #036 Clefable — Fairy *(was Normal)*

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 95 | 70 | 73 | 60 | 95 | 90 | **483** |

- **EV yield:** 3 HP
- **Catch rate:** 25 &nbsp; **Base exp:** 129 &nbsp; **Growth:** Fast
- **Evolution:** evolves from **Clefairy** (Moon Stone)
- **Locations:**
  - Only by evolving Clefairy.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Sing | Sound | Status | — | 55% | 15 | retyped Normal → Sound |
| 1 | Doubleslap | Normal | Physical | 15 | 85% | 10 | |
| 1 | Minimize | Normal | Status | — | 100% | 20 | |
| 1 | Metronome | Normal | Status | — | 100% | 10 | |

**TM/HM compatibility:** HM04 Strength, HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM22 Solarbeam, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #037 Vulpix — Fire

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 38 | 41 | 40 | 65 | 50 | 65 | **299** |

- **EV yield:** 1 Speed
- **Catch rate:** 190 &nbsp; **Base exp:** 63 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Ninetales** (Fire Stone)
- **Locations:**
  - Celadon Game Corner prize.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Ember | Fire | Special | 40 | 100% | 25 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 16 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 21 | Roar | Sound | Status | — | 100% | 20 | retyped Normal → Sound |
| 28 | Confuse Ray | Ghost | Status | — | 100% | 10 | |
| 35 | Flamethrower | Fire | Special | 95 | 100% | 15 | |
| 42 | Fire Spin | Fire | Special | 15 | 70% | 15 | |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM28 Dig, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #038 Ninetales — Fire

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 73 | 76 | 75 | 100 | 81 | 100 | **505** |

- **EV yield:** 1 Speed, 1 Special (SpA+SpD)
- **Catch rate:** 75 &nbsp; **Base exp:** 178 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Vulpix** (Fire Stone)
- **Locations:**
  - Only by evolving Vulpix.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Ember | Fire | Special | 40 | 100% | 25 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 1 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 1 | Roar | Sound | Status | — | 100% | 20 | retyped Normal → Sound |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM28 Dig, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #039 Jigglypuff — Sound/Fairy *(was Normal)*

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 115 | 45 | 20 | 20 | 45 | 25 | **270** |

- **EV yield:** 2 HP
- **Catch rate:** 170 &nbsp; **Base exp:** 76 &nbsp; **Growth:** Fast
- **Evolution:** evolves into **Wigglytuff** (Moon Stone)
- **Locations:**
  - Route 5 (grass, Lv.3–7)
  - Route 6 (grass, Lv.3–7)
  - Route 7 (grass, Lv.19–24)
  - Route 8 (grass, Lv.19–24)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Sing | Sound | Status | — | 55% | 15 | retyped Normal → Sound |
| 9 | Pound | Normal | Physical | 40 | 100% | 35 | |
| 14 | Disable | Normal | Status | — | 55% | 20 | |
| 19 | Defense Curl | Normal | Status | — | 100% | 40 | |
| 24 | Doubleslap | Normal | Physical | 15 | 85% | 10 | |
| 29 | Rest | Psychic | Status | — | 100% | 10 | |
| 34 | Body Slam | Normal | Physical | 85 | 100% | 15 | |
| 39 | Double-Edge | Normal | Physical | 100 | 100% | 15 | |

**TM/HM compatibility:** HM04 Strength, HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM22 Solarbeam, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #040 Wigglytuff — Sound/Fairy *(was Normal)*

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 140 | 70 | 45 | 45 | 85 | 50 | **435** |

- **EV yield:** 3 HP
- **Catch rate:** 50 &nbsp; **Base exp:** 109 &nbsp; **Growth:** Fast
- **Evolution:** evolves from **Jigglypuff** (Moon Stone)
- **Locations:**
  - Celadon Game Corner prize.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Sing | Sound | Status | — | 55% | 15 | retyped Normal → Sound |
| 1 | Disable | Normal | Status | — | 55% | 20 | |
| 1 | Defense Curl | Normal | Status | — | 100% | 40 | |
| 1 | Doubleslap | Normal | Physical | 15 | 85% | 10 | |

**TM/HM compatibility:** HM04 Strength, HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM22 Solarbeam, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #041 Zubat — Poison/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 45 | 35 | 55 | 30 | 40 | **245** |

- **EV yield:** 1 Speed
- **Catch rate:** 255 &nbsp; **Base exp:** 54 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Golbat** (Level 22)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Leech Life | Bug | Physical | 20 | 100% | 15 | |
| 10 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 15 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 21 | Confuse Ray | Ghost | Status | — | 100% | 10 | |
| 28 | Wing Attack | Flying | Physical | 35 | 100% | 35 | |
| 36 | Haze | Ice | Status | — | 100% | 30 | |

**TM/HM compatibility:** TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM21 Mega Drain, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM44 Rest, TM50 Substitute

---

### #042 Golbat — Poison/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 75 | 80 | 70 | 90 | 65 | 75 | **455** |

- **EV yield:** 2 Speed
- **Catch rate:** 90 &nbsp; **Base exp:** 171 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Zubat** (Level 22)
- **Locations:**
  - Only by evolving Zubat.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Leech Life | Bug | Physical | 20 | 100% | 15 | |
| 1 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 1 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 10 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 15 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 21 | Confuse Ray | Ghost | Status | — | 100% | 10 | |
| 32 | Wing Attack | Flying | Physical | 35 | 100% | 35 | |
| 43 | Haze | Ice | Status | — | 100% | 30 | |

**TM/HM compatibility:** TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM44 Rest, TM50 Substitute

---

### #043 Oddish — Grass/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 45 | 50 | 55 | 30 | 75 | 65 | **320** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 255 &nbsp; **Base exp:** 78 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Gloom** (Level 21)
- **Locations:**
  - Route 12 (grass, Lv.25–27)
  - Route 13 (grass, Lv.25–27)
  - Route 14 (grass, Lv.26–28)
  - Route 15 (grass, Lv.26–28)
  - Route 24 (grass, Lv.12–14)
  - Route 25 (grass, Lv.12–14)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Absorb | Grass | Special | 20 | 100% | 20 | |
| 15 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 17 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 19 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 24 | Acid | Poison | Special | 40 | 100% | 30 | side effect now lowers Sp. Def (was Defense) |
| 33 | Petal Dance | Grass | Special | 70 | 100% | 20 | |
| 46 | Solarbeam | Grass | Special | 120 | 100% | 10 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #044 Gloom — Grass/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 65 | 70 | 40 | 85 | 75 | **395** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 120 &nbsp; **Base exp:** 132 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Vileplume** (Leaf Stone); evolves from **Oddish** (Level 21)
- **Locations:**
  - Route 12 (grass, Lv.29)
  - Route 13 (grass, Lv.29)
  - Route 14 (grass, Lv.30)
  - Route 15 (grass, Lv.30)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Absorb | Grass | Special | 20 | 100% | 20 | |
| 1 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 1 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 15 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 17 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 19 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 28 | Acid | Poison | Special | 40 | 100% | 30 | side effect now lowers Sp. Def (was Defense) |
| 38 | Petal Dance | Grass | Special | 70 | 100% | 20 | |
| 52 | Solarbeam | Grass | Special | 120 | 100% | 10 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #045 Vileplume — Grass/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 75 | 80 | 85 | 50 | 110 | 90 | **490** |

- **EV yield:** 3 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 184 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Gloom** (Leaf Stone)
- **Locations:**
  - Only by evolving Gloom.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 1 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 1 | Acid | Poison | Special | 40 | 100% | 30 | side effect now lowers Sp. Def (was Defense) |
| 1 | Petal Dance | Grass | Special | 70 | 100% | 20 | |
| 15 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 17 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 19 | Sleep Powder | Grass | Status | — | 75% | 15 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #046 Paras — Bug/Grass

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 35 | 70 | 55 | 25 | 45 | 55 | **285** |

- **EV yield:** 1 Attack
- **Catch rate:** 190 &nbsp; **Base exp:** 70 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Parasect** (Level 24)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 13 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 20 | Leech Life | Bug | Physical | 20 | 100% | 15 | |
| 27 | Spore | Grass | Status | — | 100% | 15 | |
| 34 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 41 | Growth | Normal | Status | — | 100% | 40 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM28 Dig, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #047 Parasect — Bug/Grass

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 95 | 80 | 30 | 60 | 80 | **405** |

- **EV yield:** 2 Attack, 1 Defense
- **Catch rate:** 75 &nbsp; **Base exp:** 128 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Paras** (Level 24)
- **Locations:**
  - In-game trade: give Tangela, receive “SPIKE” (Route 18 Gate 2F)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 1 | Leech Life | Bug | Physical | 20 | 100% | 15 | |
| 13 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 20 | Leech Life | Bug | Physical | 20 | 100% | 15 | |
| 30 | Spore | Grass | Status | — | 100% | 15 | |
| 39 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 48 | Growth | Normal | Status | — | 100% | 40 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM28 Dig, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #048 Venonat — Bug/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 55 | 50 | 45 | 40 | 55 | **305** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 190 &nbsp; **Base exp:** 75 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Venomoth** (Level 31)
- **Locations:**
  - Route 14 (grass, Lv.24–27)
  - Route 15 (grass, Lv.24–27)
  - Route 24 (grass, Lv.13–16)
  - Route 25 (grass, Lv.13–16)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Disable | Normal | Status | — | 55% | 20 | |
| 11 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 19 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 22 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 27 | Leech Life | Bug | Physical | 20 | 100% | 15 | |
| 30 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 35 | Psybeam | Psychic | Special | 65 | 100% | 20 | |
| 38 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 43 | Psychic | Psychic | Special | 90 | 100% | 10 | side effect now lowers Sp. Def (was Special) |

**TM/HM compatibility:** HM05 Flash, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM29 Psychic, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM44 Rest, TM46 Psywave, TM50 Substitute

---

### #049 Venomoth — Bug/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 70 | 65 | 60 | 90 | 90 | 75 | **450** |

- **EV yield:** 1 Speed, 1 Special (SpA+SpD)
- **Catch rate:** 75 &nbsp; **Base exp:** 138 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Venonat** (Level 31)
- **Locations:**
  - Route 14 (grass, Lv.30)
  - Route 15 (grass, Lv.30)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Disable | Normal | Status | — | 55% | 20 | |
| 1 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 1 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 22 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 27 | Leech Life | Bug | Physical | 20 | 100% | 15 | |
| 30 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 38 | Psybeam | Psychic | Special | 65 | 100% | 20 | |
| 43 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 50 | Psychic | Psychic | Special | 90 | 100% | 10 | side effect now lowers Sp. Def (was Special) |

**TM/HM compatibility:** HM05 Flash, TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM44 Rest, TM46 Psywave, TM50 Substitute

---

### #050 Diglett — Ground

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 10 | 55 | 25 | 95 | 35 | 45 | **265** |

- **EV yield:** 1 Speed
- **Catch rate:** 255 &nbsp; **Base exp:** 81 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Dugtrio** (Level 26)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 15 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 19 | Dig | Ground | Physical | 100 | 100% | 10 | |
| 24 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 31 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 40 | Earthquake | Ground | Physical | 100 | 100% | 10 | |

**TM/HM compatibility:** HM01 Cut, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #051 Dugtrio — Ground

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 35 | 80 | 50 | 120 | 50 | 70 | **405** |

- **EV yield:** 2 Speed
- **Catch rate:** 50 &nbsp; **Base exp:** 153 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Diglett** (Level 26)
- **Locations:**
  - In-game trade: give Lickitung, receive “GURIO” (Route 11 Gate 2F)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 1 | Dig | Ground | Physical | 100 | 100% | 10 | |
| 15 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 19 | Dig | Ground | Physical | 100 | 100% | 10 | |
| 24 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 35 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 47 | Earthquake | Ground | Physical | 100 | 100% | 10 | |

**TM/HM compatibility:** HM01 Cut, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #052 Meowth — Normal

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 45 | 35 | 90 | 40 | 40 | **290** |

- **EV yield:** 1 Speed
- **Catch rate:** 255 &nbsp; **Base exp:** 69 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Persian** (Level 28)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 12 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 17 | Pay Day | Normal | Physical | 40 | 100% | 20 | |
| 24 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 33 | Fury Swipes | Normal | Physical | 18 | 80% | 15 | |
| 44 | Slash | Normal | Physical | 70 | 100% | 20 | |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM16 Pay Day, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #053 Persian — Normal

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 70 | 60 | 115 | 65 | 65 | **440** |

- **EV yield:** 2 Speed
- **Catch rate:** 90 &nbsp; **Base exp:** 148 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Meowth** (Level 28)
- **Locations:**
  - Only by evolving Meowth.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 1 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 1 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 12 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 17 | Pay Day | Normal | Physical | 40 | 100% | 20 | |
| 24 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 37 | Fury Swipes | Normal | Physical | 18 | 80% | 15 | |
| 51 | Slash | Normal | Physical | 70 | 100% | 20 | |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM15 Hyper Beam, TM16 Pay Day, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #054 Psyduck — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 50 | 52 | 48 | 55 | 65 | 50 | **320** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 190 &nbsp; **Base exp:** 80 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Golduck** (Level 33)
- **Locations:**
  - Route 6 (water, Lv.15)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 28 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 31 | Disable | Normal | Status | — | 55% | 20 | |
| 36 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 43 | Fury Swipes | Normal | Physical | 18 | 80% | 15 | |
| 52 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM16 Pay Day, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #055 Golduck — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 80 | 82 | 78 | 85 | 95 | 80 | **500** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 75 &nbsp; **Base exp:** 174 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Psyduck** (Level 33)
- **Locations:**
  - Route 6 (water, Lv.15–20)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 1 | Disable | Normal | Status | — | 55% | 20 | |
| 28 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 31 | Disable | Normal | Status | — | 55% | 20 | |
| 39 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 48 | Fury Swipes | Normal | Physical | 18 | 80% | 15 | |
| 59 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM16 Pay Day, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #056 Mankey — Fighting

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 80 | 35 | 70 | 35 | 45 | **305** |

- **EV yield:** 1 Attack
- **Catch rate:** 190 &nbsp; **Base exp:** 74 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Primeape** (Level 28)
- **Locations:**
  - Route 22 (grass, Lv.3–5)
  - Route 23 (grass, Lv.36–41)
  - Route 3 (grass, Lv.9)
  - Route 4 (grass, Lv.9)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 9 | Low Kick | Fighting | Physical | 50 | 90% | 20 | |
| 15 | Karate Chop | Fighting | Physical | 50 | 100% | 25 | retyped Normal → Fighting |
| 21 | Fury Swipes | Normal | Physical | 18 | 80% | 15 | |
| 27 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 33 | Seismic Toss | Fighting | Physical | * | 100% | 20 | |
| 39 | Thrash | Normal | Physical | 90 | 100% | 20 | |
| 45 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM16 Pay Day, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #057 Primeape — Fighting

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 105 | 60 | 95 | 60 | 70 | **455** |

- **EV yield:** 2 Attack
- **Catch rate:** 75 &nbsp; **Base exp:** 149 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Mankey** (Level 28)
- **Locations:**
  - Route 23 (grass, Lv.41–46)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 1 | Low Kick | Fighting | Physical | 50 | 90% | 20 | |
| 1 | Karate Chop | Fighting | Physical | 50 | 100% | 25 | retyped Normal → Fighting |
| 9 | Low Kick | Fighting | Physical | 50 | 90% | 20 | |
| 15 | Karate Chop | Fighting | Physical | 50 | 100% | 25 | retyped Normal → Fighting |
| 21 | Fury Swipes | Normal | Physical | 18 | 80% | 15 | |
| 27 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 28 | Rage | Normal | Physical | 20 | 100% | 20 | |
| 37 | Seismic Toss | Fighting | Physical | * | 100% | 20 | |
| 46 | Thrash | Normal | Physical | 90 | 100% | 20 | |
| 45 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM16 Pay Day, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #058 Growlithe — Fire

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 55 | 70 | 45 | 60 | 70 | 50 | **350** |

- **EV yield:** 1 Attack
- **Catch rate:** 190 &nbsp; **Base exp:** 91 &nbsp; **Growth:** Slow
- **Evolution:** evolves into **Arcanine** (Fire Stone)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 1 | Roar | Sound | Status | — | 100% | 20 | retyped Normal → Sound |
| 18 | Ember | Fire | Special | 40 | 100% | 25 | |
| 23 | Leer | Normal | Status | — | 100% | 30 | |
| 30 | Take Down | Normal | Physical | 90 | 85% | 20 | |
| 39 | Agility | Psychic | Status | — | 100% | 30 | |
| 50 | Flamethrower | Fire | Special | 95 | 100% | 15 | |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM23 Dragon Rage, TM28 Dig, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #059 Arcanine — Fire

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 90 | 110 | 80 | 95 | 100 | 80 | **555** |

- **EV yield:** 2 Attack
- **Catch rate:** 75 &nbsp; **Base exp:** 213 &nbsp; **Growth:** Slow
- **Evolution:** evolves from **Growlithe** (Fire Stone)
- **Locations:**
  - Only by evolving Growlithe.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Roar | Sound | Status | — | 100% | 20 | retyped Normal → Sound |
| 1 | Ember | Fire | Special | 40 | 100% | 25 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 1 | Take Down | Normal | Physical | 90 | 85% | 20 | |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM23 Dragon Rage, TM28 Dig, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #060 Poliwag — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 50 | 40 | 90 | 40 | 40 | **300** |

- **EV yield:** 1 Speed
- **Catch rate:** 255 &nbsp; **Base exp:** 77 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Poliwhirl** (Level 25)
- **Locations:**
  - Route 22 (Super Rod, Lv.5)
  - Route 22 (Super Rod, Lv.10)
  - Route 22 (Super Rod, Lv.15)
  - Route 23 (Super Rod, Lv.25)
  - Route 23 (Super Rod, Lv.30)
  - Viridian City (Super Rod, Lv.5)
  - Viridian City (Super Rod, Lv.10)
  - Viridian City (Super Rod, Lv.15)
  - any water (Good Rod, Lv.10)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Bubble | Water | Special | 20 | 100% | 30 | |
| 16 | Hypnosis | Psychic | Status | — | 60% | 20 | |
| 19 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 25 | Doubleslap | Normal | Physical | 15 | 85% | 10 | |
| 31 | Body Slam | Normal | Physical | 85 | 100% | 15 | |
| 38 | Amnesia | Psychic | Status | — | 100% | 20 | now raises Sp. Def (was Special) |
| 45 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM29 Psychic, TM31 Mimic, TM32 Double Team, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM46 Psywave, TM50 Substitute

---

### #061 Poliwhirl — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 65 | 65 | 90 | 50 | 50 | **385** |

- **EV yield:** 2 Speed
- **Catch rate:** 120 &nbsp; **Base exp:** 131 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Poliwrath** (Water Stone); evolves from **Poliwag** (Level 25)
- **Locations:**
  - Route 22 (Super Rod, Lv.15)
  - Route 23 (Super Rod, Lv.30)
  - Route 23 (Super Rod, Lv.40)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Bubble | Water | Special | 20 | 100% | 30 | |
| 1 | Hypnosis | Psychic | Status | — | 60% | 20 | |
| 1 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 16 | Hypnosis | Psychic | Status | — | 60% | 20 | |
| 19 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 26 | Doubleslap | Normal | Physical | 15 | 85% | 10 | |
| 33 | Body Slam | Normal | Physical | 85 | 100% | 15 | |
| 41 | Amnesia | Psychic | Status | — | 100% | 20 | now raises Sp. Def (was Special) |
| 49 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM29 Psychic, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM40 Skull Bash, TM44 Rest, TM46 Psywave, TM50 Substitute

---

### #062 Poliwrath — Water/Fighting

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 90 | 85 | 95 | 70 | 70 | 90 | **500** |

- **EV yield:** 3 Defense
- **Catch rate:** 45 &nbsp; **Base exp:** 185 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Poliwhirl** (Water Stone)
- **Locations:**
  - Only by evolving Poliwhirl.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Hypnosis | Psychic | Status | — | 60% | 20 | |
| 1 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 1 | Doubleslap | Normal | Physical | 15 | 85% | 10 | |
| 1 | Body Slam | Normal | Physical | 85 | 100% | 15 | |
| 16 | Hypnosis | Psychic | Status | — | 60% | 20 | |
| 19 | Water Gun | Water | Special | 40 | 100% | 25 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM29 Psychic, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM40 Skull Bash, TM44 Rest, TM46 Psywave, TM50 Substitute

---

### #063 Abra — Psychic

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 25 | 20 | 15 | 90 | 105 | 55 | **310** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 200 &nbsp; **Base exp:** 73 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Kadabra** (Level 16)
- **Locations:**
  - Route 5 (grass, Lv.7)
  - Route 6 (grass, Lv.7)
  - Route 7 (grass, Lv.15–26)
  - Route 8 (grass, Lv.15–19)
  - Celadon Game Corner prize.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Teleport | Psychic | Status | — | 100% | 20 | |

**TM/HM compatibility:** HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #064 Kadabra — Psychic

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 35 | 30 | 105 | 120 | 70 | **400** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 100 &nbsp; **Base exp:** 145 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Alakazam** (Trade); evolves from **Abra** (Level 16)
- **Locations:**
  - Route 8 (grass, Lv.20–27)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Teleport | Psychic | Status | — | 100% | 20 | |
| 1 | Kinesis | Psychic | Status | — | 80% | 15 | |
| 16 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 20 | Disable | Normal | Status | — | 55% | 20 | |
| 27 | Psybeam | Psychic | Special | 65 | 100% | 20 | |
| 31 | Recover | Normal | Status | — | 100% | 20 | |
| 38 | Psychic | Psychic | Special | 90 | 100% | 10 | side effect now lowers Sp. Def (was Special) |
| 42 | Reflect | Psychic | Status | — | 100% | 20 | |

**TM/HM compatibility:** HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM28 Dig, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #065 Alakazam — Psychic

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 55 | 50 | 45 | 120 | 135 | 95 | **500** |

- **EV yield:** 3 Special (SpA+SpD)
- **Catch rate:** 50 &nbsp; **Base exp:** 186 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Kadabra** (Trade)
- **Locations:**
  - Only by evolving Kadabra.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Teleport | Psychic | Status | — | 100% | 20 | |
| 1 | Kinesis | Psychic | Status | — | 80% | 15 | |
| 16 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 20 | Disable | Normal | Status | — | 55% | 20 | |
| 27 | Psybeam | Psychic | Special | 65 | 100% | 20 | |
| 31 | Recover | Normal | Status | — | 100% | 20 | |
| 38 | Psychic | Psychic | Special | 90 | 100% | 10 | side effect now lowers Sp. Def (was Special) |
| 42 | Reflect | Psychic | Status | — | 100% | 20 | |

**TM/HM compatibility:** HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM28 Dig, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #066 Machop — Fighting

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 70 | 80 | 50 | 35 | 35 | 35 | **305** |

- **EV yield:** 1 Attack
- **Catch rate:** 180 &nbsp; **Base exp:** 88 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Machoke** (Level 28)
- **Locations:**
  - Route 10 (grass, Lv.16–18)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Karate Chop | Fighting | Physical | 50 | 100% | 25 | retyped Normal → Fighting |
| 20 | Low Kick | Fighting | Physical | 50 | 90% | 20 | |
| 25 | Leer | Normal | Status | — | 100% | 30 | |
| 32 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 39 | Seismic Toss | Fighting | Physical | * | 100% | 20 | |
| 46 | Submission | Fighting | Physical | 80 | 80% | 25 | |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #067 Machoke — Fighting

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 80 | 100 | 70 | 45 | 50 | 60 | **405** |

- **EV yield:** 2 Attack
- **Catch rate:** 90 &nbsp; **Base exp:** 146 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Machamp** (Trade); evolves from **Machop** (Level 28)
- **Locations:**
  - In-game trade: give Cubone, receive “RICKY” (Underground Path Route 5)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Karate Chop | Fighting | Physical | 50 | 100% | 25 | retyped Normal → Fighting |
| 1 | Low Kick | Fighting | Physical | 50 | 90% | 20 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 20 | Low Kick | Fighting | Physical | 50 | 90% | 20 | |
| 25 | Leer | Normal | Status | — | 100% | 30 | |
| 36 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 44 | Seismic Toss | Fighting | Physical | * | 100% | 20 | |
| 52 | Submission | Fighting | Physical | 80 | 80% | 25 | |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #068 Machamp — Fighting

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 90 | 130 | 80 | 55 | 65 | 85 | **505** |

- **EV yield:** 3 Attack
- **Catch rate:** 45 &nbsp; **Base exp:** 193 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Machoke** (Trade)
- **Locations:**
  - Only by evolving Machoke.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Karate Chop | Fighting | Physical | 50 | 100% | 25 | retyped Normal → Fighting |
| 1 | Low Kick | Fighting | Physical | 50 | 90% | 20 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 20 | Low Kick | Fighting | Physical | 50 | 90% | 20 | |
| 25 | Leer | Normal | Status | — | 100% | 30 | |
| 36 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 44 | Seismic Toss | Fighting | Physical | * | 100% | 20 | |
| 52 | Submission | Fighting | Physical | 80 | 80% | 25 | |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #069 Bellsprout — Grass/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 50 | 75 | 35 | 40 | 70 | 30 | **300** |

- **EV yield:** 1 Attack
- **Catch rate:** 255 &nbsp; **Base exp:** 84 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Weepinbell** (Level 21)
- **Locations:**
  - Route 12 (grass, Lv.25–27)
  - Route 13 (grass, Lv.25–27)
  - Route 14 (grass, Lv.26–28)
  - Route 15 (grass, Lv.26–28)
  - Route 24 (grass, Lv.12–14)
  - Route 25 (grass, Lv.12–14)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Vine Whip | Grass | Physical | 35 | 100% | 10 | |
| 1 | Growth | Normal | Status | — | 100% | 40 | |
| 13 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 15 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 18 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 21 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 26 | Acid | Poison | Special | 40 | 100% | 30 | side effect now lowers Sp. Def (was Defense) |
| 33 | Razor Leaf | Grass | Physical | 55 | 95% | 25 | |
| 42 | Slam | Normal | Physical | 80 | 75% | 20 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #070 Weepinbell — Grass/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 90 | 50 | 55 | 85 | 45 | **390** |

- **EV yield:** 2 Attack
- **Catch rate:** 120 &nbsp; **Base exp:** 151 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Victreebel** (Leaf Stone); evolves from **Bellsprout** (Level 21)
- **Locations:**
  - Route 12 (grass, Lv.29)
  - Route 13 (grass, Lv.29)
  - Route 14 (grass, Lv.30)
  - Route 15 (grass, Lv.30)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Vine Whip | Grass | Physical | 35 | 100% | 10 | |
| 1 | Growth | Normal | Status | — | 100% | 40 | |
| 1 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 13 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 15 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 18 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 23 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 29 | Acid | Poison | Special | 40 | 100% | 30 | side effect now lowers Sp. Def (was Defense) |
| 38 | Razor Leaf | Grass | Physical | 55 | 95% | 25 | |
| 49 | Slam | Normal | Physical | 80 | 75% | 20 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #071 Victreebel — Grass/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 80 | 105 | 65 | 70 | 100 | 70 | **490** |

- **EV yield:** 3 Attack
- **Catch rate:** 45 &nbsp; **Base exp:** 191 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Weepinbell** (Leaf Stone)
- **Locations:**
  - Only by evolving Weepinbell.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 1 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 1 | Acid | Poison | Special | 40 | 100% | 30 | side effect now lowers Sp. Def (was Defense) |
| 1 | Razor Leaf | Grass | Physical | 55 | 95% | 25 | |
| 13 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 15 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 18 | Sleep Powder | Grass | Status | — | 75% | 15 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #072 Tentacool — Water/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 40 | 35 | 70 | 50 | 100 | **335** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 190 &nbsp; **Base exp:** 105 &nbsp; **Growth:** Slow
- **Evolution:** evolves into **Tentacruel** (Level 30)
- **Locations:**
  - Route 19 (water, Lv.5–40)
  - Route 20 (water, Lv.5–40)
  - Route 21 (water, Lv.5–40)
  - Cinnabar Island (Super Rod, Lv.15)
  - Cinnabar Island (Super Rod, Lv.30)
  - Pallet Town (Super Rod, Lv.10)
  - Pallet Town (Super Rod, Lv.20)
  - Route 11 (Super Rod, Lv.10)
  - Route 11 (Super Rod, Lv.15)
  - Route 11 (Super Rod, Lv.20)
  - Route 13 (Super Rod, Lv.10)
  - Route 17 (Super Rod, Lv.5)
  - Route 17 (Super Rod, Lv.15)
  - Route 18 (Super Rod, Lv.15)
  - Route 19 (Super Rod, Lv.15)
  - Route 19 (Super Rod, Lv.30)
  - Route 20 (Super Rod, Lv.20)
  - Route 21 (Super Rod, Lv.15)
  - Route 21 (Super Rod, Lv.30)
  - Vermilion City (Super Rod, Lv.10)
  - Vermilion City (Super Rod, Lv.15)
  - Vermilion City (Super Rod, Lv.20)
  - Vermilion Dock (Super Rod, Lv.10)
  - Vermilion Dock (Super Rod, Lv.15)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Acid | Poison | Special | 40 | 100% | 30 | side effect now lowers Sp. Def (was Defense) |
| 7 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 13 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 18 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 22 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 27 | Constrict | Normal | Physical | 10 | 100% | 35 | |
| 33 | Barrier | Psychic | Status | — | 100% | 30 | |
| 40 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 48 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM01 Cut, HM03 Surf, TM03 Swords Dance, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM21 Mega Drain, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #073 Tentacruel — Water/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 80 | 70 | 65 | 100 | 80 | 120 | **515** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 60 &nbsp; **Base exp:** 205 &nbsp; **Growth:** Slow
- **Evolution:** evolves from **Tentacool** (Level 30)
- **Locations:**
  - Route 19 (Super Rod, Lv.30)
  - Route 20 (Super Rod, Lv.20)
  - Route 20 (Super Rod, Lv.40)
  - Route 21 (Super Rod, Lv.30)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Acid | Poison | Special | 40 | 100% | 30 | side effect now lowers Sp. Def (was Defense) |
| 1 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 1 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 7 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 13 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 18 | Poison Sting | Poison | Physical | 15 | 100% | 35 | |
| 22 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 27 | Constrict | Normal | Physical | 10 | 100% | 35 | |
| 35 | Barrier | Psychic | Status | — | 100% | 30 | |
| 43 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 50 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM01 Cut, HM03 Surf, TM03 Swords Dance, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #074 Geodude — Rock/Ground

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 80 | 100 | 20 | 30 | 30 | **300** |

- **EV yield:** 1 Defense
- **Catch rate:** 255 &nbsp; **Base exp:** 86 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Graveler** (Level 25)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 11 | Defense Curl | Normal | Status | — | 100% | 40 | |
| 16 | Rock Throw | Rock | Physical | 50 | 65% | 15 | |
| 21 | Selfdestruct | Normal | Physical | 130 | 100% | 5 | |
| 26 | Harden | Normal | Status | — | 100% | 30 | |
| 31 | Earthquake | Ground | Physical | 100 | 100% | 10 | |
| 36 | Explosion | Normal | Physical | 170 | 100% | 5 | |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM36 Selfdestruct, TM38 Fire Blast, TM44 Rest, TM47 Explosion, TM48 Rock Slide, TM50 Substitute

---

### #075 Graveler — Rock/Ground

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 55 | 95 | 115 | 35 | 45 | 45 | **390** |

- **EV yield:** 2 Defense
- **Catch rate:** 120 &nbsp; **Base exp:** 134 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Golem** (Trade); evolves from **Geodude** (Level 25)
- **Locations:**
  - Only by evolving Geodude.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Defense Curl | Normal | Status | — | 100% | 40 | |
| 11 | Defense Curl | Normal | Status | — | 100% | 40 | |
| 16 | Rock Throw | Rock | Physical | 50 | 65% | 15 | |
| 21 | Selfdestruct | Normal | Physical | 130 | 100% | 5 | |
| 29 | Harden | Normal | Status | — | 100% | 30 | |
| 36 | Earthquake | Ground | Physical | 100 | 100% | 10 | |
| 43 | Explosion | Normal | Physical | 170 | 100% | 5 | |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM36 Selfdestruct, TM38 Fire Blast, TM44 Rest, TM47 Explosion, TM48 Rock Slide, TM50 Substitute

---

### #076 Golem — Rock/Ground

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 80 | 110 | 130 | 45 | 55 | 65 | **485** |

- **EV yield:** 3 Defense
- **Catch rate:** 45 &nbsp; **Base exp:** 177 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Graveler** (Trade)
- **Locations:**
  - Only by evolving Graveler.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Defense Curl | Normal | Status | — | 100% | 40 | |
| 11 | Defense Curl | Normal | Status | — | 100% | 40 | |
| 16 | Rock Throw | Rock | Physical | 50 | 65% | 15 | |
| 21 | Selfdestruct | Normal | Physical | 130 | 100% | 5 | |
| 29 | Harden | Normal | Status | — | 100% | 30 | |
| 36 | Earthquake | Ground | Physical | 100 | 100% | 10 | |
| 43 | Explosion | Normal | Physical | 170 | 100% | 5 | |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM36 Selfdestruct, TM38 Fire Blast, TM44 Rest, TM47 Explosion, TM48 Rock Slide, TM50 Substitute

---

### #077 Ponyta — Fire

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 50 | 85 | 55 | 90 | 65 | 65 | **410** |

- **EV yield:** 1 Speed
- **Catch rate:** 190 &nbsp; **Base exp:** 152 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Rapidash** (Level 40)
- **Locations:**
  - Route 17 (grass, Lv.28–32)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Ember | Fire | Special | 40 | 100% | 25 | |
| 30 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 32 | Stomp | Normal | Physical | 65 | 100% | 20 | |
| 35 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 39 | Fire Spin | Fire | Special | 15 | 70% | 15 | |
| 43 | Take Down | Normal | Physical | 90 | 85% | 20 | |
| 48 | Agility | Psychic | Status | — | 100% | 30 | |

**TM/HM compatibility:** TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #078 Rapidash — Fire

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 100 | 70 | 105 | 80 | 80 | **500** |

- **EV yield:** 2 Speed
- **Catch rate:** 60 &nbsp; **Base exp:** 192 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Ponyta** (Level 40)
- **Locations:**
  - Only by evolving Ponyta.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Ember | Fire | Special | 40 | 100% | 25 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 1 | Stomp | Normal | Physical | 65 | 100% | 20 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 30 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 32 | Stomp | Normal | Physical | 65 | 100% | 20 | |
| 35 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 39 | Fire Spin | Fire | Special | 15 | 70% | 15 | |
| 47 | Take Down | Normal | Physical | 90 | 85% | 20 | |
| 55 | Agility | Psychic | Status | — | 100% | 30 | |

**TM/HM compatibility:** TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #079 Slowpoke — Water/Psychic

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 90 | 65 | 65 | 15 | 40 | 40 | **315** |

- **EV yield:** 1 HP
- **Catch rate:** 190 &nbsp; **Base exp:** 99 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Slowbro** (Level 37)
- **Locations:**
  - Route 12 (water, Lv.15)
  - Route 13 (water, Lv.15)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 18 | Disable | Normal | Status | — | 55% | 20 | |
| 22 | Headbutt | Normal | Physical | 70 | 100% | 15 | |
| 27 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 33 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 40 | Amnesia | Psychic | Status | — | 100% | 20 | now raises Sp. Def (was Special) |
| 48 | Psychic | Psychic | Special | 90 | 100% | 10 | side effect now lowers Sp. Def (was Special) |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, HM05 Flash, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM16 Pay Day, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #080 Slowbro — Water/Psychic

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 95 | 75 | 110 | 30 | 100 | 80 | **490** |

- **EV yield:** 2 Defense
- **Catch rate:** 75 &nbsp; **Base exp:** 164 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Slowpoke** (Level 37)
- **Locations:**
  - Route 12 (water, Lv.15–20)
  - Route 13 (water, Lv.15–20)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 1 | Disable | Normal | Status | — | 55% | 20 | |
| 1 | Headbutt | Normal | Physical | 70 | 100% | 15 | |
| 18 | Disable | Normal | Status | — | 55% | 20 | |
| 22 | Headbutt | Normal | Physical | 70 | 100% | 15 | |
| 27 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 33 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 37 | Withdraw | Water | Status | — | 100% | 40 | |
| 44 | Amnesia | Psychic | Status | — | 100% | 20 | now raises Sp. Def (was Special) |
| 55 | Psychic | Psychic | Special | 90 | 100% | 10 | side effect now lowers Sp. Def (was Special) |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM16 Pay Day, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #081 Magnemite — Electric/Steel *(was pure Electric)*

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 25 | 35 | 70 | 45 | 95 | 55 | **325** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 190 &nbsp; **Base exp:** 89 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Magneton** (Level 30)
- **Locations:**
  - Route 10 (grass, Lv.16–22)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 21 | Sonicboom | Sound | Special | * | 90% | 20 | retyped Normal → Sound |
| 25 | Thundershock | Electric | Special | 40 | 100% | 30 | |
| 29 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 35 | Thunder Wave | Electric | Status | — | 100% | 20 | |
| 41 | Swift | Light | Special | 60 | 100% | 20 | retyped Normal → Light |
| 47 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |

**TM/HM compatibility:** HM05 Flash, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM44 Rest, TM45 Thunder Wave, TM50 Substitute

---

### #082 Magneton — Electric/Steel *(was pure Electric)*

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 50 | 60 | 95 | 70 | 120 | 70 | **465** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 60 &nbsp; **Base exp:** 161 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Magnemite** (Level 30)
- **Locations:**
  - Only by evolving Magnemite.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Sonicboom | Sound | Special | * | 90% | 20 | retyped Normal → Sound |
| 1 | Thundershock | Electric | Special | 40 | 100% | 30 | |
| 21 | Sonicboom | Sound | Special | * | 90% | 20 | retyped Normal → Sound |
| 25 | Thundershock | Electric | Special | 40 | 100% | 30 | |
| 29 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 38 | Thunder Wave | Electric | Status | — | 100% | 20 | |
| 46 | Swift | Light | Special | 60 | 100% | 20 | retyped Normal → Light |
| 54 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |

**TM/HM compatibility:** HM05 Flash, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM44 Rest, TM45 Thunder Wave, TM50 Substitute

---

### #083 Farfetch'd — Normal/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 52 | 65 | 55 | 60 | 58 | 62 | **352** |

- **EV yield:** 1 Attack
- **Catch rate:** 45 &nbsp; **Base exp:** 94 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Route 12 (grass, Lv.26–31)
  - Route 13 (grass, Lv.26–31)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Peck | Flying | Physical | 35 | 100% | 35 | |
| 1 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 7 | Leer | Normal | Status | — | 100% | 30 | |
| 15 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 23 | Swords Dance | Normal | Status | — | 100% | 30 | |
| 31 | Agility | Psychic | Status | — | 100% | 30 | |
| 39 | Slash | Normal | Physical | 70 | 100% | 20 | |

**TM/HM compatibility:** HM01 Cut, HM02 Fly, TM02 Razor Wind, TM03 Swords Dance, TM04 Whirlwind, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #084 Doduo — Normal/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 35 | 85 | 45 | 75 | 35 | 35 | **310** |

- **EV yield:** 1 Attack
- **Catch rate:** 190 &nbsp; **Base exp:** 96 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Dodrio** (Level 31)
- **Locations:**
  - Route 16 (grass, Lv.22–26)
  - Route 17 (grass, Lv.26–28)
  - Route 18 (grass, Lv.22–26)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Peck | Flying | Physical | 35 | 100% | 35 | |
| 20 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 24 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 30 | Drill Peck | Flying | Physical | 80 | 100% | 20 | |
| 36 | Rage | Normal | Physical | 20 | 100% | 20 | |
| 40 | Tri Attack | Normal | Special | 80 | 100% | 10 | |
| 44 | Agility | Psychic | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM02 Fly, TM04 Whirlwind, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM43 Sky Attack, TM44 Rest, TM49 Tri Attack, TM50 Substitute

---

### #085 Dodrio — Normal/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 110 | 70 | 100 | 60 | 60 | **460** |

- **EV yield:** 2 Attack
- **Catch rate:** 45 &nbsp; **Base exp:** 158 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Doduo** (Level 31)
- **Locations:**
  - Route 17 (grass, Lv.29)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Peck | Flying | Physical | 35 | 100% | 35 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 1 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 20 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 24 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 30 | Drill Peck | Flying | Physical | 80 | 100% | 20 | |
| 39 | Rage | Normal | Physical | 20 | 100% | 20 | |
| 45 | Tri Attack | Normal | Special | 80 | 100% | 10 | |
| 51 | Agility | Psychic | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM02 Fly, TM04 Whirlwind, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM43 Sky Attack, TM44 Rest, TM49 Tri Attack, TM50 Substitute

---

### #086 Seel — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 45 | 55 | 45 | 45 | 70 | **325** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 190 &nbsp; **Base exp:** 100 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Dewgong** (Level 34)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Headbutt | Normal | Physical | 70 | 100% | 15 | |
| 30 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 35 | Aurora Beam | Light | Special | 65 | 100% | 20 | retyped Ice → Light |
| 40 | Rest | Psychic | Status | — | 100% | 10 | |
| 45 | Take Down | Normal | Physical | 90 | 85% | 20 | |
| 50 | Ice Beam | Ice | Special | 95 | 100% | 10 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM16 Pay Day, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #087 Dewgong — Water/Ice

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 90 | 70 | 80 | 70 | 70 | 95 | **475** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 75 &nbsp; **Base exp:** 176 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Seel** (Level 34)
- **Locations:**
  - In-game trade: give Growlithe, receive “CEZANNE” (Cinnabar Lab Trade Room)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Headbutt | Normal | Physical | 70 | 100% | 15 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 1 | Aurora Beam | Light | Special | 65 | 100% | 20 | retyped Ice → Light |
| 30 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 35 | Aurora Beam | Light | Special | 65 | 100% | 20 | retyped Ice → Light |
| 44 | Rest | Psychic | Status | — | 100% | 10 | |
| 50 | Take Down | Normal | Physical | 90 | 85% | 20 | |
| 56 | Ice Beam | Ice | Special | 95 | 100% | 10 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM16 Pay Day, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #088 Grimer — Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 80 | 80 | 50 | 25 | 40 | 50 | **325** |

- **EV yield:** 1 HP
- **Catch rate:** 190 &nbsp; **Base exp:** 90 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Muk** (Level 38)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Pound | Normal | Physical | 40 | 100% | 35 | |
| 1 | Disable | Normal | Status | — | 55% | 20 | |
| 30 | Poison Gas | Poison | Status | — | 55% | 40 | |
| 33 | Minimize | Normal | Status | — | 100% | 20 | |
| 37 | Sludge | Poison | Special | 65 | 100% | 20 | |
| 42 | Harden | Normal | Status | — | 100% | 30 | |
| 48 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 55 | Acid Armor | Poison | Status | — | 100% | 40 | |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM20 Rage, TM21 Mega Drain, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM34 Bide, TM36 Selfdestruct, TM38 Fire Blast, TM44 Rest, TM47 Explosion, TM50 Substitute

---

### #089 Muk — Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 105 | 105 | 75 | 50 | 65 | 100 | **500** |

- **EV yield:** 1 HP, 1 Attack
- **Catch rate:** 75 &nbsp; **Base exp:** 157 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Grimer** (Level 38)
- **Locations:**
  - In-game trade: give Kangaskhan, receive “STICKY” (Cinnabar Lab Fossil Room)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Pound | Normal | Physical | 40 | 100% | 35 | |
| 1 | Disable | Normal | Status | — | 55% | 20 | |
| 1 | Poison Gas | Poison | Status | — | 55% | 40 | |
| 30 | Poison Gas | Poison | Status | — | 55% | 40 | |
| 33 | Minimize | Normal | Status | — | 100% | 20 | |
| 37 | Sludge | Poison | Special | 65 | 100% | 20 | |
| 45 | Harden | Normal | Status | — | 100% | 30 | |
| 53 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 60 | Acid Armor | Poison | Status | — | 100% | 40 | |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM34 Bide, TM36 Selfdestruct, TM38 Fire Blast, TM44 Rest, TM47 Explosion, TM50 Substitute

---

### #090 Shellder — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 30 | 65 | 100 | 40 | 45 | 25 | **305** |

- **EV yield:** 1 Defense
- **Catch rate:** 190 &nbsp; **Base exp:** 97 &nbsp; **Growth:** Slow
- **Evolution:** evolves into **Cloyster** (Water Stone)
- **Locations:**
  - Route 17 (Super Rod, Lv.25)
  - Route 17 (Super Rod, Lv.35)
  - Route 18 (Super Rod, Lv.20)
  - Route 18 (Super Rod, Lv.30)
  - Route 18 (Super Rod, Lv.40)
  - Vermilion Dock (Super Rod, Lv.10)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Withdraw | Water | Status | — | 100% | 40 | |
| 18 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 23 | Clamp | Water | Physical | 35 | 75% | 10 | |
| 30 | Aurora Beam | Light | Special | 65 | 100% | 20 | retyped Ice → Light |
| 39 | Leer | Normal | Status | — | 100% | 30 | |
| 50 | Ice Beam | Ice | Special | 95 | 100% | 10 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM36 Selfdestruct, TM39 Swift, TM44 Rest, TM47 Explosion, TM49 Tri Attack, TM50 Substitute

---

### #091 Cloyster — Water/Ice

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 50 | 95 | 180 | 70 | 85 | 45 | **525** |

- **EV yield:** 2 Defense
- **Catch rate:** 60 &nbsp; **Base exp:** 203 &nbsp; **Growth:** Slow
- **Evolution:** evolves from **Shellder** (Water Stone)
- **Locations:**
  - Only by evolving Shellder.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Withdraw | Water | Status | — | 100% | 40 | |
| 1 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 1 | Clamp | Water | Physical | 35 | 75% | 10 | |
| 1 | Aurora Beam | Light | Special | 65 | 100% | 20 | retyped Ice → Light |
| 50 | Spike Cannon | Normal | Physical | 20 | 100% | 15 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM36 Selfdestruct, TM39 Swift, TM44 Rest, TM47 Explosion, TM49 Tri Attack, TM50 Substitute

---

### #092 Gastly — Ghost/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 30 | 35 | 30 | 80 | 100 | 35 | **310** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 190 &nbsp; **Base exp:** 95 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Haunter** (Level 25)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Lick | Ghost | Physical | 20 | 100% | 30 | |
| 1 | Confuse Ray | Ghost | Status | — | 100% | 10 | |
| 1 | Night Shade | Ghost | Special | — | 100% | 15 | |
| 27 | Hypnosis | Psychic | Status | — | 60% | 20 | |
| 35 | Dream Eater | Psychic | Special | 100 | 100% | 15 | |

**TM/HM compatibility:** TM06 Toxic, TM20 Rage, TM21 Mega Drain, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM31 Mimic, TM32 Double Team, TM34 Bide, TM36 Selfdestruct, TM42 Dream Eater, TM44 Rest, TM46 Psywave, TM47 Explosion, TM50 Substitute

---

### #093 Haunter — Ghost/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 45 | 50 | 45 | 95 | 115 | 55 | **405** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 90 &nbsp; **Base exp:** 126 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves into **Gengar** (Trade); evolves from **Gastly** (Level 25)
- **Locations:**
  - Only by evolving Gastly.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Lick | Ghost | Physical | 20 | 100% | 30 | |
| 1 | Confuse Ray | Ghost | Status | — | 100% | 10 | |
| 1 | Night Shade | Ghost | Special | — | 100% | 15 | |
| 29 | Hypnosis | Psychic | Status | — | 60% | 20 | |
| 38 | Dream Eater | Psychic | Special | 100 | 100% | 15 | |

**TM/HM compatibility:** TM06 Toxic, TM20 Rage, TM21 Mega Drain, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM31 Mimic, TM32 Double Team, TM34 Bide, TM36 Selfdestruct, TM42 Dream Eater, TM44 Rest, TM46 Psywave, TM47 Explosion, TM50 Substitute

---

### #094 Gengar — Ghost/Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 65 | 60 | 110 | 130 | 75 | **500** |

- **EV yield:** 3 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 190 &nbsp; **Growth:** Medium Slow
- **Evolution:** evolves from **Haunter** (Trade)
- **Locations:**
  - Only by evolving Haunter.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Lick | Ghost | Physical | 20 | 100% | 30 | |
| 1 | Confuse Ray | Ghost | Status | — | 100% | 10 | |
| 1 | Night Shade | Ghost | Special | — | 100% | 15 | |
| 29 | Hypnosis | Psychic | Status | — | 60% | 20 | |
| 38 | Dream Eater | Psychic | Special | 100 | 100% | 15 | |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM21 Mega Drain, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM36 Selfdestruct, TM40 Skull Bash, TM42 Dream Eater, TM44 Rest, TM46 Psywave, TM47 Explosion, TM50 Substitute

---

### #095 Onix — Rock/Ground

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 35 | 45 | 160 | 70 | 30 | 45 | **385** |

- **EV yield:** 1 Defense
- **Catch rate:** 45 &nbsp; **Base exp:** 108 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 15 | Bind | Normal | Physical | 15 | 75% | 20 | |
| 19 | Rock Throw | Rock | Physical | 50 | 65% | 15 | |
| 25 | Rage | Normal | Physical | 20 | 100% | 20 | |
| 33 | Slam | Normal | Physical | 80 | 75% | 20 | |
| 43 | Harden | Normal | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM04 Strength, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM36 Selfdestruct, TM40 Skull Bash, TM44 Rest, TM47 Explosion, TM48 Rock Slide, TM50 Substitute

---

### #096 Drowzee — Psychic

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 48 | 45 | 42 | 43 | 90 | **328** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 190 &nbsp; **Base exp:** 102 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Hypno** (Level 26)
- **Locations:**
  - Route 11 (grass, Lv.15–19)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Pound | Normal | Physical | 40 | 100% | 35 | |
| 1 | Hypnosis | Psychic | Status | — | 60% | 20 | |
| 12 | Disable | Normal | Status | — | 55% | 20 | |
| 17 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 24 | Headbutt | Normal | Physical | 70 | 100% | 15 | |
| 29 | Poison Gas | Poison | Status | — | 55% | 40 | |
| 32 | Psychic | Psychic | Special | 90 | 100% | 10 | side effect now lowers Sp. Def (was Special) |
| 37 | Meditate | Psychic | Status | — | 100% | 40 | |

**TM/HM compatibility:** HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM40 Skull Bash, TM42 Dream Eater, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #097 Hypno — Psychic

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 85 | 73 | 70 | 67 | 73 | 115 | **483** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 75 &nbsp; **Base exp:** 165 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Drowzee** (Level 26)
- **Locations:**
  - Only by evolving Drowzee.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Pound | Normal | Physical | 40 | 100% | 35 | |
| 1 | Hypnosis | Psychic | Status | — | 60% | 20 | |
| 1 | Disable | Normal | Status | — | 55% | 20 | |
| 1 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 12 | Disable | Normal | Status | — | 55% | 20 | |
| 17 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 24 | Headbutt | Normal | Physical | 70 | 100% | 15 | |
| 33 | Poison Gas | Poison | Status | — | 55% | 40 | |
| 37 | Psychic | Psychic | Special | 90 | 100% | 10 | side effect now lowers Sp. Def (was Special) |
| 43 | Meditate | Psychic | Status | — | 100% | 40 | |

**TM/HM compatibility:** HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM40 Skull Bash, TM42 Dream Eater, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #098 Krabby — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 30 | 105 | 90 | 50 | 25 | 25 | **325** |

- **EV yield:** 1 Attack
- **Catch rate:** 225 &nbsp; **Base exp:** 115 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Kingler** (Level 28)
- **Locations:**
  - Route 10 (Super Rod, Lv.15)
  - Route 10 (Super Rod, Lv.20)
  - Route 25 (Super Rod, Lv.10)
  - Route 25 (Super Rod, Lv.15)
  - Seafoam Islands B3F (Super Rod, Lv.25)
  - Seafoam Islands B4F (Super Rod, Lv.25)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Bubble | Water | Special | 20 | 100% | 30 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 20 | Vicegrip | Normal | Physical | 55 | 100% | 30 | |
| 25 | Guillotine | Normal | Physical | * | 30% | 5 | |
| 30 | Stomp | Normal | Physical | 65 | 100% | 20 | |
| 35 | Crabhammer | Water | Physical | 90 | 85% | 10 | |
| 40 | Harden | Normal | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM01 Cut, HM03 Surf, HM04 Strength, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #099 Kingler — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 55 | 130 | 115 | 75 | 50 | 50 | **475** |

- **EV yield:** 2 Attack
- **Catch rate:** 60 &nbsp; **Base exp:** 206 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Krabby** (Level 28)
- **Locations:**
  - Route 10 (Super Rod, Lv.25)
  - Route 25 (Super Rod, Lv.15)
  - Route 25 (Super Rod, Lv.25)
  - Seafoam Islands B3F (Super Rod, Lv.35)
  - Seafoam Islands B4F (Super Rod, Lv.35)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Bubble | Water | Special | 20 | 100% | 30 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 1 | Vicegrip | Normal | Physical | 55 | 100% | 30 | |
| 20 | Vicegrip | Normal | Physical | 55 | 100% | 30 | |
| 25 | Guillotine | Normal | Physical | * | 30% | 5 | |
| 34 | Stomp | Normal | Physical | 65 | 100% | 20 | |
| 42 | Crabhammer | Water | Physical | 90 | 85% | 10 | |
| 49 | Harden | Normal | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM01 Cut, HM03 Surf, HM04 Strength, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #100 Voltorb — Electric

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 30 | 50 | 100 | 55 | 55 | **330** |

- **EV yield:** 1 Speed
- **Catch rate:** 190 &nbsp; **Base exp:** 103 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Electrode** (Level 30)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 17 | Sonicboom | Sound | Special | * | 90% | 20 | retyped Normal → Sound |
| 22 | Selfdestruct | Normal | Physical | 130 | 100% | 5 | |
| 29 | Light Screen | Psychic | Status | — | 100% | 30 | |
| 36 | Swift | Light | Special | 60 | 100% | 20 | retyped Normal → Light |
| 43 | Explosion | Normal | Physical | 170 | 100% | 5 | |

**TM/HM compatibility:** HM05 Flash, TM06 Toxic, TM09 Take Down, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM36 Selfdestruct, TM39 Swift, TM44 Rest, TM45 Thunder Wave, TM47 Explosion, TM50 Substitute

---

### #101 Electrode — Electric

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 50 | 70 | 140 | 80 | 80 | **480** |

- **EV yield:** 2 Speed
- **Catch rate:** 60 &nbsp; **Base exp:** 150 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Voltorb** (Level 30)
- **Locations:**
  - Only by evolving Voltorb.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 1 | Sonicboom | Sound | Special | * | 90% | 20 | retyped Normal → Sound |
| 17 | Sonicboom | Sound | Special | * | 90% | 20 | retyped Normal → Sound |
| 22 | Selfdestruct | Normal | Physical | 130 | 100% | 5 | |
| 29 | Light Screen | Psychic | Status | — | 100% | 30 | |
| 40 | Swift | Light | Special | 60 | 100% | 20 | retyped Normal → Light |
| 50 | Explosion | Normal | Physical | 170 | 100% | 5 | |

**TM/HM compatibility:** HM05 Flash, TM06 Toxic, TM09 Take Down, TM15 Hyper Beam, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM36 Selfdestruct, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM47 Explosion, TM50 Substitute

---

### #102 Exeggcute — Grass/Psychic

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 40 | 80 | 40 | 60 | 45 | **325** |

- **EV yield:** 1 Defense
- **Catch rate:** 90 &nbsp; **Base exp:** 98 &nbsp; **Growth:** Slow
- **Evolution:** evolves into **Exeggutor** (Leaf Stone)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Barrage | Normal | Physical | 15 | 85% | 20 | |
| 1 | Hypnosis | Psychic | Status | — | 60% | 20 | |
| 25 | Reflect | Psychic | Status | — | 100% | 20 | |
| 28 | Leech Seed | Grass | Status | — | 90% | 10 | |
| 32 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 37 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 42 | Solarbeam | Grass | Special | 120 | 100% | 10 | |
| 48 | Sleep Powder | Grass | Status | — | 75% | 15 | |

**TM/HM compatibility:** TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM36 Selfdestruct, TM37 Egg Bomb, TM44 Rest, TM46 Psywave, TM47 Explosion, TM50 Substitute

---

### #103 Exeggutor — Grass/Psychic

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 95 | 95 | 85 | 55 | 125 | 75 | **530** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 212 &nbsp; **Growth:** Slow
- **Evolution:** evolves from **Exeggcute** (Leaf Stone)
- **Locations:**
  - Only by evolving Exeggcute.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Barrage | Normal | Physical | 15 | 85% | 20 | |
| 1 | Hypnosis | Psychic | Status | — | 60% | 20 | |
| 28 | Stomp | Normal | Physical | 65 | 100% | 20 | |

**TM/HM compatibility:** HM04 Strength, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM36 Selfdestruct, TM37 Egg Bomb, TM44 Rest, TM46 Psywave, TM47 Explosion, TM50 Substitute

---

### #104 Cubone — Ground

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 50 | 50 | 95 | 35 | 40 | 50 | **320** |

- **EV yield:** 1 Defense
- **Catch rate:** 190 &nbsp; **Base exp:** 87 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Marowak** (Level 28)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 10 | Bone Club | Ground | Physical | 65 | 85% | 20 | |
| 13 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 18 | Headbutt | Normal | Physical | 70 | 100% | 15 | |
| 25 | Leer | Normal | Status | — | 100% | 30 | |
| 31 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 38 | Thrash | Normal | Physical | 90 | 100% | 20 | |
| 43 | Bonemerang | Ground | Physical | 50 | 90% | 10 | |
| 46 | Rage | Normal | Physical | 20 | 100% | 20 | |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #105 Marowak — Ground

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 80 | 110 | 45 | 50 | 80 | **425** |

- **EV yield:** 2 Defense
- **Catch rate:** 75 &nbsp; **Base exp:** 124 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Cubone** (Level 28)
- **Locations:**
  - Only by evolving Cubone.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Bone Club | Ground | Physical | 65 | 85% | 20 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 10 | Bone Club | Ground | Physical | 65 | 85% | 20 | |
| 13 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 18 | Headbutt | Normal | Physical | 70 | 100% | 15 | |
| 25 | Leer | Normal | Status | — | 100% | 30 | |
| 33 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 41 | Thrash | Normal | Physical | 90 | 100% | 20 | |
| 48 | Bonemerang | Ground | Physical | 50 | 90% | 10 | |
| 55 | Rage | Normal | Physical | 20 | 100% | 20 | |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #106 Hitmonlee — Fighting

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 50 | 120 | 53 | 87 | 35 | 110 | **455** |

- **EV yield:** 2 Attack
- **Catch rate:** 45 &nbsp; **Base exp:** 139 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Choice reward at the Saffron City Fighting Dojo.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Double Kick | Fighting | Physical | 30 | 100% | 30 | |
| 1 | Meditate | Psychic | Status | — | 100% | 40 | |
| 33 | Rolling Kick | Fighting | Physical | 60 | 85% | 15 | |
| 38 | Jump Kick | Fighting | Physical | 70 | 95% | 25 | |
| 43 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 48 | Hi Jump Kick | Fighting | Physical | 85 | 90% | 20 | |
| 53 | Mega Kick | Normal | Physical | 120 | 75% | 5 | |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #107 Hitmonchan — Fighting

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 50 | 105 | 79 | 76 | 35 | 110 | **455** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 140 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Choice reward at the Saffron City Fighting Dojo.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Comet Punch | Normal | Physical | 18 | 85% | 15 | |
| 1 | Agility | Psychic | Status | — | 100% | 30 | |
| 33 | Fire Punch | Fire | Physical | 75 | 100% | 15 | |
| 38 | Ice Punch | Ice | Physical | 75 | 100% | 15 | |
| 43 | Thunderpunch | Electric | Physical | 75 | 100% | 15 | |
| 48 | Mega Punch | Normal | Physical | 80 | 85% | 20 | |
| 53 | Counter | Fighting | Physical | * | 100% | 20 | now counters any physical move (was Normal/Fighting only) |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #108 Lickitung — Normal

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 90 | 55 | 75 | 30 | 60 | 75 | **385** |

- **EV yield:** 2 HP
- **Catch rate:** 45 &nbsp; **Base exp:** 127 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 1 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 7 | Stomp | Normal | Physical | 65 | 100% | 20 | |
| 15 | Disable | Normal | Status | — | 55% | 20 | |
| 23 | Defense Curl | Normal | Status | — | 100% | 40 | |
| 31 | Slam | Normal | Physical | 80 | 75% | 20 | |
| 39 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |

**TM/HM compatibility:** HM01 Cut, HM03 Surf, HM04 Strength, TM01 Mega Punch, TM03 Swords Dance, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM26 Earthquake, TM27 Fissure, TM31 Mimic, TM32 Double Team, TM34 Bide, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #109 Koffing — Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 65 | 95 | 35 | 60 | 45 | **340** |

- **EV yield:** 1 Defense
- **Catch rate:** 190 &nbsp; **Base exp:** 114 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Weezing** (Level 35)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Smog | Poison | Special | 20 | 70% | 20 | |
| 32 | Sludge | Poison | Special | 65 | 100% | 20 | |
| 37 | Smokescreen | Normal | Status | — | 100% | 20 | |
| 40 | Selfdestruct | Normal | Physical | 130 | 100% | 5 | |
| 45 | Haze | Ice | Status | — | 100% | 30 | |
| 48 | Explosion | Normal | Physical | 170 | 100% | 5 | |

**TM/HM compatibility:** TM06 Toxic, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM34 Bide, TM36 Selfdestruct, TM38 Fire Blast, TM44 Rest, TM47 Explosion, TM50 Substitute

---

### #110 Weezing — Poison

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 90 | 120 | 60 | 85 | 70 | **490** |

- **EV yield:** 2 Defense
- **Catch rate:** 60 &nbsp; **Base exp:** 173 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Koffing** (Level 35)
- **Locations:**
  - Only by evolving Koffing.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Smog | Poison | Special | 20 | 70% | 20 | |
| 1 | Sludge | Poison | Special | 65 | 100% | 20 | |
| 32 | Sludge | Poison | Special | 65 | 100% | 20 | |
| 39 | Smokescreen | Normal | Status | — | 100% | 20 | |
| 43 | Selfdestruct | Normal | Physical | 130 | 100% | 5 | |
| 49 | Haze | Ice | Status | — | 100% | 30 | |
| 53 | Explosion | Normal | Physical | 170 | 100% | 5 | |

**TM/HM compatibility:** TM06 Toxic, TM15 Hyper Beam, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM34 Bide, TM36 Selfdestruct, TM38 Fire Blast, TM44 Rest, TM47 Explosion, TM50 Substitute

---

### #111 Rhyhorn — Ground/Rock

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 80 | 85 | 95 | 25 | 30 | 30 | **345** |

- **EV yield:** 1 Defense
- **Catch rate:** 120 &nbsp; **Base exp:** 135 &nbsp; **Growth:** Slow
- **Evolution:** evolves into **Rhydon** (Level 42)
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Horn Attack | Normal | Physical | 65 | 100% | 25 | |
| 30 | Stomp | Normal | Physical | 65 | 100% | 20 | |
| 35 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 40 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 45 | Horn Drill | Normal | Physical | * | 30% | 5 | |
| 50 | Leer | Normal | Status | — | 100% | 30 | |
| 55 | Take Down | Normal | Physical | 90 | 85% | 20 | |

**TM/HM compatibility:** HM04 Strength, TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #112 Rhydon — Ground/Rock

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 105 | 130 | 120 | 40 | 45 | 45 | **485** |

- **EV yield:** 2 Attack
- **Catch rate:** 60 &nbsp; **Base exp:** 204 &nbsp; **Growth:** Slow
- **Evolution:** evolves from **Rhyhorn** (Level 42)
- **Locations:**
  - In-game trade: give Golduck, receive “BUFFY” (Cinnabar Lab Trade Room)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Horn Attack | Normal | Physical | 65 | 100% | 25 | |
| 1 | Stomp | Normal | Physical | 65 | 100% | 20 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 1 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 30 | Stomp | Normal | Physical | 65 | 100% | 20 | |
| 35 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 40 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 48 | Horn Drill | Normal | Physical | * | 30% | 5 | |
| 55 | Leer | Normal | Status | — | 100% | 30 | |
| 64 | Take Down | Normal | Physical | 90 | 85% | 20 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM16 Pay Day, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM31 Mimic, TM32 Double Team, TM34 Bide, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #113 Chansey — Normal

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 250 | 5 | 5 | 50 | 35 | 105 | **450** |

- **EV yield:** 2 HP
- **Catch rate:** 30 &nbsp; **Base exp:** 255 &nbsp; **Growth:** Fast
- **Evolution:** none
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Pound | Normal | Physical | 40 | 100% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 12 | Doubleslap | Normal | Physical | 15 | 85% | 10 | |
| 24 | Sing | Sound | Status | — | 55% | 15 | retyped Normal → Sound |
| 30 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 38 | Minimize | Normal | Status | — | 100% | 20 | |
| 44 | Defense Curl | Normal | Status | — | 100% | 40 | |
| 48 | Light Screen | Psychic | Status | — | 100% | 30 | |
| 54 | Double-Edge | Normal | Physical | 100 | 100% | 15 | |

**TM/HM compatibility:** HM04 Strength, HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM22 Solarbeam, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM37 Egg Bomb, TM38 Fire Blast, TM40 Skull Bash, TM41 Softboiled, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #114 Tangela — Grass

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 55 | 115 | 60 | 100 | 40 | **435** |

- **EV yield:** 1 Defense
- **Catch rate:** 45 &nbsp; **Base exp:** 166 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Constrict | Normal | Physical | 10 | 100% | 35 | |
| 24 | Bind | Normal | Physical | 15 | 75% | 20 | |
| 27 | Absorb | Grass | Special | 20 | 100% | 20 | |
| 29 | Vine Whip | Grass | Physical | 35 | 100% | 10 | |
| 32 | Poisonpowder | Poison | Status | — | 75% | 35 | |
| 36 | Stun Spore | Grass | Status | — | 75% | 30 | |
| 39 | Sleep Powder | Grass | Status | — | 75% | 15 | |
| 45 | Slam | Normal | Physical | 80 | 75% | 20 | |
| 48 | Growth | Normal | Status | — | 100% | 40 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM31 Mimic, TM32 Double Team, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #115 Kangaskhan — Normal

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 105 | 95 | 80 | 90 | 40 | 80 | **490** |

- **EV yield:** 2 HP
- **Catch rate:** 45 &nbsp; **Base exp:** 175 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Comet Punch | Normal | Physical | 18 | 85% | 15 | |
| 1 | Rage | Normal | Physical | 20 | 100% | 20 | |
| 26 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 31 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 36 | Mega Punch | Normal | Physical | 80 | 85% | 20 | |
| 41 | Leer | Normal | Status | — | 100% | 30 | |
| 46 | Dizzy Punch | Normal | Physical | 70 | 100% | 10 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM26 Earthquake, TM27 Fissure, TM31 Mimic, TM32 Double Team, TM34 Bide, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM48 Rock Slide, TM50 Substitute

---

### #116 Horsea — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 30 | 40 | 70 | 60 | 70 | 25 | **295** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 225 &nbsp; **Base exp:** 83 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Seadra** (Level 32)
- **Locations:**
  - Route 10 (Super Rod, Lv.10)
  - Route 11 (Super Rod, Lv.5)
  - Route 12 (Super Rod, Lv.20)
  - Route 12 (Super Rod, Lv.25)
  - Route 13 (Super Rod, Lv.15)
  - Route 13 (Super Rod, Lv.20)
  - Vermilion City (Super Rod, Lv.5)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Bubble | Water | Special | 20 | 100% | 30 | |
| 19 | Smokescreen | Normal | Status | — | 100% | 20 | |
| 24 | Leer | Normal | Status | — | 100% | 30 | |
| 30 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 37 | Agility | Psychic | Status | — | 100% | 30 | |
| 45 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #117 Seadra — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 55 | 65 | 95 | 85 | 95 | 45 | **440** |

- **EV yield:** 1 Defense, 1 Special (SpA+SpD)
- **Catch rate:** 75 &nbsp; **Base exp:** 155 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Horsea** (Level 32)
- **Locations:**
  - Route 12 (Super Rod, Lv.25)
  - Route 12 (Super Rod, Lv.35)
  - Route 13 (Super Rod, Lv.20)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Bubble | Water | Special | 20 | 100% | 30 | |
| 1 | Smokescreen | Normal | Status | — | 100% | 20 | |
| 19 | Smokescreen | Normal | Status | — | 100% | 20 | |
| 24 | Leer | Normal | Status | — | 100% | 30 | |
| 30 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 41 | Agility | Psychic | Status | — | 100% | 30 | |
| 52 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #118 Goldeen — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 45 | 67 | 60 | 63 | 35 | 50 | **320** |

- **EV yield:** 1 Attack
- **Catch rate:** 225 &nbsp; **Base exp:** 111 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Seaking** (Level 33)
- **Locations:**
  - Celadon City (Super Rod, Lv.5)
  - Celadon City (Super Rod, Lv.10)
  - Celadon City (Super Rod, Lv.15)
  - Celadon City (Super Rod, Lv.20)
  - Cerulean Cave 1F (Super Rod, Lv.25)
  - Cerulean Cave B1F (Super Rod, Lv.30)
  - Cerulean City (Super Rod, Lv.25)
  - Cerulean City (Super Rod, Lv.30)
  - Route 24 (Super Rod, Lv.20)
  - Route 24 (Super Rod, Lv.25)
  - Route 24 (Super Rod, Lv.30)
  - Route 4 (Super Rod, Lv.20)
  - Route 4 (Super Rod, Lv.25)
  - Route 4 (Super Rod, Lv.30)
  - Route 6 (Super Rod, Lv.5)
  - Route 6 (Super Rod, Lv.10)
  - Route 6 (Super Rod, Lv.15)
  - Route 6 (Super Rod, Lv.20)
  - any water (Good Rod, Lv.10)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Peck | Flying | Physical | 35 | 100% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 19 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 24 | Horn Attack | Normal | Physical | 65 | 100% | 25 | |
| 30 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 37 | Waterfall | Water | Physical | 80 | 100% | 15 | |
| 45 | Horn Drill | Normal | Physical | * | 30% | 5 | |
| 54 | Agility | Psychic | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM07 Horn Drill, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #119 Seaking — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 80 | 92 | 65 | 68 | 65 | 80 | **450** |

- **EV yield:** 2 Attack
- **Catch rate:** 60 &nbsp; **Base exp:** 170 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Goldeen** (Level 33)
- **Locations:**
  - Cerulean Cave 1F (Super Rod, Lv.35)
  - Cerulean Cave 1F (Super Rod, Lv.45)
  - Cerulean Cave 1F (Super Rod, Lv.55)
  - Cerulean Cave B1F (Super Rod, Lv.40)
  - Cerulean Cave B1F (Super Rod, Lv.50)
  - Cerulean Cave B1F (Super Rod, Lv.60)
  - Cerulean City (Super Rod, Lv.30)
  - Cerulean City (Super Rod, Lv.40)
  - Route 24 (Super Rod, Lv.30)
  - Route 4 (Super Rod, Lv.30)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Peck | Flying | Physical | 35 | 100% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 1 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 19 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 24 | Horn Attack | Normal | Physical | 65 | 100% | 25 | |
| 30 | Fury Attack | Normal | Physical | 15 | 85% | 20 | |
| 39 | Waterfall | Water | Physical | 80 | 100% | 15 | |
| 48 | Horn Drill | Normal | Physical | * | 30% | 5 | |
| 54 | Agility | Psychic | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM07 Horn Drill, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #120 Staryu — Water/Light *(was pure Water)*

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 30 | 45 | 55 | 85 | 70 | 55 | **340** |

- **EV yield:** 1 Speed
- **Catch rate:** 225 &nbsp; **Base exp:** 106 &nbsp; **Growth:** Slow
- **Evolution:** evolves into **Starmie** (Water Stone)
- **Locations:**
  - Cinnabar Island (Super Rod, Lv.10)
  - Cinnabar Island (Super Rod, Lv.15)
  - Pallet Town (Super Rod, Lv.5)
  - Pallet Town (Super Rod, Lv.10)
  - Route 19 (Super Rod, Lv.20)
  - Route 20 (Super Rod, Lv.30)
  - Route 21 (Super Rod, Lv.20)
  - Seafoam Islands B3F (Super Rod, Lv.20)
  - Seafoam Islands B3F (Super Rod, Lv.40)
  - Seafoam Islands B4F (Super Rod, Lv.20)
  - Seafoam Islands B4F (Super Rod, Lv.40)
  - Vermilion Dock (Super Rod, Lv.15)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 17 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 22 | Harden | Normal | Status | — | 100% | 30 | |
| 27 | Recover | Normal | Status | — | 100% | 20 | |
| 32 | Swift | Light | Special | 60 | 100% | 20 | retyped Normal → Light |
| 37 | Minimize | Normal | Status | — | 100% | 20 | |
| 42 | Light Screen | Psychic | Status | — | 100% | 30 | |
| 47 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, HM05 Flash, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #121 Starmie — Water/Light *(was Water/Psychic)*

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 75 | 85 | 115 | 100 | 85 | **520** |

- **EV yield:** 2 Speed
- **Catch rate:** 60 &nbsp; **Base exp:** 207 &nbsp; **Growth:** Slow
- **Evolution:** evolves from **Staryu** (Water Stone)
- **Locations:**
  - Only by evolving Staryu.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 1 | Harden | Normal | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM03 Surf, HM05 Flash, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #122 Mr. Mime — Psychic/Fairy *(was pure Psychic)*

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 40 | 45 | 65 | 90 | 100 | 120 | **460** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 136 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - In-game trade: give Clefairy, receive “MILES” (Route 2 Trade House)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 1 | Barrier | Psychic | Status | — | 100% | 30 | |
| 15 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 23 | Light Screen | Psychic | Status | — | 100% | 30 | |
| 31 | Doubleslap | Normal | Physical | 15 | 85% | 10 | |
| 39 | Meditate | Psychic | Status | — | 100% | 40 | |
| 47 | Substitute | Normal | Status | — | 100% | 10 | |

**TM/HM compatibility:** HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM22 Solarbeam, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM50 Substitute

---

### #123 Scyther — Bug/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 70 | 110 | 80 | 105 | 55 | 80 | **500** |

- **EV yield:** 1 Attack
- **Catch rate:** 45 &nbsp; **Base exp:** 187 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Celadon Game Corner prize.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 17 | Leer | Normal | Status | — | 100% | 30 | |
| 20 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 24 | Double Team | Normal | Status | — | 100% | 15 | |
| 29 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 35 | Swords Dance | Normal | Status | — | 100% | 30 | |
| 42 | Agility | Psychic | Status | — | 100% | 30 | |
| 50 | Wing Attack | Flying | Physical | 35 | 100% | 35 | |

**TM/HM compatibility:** HM01 Cut, TM03 Swords Dance, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #124 Jynx — Ice/Psychic

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 50 | 35 | 95 | 115 | 95 | **455** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 137 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Pound | Normal | Physical | 40 | 100% | 35 | |
| 1 | Lovely Kiss | Normal | Status | — | 75% | 10 | |
| 18 | Lick | Ghost | Physical | 20 | 100% | 30 | |
| 23 | Doubleslap | Normal | Physical | 15 | 85% | 10 | |
| 31 | Ice Punch | Ice | Physical | 75 | 100% | 15 | |
| 39 | Body Slam | Normal | Physical | 85 | 100% | 15 | |
| 47 | Thrash | Normal | Physical | 90 | 100% | 20 | |
| 58 | Blizzard | Ice | Special | 120 | 90% | 5 | |

**TM/HM compatibility:** TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM40 Skull Bash, TM44 Rest, TM46 Psywave, TM50 Substitute

---

### #125 Electabuzz — Electric

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 83 | 57 | 105 | 95 | 85 | **490** |

- **EV yield:** 2 Speed
- **Catch rate:** 45 &nbsp; **Base exp:** 156 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 34 | Thundershock | Electric | Special | 40 | 100% | 30 | |
| 37 | Screech | Sound | Status | — | 85% | 40 | retyped Normal → Sound |
| 42 | Thunderpunch | Electric | Physical | 75 | 100% | 15 | |
| 49 | Light Screen | Psychic | Status | — | 100% | 30 | |
| 54 | Thunder | Electric | Special | 120 | 70% | 10 | |

**TM/HM compatibility:** HM04 Strength, HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM50 Substitute

---

### #126 Magmar — Fire

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 95 | 57 | 93 | 100 | 85 | **495** |

- **EV yield:** 2 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 167 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Ember | Fire | Special | 40 | 100% | 25 | |
| 36 | Leer | Normal | Status | — | 100% | 30 | |
| 39 | Confuse Ray | Ghost | Status | — | 100% | 10 | |
| 43 | Fire Punch | Fire | Physical | 75 | 100% | 15 | |
| 48 | Smokescreen | Normal | Status | — | 100% | 20 | |
| 52 | Smog | Poison | Special | 20 | 70% | 20 | |
| 55 | Flamethrower | Fire | Special | 95 | 100% | 15 | |

**TM/HM compatibility:** HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM34 Bide, TM35 Metronome, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM46 Psywave, TM50 Substitute

---

### #127 Pinsir — Bug

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 125 | 100 | 85 | 55 | 70 | **500** |

- **EV yield:** 2 Attack
- **Catch rate:** 45 &nbsp; **Base exp:** 200 &nbsp; **Growth:** Slow
- **Evolution:** none
- **Locations:**
  - Celadon Game Corner prize.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Vicegrip | Normal | Physical | 55 | 100% | 30 | |
| 21 | Bind | Normal | Physical | 15 | 75% | 20 | |
| 25 | Seismic Toss | Fighting | Physical | * | 100% | 20 | |
| 30 | Guillotine | Normal | Physical | * | 30% | 5 | |
| 36 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 43 | Harden | Normal | Status | — | 100% | 30 | |
| 49 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 54 | Swords Dance | Normal | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM01 Cut, HM04 Strength, TM03 Swords Dance, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM17 Submission, TM19 Seismic Toss, TM20 Rage, TM31 Mimic, TM32 Double Team, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #128 Tauros — Normal

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 75 | 100 | 95 | 110 | 40 | 70 | **490** |

- **EV yield:** 1 Attack, 1 Speed
- **Catch rate:** 45 &nbsp; **Base exp:** 211 &nbsp; **Growth:** Slow
- **Evolution:** none
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 21 | Stomp | Normal | Physical | 65 | 100% | 20 | |
| 28 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 35 | Leer | Normal | Status | — | 100% | 30 | |
| 44 | Rage | Normal | Physical | 20 | 100% | 20 | |
| 51 | Take Down | Normal | Physical | 90 | 85% | 20 | |

**TM/HM compatibility:** HM04 Strength, TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM26 Earthquake, TM27 Fissure, TM31 Mimic, TM32 Double Team, TM34 Bide, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #129 Magikarp — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 20 | 10 | 55 | 80 | 15 | 20 | **200** |

- **EV yield:** 1 Speed
- **Catch rate:** 255 &nbsp; **Base exp:** 20 &nbsp; **Growth:** Slow
- **Evolution:** evolves into **Gyarados** (Level 20)
- **Locations:**
  - Fuchsia City (Super Rod, Lv.5)
  - Fuchsia City (Super Rod, Lv.10)
  - Fuchsia City (Super Rod, Lv.15)
  - Safari Zone Center (Super Rod, Lv.5)
  - Safari Zone Center (Super Rod, Lv.10)
  - Safari Zone East (Super Rod, Lv.5)
  - Safari Zone East (Super Rod, Lv.10)
  - Safari Zone East (Super Rod, Lv.15)
  - Safari Zone North (Super Rod, Lv.5)
  - Safari Zone North (Super Rod, Lv.10)
  - Safari Zone North (Super Rod, Lv.15)
  - Safari Zone West (Super Rod, Lv.5)
  - Safari Zone West (Super Rod, Lv.10)
  - Safari Zone West (Super Rod, Lv.15)
  - any water (Old Rod, Lv.5)
  - Sold by the salesman at the Route 4 Pokémon Center.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Splash | Normal | Status | — | 100% | 40 | |
| 15 | Tackle | Normal | Physical | 35 | 95% | 35 | |

**TM/HM compatibility:** none

---

### #130 Gyarados — Water/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 95 | 125 | 79 | 81 | 60 | 100 | **540** |

- **EV yield:** 2 Attack
- **Catch rate:** 45 &nbsp; **Base exp:** 214 &nbsp; **Growth:** Slow
- **Evolution:** evolves from **Magikarp** (Level 20)
- **Locations:**
  - Fuchsia City (Super Rod, Lv.15)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 20 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 25 | Dragon Rage | Dragon | Special | * | 100% | 10 | |
| 32 | Leer | Normal | Status | — | 100% | 30 | |
| 41 | Hydro Pump | Water | Special | 120 | 80% | 5 | |
| 52 | Hyper Beam | Normal | Special | 150 | 90% | 5 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM23 Dragon Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #131 Lapras — Water/Ice

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 130 | 85 | 80 | 60 | 85 | 95 | **535** |

- **EV yield:** 2 HP
- **Catch rate:** 45 &nbsp; **Base exp:** 219 &nbsp; **Growth:** Slow
- **Evolution:** none
- **Locations:**
  - Gift on Silph Co. 7F.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 1 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 16 | Sing | Sound | Status | — | 55% | 15 | retyped Normal → Sound |
| 20 | Mist | Ice | Status | — | 100% | 30 | |
| 25 | Body Slam | Normal | Physical | 85 | 100% | 15 | |
| 31 | Confuse Ray | Ghost | Status | — | 100% | 10 | |
| 38 | Ice Beam | Ice | Special | 95 | 100% | 10 | |
| 46 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM22 Solarbeam, TM23 Dragon Rage, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM46 Psywave, TM50 Substitute

---

### #132 Ditto — Normal

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 48 | 48 | 48 | 48 | 48 | 48 | **288** |

- **EV yield:** 1 HP
- **Catch rate:** 35 &nbsp; **Base exp:** 61 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Not obtainable in this version — trade from another game.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Transform | Normal | Status | — | 100% | 10 | |

**TM/HM compatibility:** none

---

### #133 Eevee — Normal

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 55 | 55 | 50 | 55 | 45 | 65 | **325** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 92 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Flareon** (Fire Stone); evolves into **Jolteon** (Thunder Stone); evolves into **Vaporeon** (Water Stone)
- **Locations:**
  - Gift on the Celadon Mansion rooftop (back stairs).

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 8 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 16 | Growl | Sound | Status | — | 100% | 40 | retyped Normal → Sound |
| 23 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 30 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 36 | Focus Energy | Normal | Status | — | 100% | 30 | |
| 42 | Take Down | Normal | Physical | 90 | 85% | 20 | |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #134 Vaporeon — Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 130 | 65 | 60 | 65 | 110 | 95 | **525** |

- **EV yield:** 2 HP
- **Catch rate:** 45 &nbsp; **Base exp:** 196 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Eevee** (Water Stone)
- **Locations:**
  - Only by evolving Eevee.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 1 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 1 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 8 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 16 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 23 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 30 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 36 | Aurora Beam | Light | Special | 65 | 100% | 20 | retyped Ice → Light |
| 42 | Haze | Ice | Status | — | 100% | 30 | |
| 42 | Mist | Ice | Status | — | 100% | 30 | |
| 47 | Acid Armor | Poison | Status | — | 100% | 40 | |
| 52 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #135 Jolteon — Electric

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 65 | 60 | 130 | 110 | 95 | **525** |

- **EV yield:** 2 Speed
- **Catch rate:** 45 &nbsp; **Base exp:** 197 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Eevee** (Thunder Stone)
- **Locations:**
  - Only by evolving Eevee.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 1 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 1 | Thundershock | Electric | Special | 40 | 100% | 30 | |
| 8 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 16 | Thundershock | Electric | Special | 40 | 100% | 30 | |
| 23 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 30 | Double Kick | Fighting | Physical | 30 | 100% | 30 | |
| 36 | Pin Missile | Bug | Physical | 14 | 85% | 20 | |
| 42 | Thunder Wave | Electric | Status | — | 100% | 20 | |
| 47 | Agility | Psychic | Status | — | 100% | 30 | |
| 52 | Thunder | Electric | Special | 120 | 70% | 10 | |

**TM/HM compatibility:** HM05 Flash, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM50 Substitute

---

### #136 Flareon — Fire

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 130 | 60 | 65 | 95 | 110 | **525** |

- **EV yield:** 2 Attack
- **Catch rate:** 45 &nbsp; **Base exp:** 198 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Eevee** (Fire Stone)
- **Locations:**
  - Only by evolving Eevee.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Tail Whip | Normal | Status | — | 100% | 30 | |
| 1 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 1 | Ember | Fire | Special | 40 | 100% | 25 | |
| 8 | Sand-Attack | Ground | Status | — | 100% | 15 | retyped Normal → Ground |
| 16 | Ember | Fire | Special | 40 | 100% | 25 | |
| 23 | Quick Attack | Normal | Physical | 40 | 100% | 30 | |
| 30 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 36 | Fire Spin | Fire | Special | 15 | 70% | 15 | |
| 42 | Smog | Poison | Special | 20 | 70% | 20 | |
| 47 | Leer | Normal | Status | — | 100% | 30 | |
| 52 | Flamethrower | Fire | Special | 95 | 100% | 15 | |

**TM/HM compatibility:** TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #137 Porygon — Normal

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 65 | 60 | 70 | 40 | 85 | 75 | **395** |

- **EV yield:** 1 Special (SpA+SpD)
- **Catch rate:** 45 &nbsp; **Base exp:** 130 &nbsp; **Growth:** Medium Fast
- **Evolution:** none
- **Locations:**
  - Celadon Game Corner prize.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Tackle | Normal | Physical | 35 | 95% | 35 | |
| 1 | Sharpen | Normal | Status | — | 100% | 30 | |
| 1 | Conversion | Normal | Status | — | 100% | 30 | |
| 23 | Psybeam | Psychic | Special | 65 | 100% | 20 | |
| 28 | Recover | Normal | Status | — | 100% | 20 | |
| 35 | Agility | Psychic | Status | — | 100% | 30 | |
| 42 | Tri Attack | Normal | Special | 80 | 100% | 10 | |

**TM/HM compatibility:** HM05 Flash, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #138 Omanyte — Rock/Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 35 | 40 | 100 | 35 | 90 | 55 | **355** |

- **EV yield:** 1 Defense
- **Catch rate:** 45 &nbsp; **Base exp:** 120 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Omastar** (Level 40)
- **Locations:**
  - Revived from the Helix Fossil (Mt. Moon) at the Cinnabar Lab.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 1 | Withdraw | Water | Status | — | 100% | 40 | |
| 34 | Horn Attack | Normal | Physical | 65 | 100% | 25 | |
| 39 | Leer | Normal | Status | — | 100% | 30 | |
| 46 | Spike Cannon | Normal | Physical | 20 | 100% | 15 | |
| 53 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #139 Omastar — Rock/Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 70 | 60 | 125 | 55 | 115 | 70 | **495** |

- **EV yield:** 2 Defense
- **Catch rate:** 45 &nbsp; **Base exp:** 199 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Omanyte** (Level 40)
- **Locations:**
  - Only by evolving Omanyte.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Water Gun | Water | Special | 40 | 100% | 25 | |
| 1 | Withdraw | Water | Status | — | 100% | 40 | |
| 1 | Horn Attack | Normal | Physical | 65 | 100% | 25 | |
| 34 | Horn Attack | Normal | Physical | 65 | 100% | 25 | |
| 39 | Leer | Normal | Status | — | 100% | 30 | |
| 44 | Spike Cannon | Normal | Physical | 20 | 100% | 15 | |
| 49 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM17 Submission, TM19 Seismic Toss, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #140 Kabuto — Rock/Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 30 | 80 | 90 | 55 | 55 | 45 | **355** |

- **EV yield:** 1 Defense
- **Catch rate:** 45 &nbsp; **Base exp:** 119 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves into **Kabutops** (Level 40)
- **Locations:**
  - Revived from the Dome Fossil (Mt. Moon) at the Cinnabar Lab.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Harden | Normal | Status | — | 100% | 30 | |
| 34 | Absorb | Grass | Special | 20 | 100% | 20 | |
| 39 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 44 | Leer | Normal | Status | — | 100% | 30 | |
| 49 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM44 Rest, TM50 Substitute

---

### #141 Kabutops — Rock/Water

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 60 | 115 | 105 | 80 | 65 | 70 | **495** |

- **EV yield:** 2 Attack
- **Catch rate:** 45 &nbsp; **Base exp:** 201 &nbsp; **Growth:** Medium Fast
- **Evolution:** evolves from **Kabuto** (Level 40)
- **Locations:**
  - Only by evolving Kabuto.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Scratch | Normal | Physical | 40 | 100% | 35 | |
| 1 | Harden | Normal | Status | — | 100% | 30 | |
| 1 | Absorb | Grass | Special | 20 | 100% | 20 | |
| 34 | Absorb | Grass | Special | 20 | 100% | 20 | |
| 39 | Slash | Normal | Physical | 70 | 100% | 20 | |
| 46 | Leer | Normal | Status | — | 100% | 30 | |
| 53 | Hydro Pump | Water | Special | 120 | 80% | 5 | |

**TM/HM compatibility:** HM01 Cut, HM03 Surf, TM02 Razor Wind, TM03 Swords Dance, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM17 Submission, TM19 Seismic Toss, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM40 Skull Bash, TM44 Rest, TM50 Substitute

---

### #142 Aerodactyl — Rock/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 80 | 105 | 65 | 130 | 60 | 75 | **515** |

- **EV yield:** 2 Speed
- **Catch rate:** 45 &nbsp; **Base exp:** 202 &nbsp; **Growth:** Slow
- **Evolution:** none
- **Locations:**
  - Revived from the Old Amber (Pewter Museum) at the Cinnabar Lab.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Wing Attack | Flying | Physical | 35 | 100% | 35 | |
| 1 | Agility | Psychic | Status | — | 100% | 30 | |
| 33 | Supersonic | Sound | Status | — | 55% | 20 | retyped Normal → Sound |
| 38 | Bite | Dark | Physical | 60 | 100% | 25 | retyped Normal → Dark |
| 45 | Take Down | Normal | Physical | 90 | 85% | 20 | |
| 54 | Hyper Beam | Normal | Special | 150 | 90% | 5 | |

**TM/HM compatibility:** HM02 Fly, TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM23 Dragon Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM43 Sky Attack, TM44 Rest, TM50 Substitute

---

### #143 Snorlax — Normal

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 160 | 110 | 65 | 30 | 65 | 110 | **540** |

- **EV yield:** 2 HP
- **Catch rate:** 25 &nbsp; **Base exp:** 154 &nbsp; **Growth:** Slow
- **Evolution:** none
- **Locations:**
  - Static encounter on Route 12 and Route 16 (requires the Poké Flute).

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Headbutt | Normal | Physical | 70 | 100% | 15 | |
| 1 | Amnesia | Psychic | Status | — | 100% | 20 | now raises Sp. Def (was Special) |
| 1 | Rest | Psychic | Status | — | 100% | 10 | |
| 35 | Body Slam | Normal | Physical | 85 | 100% | 15 | |
| 41 | Harden | Normal | Status | — | 100% | 30 | |
| 48 | Double-Edge | Normal | Physical | 100 | 100% | 15 | |
| 56 | Hyper Beam | Normal | Special | 150 | 90% | 5 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM16 Pay Day, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM22 Solarbeam, TM24 Thunderbolt, TM25 Thunder, TM26 Earthquake, TM27 Fissure, TM29 Psychic, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM36 Selfdestruct, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM46 Psywave, TM48 Rock Slide, TM50 Substitute

---

### #144 Articuno — Ice/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 90 | 85 | 100 | 85 | 95 | 125 | **580** |

- **EV yield:** 3 Special (SpA+SpD)
- **Catch rate:** 3 &nbsp; **Base exp:** 215 &nbsp; **Growth:** Slow
- **Evolution:** none
- **Locations:**
  - Static encounter in Seafoam Islands B4F.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Peck | Flying | Physical | 35 | 100% | 35 | |
| 1 | Ice Beam | Ice | Special | 95 | 100% | 10 | |
| 51 | Blizzard | Ice | Special | 120 | 90% | 5 | |
| 55 | Agility | Psychic | Status | — | 100% | 30 | |
| 60 | Mist | Ice | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM02 Fly, TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM43 Sky Attack, TM44 Rest, TM50 Substitute

---

### #145 Zapdos — Electric/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 90 | 90 | 85 | 100 | 125 | 90 | **580** |

- **EV yield:** 3 Special (SpA+SpD)
- **Catch rate:** 3 &nbsp; **Base exp:** 216 &nbsp; **Growth:** Slow
- **Evolution:** none
- **Locations:**
  - Static encounter at the Power Plant.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Thundershock | Electric | Special | 40 | 100% | 30 | |
| 1 | Drill Peck | Flying | Physical | 80 | 100% | 20 | |
| 51 | Thunder | Electric | Special | 120 | 70% | 10 | |
| 55 | Agility | Psychic | Status | — | 100% | 30 | |
| 60 | Light Screen | Psychic | Status | — | 100% | 30 | |

**TM/HM compatibility:** HM02 Fly, HM05 Flash, TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM39 Swift, TM43 Sky Attack, TM44 Rest, TM45 Thunder Wave, TM50 Substitute

---

### #146 Moltres — Fire/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 90 | 100 | 90 | 90 | 125 | 85 | **580** |

- **EV yield:** 3 Special (SpA+SpD)
- **Catch rate:** 3 &nbsp; **Base exp:** 217 &nbsp; **Growth:** Slow
- **Evolution:** none
- **Locations:**
  - Static encounter on Victory Road 2F.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Peck | Flying | Physical | 35 | 100% | 35 | |
| 1 | Fire Spin | Fire | Special | 15 | 70% | 15 | |
| 51 | Leer | Normal | Status | — | 100% | 30 | |
| 55 | Agility | Psychic | Status | — | 100% | 30 | |
| 60 | Sky Attack | Flying | Physical | 140 | 90% | 5 | |

**TM/HM compatibility:** HM02 Fly, TM02 Razor Wind, TM04 Whirlwind, TM06 Toxic, TM09 Take Down, TM10 Double-Edge, TM15 Hyper Beam, TM20 Rage, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM43 Sky Attack, TM44 Rest, TM50 Substitute

---

### #147 Dratini — Dragon

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 41 | 64 | 45 | 50 | 50 | 50 | **300** |

- **EV yield:** 1 Attack
- **Catch rate:** 45 &nbsp; **Base exp:** 67 &nbsp; **Growth:** Slow
- **Evolution:** evolves into **Dragonair** (Level 30)
- **Locations:**
  - Safari Zone Center (Super Rod, Lv.10)
  - Safari Zone East (Super Rod, Lv.15)
  - Safari Zone North (Super Rod, Lv.15)
  - Safari Zone West (Super Rod, Lv.15)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 10 | Thunder Wave | Electric | Status | — | 100% | 20 | |
| 20 | Agility | Psychic | Status | — | 100% | 30 | |
| 30 | Slam | Normal | Physical | 80 | 75% | 20 | |
| 40 | Dragon Rage | Dragon | Special | * | 100% | 10 | |
| 50 | Hyper Beam | Normal | Special | 150 | 90% | 5 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM23 Dragon Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM50 Substitute

---

### #148 Dragonair — Dragon

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 61 | 84 | 65 | 70 | 70 | 70 | **420** |

- **EV yield:** 2 Attack
- **Catch rate:** 27 &nbsp; **Base exp:** 144 &nbsp; **Growth:** Slow
- **Evolution:** evolves into **Dragonite** (Level 55); evolves from **Dratini** (Level 30)
- **Locations:**
  - Safari Zone Center (Super Rod, Lv.15)

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 1 | Thunder Wave | Electric | Status | — | 100% | 20 | |
| 10 | Thunder Wave | Electric | Status | — | 100% | 20 | |
| 20 | Agility | Psychic | Status | — | 100% | 30 | |
| 35 | Slam | Normal | Physical | 80 | 75% | 20 | |
| 45 | Dragon Rage | Dragon | Special | * | 100% | 10 | |
| 55 | Hyper Beam | Normal | Special | 150 | 90% | 5 | |

**TM/HM compatibility:** HM03 Surf, TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM20 Rage, TM23 Dragon Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM50 Substitute

---

### #149 Dragonite — Dragon/Flying

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 91 | 134 | 95 | 80 | 100 | 100 | **600** |

- **EV yield:** 3 Attack
- **Catch rate:** 9 &nbsp; **Base exp:** 218 &nbsp; **Growth:** Slow
- **Evolution:** evolves from **Dragonair** (Level 55)
- **Locations:**
  - Only by evolving Dragonair.

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Wrap | Normal | Physical | 15 | 85% | 20 | |
| 1 | Leer | Normal | Status | — | 100% | 30 | |
| 1 | Thunder Wave | Electric | Status | — | 100% | 20 | |
| 1 | Agility | Psychic | Status | — | 100% | 30 | |
| 10 | Thunder Wave | Electric | Status | — | 100% | 20 | |
| 20 | Agility | Psychic | Status | — | 100% | 30 | |
| 35 | Slam | Normal | Physical | 80 | 75% | 20 | |
| 45 | Dragon Rage | Dragon | Special | * | 100% | 10 | |
| 60 | Hyper Beam | Normal | Special | 150 | 90% | 5 | |

**TM/HM compatibility:** HM03 Surf, HM04 Strength, TM02 Razor Wind, TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM20 Rage, TM23 Dragon Rage, TM24 Thunderbolt, TM25 Thunder, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM50 Substitute

---

### #150 Mewtwo — Psychic

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 106 | 110 | 90 | 130 | 154 | 90 | **680** |

- **EV yield:** 3 Special (SpA+SpD)
- **Catch rate:** 3 &nbsp; **Base exp:** 220 &nbsp; **Growth:** Slow
- **Evolution:** none
- **Locations:**
  - Static encounter in Cerulean Cave (after entering the Hall of Fame).

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Confusion | Psychic | Special | 50 | 100% | 25 | |
| 1 | Disable | Normal | Status | — | 55% | 20 | |
| 1 | Swift | Light | Special | 60 | 100% | 20 | retyped Normal → Light |
| 1 | Psychic | Psychic | Special | 90 | 100% | 10 | side effect now lowers Sp. Def (was Special) |
| 63 | Barrier | Psychic | Status | — | 100% | 30 | |
| 66 | Psychic | Psychic | Special | 90 | 100% | 10 | side effect now lowers Sp. Def (was Special) |
| 70 | Recover | Normal | Status | — | 100% | 20 | |
| 75 | Mist | Ice | Status | — | 100% | 30 | |
| 81 | Amnesia | Psychic | Status | — | 100% | 20 | now raises Sp. Def (was Special) |

**TM/HM compatibility:** HM04 Strength, HM05 Flash, TM01 Mega Punch, TM05 Mega Kick, TM06 Toxic, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM22 Solarbeam, TM24 Thunderbolt, TM25 Thunder, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM36 Selfdestruct, TM38 Fire Blast, TM40 Skull Bash, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM49 Tri Attack, TM50 Substitute

---

### #151 Mew — Psychic

| HP | Attack | Defense | Speed | Sp. Atk | Sp. Def | Total |
|----|--------|---------|-------|---------|---------|-------|
| 100 | 100 | 100 | 100 | 100 | 100 | **600** |

- **EV yield:** 3 HP
- **Catch rate:** 45 &nbsp; **Base exp:** 64 &nbsp; **Growth:** Medium Slow
- **Evolution:** none
- **Locations:**
  - Not obtainable in normal gameplay (event distribution only).

**Level-up moves**

| Lv | Move | Type | Category | Power | Acc | PP | Notes |
|----|------|------|----------|-------|-----|----|-------|
| 1 | Pound | Normal | Physical | 40 | 100% | 35 | |
| 10 | Transform | Normal | Status | — | 100% | 10 | |
| 20 | Mega Punch | Normal | Physical | 80 | 85% | 20 | |
| 30 | Metronome | Normal | Status | — | 100% | 10 | |
| 40 | Psychic | Psychic | Special | 90 | 100% | 10 | side effect now lowers Sp. Def (was Special) |

**TM/HM compatibility:** HM01 Cut, HM02 Fly, HM03 Surf, HM04 Strength, HM05 Flash, TM01 Mega Punch, TM02 Razor Wind, TM03 Swords Dance, TM04 Whirlwind, TM05 Mega Kick, TM06 Toxic, TM07 Horn Drill, TM08 Body Slam, TM09 Take Down, TM10 Double-Edge, TM11 Bubblebeam, TM12 Water Gun, TM13 Ice Beam, TM14 Blizzard, TM15 Hyper Beam, TM16 Pay Day, TM17 Submission, TM18 Counter, TM19 Seismic Toss, TM20 Rage, TM21 Mega Drain, TM22 Solarbeam, TM23 Dragon Rage, TM24 Thunderbolt, TM25 Thunder, TM26 Earthquake, TM27 Fissure, TM28 Dig, TM29 Psychic, TM30 Teleport, TM31 Mimic, TM32 Double Team, TM33 Reflect, TM34 Bide, TM35 Metronome, TM36 Selfdestruct, TM37 Egg Bomb, TM38 Fire Blast, TM39 Swift, TM40 Skull Bash, TM41 Softboiled, TM42 Dream Eater, TM43 Sky Attack, TM44 Rest, TM45 Thunder Wave, TM46 Psywave, TM47 Explosion, TM48 Rock Slide, TM49 Tri Attack, TM50 Substitute

