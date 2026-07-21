# Move Reference

Every move in Pokémon Chromatic Yellow (225 total), generated from `data/moves/moves.asm`, `data/moves/categories.asm`, and `constants/move_effect_constants.asm`. Category and type reflect this fork's rebuilt move list (see [move_overhaul_plan.md](move_overhaul_plan.md)); secondary-effect chances are hardcoded from the roll logic in `engine/battle/effects.asm`, since they aren't stored in the move data table itself. See [pokemon_reference.md](pokemon_reference.md) for the full type chart and per-Pokémon learnsets.

Power `—` = status move (no direct damage); `*` = special-damage move whose power varies or isn't a flat number. High-critical-hit moves: Karate Chop, Stone Edge, Razor Leaf, Crabhammer, Slash, Night Slash.

| # | Move | Type | Category | Power | Acc | PP | TM/HM | Effect | Notes |
|---|------|------|----------|-------|-----|----|----|--------|-------|
| 1 | Spiral Beam | Normal | Special | 90 | 100% | 15 |  |  |  |
| 2 | Karate Chop | Fighting | Physical | 50 | 100% | 30 |  |  | retyped Normal → Fighting; high crit ratio |
| 3 | Vacuum Wave | Fighting | Special | 40 | 100% | 35 |  |  |  |
| 4 | Aura Sphere | Fighting | Special | 90 | 100% | 15 | TM17 |  |  |
| 5 | Force Palm | Fighting | Special | 60 | 100% | 25 |  | 10% chance to paralyze the target. |  |
| 6 | Pay Day | Normal | Physical | 40 | 100% | 20 | TM16 | Scatters coins (trainer battles only). |  |
| 7 | Fire Punch | Fire | Physical | 90 | 100% | 15 |  | 10% chance to burn the target. |  |
| 8 | Ice Punch | Ice | Physical | 90 | 100% | 15 |  | 10% chance to freeze the target. |  |
| 9 | Thunderpunch | Electric | Physical | 90 | 100% | 15 |  | 10% chance to paralyze the target. |  |
| 10 | Focus Blast | Fighting | Special | 120 | 85% | 5 |  | 33% chance to lower the target's Sp. Atk/Sp. Def by 1 stage. |  |
| 11 | Air Cutter | Flying | Special | 60 | 100% | 25 |  |  |  |
| 12 | Air Slash | Flying | Special | 90 | 100% | 15 | TM02 | 10% chance to flinch the target. |  |
| 13 | Razor Wind | Normal | Special | 40 | 100% | 30 |  |  |  |
| 14 | Swords Dance | Normal | Status | — | 100% | 30 | TM03 | Raises the user's Attack by 2 stages. |  |
| 15 | Cut | Normal | Physical | 50 | 100% | 30 | HM01 |  |  |
| 16 | Gust | Flying | Special | 40 | 100% | 35 |  |  | retyped Normal → Flying |
| 17 | Wing Attack | Flying | Physical | 60 | 100% | 25 |  |  |  |
| 18 | Whirlwind | Normal | Status | — | 85% | 20 |  | Forces the target to switch out, or lets the user swap out/flee. |  |
| 19 | Fly | Flying | Physical | 120 | 85% | 10 | HM02 |  |  |
| 20 | Hurricane | Flying | Special | 120 | 85% | 5 |  | 10% chance to confuse the target. |  |
| 21 | Cross Poison | Poison | Physical | 65 | 100% | 25 |  | 20% chance to poison the target. |  |
| 22 | Vine Whip | Grass | Physical | 45 | 100% | 30 |  |  |  |
| 23 | Poison Jab | Poison | Physical | 90 | 100% | 15 |  |  |  |
| 24 | Gunk Shot | Poison | Physical | 120 | 85% | 5 |  | 40% chance to poison the target. |  |
| 25 | Sludge Bomb | Poison | Special | 90 | 100% | 15 | TM01 | 20% chance to poison the target. |  |
| 26 | Sludge Wave | Poison | Special | 120 | 85% | 5 |  | 20% chance to poison the target. |  |
| 27 | Bulldoze | Ground | Physical | 60 | 100% | 25 |  | 33% chance to lower the target's Speed by 1 stage. |  |
| 28 | Sand-Attack | Ground | Status | — | 100% | 15 |  | Lowers the target's accuracy by 1 stage. | retyped Normal → Ground |
| 29 | Headbutt | Normal | Physical | 65 | 100% | 25 |  | 30% chance to flinch the target. |  |
| 30 | Mud-Slap | Ground | Special | 40 | 100% | 35 |  |  |  |
| 31 | Mud Bomb | Ground | Special | 65 | 100% | 20 |  | 33% chance to lower the target's Defense by 1 stage. |  |
| 32 | Earth Power | Ground | Special | 90 | 100% | 15 |  | 33% chance to lower the target's Sp. Atk/Sp. Def by 1 stage. |  |
| 33 | Tackle | Normal | Physical | 40 | 100% | 35 |  |  |  |
| 34 | Stone Edge | Rock | Physical | 90 | 100% | 15 | TM07 |  | high crit ratio |
| 35 | Head Smash | Rock | Physical | 120 | 85% | 5 |  | User takes recoil damage equal to a portion of the damage dealt. |  |
| 36 | Rock Blast | Rock | Special | 45 | 100% | 30 |  |  |  |
| 37 | Ancientpower | Rock | Special | 60 | 100% | 25 |  |  |  |
| 38 | Double-Edge | Normal | Physical | 120 | 85% | 10 | TM10 | User takes recoil damage equal to a portion of the damage dealt. |  |
| 39 | Tail Whip | Normal | Status | — | 100% | 30 |  | Lowers the target's Defense by 1 stage. |  |
| 40 | Poison Sting | Poison | Physical | 40 | 100% | 35 |  |  |  |
| 41 | Power Gem | Rock | Special | 90 | 100% | 15 |  |  |  |
| 42 | Meteor Beam | Rock | Special | 120 | 85% | 5 |  |  |  |
| 43 | Leer | Normal | Status | — | 100% | 30 |  | Lowers the target's Defense by 1 stage. |  |
| 44 | Bite | Dark | Physical | 60 | 100% | 25 |  | 10% chance to flinch the target. | retyped Normal → Dark |
| 45 | Growl | Sound | Status | — | 100% | 40 |  | Lowers the target's Attack by 1 stage. | retyped Normal → Sound |
| 46 | Roar | Sound | Status | — | 100% | 20 |  | Forces the target to switch out, or lets the user swap out/flee. | retyped Normal → Sound |
| 47 | Sing | Sound | Status | — | 55% | 15 |  | Puts the target to sleep. | retyped Normal → Sound |
| 48 | Supersonic | Sound | Status | — | 55% | 20 |  | Confuses the target. | retyped Normal → Sound |
| 49 | Sonicboom | Sound | Special | 40 | 100% | 30 |  |  | retyped Normal → Sound |
| 50 | Disable | Normal | Status | — | 55% | 20 |  | Disables one of the target's known moves for several turns. |  |
| 51 | Acid | Poison | Special | 40 | 100% | 30 |  |  |  |
| 52 | Ember | Fire | Special | 40 | 100% | 30 |  |  |  |
| 53 | Flamethrower | Fire | Special | 90 | 100% | 15 | TM20 | 10% chance to burn the target. |  |
| 54 | Mist | Ice | Status | — | 100% | 30 |  | Protects the user's stats from being lowered for 5 turns. |  |
| 55 | Water Gun | Water | Special | 40 | 100% | 30 |  |  |  |
| 56 | Hydro Pump | Water | Special | 120 | 85% | 5 |  |  |  |
| 57 | Surf | Water | Special | 90 | 100% | 15 | HM03 |  |  |
| 58 | Ice Beam | Ice | Special | 90 | 100% | 15 | TM13 | 10% chance to freeze the target. |  |
| 59 | Blizzard | Ice | Special | 120 | 85% | 5 | TM14 | 10% chance to freeze the target. |  |
| 60 | Psybeam | Psychic | Special | 65 | 100% | 20 |  | 10% chance to confuse the target. |  |
| 61 | Bubblebeam | Water | Special | 65 | 100% | 20 | TM11 | 33% chance to lower the target's Speed by 1 stage. |  |
| 62 | Aurora Beam | Light | Special | 65 | 100% | 20 |  | 33% chance to lower the target's Attack by 1 stage. | retyped Ice → Light |
| 63 | Hyper Beam | Normal | Special | 120 | 85% | 5 | TM15 |  |  |
| 64 | Peck | Flying | Physical | 40 | 100% | 35 |  |  |  |
| 65 | Drill Peck | Flying | Physical | 90 | 100% | 15 |  |  |  |
| 66 | Submission | Fighting | Physical | 120 | 85% | 10 |  | User takes recoil damage equal to a portion of the damage dealt. |  |
| 67 | Low Kick | Fighting | Physical | 60 | 100% | 25 |  | 30% chance to flinch the target. |  |
| 68 | Counter | Fighting | Physical | * | 100% | 20 | TM18 |  | now counters any physical move (was Normal/Fighting only) |
| 69 | Seismic Toss | Fighting | Physical | * | 100% | 20 | TM19 | Deals fixed/level-based damage, independent of Attack or Sp. Atk. |  |
| 70 | Strength | Normal | Physical | 90 | 100% | 15 | HM04 |  |  |
| 71 | Fury Cutter | Bug | Physical | 40 | 100% | 35 |  |  |  |
| 72 | Mega Drain | Grass | Special | 60 | 100% | 15 | TM21 | User recovers HP equal to half the damage dealt. |  |
| 73 | Leech Seed | Grass | Status | — | 90% | 10 |  | Saps HP from the target to the user each turn. |  |
| 74 | Growth | Normal | Status | — | 100% | 40 |  | Raises the user's Sp. Atk/Sp. Def by 1 stage. |  |
| 75 | Razor Leaf | Grass | Physical | 60 | 100% | 25 |  |  | high crit ratio |
| 76 | Solarbeam | Grass | Special | 120 | 85% | 5 | TM22 |  |  |
| 77 | Poisonpowder | Poison | Status | — | 75% | 35 |  | Poisons the target. |  |
| 78 | Stun Spore | Grass | Status | — | 75% | 30 |  | Paralyzes the target. |  |
| 79 | Sleep Powder | Grass | Status | — | 75% | 15 |  | Puts the target to sleep. |  |
| 80 | X-Scissor | Bug | Physical | 90 | 100% | 15 | TM40 |  |  |
| 81 | String Shot | Bug | Status | — | 95% | 40 |  | Lowers the target's Speed by 1 stage. |  |
| 82 | Megahorn | Bug | Physical | 120 | 85% | 5 |  |  |  |
| 83 | Infestation | Bug | Special | 40 | 100% | 35 |  |  |  |
| 84 | Thundershock | Electric | Special | 40 | 100% | 30 |  |  |  |
| 85 | Thunderbolt | Electric | Special | 90 | 100% | 15 | TM24 | 10% chance to paralyze the target. |  |
| 86 | Thunder Wave | Electric | Status | — | 100% | 20 | TM45 | Paralyzes the target. |  |
| 87 | Thunder | Electric | Special | 120 | 85% | 5 | TM25 | 10% chance to paralyze the target. |  |
| 88 | Rock Throw | Rock | Physical | 45 | 100% | 30 |  |  |  |
| 89 | Earthquake | Ground | Physical | 90 | 100% | 15 | TM26 |  |  |
| 90 | Fissure | Ground | Special | 120 | 85% | 5 | TM27 |  |  |
| 91 | Dig | Ground | Physical | 120 | 85% | 10 | TM28 |  |  |
| 92 | Toxic | Poison | Status | — | 85% | 10 | TM06 | Poisons the target. |  |
| 93 | Confusion | Psychic | Special | 50 | 100% | 30 |  |  |  |
| 94 | Psychic | Psychic | Special | 90 | 100% | 15 | TM29 | 33% chance to lower the target's Sp. Atk/Sp. Def by 1 stage. | side effect now lowers Sp. Def (was Special) |
| 95 | Hypnosis | Psychic | Status | — | 60% | 20 |  | Puts the target to sleep. |  |
| 96 | Meditate | Psychic | Status | — | 100% | 40 |  | Raises the user's Attack by 1 stage. |  |
| 97 | Agility | Psychic | Status | — | 100% | 30 |  | Raises the user's Speed by 2 stages. |  |
| 98 | Quick Attack | Normal | Physical | 40 | 100% | 30 |  |  |  |
| 99 | Silver Wind | Bug | Special | 60 | 100% | 25 |  |  |  |
| 100 | Teleport | Psychic | Status | — | 100% | 20 |  | Forces the target to switch out, or lets the user swap out/flee. |  |
| 101 | Night Shade | Ghost | Special | * | 100% | 15 |  | Deals fixed/level-based damage, independent of Attack or Sp. Atk. |  |
| 102 | Mimic | Normal | Status | — | 100% | 10 | TM31 | Copies the target's last-used move. |  |
| 103 | Screech | Sound | Status | — | 85% | 40 |  | Lowers the target's Defense by 2 stages. | retyped Normal → Sound |
| 104 | Double Team | Normal | Status | — | 100% | 15 | TM32 | Raises the user's evasion by 1 stage. |  |
| 105 | Recover | Normal | Status | — | 100% | 20 |  | User restores its own HP. |  |
| 106 | Harden | Normal | Status | — | 100% | 30 |  | Raises the user's Defense by 1 stage. |  |
| 107 | Minimize | Normal | Status | — | 100% | 20 |  | Raises the user's evasion by 1 stage. |  |
| 108 | Smokescreen | Normal | Status | — | 100% | 20 |  | Lowers the target's accuracy by 1 stage. |  |
| 109 | Confuse Ray | Ghost | Status | — | 100% | 10 |  | Confuses the target. |  |
| 110 | Withdraw | Water | Status | — | 100% | 40 |  | Raises the user's Defense by 1 stage. |  |
| 111 | Defense Curl | Normal | Status | — | 100% | 40 |  | Raises the user's Defense by 1 stage. |  |
| 112 | Barrier | Psychic | Status | — | 100% | 30 |  | Raises the user's Defense by 2 stages. |  |
| 113 | Light Screen | Psychic | Status | — | 100% | 30 | TM46 | Halves incoming Special damage for 5 turns. |  |
| 114 | Haze | Ice | Status | — | 100% | 30 |  | Resets every stat stage on the field to 0. |  |
| 115 | Reflect | Psychic | Status | — | 100% | 20 | TM33 | Halves incoming Physical damage for 5 turns. |  |
| 116 | Focus Energy | Normal | Status | — | 100% | 30 |  | Sharply raises the user's critical-hit rate. |  |
| 117 | Bug Buzz | Bug | Special | 90 | 100% | 15 | TM43 | 33% chance to lower the target's Sp. Atk/Sp. Def by 1 stage. |  |
| 118 | Metronome | Normal | Status | — | 100% | 10 | TM35 | Uses a random move. |  |
| 119 | Mirror Move | Flying | Status | — | 100% | 20 |  | Uses whichever move the target last used. |  |
| 120 | Locust Storm | Bug | Special | 120 | 85% | 5 |  |  |  |
| 121 | Astonish | Ghost | Physical | 40 | 100% | 35 |  |  |  |
| 122 | Lick | Ghost | Physical | 60 | 100% | 25 |  | 30% chance to paralyze the target. |  |
| 123 | Shadow Claw | Ghost | Physical | 90 | 100% | 15 |  |  |  |
| 124 | Sludge | Poison | Special | 65 | 100% | 20 |  | 40% chance to poison the target. |  |
| 125 | Bone Club | Ground | Physical | 45 | 100% | 30 |  |  |  |
| 126 | Fire Blast | Fire | Special | 120 | 85% | 5 | TM38 | 30% chance to burn the target. |  |
| 127 | Waterfall | Water | Physical | 90 | 100% | 15 |  |  |  |
| 128 | Shadow Force | Ghost | Physical | 120 | 85% | 10 |  |  |  |
| 129 | Swift | Light | Special | 60 | 100% | 20 | TM39 | Never misses. | retyped Normal → Light |
| 130 | Ominous Wind | Ghost | Special | 40 | 100% | 30 |  |  |  |
| 131 | Hex | Ghost | Special | 65 | 100% | 20 |  |  |  |
| 132 | Shadow Ball | Ghost | Special | 90 | 100% | 15 | TM04 | 33% chance to lower the target's Sp. Atk/Sp. Def by 1 stage. |  |
| 133 | Amnesia | Psychic | Status | — | 100% | 20 |  | Raises the user's Sp. Atk/Sp. Def by 2 stages. | now raises Sp. Def (was Special) |
| 134 | Kinesis | Psychic | Status | — | 80% | 15 |  | Lowers the target's accuracy by 1 stage. |  |
| 135 | Softboiled | Normal | Status | — | 100% | 10 | TM41 | User restores its own HP. |  |
| 136 | Hi Jump Kick | Fighting | Physical | 90 | 100% | 15 |  |  |  |
| 137 | Glare | Normal | Status | — | 75% | 30 |  | Paralyzes the target. |  |
| 138 | Spirit Blast | Ghost | Special | 120 | 85% | 5 |  |  |  |
| 139 | Poison Gas | Poison | Status | — | 55% | 40 |  | Poisons the target. |  |
| 140 | Metal Claw | Steel | Physical | 50 | 100% | 30 |  |  |  |
| 141 | Leech Life | Bug | Physical | 60 | 100% | 20 |  | User recovers HP equal to half the damage dealt. |  |
| 142 | Lovely Kiss | Normal | Status | — | 75% | 10 |  | Puts the target to sleep. |  |
| 143 | Iron Head | Steel | Physical | 65 | 100% | 20 |  | 30% chance to flinch the target. |  |
| 144 | Transform | Normal | Status | — | 100% | 10 |  | User transforms into the target, copying its stats, types, and moves. |  |
| 145 | Meteor Mash | Steel | Physical | 90 | 100% | 15 |  |  |  |
| 146 | Iron Tail | Steel | Physical | 120 | 85% | 5 | TM23 | 33% chance to lower the target's Defense by 1 stage. |  |
| 147 | Spore | Grass | Status | — | 100% | 15 |  | Puts the target to sleep. |  |
| 148 | Flash | Light | Status | — | 70% | 20 | HM05 | Lowers the target's accuracy by 1 stage. | retyped Normal → Light |
| 149 | Metal Shard | Steel | Special | 40 | 100% | 35 |  |  |  |
| 150 | Splash | Normal | Status | — | 100% | 40 |  | Does nothing. |  |
| 151 | Acid Armor | Poison | Status | — | 100% | 40 |  | Raises the user's Defense by 2 stages. |  |
| 152 | Crabhammer | Water | Physical | 120 | 85% | 5 |  |  | high crit ratio |
| 153 | Explosion | Normal | Physical | 170 | 100% | 5 | TM47 | User faints after attacking. |  |
| 154 | Mirror Shot | Steel | Special | 65 | 100% | 20 |  |  |  |
| 155 | Flash Cannon | Steel | Special | 90 | 100% | 15 | TM36 | 33% chance to lower the target's Sp. Atk/Sp. Def by 1 stage. |  |
| 156 | Rest | Psychic | Status | — | 100% | 10 | TM44 | User restores its own HP. |  |
| 157 | Rock Slide | Rock | Physical | 65 | 100% | 20 | TM48 | 30% chance to flinch the target. |  |
| 158 | Steel Beam | Steel | Special | 120 | 85% | 5 |  | User takes recoil damage equal to a portion of the damage dealt. |  |
| 159 | Sharpen | Normal | Status | — | 100% | 30 |  | Raises the user's Attack by 1 stage. |  |
| 160 | Conversion | Normal | Status | — | 100% | 30 |  | User becomes the type of one of its own moves. |  |
| 161 | Tri Attack | Normal | Special | 65 | 100% | 25 | TM49 |  |  |
| 162 | Flame Charge | Fire | Physical | 50 | 100% | 30 |  |  |  |
| 163 | Slash | Normal | Physical | 65 | 100% | 20 |  |  | high crit ratio |
| 164 | Substitute | Normal | Status | — | 100% | 10 | TM50 | User creates a decoy that absorbs hits until broken. |  |
| 165 | Struggle | ??? | Physical | 50 | 100% | 10 |  | User takes recoil damage equal to a portion of the damage dealt. | retyped Normal → ??? (typeless; no STAB, hits Ghosts) |
| 166 | Fire Fang | Fire | Physical | 65 | 100% | 20 |  | 10% chance to burn the target. |  |
| 167 | Flare Blitz | Fire | Physical | 120 | 85% | 10 |  | User takes recoil damage equal to a portion of the damage dealt. |  |
| 168 | Flame Burst | Fire | Special | 65 | 100% | 20 |  | 10% chance to burn the target. |  |
| 169 | Aqua Jet | Water | Physical | 40 | 100% | 35 |  |  |  |
| 170 | Razor Shell | Water | Physical | 65 | 100% | 20 |  | 33% chance to lower the target's Defense by 1 stage. |  |
| 171 | Leaf Blade | Grass | Physical | 90 | 100% | 15 |  |  |  |
| 172 | Wood Hammer | Grass | Physical | 120 | 85% | 10 |  | User takes recoil damage equal to a portion of the damage dealt. |  |
| 173 | Leafage | Grass | Special | 40 | 100% | 35 |  |  |  |
| 174 | Energy Ball | Grass | Special | 90 | 100% | 15 | TM09 | 33% chance to lower the target's Sp. Atk/Sp. Def by 1 stage. |  |
| 175 | Nuzzle | Electric | Physical | 40 | 100% | 35 |  |  |  |
| 176 | Spark | Electric | Physical | 65 | 100% | 20 |  | 10% chance to paralyze the target. |  |
| 177 | Wild Charge | Electric | Physical | 120 | 85% | 10 |  | User takes recoil damage equal to a portion of the damage dealt. |  |
| 178 | Shock Wave | Electric | Special | 60 | 100% | 20 | TM30 | Never misses. |  |
| 179 | Mind Spike | Psychic | Physical | 40 | 100% | 35 |  |  |  |
| 180 | Psycho Cut | Psychic | Physical | 65 | 100% | 20 |  |  |  |
| 181 | Zen Headbutt | Psychic | Physical | 90 | 100% | 15 |  | 10% chance to flinch the target. |  |
| 182 | Mind Crush | Psychic | Physical | 120 | 85% | 5 |  |  |  |
| 183 | Psycho Boost | Psychic | Special | 120 | 85% | 5 |  |  |  |
| 184 | Ice Shard | Ice | Physical | 40 | 100% | 35 |  |  |  |
| 185 | Ice Fang | Ice | Physical | 65 | 100% | 20 |  | 10% chance to freeze the target. |  |
| 186 | Icicle Crash | Ice | Physical | 120 | 85% | 10 |  | 10% chance to flinch the target. |  |
| 187 | Powder Snow | Ice | Special | 40 | 100% | 35 |  |  |  |
| 188 | Icy Wind | Ice | Special | 60 | 100% | 20 |  | 33% chance to lower the target's Speed by 1 stage. |  |
| 189 | Dragon Tail | Dragon | Physical | 45 | 100% | 30 |  |  |  |
| 190 | Dragon Claw | Dragon | Physical | 65 | 100% | 20 |  |  |  |
| 191 | Dragon Rush | Dragon | Physical | 90 | 100% | 15 |  |  |  |
| 192 | Outrage | Dragon | Physical | 120 | 85% | 10 |  | User attacks for 2-3 turns in a row, then becomes confused. |  |
| 193 | Twister | Dragon | Special | 40 | 100% | 30 |  |  |  |
| 194 | Dragonbreath | Dragon | Special | 60 | 100% | 20 |  | 10% chance to paralyze the target. |  |
| 195 | Dragon Pulse | Dragon | Special | 90 | 100% | 15 | TM42 |  |  |
| 196 | Draco Meteor | Dragon | Special | 130 | 85% | 5 |  |  |  |
| 197 | Pursuit | Dark | Physical | 40 | 100% | 35 |  |  |  |
| 198 | Crunch | Dark | Physical | 90 | 100% | 15 | TM08 | 33% chance to lower the target's Defense by 1 stage. |  |
| 199 | Night Slash | Dark | Physical | 120 | 85% | 10 |  |  | high crit ratio |
| 200 | Snarl | Dark | Special | 40 | 100% | 30 |  |  |  |
| 201 | Night Ray | Dark | Special | 65 | 100% | 20 |  |  |  |
| 202 | Dark Pulse | Dark | Special | 90 | 100% | 15 | TM34 | 10% chance to flinch the target. |  |
| 203 | Dark Storm | Dark | Special | 120 | 85% | 5 |  |  |  |
| 204 | Pixie Strike | Fairy | Physical | 40 | 100% | 35 |  |  |  |
| 205 | Spirit Break | Fairy | Physical | 65 | 100% | 20 |  | 33% chance to lower the target's Sp. Atk/Sp. Def by 1 stage. |  |
| 206 | Play Rough | Fairy | Physical | 90 | 100% | 15 |  | 33% chance to lower the target's Attack by 1 stage. |  |
| 207 | Star Smash | Fairy | Physical | 120 | 85% | 5 |  |  |  |
| 208 | Fairy Wind | Fairy | Special | 40 | 100% | 30 |  |  |  |
| 209 | Drain Kiss | Fairy | Special | 60 | 100% | 20 |  | User recovers HP equal to half the damage dealt. |  |
| 210 | Dazzle Gleam | Fairy | Special | 90 | 100% | 15 | TM05 |  |  |
| 211 | Moonblast | Fairy | Special | 120 | 85% | 5 |  | 33% chance to lower the target's Sp. Atk/Sp. Def by 1 stage. |  |
| 212 | Echo Jab | Sound | Physical | 40 | 100% | 35 |  |  |  |
| 213 | Sonic Slam | Sound | Physical | 65 | 100% | 20 |  | 10% chance to flinch the target. |  |
| 214 | Echo Crash | Sound | Physical | 90 | 100% | 15 |  |  |  |
| 215 | Sonic Smash | Sound | Physical | 120 | 85% | 5 |  |  |  |
| 216 | Round | Sound | Special | 60 | 100% | 25 |  |  |  |
| 217 | Hyper Voice | Sound | Special | 90 | 100% | 15 | TM12 |  |  |
| 218 | Boomburst | Sound | Special | 120 | 85% | 5 |  |  |  |
| 219 | Glow Punch | Light | Physical | 40 | 100% | 35 |  |  |  |
| 220 | Flash Kick | Light | Physical | 65 | 100% | 20 |  |  |  |
| 221 | Prism Blade | Light | Physical | 90 | 100% | 15 |  |  |  |
| 222 | Nova Strike | Light | Physical | 120 | 85% | 5 |  |  |  |
| 223 | Light Ray | Light | Special | 40 | 100% | 30 |  |  |  |
| 224 | Photon Beam | Light | Special | 90 | 100% | 15 | TM37 |  |  |
| 225 | Supernova | Light | Special | 120 | 85% | 5 |  |  |  |
