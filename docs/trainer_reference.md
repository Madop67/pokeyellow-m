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

## Trainer classes

396 trainer battles across 45 classes (⭐ = boss with fully-specified movesets).

- **Youngster** — 14 battles
- **Bug Catcher** — 15 battles
- **Lass** — 19 battles
- **Sailor** — 8 battles
- **Jr. Trainer♂** — 10 battles
- **Jr. Trainer♀** — 25 battles
- **Poké Maniac** — 7 battles
- **Super Nerd** — 12 battles
- **Hiker** — 14 battles
- **Biker** — 15 battles
- **Burglar** — 9 battles
- **Engineer** — 3 battles
- **Fisherman** — 11 battles
- **Swimmer** — 15 battles
- **Cue Ball** — 9 battles
- **Gambler** — 7 battles
- **Beauty** — 15 battles
- **Psychic** — 4 battles
- **Rocker** — 2 battles
- **Juggler** — 8 battles
- **Tamer** — 6 battles
- **Bird Keeper** — 17 battles
- **Blackbelt** — 9 battles
- **Rival (early)** — 3 battles
- **Prof. Oak** — 3 battles
- **Scientist** — 13 battles
- **Giovanni** ⭐ — 3 battles
- **Rocket** — 49 battles
- **Cooltrainer♂** — 10 battles
- **Cooltrainer♀** — 8 battles
- **Bruno** ⭐ — 1 battle
- **Brock** ⭐ — 1 battle
- **Misty** ⭐ — 1 battle
- **Lt. Surge** ⭐ — 1 battle
- **Erika** ⭐ — 1 battle
- **Koga** ⭐ — 1 battle
- **Blaine** ⭐ — 1 battle
- **Sabrina** ⭐ — 1 battle
- **Gentleman** — 5 battles
- **Rival (Silph/mid)** — 10 battles
- **Rival (Champion)** ⭐ — 3 battles
- **Lorelei** ⭐ — 1 battle
- **Channeler** — 24 battles
- **Agatha** ⭐ — 1 battle
- **Lance** ⭐ — 1 battle


---

## Youngster

### Youngster #1 — Route 3
_Lv 11 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 11 | Normal | Tackle · **Pay Day** · Quick Attack · **Shock Wave** |
| 2 | Ekans | 11 | Poison | Tackle · **Counter** · Poison Sting · **Mega Drain** |

### Youngster #2 — Route 3
_Lv 14 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Spearow | 14 | Normal/Flying | Peck · **Swift** · **Counter** · **Pay Day** |

### Youngster #3 — Mt. Moon 1F
_Lv 10 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 10 | Normal | Tackle · **Pay Day** · Quick Attack · **Shock Wave** |
| 2 | Rattata | 10 | Normal | Tackle · **Pay Day** · Quick Attack · **Shock Wave** |
| 3 | Zubat | 10 | Poison/Flying | Leech Life · Poison Sting · Supersonic · **Mega Drain** |

### Youngster #4 — Route 24
_Lv 14 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 14 | Normal | Tackle · **Pay Day** · Quick Attack · Bite |
| 2 | Ekans | 14 | Poison | Tackle · **Counter** · Poison Sting · **Mega Drain** |
| 3 | Zubat | 14 | Poison/Flying | Leech Life · Poison Sting · Supersonic · **Mega Drain** |

### Youngster #5 — Route 25
_Lv 15 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 15 | Normal | Tackle · **Pay Day** · Quick Attack · Bite |
| 2 | Spearow | 15 | Normal/Flying | Peck · **Pay Day** · **Swift** · Tackle |

### Youngster #6 — Route 25
_Lv 17 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Slowpoke | 17 | Water/Psychic | Confusion · **Bubblebeam** · **Tri Attack** · **Thunder Wave** |

### Youngster #7 — Route 25
_Lv 14 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ekans | 14 | Poison | Tackle · **Counter** · Poison Sting · **Mega Drain** |
| 2 | Sandshrew | 14 | Ground | Tackle · Sand-Attack · **Cut** · **Swift** |

### Youngster #8 — SS Anne 1F Rooms
_Lv 21 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Nidoran♂ | 21 | Poison | **Tackle** · Headbutt · Low Kick · Poison Sting |

### Youngster #9 — Route 11
_Lv 21 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ekans | 21 | Poison | Tackle · **Rock Slide** · Poison Sting · Bite |

### Youngster #10 — Route 11
_Lv 19 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandshrew | 19 | Ground | Tackle · Sand-Attack · Bulldoze · Slash |
| 2 | Zubat | 19 | Poison/Flying | Leech Life · Poison Sting · Supersonic · Bite |

### Youngster #11 — Route 11
_Lv 17 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 17 | Normal | Tackle · **Tri Attack** · Quick Attack · Bite |
| 2 | Rattata | 17 | Normal | Tackle · **Tri Attack** · Quick Attack · Bite |
| 3 | Raticate | 17 | Normal | Tackle · Quick Attack · **Tri Attack** · Bite |

### Youngster #12 — Route 11
_Lv 18 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Nidoran♂ | 18 | Poison | **Tackle** · Headbutt · Low Kick · Poison Sting |
| 2 | Nidorino | 18 | Poison | Tackle · Headbutt · **Bubblebeam** · Low Kick |

### Youngster #13 — Unused
_Lv 17 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Spearow | 17 | Normal/Flying | Peck · Growl · Leer · Tackle |
| 2 | Rattata | 17 | Normal | Tackle · Tail Whip · Quick Attack · Bite |
| 3 | Rattata | 17 | Normal | Tackle · Tail Whip · Quick Attack · Bite |
| 4 | Spearow | 17 | Normal/Flying | Peck · Growl · Leer · Tackle |

### Youngster #14 — Route 9
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandshrew | 24 | Ground | Sand-Attack · Bulldoze · Slash · **Fissure** |


---

## Bug Catcher

### Bug Catcher #1 — Viridian Forest
_Lv 7 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Caterpie | 7 | Bug | Tackle · String Shot · Fury Cutter |
| 2 | Caterpie | 7 | Bug | Tackle · String Shot · Fury Cutter |

### Bug Catcher #2 — Viridian Forest
_Lv 6 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Metapod | 6 | Bug | Tackle · Harden · Fury Cutter |
| 2 | Caterpie | 6 | Bug | Tackle · String Shot · Fury Cutter |
| 3 | Metapod | 6 | Bug | Tackle · Harden · Fury Cutter |

### Bug Catcher #3 — Viridian Forest
_Lv 10 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Caterpie | 10 | Bug | Tackle · String Shot · Fury Cutter |

### Bug Catcher #4 — Route 3
_Lv 10 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Caterpie | 10 | Bug | Tackle · String Shot · Fury Cutter |
| 2 | Weedle | 10 | Bug/Poison | Poison Sting · String Shot · Fury Cutter |
| 3 | Caterpie | 10 | Bug | Tackle · String Shot · Fury Cutter |

### Bug Catcher #5 — Route 3
_Lv 9 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weedle | 9 | Bug/Poison | Poison Sting · String Shot · Fury Cutter |
| 2 | Kakuna | 9 | Bug/Poison | Tackle · Harden · Fury Cutter |
| 3 | Caterpie | 9 | Bug | Tackle · String Shot · Fury Cutter |
| 4 | Metapod | 9 | Bug | Tackle · Harden · Fury Cutter |

### Bug Catcher #6 — Route 3
_Lv 11 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Caterpie | 11 | Bug | Tackle · String Shot · Fury Cutter |
| 2 | Metapod | 11 | Bug | Tackle · Harden · Fury Cutter |

### Bug Catcher #7 — Mt. Moon 1F
_Lv 11 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weedle | 11 | Bug/Poison | Poison Sting · String Shot · Fury Cutter |
| 2 | Kakuna | 11 | Bug/Poison | Tackle · Harden · Fury Cutter |

### Bug Catcher #8 — Mt. Moon 1F
_Lv 10 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Caterpie | 10 | Bug | Tackle · String Shot · Fury Cutter |
| 2 | Metapod | 10 | Bug | Tackle · Harden · Fury Cutter |
| 3 | Caterpie | 10 | Bug | Tackle · String Shot · Fury Cutter |

### Bug Catcher #9 — Route 24
_Lv 14 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Caterpie | 14 | Bug | Tackle · String Shot · Fury Cutter |
| 2 | Weedle | 14 | Bug/Poison | Poison Sting · String Shot · Fury Cutter |

### Bug Catcher #10 — Route 6
_Lv 16 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weedle | 16 | Bug/Poison | Poison Sting · String Shot · Fury Cutter |
| 2 | Caterpie | 16 | Bug | Tackle · String Shot · Fury Cutter |
| 3 | Weedle | 16 | Bug/Poison | Poison Sting · String Shot · Fury Cutter |

### Bug Catcher #11 — Route 6
_Lv 20 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Butterfree | 20 | Bug/Flying | **Infestation** · **Confusion** · Sleep Powder · **Mega Drain** |

### Bug Catcher #12 — Unused
_Lv 18 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Metapod | 18 | Bug | Tackle · Harden · Fury Cutter |
| 2 | Caterpie | 18 | Bug | Tackle · String Shot · Fury Cutter |
| 3 | Venonat | 18 | Bug/Poison | Tackle · Disable · Supersonic |

### Bug Catcher #13 — Route 9
_Lv 19 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Beedrill | 19 | Bug/Poison | Tackle · **Swords Dance** · **Cut** · **Mega Drain** |
| 2 | Beedrill | 19 | Bug/Poison | Tackle · **Swords Dance** · **Cut** · **Mega Drain** |

### Bug Catcher #14 — Route 9
_Lv 20 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Caterpie | 20 | Bug | Tackle · String Shot · Fury Cutter |
| 2 | Weedle | 20 | Bug/Poison | Poison Sting · String Shot · Fury Cutter |
| 3 | Venonat | 20 | Bug/Poison | Tackle · **Mega Drain** · Supersonic · Confusion |

### Bug Catcher #15 — Viridian Forest
_Lv 8 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Caterpie | 8 | Bug | Tackle · String Shot · Fury Cutter |
| 2 | Metapod | 8 | Bug | Tackle · **Tackle** · **String Shot** |


---

## Lass

### Lass #1 — Route 3
_Lv 9 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 9 | Normal/Flying | Gust · Sand-Attack · **Pay Day** · **Swift** |
| 2 | Pidgey | 9 | Normal/Flying | Gust · Sand-Attack · **Pay Day** · **Swift** |

### Lass #2 — Route 3
_Lv 10 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 10 | Normal | Tackle · **Pay Day** · Quick Attack · **Shock Wave** |
| 2 | Nidoran♂ | 10 | Poison | Tackle · Leer · **Counter** · **Shock Wave** |

### Lass #3 — Route 3
_Lv 14 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Jigglypuff | 14 | Sound/Fairy | Sing · Tackle · **Counter** · **Shock Wave** |

### Lass #4 — Route 4
_Lv 31 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Paras | 31 | Bug/Grass | Tackle · **X-Scissor** · Leech Life · Spore |
| 2 | Paras | 31 | Bug/Grass | Tackle · **X-Scissor** · Leech Life · Spore |
| 3 | Parasect | 31 | Bug/Grass | Leech Life · **Tackle** · Razor Leaf · Spore |

### Lass #5 — Mt. Moon 1F
_Lv 11 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Oddish | 11 | Grass/Poison | Mega Drain · **Cut** · **Counter** · **Double Team** |
| 2 | Bellsprout | 11 | Grass/Poison | Vine Whip · **Swords Dance** · **Cut** · **Mega Drain** |

### Lass #6 — Mt. Moon 1F
_Lv 14 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Clefairy | 14 | Fairy | Tackle · **Counter** · Sing · **Shock Wave** |

### Lass #7 — Route 24
_Lv 16 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 16 | Normal/Flying | Gust · Sand-Attack · Tackle · Quick Attack |
| 2 | Nidoran♀ | 16 | Poison | Tackle · **Counter** · Low Kick · **Shock Wave** |

### Lass #8 — Route 24
_Lv 14 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 14 | Normal/Flying | Gust · Sand-Attack · Tackle · Quick Attack |
| 2 | Nidoran♀ | 14 | Poison | Tackle · **Counter** · Low Kick · **Shock Wave** |

### Lass #9 — Route 25
_Lv 15 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Nidoran♂ | 15 | Poison | Tackle · **Shock Wave** · **Counter** · Low Kick |
| 2 | Nidoran♀ | 15 | Poison | Tackle · **Counter** · Low Kick · **Shock Wave** |

### Lass #10 — Route 25
_Lv 13 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Oddish | 13 | Grass/Poison | Mega Drain · **Cut** · **Counter** · **Double Team** |
| 2 | Pidgey | 13 | Normal/Flying | Gust · Sand-Attack · Tackle · Quick Attack |
| 3 | Oddish | 13 | Grass/Poison | Mega Drain · **Cut** · **Counter** · **Double Team** |

### Lass #11 — SS Anne 1F Rooms
_Lv 18 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 18 | Normal/Flying | Gust · Sand-Attack · Tackle · Quick Attack |
| 2 | Nidoran♀ | 18 | Poison | Tackle · **Shock Wave** · Low Kick · Poison Sting |

### Lass #12 — SS Anne 2F Rooms
_Lv 20 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Jigglypuff | 20 | Sound/Fairy | Sing · Tackle · **Bubblebeam** · **Tri Attack** |

### Lass #13 — Route 8
_Lv 23 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Nidoran♀ | 23 | Poison | **Tackle** · Low Kick · Poison Sting · **Shock Wave** |
| 2 | Nidorina | 23 | Poison | **Tackle** · Low Kick · Poison Sting · Cross Poison |

### Lass #14 — Route 8
_Lv 24 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Meowth | 24 | Normal | **Tackle** · Bite · Pay Day · Screech |
| 2 | Meowth | 24 | Normal | **Tackle** · Bite · Pay Day · Screech |
| 3 | Meowth | 24 | Normal | **Tackle** · Bite · Pay Day · Screech |

### Lass #15 — Route 8
_Lv 19 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 19 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 2 | Rattata | 19 | Normal | Tackle · **Tri Attack** · Quick Attack · Bite |
| 3 | Nidoran♀ | 19 | Poison | Tackle · **Shock Wave** · Low Kick · Poison Sting |
| 4 | Meowth | 19 | Normal | Tackle · **Tri Attack** · Bite · Pay Day |
| 5 | Nidoran♂ | 19 | Poison | **Tackle** · Headbutt · Low Kick · Poison Sting |

### Lass #16 — Route 8
_Lv 22 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Clefairy | 22 | Fairy | Tackle · **Tri Attack** · Sing · **Bubblebeam** |
| 2 | Clefairy | 22 | Fairy | Tackle · **Tri Attack** · Sing · **Bubblebeam** |

### Lass #17 — Celadon Gym
_Lv 23 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Bellsprout | 23 | Grass/Poison | Tackle · **Vine Whip** · Sleep Powder · **Mega Drain** |
| 2 | Weepinbell | 23 | Grass/Poison | **Vine Whip** · **Tackle** · Sleep Powder · **Mega Drain** |

### Lass #18 — Celadon Gym
_Lv 23 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Oddish | 23 | Grass/Poison | Mega Drain · **Cut** · **Counter** · Sleep Powder |
| 2 | Gloom | 23 | Grass/Poison | Mega Drain · **Cut** · **Counter** · Sleep Powder |

### Lass #19 — Viridian Forest
_Lv 6 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Nidoran♀ | 6 | Poison | Tackle · Growl · **Shock Wave** · **Counter** |
| 2 | Nidoran♂ | 6 | Poison | Tackle · Leer · **Shock Wave** · **Counter** |


---

## Sailor

### Sailor #1 — SS Anne Stern
_Lv 18 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 18 | Fighting | Karate Chop · **Rock Slide** · **Counter** · **Seismic Toss** |
| 2 | Shellder | 18 | Water | Tackle · **Tri Attack** · Supersonic · **Bubblebeam** |

### Sailor #2 — SS Anne Stern
_Lv 17 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 17 | Fighting | Karate Chop · **Rock Slide** · **Counter** · **Seismic Toss** |
| 2 | Tentacool | 17 | Water/Poison | Acid · Supersonic · Tackle · **Bubblebeam** |

### Sailor #3 — SS Anne B1F Rooms
_Lv 21 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Shellder | 21 | Water | Tackle · **Tri Attack** · Supersonic · **Bubblebeam** |

### Sailor #4 — SS Anne B1F Rooms
_Lv 17 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Horsea | 17 | Water | Water Gun · **Swift** · **Bubblebeam** · **Counter** |
| 2 | Shellder | 17 | Water | Tackle · **Swift** · **Bubblebeam** · **Tri Attack** |
| 3 | Tentacool | 17 | Water/Poison | Acid · Supersonic · Tackle · **Bubblebeam** |

### Sailor #5 — SS Anne B1F Rooms
_Lv 18 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Tentacool | 18 | Water/Poison | Acid · Supersonic · Tackle · Poison Sting |
| 2 | Staryu | 18 | Water/Light | Tackle · Water Gun · **Bubblebeam** · **Thunder Wave** |

### Sailor #6 — SS Anne B1F Rooms
_Lv 17 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Horsea | 17 | Water | Water Gun · **Swift** · **Bubblebeam** · **Counter** |
| 2 | Horsea | 17 | Water | Water Gun · **Swift** · **Bubblebeam** · **Counter** |
| 3 | Horsea | 17 | Water | Water Gun · **Swift** · **Bubblebeam** · **Counter** |

### Sailor #7 — SS Anne B1F Rooms
_Lv 20 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 20 | Fighting | Karate Chop · Low Kick · **Rock Slide** · **Counter** |

### Sailor #8 — Vermilion Gym
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magnemite | 24 | Electric/Steel | Tackle · Sonicboom · **Shock Wave** · **Thunder Wave** |


---

## Jr. Trainer♂

### Jr. Trainer♂ #1 — Pewter Gym
_Lv 9 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Diglett | 9 | Ground | Tackle · **Cut** · **Counter** · **Double Team** |
| 2 | Sandshrew | 9 | Ground | Tackle · **Cut** · **Swift** · **Swords Dance** |

### Jr. Trainer♂ #2 — Route 24/Route 25
_Lv 14 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 14 | Normal | Tackle · **Pay Day** · Quick Attack · Bite |
| 2 | Ekans | 14 | Poison | Tackle · **Counter** · Poison Sting · **Mega Drain** |

### Jr. Trainer♂ #3 — Route 24
_Lv 18 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Mankey | 18 | Fighting | Tackle · **Shock Wave** · Low Kick · **Rock Slide** |

### Jr. Trainer♂ #4 — Unused
_Lv 20 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Squirtle | 20 | Water | Tackle · Tail Whip · Water Gun |

### Jr. Trainer♂ #5 — Route 6
_Lv 16 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Spearow | 16 | Normal/Flying | Peck · **Tri Attack** · **Pay Day** · Tackle |
| 2 | Raticate | 16 | Normal | Tackle · Quick Attack · **Tri Attack** · Bite |

### Jr. Trainer♂ #6 — Unused
_Lv 18 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Diglett | 18 | Ground | Tackle · Growl |
| 2 | Diglett | 18 | Ground | Tackle · Growl |
| 3 | Sandshrew | 18 | Ground | Tackle · Sand-Attack · Bulldoze · Slash |

### Jr. Trainer♂ #7 — Unused
_Lv 21 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Growlithe | 21 | Fire | Bite · Roar · Ember |
| 2 | Charmander | 21 | Fire | Tackle · Growl · Ember · Leer |

### Jr. Trainer♂ #8 — Route 9
_Lv 19 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 19 | Normal | Tackle · **Tri Attack** · Quick Attack · Bite |
| 2 | Diglett | 19 | Ground | Tackle · **Rock Slide** · Bulldoze · **Cut** |
| 3 | Ekans | 19 | Poison | Tackle · **Rock Slide** · Poison Sting · Bite |
| 4 | Sandshrew | 19 | Ground | Tackle · Sand-Attack · Bulldoze · Slash |

### Jr. Trainer♂ #9 — Route 12
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Nidoran♂ | 29 | Poison | Headbutt · Low Kick · Poison Sting · **Tackle** |
| 2 | Nidorino | 29 | Poison | Low Kick · Poison Sting · Cross Poison · **Headbutt** |

### Jr. Trainer♂ #10 — Route 6
_Lv 16 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weepinbell | 16 | Grass/Poison | Tackle · Vine Whip · **Mega Drain** · **Swords Dance** |


---

## Jr. Trainer♀

### Jr. Trainer♀ #1 — Cerulean Gym
_Lv 19 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Goldeen | 19 | Water | Peck · **Swift** · Supersonic · **Bubblebeam** |

### Jr. Trainer♀ #2 — Unused
_Lv 16 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Oddish | 16 | Grass/Poison | Mega Drain · Poisonpowder |
| 2 | Bellsprout | 16 | Grass/Poison | Vine Whip · Growth · Tackle · Poisonpowder |

### Jr. Trainer♀ #3 — Route 6
_Lv 16 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 16 | Normal/Flying | Gust · Sand-Attack · Tackle · Quick Attack |
| 2 | Pidgey | 16 | Normal/Flying | Gust · Sand-Attack · Tackle · Quick Attack |
| 3 | Pidgey | 16 | Normal/Flying | Gust · Sand-Attack · Tackle · Quick Attack |

### Jr. Trainer♀ #4 — Unused
_Lv 22 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Bulbasaur | 22 | Grass/Poison | Growl · Leech Seed · Vine Whip · Poisonpowder |

### Jr. Trainer♀ #5 — Route 9
_Lv 18 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Oddish | 18 | Grass/Poison | Mega Drain · **Counter** · Stun Spore · **Cut** |
| 2 | Bellsprout | 18 | Grass/Poison | **Vine Whip** · Tackle · **Mega Drain** · Sleep Powder |
| 3 | Oddish | 18 | Grass/Poison | Mega Drain · **Counter** · Stun Spore · **Cut** |
| 4 | Bellsprout | 18 | Grass/Poison | **Vine Whip** · Tackle · **Mega Drain** · Sleep Powder |

### Jr. Trainer♀ #6 — Route 9
_Lv 23 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Meowth | 23 | Normal | Tackle · **Tri Attack** · Bite · Pay Day |

### Jr. Trainer♀ #7 — Route 10
_Lv 20 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Jigglypuff | 20 | Sound/Fairy | Sing · Tackle · **Bubblebeam** · **Tri Attack** |
| 2 | Clefairy | 20 | Fairy | Tackle · **Tri Attack** · Sing · **Bubblebeam** |

### Jr. Trainer♀ #8 — Route 10
_Lv 21 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 21 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 2 | Pidgeotto | 21 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |

### Jr. Trainer♀ #9 — Rock Tunnel B1F
_Lv 21 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Jigglypuff | 21 | Sound/Fairy | Sing · Tackle · **Bubblebeam** · **Tri Attack** |
| 2 | Pidgey | 21 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 3 | Meowth | 21 | Normal | Tackle · **Tri Attack** · Bite · Pay Day |

### Jr. Trainer♀ #10 — Rock Tunnel B1F
_Lv 22 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Oddish | 22 | Grass/Poison | Mega Drain · **Cut** · **Counter** · Sleep Powder |
| 2 | Bulbasaur | 22 | Grass/Poison | **Tackle** · Leech Seed · Vine Whip · **Mega Drain** |

### Jr. Trainer♀ #11 — Celadon Gym
_Lv 24 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Bulbasaur | 24 | Grass/Poison | **Tackle** · Leech Seed · Vine Whip · **Mega Drain** |
| 2 | Ivysaur | 24 | Grass/Poison | **Tackle** · Leech Seed · Vine Whip · **Mega Drain** |

### Jr. Trainer♀ #12 — Route 13
_Lv 24 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 24 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 2 | Meowth | 24 | Normal | **Tackle** · Bite · Pay Day · Screech |
| 3 | Rattata | 24 | Normal | **Tackle** · Quick Attack · Bite · **Tri Attack** |
| 4 | Pidgey | 24 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 5 | Meowth | 24 | Normal | **Tackle** · Bite · Pay Day · Screech |

### Jr. Trainer♀ #13 — Route 13
_Lv 30 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Poliwag | 30 | Water | Water Gun · Hypnosis · Tackle · **Bubblebeam** |
| 2 | Poliwag | 30 | Water | Water Gun · Hypnosis · Tackle · **Bubblebeam** |

### Jr. Trainer♀ #14 — Route 13
_Lv 27 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 27 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 2 | Meowth | 27 | Normal | **Tackle** · Bite · Pay Day · Screech |
| 3 | Pidgey | 27 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 4 | Pidgeotto | 27 | Normal/Flying | **Gust** · Quick Attack · **Sand-Attack** · Headbutt |

### Jr. Trainer♀ #15 — Route 13
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Goldeen | 28 | Water | Peck · **Bubblebeam** · Supersonic · Headbutt |
| 2 | Poliwag | 28 | Water | Water Gun · Hypnosis · Tackle · **Bubblebeam** |
| 3 | Horsea | 28 | Water | Water Gun · Smokescreen · **Bubblebeam** · **Swift** |

### Jr. Trainer♀ #16 — Route 20
_Lv 31 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Goldeen | 31 | Water | Peck · **Surf** · Supersonic · Headbutt |
| 2 | Seaking | 31 | Water | Supersonic · **Peck** · Razor Shell · Headbutt |

### Jr. Trainer♀ #17 — Rock Tunnel 1F
_Lv 22 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Bellsprout | 22 | Grass/Poison | Tackle · **Vine Whip** · Sleep Powder · **Mega Drain** |
| 2 | Clefairy | 22 | Fairy | Tackle · **Tri Attack** · Sing · **Bubblebeam** |

### Jr. Trainer♀ #18 — Rock Tunnel 1F
_Lv 20 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Meowth | 20 | Normal | Tackle · **Tri Attack** · Bite · Pay Day |
| 2 | Oddish | 20 | Grass/Poison | Mega Drain · **Cut** · **Counter** · Sleep Powder |
| 3 | Pidgey | 20 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |

### Jr. Trainer♀ #19 — Rock Tunnel 1F
_Lv 19 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 19 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 2 | Rattata | 19 | Normal | Tackle · **Tri Attack** · Quick Attack · Bite |
| 3 | Rattata | 19 | Normal | Tackle · **Tri Attack** · Quick Attack · Bite |
| 4 | Bellsprout | 19 | Grass/Poison | **Vine Whip** · Tackle · **Mega Drain** · Sleep Powder |

### Jr. Trainer♀ #20 — Route 15
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gloom | 28 | Grass/Poison | **Mega Drain** · **Cut** · Sleep Powder · Acid |
| 2 | Oddish | 28 | Grass/Poison | **Mega Drain** · **Cut** · Sleep Powder · Acid |
| 3 | Oddish | 28 | Grass/Poison | **Mega Drain** · **Cut** · Sleep Powder · Acid |

### Jr. Trainer♀ #21 — Route 15
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 29 | Normal/Flying | Tackle · Quick Attack · **Sand-Attack** · Wing Attack |
| 2 | Pidgeotto | 29 | Normal/Flying | **Gust** · Quick Attack · **Sand-Attack** · Headbutt |

### Jr. Trainer♀ #22 — Route 15
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Clefairy | 33 | Fairy | Sing · **Tackle** · Drain Kiss · **Dazzle Gleam** |

### Jr. Trainer♀ #23 — Route 15
_Lv 29 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Bellsprout | 29 | Grass/Poison | **Vine Whip** · Sleep Powder · **Tackle** · Acid |
| 2 | Oddish | 29 | Grass/Poison | **Mega Drain** · **Cut** · Sleep Powder · Acid |
| 3 | Tangela | 29 | Grass | Tackle · Headbutt · Mega Drain · Vine Whip |

### Jr. Trainer♀ #24 — Route 20
_Lv 30 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Tentacool | 30 | Water/Poison | Supersonic · **Acid** · Poison Sting · Water Gun |
| 2 | Horsea | 30 | Water | Water Gun · Smokescreen · **Bubblebeam** · **Swift** |
| 3 | Seel | 30 | Water | Headbutt · Water Gun · **Pay Day** · **Bubblebeam** |

### Jr. Trainer♀ #25 — Route 6
_Lv 20 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Cubone | 20 | Ground | **Tackle** · Bone Club · **Bubblebeam** · Headbutt |


---

## Poké Maniac

### Poké Maniac #1 — Route 10
_Lv 30 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rhyhorn | 30 | Ground/Rock | Headbutt · Bone Club · **Rock Slide** · **Shock Wave** |
| 2 | Lickitung | 30 | Normal | Supersonic · Headbutt · **Bubblebeam** · **Tackle** |

### Poké Maniac #2 — Route 10
_Lv 20 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Cubone | 20 | Ground | **Tackle** · Bone Club · **Bubblebeam** · Headbutt |
| 2 | Slowpoke | 20 | Water/Psychic | Confusion · **Thunder Wave** · **Bubblebeam** · **Tri Attack** |

### Poké Maniac #3 — Rock Tunnel B1F
_Lv 20 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Slowpoke | 20 | Water/Psychic | Confusion · **Thunder Wave** · **Bubblebeam** · **Tri Attack** |
| 2 | Slowpoke | 20 | Water/Psychic | Confusion · **Thunder Wave** · **Bubblebeam** · **Tri Attack** |
| 3 | Slowpoke | 20 | Water/Psychic | Confusion · **Thunder Wave** · **Bubblebeam** · **Tri Attack** |

### Poké Maniac #4 — Rock Tunnel B1F
_Lv 22 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Charmander | 22 | Fire | **Tackle** · Ember · **Swift** · Headbutt |
| 2 | Cubone | 22 | Ground | **Tackle** · Bone Club · **Bubblebeam** · Headbutt |

### Poké Maniac #5 — Rock Tunnel B1F
_Lv 25 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Slowpoke | 25 | Water/Psychic | Confusion · **Thunder Wave** · Headbutt · **Bubblebeam** |

### Poké Maniac #6 — Victory Road 2F
_Lv 40 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Charmeleon | 40 | Fire | **Ember** · **Tackle** · Headbutt · Slash |
| 2 | Lapras | 40 | Water/Ice | Strength · **Bubblebeam** · **Sing** · Ice Beam |
| 3 | Lickitung | 40 | Normal | Headbutt · **Hyper Voice** · **Tackle** · **Supersonic** |

### Poké Maniac #7 — Rock Tunnel 1F
_Lv 23 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Cubone | 23 | Ground | **Tackle** · Bone Club · **Bubblebeam** · Headbutt |
| 2 | Slowpoke | 23 | Water/Psychic | Confusion · **Thunder Wave** · Headbutt · **Bubblebeam** |


---

## Super Nerd

### Super Nerd #1 — Mt. Moon 1F
_Lv 11 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magnemite | 11 | Electric/Steel | Tackle · **Shock Wave** · **Swift** · **Thunder Wave** |
| 2 | Voltorb | 11 | Electric | Tackle · **Thunder Wave** · Thundershock · **Shock Wave** |

### Super Nerd #2 — Mt. Moon B2F
_Lv 12 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Grimer | 12 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 2 | Voltorb | 12 | Electric | Tackle · **Thunder Wave** · Thundershock · **Shock Wave** |
| 3 | Koffing | 12 | Poison | Tackle · **Double Team** · **Shock Wave** · **Counter** |

### Super Nerd #3 — Route 8
_Lv 20 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Voltorb | 20 | Electric | Tackle · **Thunder Wave** · Thundershock · Sonicboom |
| 2 | Koffing | 20 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 3 | Voltorb | 20 | Electric | Tackle · **Thunder Wave** · Thundershock · Sonicboom |
| 4 | Magnemite | 20 | Electric/Steel | Tackle · **Shock Wave** · **Swift** · **Thunder Wave** |

### Super Nerd #4 — Route 8
_Lv 22 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Grimer | 22 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 2 | Muk | 22 | Poison | Tackle · **Shock Wave** · **Counter** · **Mega Drain** |
| 3 | Grimer | 22 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |

### Super Nerd #5 — Route 8
_Lv 26 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 26 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Super Nerd #6 — Unused
_Lv 22 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 22 | Poison | Tackle · Sludge |
| 2 | Magnemite | 22 | Electric/Steel | Tackle · Sonicboom |
| 3 | Weezing | 22 | Poison | Tackle · Sludge |

### Super Nerd #7 — Unused
_Lv 20 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magnemite | 20 | Electric/Steel | Tackle |
| 2 | Magnemite | 20 | Electric/Steel | Tackle |
| 3 | Koffing | 20 | Poison | Tackle · Sludge |
| 4 | Magnemite | 20 | Electric/Steel | Tackle |

### Super Nerd #8 — Unused
_Lv 24 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magnemite | 24 | Electric/Steel | Tackle · Sonicboom |
| 2 | Voltorb | 24 | Electric | Screech · Thundershock · Sonicboom · Explosion |

### Super Nerd #9 — Cinnabar Gym
_Lv 36 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Vulpix | 36 | Fire | Quick Attack · **Ember** · Confuse Ray · Flamethrower |
| 2 | Vulpix | 36 | Fire | Quick Attack · **Ember** · Confuse Ray · Flamethrower |
| 3 | Ninetales | 36 | Fire | Quick Attack · **Ember** · **Flamethrower** · Flame Burst |

### Super Nerd #10 — Cinnabar Gym
_Lv 34 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ponyta | 34 | Fire | Ember · **Strength** · Headbutt · **Flamethrower** |
| 2 | Charmander | 34 | Fire | Ember · **Tackle** · Headbutt · Slash |
| 3 | Vulpix | 34 | Fire | **Ember** · Quick Attack · **Flamethrower** · Confuse Ray |
| 4 | Growlithe | 34 | Fire | **Bite** · Ember · **Flamethrower** · **Crunch** |

### Super Nerd #11 — Cinnabar Gym
_Lv 41 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rapidash | 41 | Fire | Headbutt · **Ember** · **Flamethrower** · Flame Burst |

### Super Nerd #12 — Cinnabar Gym
_Lv 37 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Growlithe | 37 | Fire | **Bite** · Ember · **Flamethrower** · **Crunch** |
| 2 | Vulpix | 37 | Fire | Quick Attack · **Ember** · Confuse Ray · Flamethrower |


---

## Hiker

### Hiker #1 — Mt. Moon 1F
_Lv 10 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Geodude | 10 | Rock/Ground | Tackle · **Counter** · **Seismic Toss** · **Double Team** |
| 2 | Geodude | 10 | Rock/Ground | Tackle · **Counter** · **Seismic Toss** · **Double Team** |
| 3 | Onix | 10 | Rock/Ground | Tackle · Screech · **Counter** · **Double Team** |

### Hiker #2 — Route 25
_Lv 15 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 15 | Fighting | Karate Chop · **Counter** · **Seismic Toss** · **Double Team** |
| 2 | Geodude | 15 | Rock/Ground | Tackle · Defense Curl · **Counter** · **Seismic Toss** |

### Hiker #3 — Route 25
_Lv 13 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Geodude | 13 | Rock/Ground | Tackle · Defense Curl · **Counter** · **Seismic Toss** |
| 2 | Geodude | 13 | Rock/Ground | Tackle · Defense Curl · **Counter** · **Seismic Toss** |
| 3 | Machop | 13 | Fighting | Karate Chop · **Counter** · **Seismic Toss** · **Double Team** |
| 4 | Geodude | 13 | Rock/Ground | Tackle · Defense Curl · **Counter** · **Seismic Toss** |

### Hiker #4 — Route 25
_Lv 17 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Onix | 17 | Rock/Ground | Tackle · Screech · Headbutt · **Rock Slide** |

### Hiker #5 — Route 9
_Lv 21 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Geodude | 21 | Rock/Ground | Tackle · **Rock Slide** · Rock Throw · **Counter** |
| 2 | Onix | 21 | Rock/Ground | Tackle · Screech · Headbutt · Rock Throw |

### Hiker #6 — Route 9
_Lv 20 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Geodude | 20 | Rock/Ground | Tackle · **Counter** · Rock Throw · **Rock Slide** |
| 2 | Machop | 20 | Fighting | Karate Chop · Low Kick · **Rock Slide** · **Counter** |
| 3 | Geodude | 20 | Rock/Ground | Tackle · **Counter** · Rock Throw · **Rock Slide** |

### Hiker #7 — Route 10
_Lv 21 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Geodude | 21 | Rock/Ground | Tackle · **Rock Slide** · Rock Throw · **Counter** |
| 2 | Onix | 21 | Rock/Ground | Tackle · Screech · Headbutt · Rock Throw |

### Hiker #8 — Route 10
_Lv 19 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Onix | 19 | Rock/Ground | Tackle · Screech · Headbutt · Rock Throw |
| 2 | Graveler | 19 | Rock/Ground | Tackle · **Counter** · Rock Throw · **Rock Slide** |

### Hiker #9 — Rock Tunnel B1F
_Lv 21 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Geodude | 21 | Rock/Ground | Tackle · **Rock Slide** · Rock Throw · **Counter** |
| 2 | Geodude | 21 | Rock/Ground | Tackle · **Rock Slide** · Rock Throw · **Counter** |
| 3 | Graveler | 21 | Rock/Ground | Tackle · **Rock Slide** · Rock Throw · **Counter** |

### Hiker #10 — Rock Tunnel B1F
_Lv 25 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Geodude | 25 | Rock/Ground | Tackle · **Rock Slide** · Rock Throw · **Counter** |

### Hiker #11 — Route 9/Rock Tunnel B1F
_Lv 20 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 20 | Fighting | Karate Chop · Low Kick · **Rock Slide** · **Counter** |
| 2 | Onix | 20 | Rock/Ground | Tackle · Screech · Headbutt · Rock Throw |

### Hiker #12 — Rock Tunnel 1F
_Lv 19 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Geodude | 19 | Rock/Ground | Tackle · **Counter** · Rock Throw · **Rock Slide** |
| 2 | Machop | 19 | Fighting | Karate Chop · **Rock Slide** · **Counter** · **Seismic Toss** |
| 3 | Geodude | 19 | Rock/Ground | Tackle · **Counter** · Rock Throw · **Rock Slide** |
| 4 | Geodude | 19 | Rock/Ground | Tackle · **Counter** · Rock Throw · **Rock Slide** |

### Hiker #13 — Rock Tunnel 1F
_Lv 20 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Onix | 20 | Rock/Ground | Tackle · Screech · Headbutt · Rock Throw |
| 2 | Onix | 20 | Rock/Ground | Tackle · Screech · Headbutt · Rock Throw |
| 3 | Geodude | 20 | Rock/Ground | Tackle · **Counter** · Rock Throw · **Rock Slide** |

### Hiker #14 — Rock Tunnel 1F
_Lv 21 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Geodude | 21 | Rock/Ground | Tackle · **Rock Slide** · Rock Throw · **Counter** |
| 2 | Graveler | 21 | Rock/Ground | Tackle · **Rock Slide** · Rock Throw · **Counter** |


---

## Biker

### Biker #1 — Route 13
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 28 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 2 | Koffing | 28 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 3 | Koffing | 28 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Biker #2 — Route 14
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 29 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 2 | Grimer | 29 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |

### Biker #3 — Route 15
_Lv 25 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 25 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 2 | Koffing | 25 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 3 | Weezing | 25 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 4 | Koffing | 25 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 5 | Grimer | 25 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |

### Biker #4 — Route 15
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 28 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 2 | Grimer | 28 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 3 | Weezing | 28 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Biker #5 — Route 16
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Grimer | 29 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 2 | Koffing | 29 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Biker #6 — Route 16
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weezing | 33 | Poison | Tackle · Sludge · **Sludge Bomb** · **Thunderbolt** |

### Biker #7 — Route 16
_Lv 26 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Grimer | 26 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 2 | Grimer | 26 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 3 | Grimer | 26 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 4 | Grimer | 26 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |

### Biker #8 — Route 17
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weezing | 28 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 2 | Koffing | 28 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 3 | Weezing | 28 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Biker #9 — Route 17
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Muk | 33 | Poison | Tackle · **Sludge Bomb** · **Strength** · **Hyper Voice** |

### Biker #10 — Route 17
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Voltorb | 29 | Electric | Thundershock · Sonicboom · **Tackle** · **Thunder Wave** |
| 2 | Voltorb | 29 | Electric | Thundershock · Sonicboom · **Tackle** · **Thunder Wave** |

### Biker #11 — Route 17
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weezing | 29 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 2 | Muk | 29 | Poison | Tackle · **Shock Wave** · **Counter** · **Mega Drain** |

### Biker #12 — Route 17
_Lv 25 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 25 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 2 | Weezing | 25 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 3 | Koffing | 25 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 4 | Koffing | 25 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 5 | Weezing | 25 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Biker #13 — Route 14
_Lv 26 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 26 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 2 | Koffing | 26 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 3 | Grimer | 26 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 4 | Koffing | 26 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Biker #14 — Route 14
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Grimer | 28 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 2 | Grimer | 28 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 3 | Koffing | 28 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Biker #15 — Route 14
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 29 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 2 | Muk | 29 | Poison | Tackle · **Shock Wave** · **Counter** · **Mega Drain** |


---

## Burglar

### Burglar #1 — Unused
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Growlithe | 29 | Fire | Bite · Roar · Ember · Leer |
| 2 | Vulpix | 29 | Fire | Tail Whip · Quick Attack · Roar · Confuse Ray |

### Burglar #2 — Unused
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Growlithe | 33 | Fire | Roar · Ember · Leer · Double-Edge |

### Burglar #3 — Unused
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Vulpix | 28 | Fire | Tail Whip · Quick Attack · Roar · Confuse Ray |
| 2 | Charmander | 28 | Fire | Growl · Ember · Leer · Headbutt |
| 3 | Ponyta | 28 | Fire | Ember |

### Burglar #4 — Cinnabar Gym
_Lv 36 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Growlithe | 36 | Fire | **Bite** · Ember · **Flamethrower** · **Crunch** |
| 2 | Vulpix | 36 | Fire | Quick Attack · **Ember** · Confuse Ray · Flamethrower |
| 3 | Ninetales | 36 | Fire | Quick Attack · **Ember** · **Flamethrower** · Flame Burst |

### Burglar #5 — Cinnabar Gym
_Lv 41 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ponyta | 41 | Fire | **Ember** · Headbutt · **Flamethrower** · Flame Burst |

### Burglar #6 — Cinnabar Gym
_Lv 37 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Vulpix | 37 | Fire | Quick Attack · **Ember** · Confuse Ray · Flamethrower |
| 2 | Growlithe | 37 | Fire | **Bite** · Ember · **Flamethrower** · **Crunch** |

### Burglar #7 — Mansion 2F
_Lv 34 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Charmander | 34 | Fire | Ember · **Tackle** · Headbutt · Slash |
| 2 | Charmeleon | 34 | Fire | **Ember** · **Tackle** · Headbutt · Slash |

### Burglar #8 — Mansion 3F
_Lv 38 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ninetales | 38 | Fire | **Quick Attack** · **Ember** · Flame Burst · Flamethrower |

### Burglar #9 — Mansion B1F
_Lv 34 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Growlithe | 34 | Fire | **Bite** · Ember · **Flamethrower** · **Crunch** |
| 2 | Ponyta | 34 | Fire | Ember · **Strength** · Headbutt · **Flamethrower** |


---

## Engineer

### Engineer #1 — Unused
_Lv 21 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Voltorb | 21 | Electric | Tackle · Screech · Thundershock · Sonicboom |
| 2 | Magnemite | 21 | Electric/Steel | Tackle · Sonicboom |

### Engineer #2 — Route 11
_Lv 21 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magnemite | 21 | Electric/Steel | Tackle · Sonicboom · **Shock Wave** · **Thunder Wave** |

### Engineer #3 — Route 11
_Lv 18 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magnemite | 18 | Electric/Steel | Tackle · **Shock Wave** · **Swift** · **Thunder Wave** |
| 2 | Magnemite | 18 | Electric/Steel | Tackle · **Shock Wave** · **Swift** · **Thunder Wave** |
| 3 | Magneton | 18 | Electric/Steel | Sonicboom · Tackle · Thundershock · **Thunder Wave** |


---

## Fisherman

### Fisherman #1 — SS Anne 2F Rooms
_Lv 17 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Goldeen | 17 | Water | Peck · **Counter** · **Bubblebeam** · **Swift** |
| 2 | Tentacool | 17 | Water/Poison | Acid · Supersonic · Tackle · **Bubblebeam** |
| 3 | Goldeen | 17 | Water | Peck · **Counter** · **Bubblebeam** · **Swift** |

### Fisherman #2 — SS Anne B1F Rooms
_Lv 17 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Tentacool | 17 | Water/Poison | Acid · Supersonic · Tackle · **Bubblebeam** |
| 2 | Staryu | 17 | Water/Light | Tackle · Water Gun · **Bubblebeam** · **Thunder Wave** |
| 3 | Shellder | 17 | Water | Tackle · **Swift** · **Bubblebeam** · **Tri Attack** |

### Fisherman #3 — Route 12
_Lv 22 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Goldeen | 22 | Water | Peck · **Swift** · Supersonic · **Bubblebeam** |
| 2 | Poliwag | 22 | Water | Water Gun · Hypnosis · **Counter** · **Bubblebeam** |
| 3 | Goldeen | 22 | Water | Peck · **Swift** · Supersonic · **Bubblebeam** |

### Fisherman #4 — Route 12
_Lv 24 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Tentacool | 24 | Water/Poison | Supersonic · **Acid** · Poison Sting · Water Gun |
| 2 | Goldeen | 24 | Water | Peck · **Bubblebeam** · Supersonic · Headbutt |

### Fisherman #5 — Route 12
_Lv 27 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Goldeen | 27 | Water | Peck · **Bubblebeam** · Supersonic · Headbutt |

### Fisherman #6 — Route 12
_Lv 21 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Poliwag | 21 | Water | Water Gun · Hypnosis · **Counter** · **Bubblebeam** |
| 2 | Shellder | 21 | Water | Tackle · **Tri Attack** · Supersonic · **Bubblebeam** |
| 3 | Goldeen | 21 | Water | Peck · **Swift** · Supersonic · **Bubblebeam** |
| 4 | Horsea | 21 | Water | Water Gun · Smokescreen · **Swift** · **Bubblebeam** |

### Fisherman #7 — Route 21
_Lv 28 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Seaking | 28 | Water | Supersonic · **Peck** · Razor Shell · Headbutt |
| 2 | Goldeen | 28 | Water | Peck · **Bubblebeam** · Supersonic · Headbutt |
| 3 | Seaking | 28 | Water | Supersonic · **Peck** · Razor Shell · Headbutt |
| 4 | Seaking | 28 | Water | Supersonic · **Peck** · Razor Shell · Headbutt |

### Fisherman #8 — Route 21
_Lv 31 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Shellder | 31 | Water | **Tackle** · Supersonic · Razor Shell · Aurora Beam |
| 2 | Cloyster | 31 | Water/Ice | Razor Shell · Supersonic · **Aurora Beam** · Ice Fang |

### Fisherman #9 — Route 21
_Lv 27 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magikarp | 27 | Water | Splash · Tackle |
| 2 | Magikarp | 27 | Water | Splash · Tackle |
| 3 | Magikarp | 27 | Water | Splash · Tackle |
| 4 | Magikarp | 27 | Water | Splash · Tackle |
| 5 | Magikarp | 27 | Water | Splash · Tackle |
| 6 | Magikarp | 27 | Water | Splash · Tackle |

### Fisherman #10 — Route 21
_Lv 33 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Seaking | 33 | Water | Supersonic · **Peck** · Razor Shell · Headbutt |
| 2 | Goldeen | 33 | Water | Peck · **Surf** · Supersonic · Headbutt |

### Fisherman #11 — Route 12
_Lv 24 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magikarp | 24 | Water | Splash · Tackle |
| 2 | Magikarp | 24 | Water | Splash · Tackle |


---

## Swimmer

### Swimmer #1 — Cerulean Gym
_Lv 16 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Horsea | 16 | Water | Water Gun · **Swift** · **Bubblebeam** · **Counter** |
| 2 | Shellder | 16 | Water | Tackle · **Swift** · **Bubblebeam** · **Tri Attack** |

### Swimmer #2 — Route 19
_Lv 30 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Tentacool | 30 | Water/Poison | Supersonic · **Acid** · Poison Sting · Water Gun |
| 2 | Shellder | 30 | Water | **Tackle** · Supersonic · Razor Shell · Aurora Beam |

### Swimmer #3 — Route 19
_Lv 29 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Goldeen | 29 | Water | Peck · **Bubblebeam** · Supersonic · Headbutt |
| 2 | Horsea | 29 | Water | Water Gun · Smokescreen · **Bubblebeam** · **Swift** |
| 3 | Staryu | 29 | Water/Light | Water Gun · **Tackle** · **Thunder Wave** · Light Ray |

### Swimmer #4 — Route 19
_Lv 30 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Poliwag | 30 | Water | Water Gun · Hypnosis · Tackle · **Bubblebeam** |
| 2 | Poliwhirl | 30 | Water | Water Gun · Hypnosis · Razor Shell · Tackle |

### Swimmer #5 — Route 19
_Lv 27 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Horsea | 27 | Water | Water Gun · Smokescreen · **Bubblebeam** · **Swift** |
| 2 | Tentacool | 27 | Water/Poison | Supersonic · **Acid** · Poison Sting · Water Gun |
| 3 | Tentacool | 27 | Water/Poison | Supersonic · **Acid** · Poison Sting · Water Gun |
| 4 | Goldeen | 27 | Water | Peck · **Bubblebeam** · Supersonic · Headbutt |

### Swimmer #6 — Route 19
_Lv 29 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Goldeen | 29 | Water | Peck · **Bubblebeam** · Supersonic · Headbutt |
| 2 | Shellder | 29 | Water | Tackle · **Bubblebeam** · Supersonic · Razor Shell |
| 3 | Seaking | 29 | Water | Supersonic · **Peck** · Razor Shell · Headbutt |

### Swimmer #7 — Route 19
_Lv 30 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Horsea | 30 | Water | Water Gun · Smokescreen · **Bubblebeam** · **Swift** |
| 2 | Horsea | 30 | Water | Water Gun · Smokescreen · **Bubblebeam** · **Swift** |

### Swimmer #8 — Route 19
_Lv 27 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Tentacool | 27 | Water/Poison | Supersonic · **Acid** · Poison Sting · Water Gun |
| 2 | Tentacool | 27 | Water/Poison | Supersonic · **Acid** · Poison Sting · Water Gun |
| 3 | Staryu | 27 | Water/Light | Tackle · Water Gun · **Bubblebeam** · **Thunder Wave** |
| 4 | Horsea | 27 | Water | Water Gun · Smokescreen · **Bubblebeam** · **Swift** |
| 5 | Tentacruel | 27 | Water/Poison | **Acid** · Supersonic · Poison Sting · Bubblebeam |

### Swimmer #9 — Route 20
_Lv 31 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Shellder | 31 | Water | **Tackle** · Supersonic · Razor Shell · Aurora Beam |
| 2 | Cloyster | 31 | Water/Ice | Razor Shell · Supersonic · **Aurora Beam** · Ice Fang |

### Swimmer #10 — Route 20
_Lv 35 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Staryu | 35 | Water/Light | **Water Gun** · **Thunder Wave** · Light Ray · Swift |

### Swimmer #11 — Route 20
_Lv 28 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Horsea | 28 | Water | Water Gun · Smokescreen · **Bubblebeam** · **Swift** |
| 2 | Horsea | 28 | Water | Water Gun · Smokescreen · **Bubblebeam** · **Swift** |
| 3 | Seadra | 28 | Water | Water Gun · Smokescreen · Bubblebeam · **Swift** |
| 4 | Horsea | 28 | Water | Water Gun · Smokescreen · **Bubblebeam** · **Swift** |

### Swimmer #12 — Route 21
_Lv 33 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Seadra | 33 | Water | Water Gun · Smokescreen · Bubblebeam · **Dragon Pulse** |
| 2 | Tentacruel | 33 | Water/Poison | Supersonic · **Acid** · Bubblebeam · Sludge |

### Swimmer #13 — Route 21
_Lv 37 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Starmie | 37 | Water/Light | **Light Ray** · **Thunder Wave** · Bubblebeam · Aurora Beam |

### Swimmer #14 — Route 21
_Lv 33 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Staryu | 33 | Water/Light | **Water Gun** · **Thunder Wave** · Light Ray · Swift |
| 2 | Wartortle | 33 | Water | **Water Gun** · Bubblebeam · Bite · **Tackle** |

### Swimmer #15 — Route 21
_Lv 32 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Poliwhirl | 32 | Water | Water Gun · Hypnosis · Razor Shell · Tackle |
| 2 | Tentacool | 32 | Water/Poison | Supersonic · **Acid** · Poison Sting · Water Gun |
| 3 | Seadra | 32 | Water | Water Gun · Smokescreen · Bubblebeam · **Dragon Pulse** |


---

## Cue Ball

### Cue Ball #1 — Route 16
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 28 | Fighting | Karate Chop · Low Kick · **Counter** · **Rock Slide** |
| 2 | Mankey | 28 | Fighting | **Tackle** · Low Kick · Slash · **Rock Slide** |
| 3 | Machop | 28 | Fighting | Karate Chop · Low Kick · **Counter** · **Rock Slide** |

### Cue Ball #2 — Route 16
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Mankey | 29 | Fighting | **Tackle** · Low Kick · Slash · **Rock Slide** |
| 2 | Machop | 29 | Fighting | Karate Chop · Low Kick · **Counter** · **Rock Slide** |

### Cue Ball #3 — Route 16
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 33 | Fighting | Karate Chop · Low Kick · **Earthquake** · **Aura Sphere** |

### Cue Ball #4 — Route 17
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Mankey | 29 | Fighting | **Tackle** · Low Kick · Slash · **Rock Slide** |
| 2 | Primeape | 29 | Fighting | **Low Kick** · Slash · **Karate Chop** · Headbutt |

### Cue Ball #5 — Route 17
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 29 | Fighting | Karate Chop · Low Kick · **Counter** · **Rock Slide** |
| 2 | Machoke | 29 | Fighting | Karate Chop · Low Kick · **Counter** · **Rock Slide** |

### Cue Ball #6 — Route 17
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machoke | 33 | Fighting | Karate Chop · Low Kick · **Aura Sphere** · **Earthquake** |

### Cue Ball #7 — Route 17
_Lv 26 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Mankey | 26 | Fighting | Tackle · **Rock Slide** · Low Kick · Slash |
| 2 | Mankey | 26 | Fighting | Tackle · **Rock Slide** · Low Kick · Slash |
| 3 | Machoke | 26 | Fighting | Karate Chop · Low Kick · **Counter** · **Rock Slide** |
| 4 | Machop | 26 | Fighting | Karate Chop · Low Kick · **Counter** · **Rock Slide** |

### Cue Ball #8 — Route 17
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Primeape | 29 | Fighting | **Low Kick** · Slash · **Karate Chop** · Headbutt |
| 2 | Machoke | 29 | Fighting | Karate Chop · Low Kick · **Counter** · **Rock Slide** |

### Cue Ball #9 — Route 21
_Lv 31 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Tentacool | 31 | Water/Poison | Supersonic · **Acid** · Poison Sting · Water Gun |
| 2 | Tentacool | 31 | Water/Poison | Supersonic · **Acid** · Poison Sting · Water Gun |
| 3 | Tentacruel | 31 | Water/Poison | Supersonic · **Acid** · Bubblebeam · Sludge |


---

## Gambler

### Gambler #1 — Route 11
_Lv 18 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Poliwag | 18 | Water | Water Gun · Hypnosis · **Counter** · **Bubblebeam** |
| 2 | Horsea | 18 | Water | Water Gun · **Swift** · **Bubblebeam** · **Counter** |

### Gambler #2 — Route 11
_Lv 18 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Bellsprout | 18 | Grass/Poison | **Vine Whip** · Tackle · **Mega Drain** · Sleep Powder |
| 2 | Oddish | 18 | Grass/Poison | Mega Drain · **Counter** · Stun Spore · **Cut** |

### Gambler #3 — Route 11
_Lv 18 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Voltorb | 18 | Electric | Tackle · **Thunder Wave** · Thundershock · Sonicboom |
| 2 | Magnemite | 18 | Electric/Steel | Tackle · **Shock Wave** · **Swift** · **Thunder Wave** |

### Gambler #4 — Route 11
_Lv 18 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Growlithe | 18 | Fire | Bite · **Counter** · Ember · **Swift** |
| 2 | Vulpix | 18 | Fire | Ember · **Counter** · Quick Attack · **Swift** |

### Gambler #5 — Route 8
_Lv 22 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Poliwag | 22 | Water | Water Gun · Hypnosis · **Counter** · **Bubblebeam** |
| 2 | Poliwag | 22 | Water | Water Gun · Hypnosis · **Counter** · **Bubblebeam** |
| 3 | Poliwhirl | 22 | Water | Water Gun · Hypnosis · Razor Shell · **Counter** |

### Gambler #6 — Unused
_Lv 22 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Onix | 22 | Rock/Ground | Screech · Headbutt · Rock Throw · Rock Slide |
| 2 | Geodude | 22 | Rock/Ground | Tackle · Defense Curl · Rock Throw · Explosion |
| 3 | Graveler | 22 | Rock/Ground | Defense Curl · Rock Throw · Explosion · Rock Slide |

### Gambler #7 — Route 8
_Lv 24 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Growlithe | 24 | Fire | Bite · **Swift** · Ember · **Counter** |
| 2 | Vulpix | 24 | Fire | Ember · **Swift** · Quick Attack · **Counter** |


---

## Beauty

### Beauty #1 — Celadon Gym
_Lv 21 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Oddish | 21 | Grass/Poison | Mega Drain · **Cut** · **Counter** · Sleep Powder |
| 2 | Bellsprout | 21 | Grass/Poison | Tackle · **Vine Whip** · Sleep Powder · **Mega Drain** |
| 3 | Oddish | 21 | Grass/Poison | Mega Drain · **Cut** · **Counter** · Sleep Powder |
| 4 | Bellsprout | 21 | Grass/Poison | Tackle · **Vine Whip** · Sleep Powder · **Mega Drain** |

### Beauty #2 — Celadon Gym
_Lv 24 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Bellsprout | 24 | Grass/Poison | Tackle · **Vine Whip** · Sleep Powder · **Mega Drain** |
| 2 | Bellsprout | 24 | Grass/Poison | Tackle · **Vine Whip** · Sleep Powder · **Mega Drain** |

### Beauty #3 — Celadon Gym
_Lv 26 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Exeggcute | 26 | Grass/Psychic | Tackle · Hypnosis · Leafage · **Mega Drain** |

### Beauty #4 — Route 13
_Lv 27 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 27 | Normal | **Tackle** · Quick Attack · Bite · **Tri Attack** |
| 2 | Vulpix | 27 | Fire | Ember · **Swift** · Quick Attack · **Counter** |
| 3 | Rattata | 27 | Normal | **Tackle** · Quick Attack · Bite · **Tri Attack** |

### Beauty #5 — Route 13
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Clefairy | 29 | Fairy | Tackle · **Bubblebeam** · Sing · **Tri Attack** |
| 2 | Meowth | 29 | Normal | **Tackle** · Bite · Pay Day · Screech |

### Beauty #6 — Route 20
_Lv 35 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Seaking | 35 | Water | Supersonic · **Peck** · Razor Shell · Headbutt |

### Beauty #7 — Route 20
_Lv 30 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Shellder | 30 | Water | **Tackle** · Supersonic · Razor Shell · Aurora Beam |
| 2 | Shellder | 30 | Water | **Tackle** · Supersonic · Razor Shell · Aurora Beam |
| 3 | Cloyster | 30 | Water/Ice | Razor Shell · Supersonic · **Aurora Beam** · Ice Fang |

### Beauty #8 — Route 20
_Lv 31 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Poliwag | 31 | Water | Water Gun · Hypnosis · Tackle · Strength |
| 2 | Seaking | 31 | Water | Supersonic · **Peck** · Razor Shell · Headbutt |

### Beauty #9 — Route 15
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgeotto | 29 | Normal/Flying | **Gust** · Quick Attack · **Sand-Attack** · Headbutt |
| 2 | Wigglytuff | 29 | Sound/Fairy | Round · **Tackle** · **Bubblebeam** · Sing |

### Beauty #10 — Route 15
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Bulbasaur | 29 | Grass/Poison | Leech Seed · Vine Whip · **Tackle** · Razor Leaf |
| 2 | Ivysaur | 29 | Grass/Poison | **Tackle** · Leech Seed · Vine Whip · **Mega Drain** |

### Beauty #11 — Unused
_Lv 33 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weepinbell | 33 | Grass/Poison | Sleep Powder · Stun Spore · Acid · Cross Poison |
| 2 | Bellsprout | 33 | Grass/Poison | Sleep Powder · Stun Spore · Acid · Razor Leaf |
| 3 | Weepinbell | 33 | Grass/Poison | Sleep Powder · Stun Spore · Acid · Cross Poison |

### Beauty #12 — Route 19
_Lv 27 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Poliwag | 27 | Water | Water Gun · Hypnosis · Tackle · **Bubblebeam** |
| 2 | Goldeen | 27 | Water | Peck · **Bubblebeam** · Supersonic · Headbutt |
| 3 | Seaking | 27 | Water | Supersonic · **Peck** · Razor Shell · Headbutt |
| 4 | Goldeen | 27 | Water | Peck · **Bubblebeam** · Supersonic · Headbutt |
| 5 | Poliwag | 27 | Water | Water Gun · Hypnosis · Tackle · **Bubblebeam** |

### Beauty #13 — Route 19
_Lv 30 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Goldeen | 30 | Water | Peck · **Bubblebeam** · Supersonic · Headbutt |
| 2 | Seaking | 30 | Water | Supersonic · **Peck** · Razor Shell · Headbutt |

### Beauty #14 — Route 19
_Lv 29 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Staryu | 29 | Water/Light | Water Gun · **Tackle** · **Thunder Wave** · Light Ray |
| 2 | Staryu | 29 | Water/Light | Water Gun · **Tackle** · **Thunder Wave** · Light Ray |
| 3 | Staryu | 29 | Water/Light | Water Gun · **Tackle** · **Thunder Wave** · Light Ray |

### Beauty #15 — Route 20
_Lv 30 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Seadra | 30 | Water | Water Gun · Smokescreen · Bubblebeam · **Swift** |
| 2 | Horsea | 30 | Water | Water Gun · Smokescreen · **Bubblebeam** · **Swift** |
| 3 | Seadra | 30 | Water | Water Gun · Smokescreen · Bubblebeam · **Swift** |


---

## Psychic

### Psychic #1 — Saffron Gym
_Lv 31 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Kadabra | 31 | Psychic | Confusion · **Tackle** · Psybeam · **Kinesis** |
| 2 | Slowpoke | 31 | Water/Psychic | Confusion · **Psychic** · Headbutt · **Thunder Wave** |
| 3 | Mr. Mime | 31 | Psychic/Fairy | Psybeam · **Confusion** · Drain Kiss · **Thunder Wave** |
| 4 | Kadabra | 31 | Psychic | Confusion · **Tackle** · Psybeam · **Kinesis** |

### Psychic #2 — Saffron Gym
_Lv 34 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Mr. Mime | 34 | Psychic/Fairy | Psybeam · **Confusion** · Drain Kiss · **Thunder Wave** |
| 2 | Kadabra | 34 | Psychic | Confusion · **Tackle** · Psybeam · **Kinesis** |

### Psychic #3 — Saffron Gym
_Lv 33 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Slowpoke | 33 | Water/Psychic | **Confusion** · Headbutt · **Thunder Wave** · Water Gun |
| 2 | Slowpoke | 33 | Water/Psychic | **Confusion** · Headbutt · **Thunder Wave** · Water Gun |
| 3 | Slowbro | 33 | Water/Psychic | **Confusion** · Bubblebeam · **Thunder Wave** · Psybeam |

### Psychic #4 — Saffron Gym
_Lv 38 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Slowbro | 38 | Water/Psychic | Bubblebeam · **Confusion** · Psybeam · **Thunder Wave** |


---

## Rocker

### Rocker #1 — Vermilion Gym
_Lv 20 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Voltorb | 20 | Electric | Tackle · **Thunder Wave** · Thundershock · Sonicboom |
| 2 | Voltorb | 20 | Electric | Tackle · **Thunder Wave** · Thundershock · Sonicboom |
| 3 | Voltorb | 20 | Electric | Tackle · **Thunder Wave** · Thundershock · Sonicboom |

### Rocker #2 — Route 12
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Voltorb | 29 | Electric | Thundershock · Sonicboom · **Tackle** · **Thunder Wave** |
| 2 | Electrode | 29 | Electric | Thundershock · **Sonicboom** · Shock Wave · **Thunder Wave** |


---

## Juggler

### Juggler #1 — Silph Co. 5F
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Kadabra | 29 | Psychic | **Tackle** · Confusion · **Kinesis** · Psybeam |
| 2 | Mr. Mime | 29 | Psychic/Fairy | Confusion · **Shock Wave** · Psybeam · **Thunder Wave** |

### Juggler #2 — Victory Road 2F
_Lv 41 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Drowzee | 41 | Psychic | Headbutt · **Confusion** · Psychic · **Hypnosis** |
| 2 | Hypno | 41 | Psychic | Psybeam · Headbutt · **Hypnosis** · Psychic |
| 3 | Kadabra | 41 | Psychic | **Tackle** · Psybeam · **Kinesis** · Psychic |
| 4 | Kadabra | 41 | Psychic | **Tackle** · Psybeam · **Kinesis** · Psychic |

### Juggler #3 — Fuchsia Gym
_Lv 31 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Drowzee | 31 | Psychic | **Tackle** · Confusion · Headbutt · **Hypnosis** |
| 2 | Drowzee | 31 | Psychic | **Tackle** · Confusion · Headbutt · **Hypnosis** |
| 3 | Kadabra | 31 | Psychic | Confusion · **Tackle** · Psybeam · **Kinesis** |
| 4 | Drowzee | 31 | Psychic | **Tackle** · Confusion · Headbutt · **Hypnosis** |

### Juggler #4 — Fuchsia Gym
_Lv 34 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Drowzee | 34 | Psychic | Confusion · Headbutt · **Hypnosis** · Psychic |
| 2 | Hypno | 34 | Psychic | Hypnosis · Psybeam · Headbutt · **Confusion** |

### Juggler #5 — Victory Road 2F
_Lv 48 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Mr. Mime | 48 | Psychic/Fairy | Drain Kiss · **Psybeam** · **Confusion** · **Thunder Wave** |

### Juggler #6 — Unused
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Hypno | 33 | Psychic | Hypnosis · Psybeam · Headbutt · Poison Gas |

### Juggler #7 — Fuchsia Gym
_Lv 38 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Hypno | 38 | Psychic | Psybeam · Headbutt · **Hypnosis** · Psychic |

### Juggler #8 — Fuchsia Gym
_Lv 34 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Drowzee | 34 | Psychic | Confusion · Headbutt · **Hypnosis** · Psychic |
| 2 | Kadabra | 34 | Psychic | Confusion · **Tackle** · Psybeam · **Kinesis** |


---

## Tamer

### Tamer #1 — Fuchsia Gym
_Lv 34 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandslash | 34 | Ground | Sand-Attack · Bulldoze · Slash · Poison Sting |
| 2 | Arbok | 34 | Poison | **Poison Sting** · Bite · Cross Poison · Glare |

### Tamer #2 — Fuchsia Gym
_Lv 33 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Arbok | 33 | Poison | **Poison Sting** · Bite · Cross Poison · Glare |
| 2 | Sandslash | 33 | Ground | Sand-Attack · Bulldoze · Slash · Poison Sting |
| 3 | Arbok | 33 | Poison | **Poison Sting** · Bite · Cross Poison · Glare |

### Tamer #3 — Viridian Gym
_Lv 43 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rhyhorn | 43 | Ground/Rock | Headbutt · Bone Club · **Stone Edge** · **Earthquake** |

### Tamer #4 — Viridian Gym
_Lv 39 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Arbok | 39 | Poison | Bite · Cross Poison · Glare · **Poison Sting** |
| 2 | Tauros | 39 | Normal | Tackle · Headbutt · **Earthquake** · **Strength** |

### Tamer #5 — Victory Road 2F
_Lv 44 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Persian | 44 | Normal | **Bite** · Headbutt · **Screech** · Strength |
| 2 | Golduck | 44 | Water | **Tackle** · Water Gun · Bubblebeam · Confusion |

### Tamer #6 — Unused
_Lv 42 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rhyhorn | 42 | Ground/Rock | Headbutt · Bone Club · Tail Whip |
| 2 | Primeape | 42 | Fighting | Slash · Focus Energy · Headbutt · Seismic Toss |
| 3 | Arbok | 42 | Poison | Bite · Cross Poison · Glare · Screech |
| 4 | Tauros | 42 | Normal | Tackle · Headbutt · Tail Whip · Leer |


---

## Bird Keeper

### Bird Keeper #1 — Route 13
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 29 | Normal/Flying | Tackle · Quick Attack · **Sand-Attack** · Wing Attack |
| 2 | Pidgeotto | 29 | Normal/Flying | **Gust** · Quick Attack · **Sand-Attack** · Headbutt |

### Bird Keeper #2 — Route 13
_Lv 25 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Spearow | 25 | Normal/Flying | **Peck** · **Tri Attack** · Tackle · **Pay Day** |
| 2 | Pidgey | 25 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 3 | Pidgey | 25 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 4 | Spearow | 25 | Normal/Flying | **Peck** · **Tri Attack** · Tackle · **Pay Day** |
| 5 | Spearow | 25 | Normal/Flying | **Peck** · **Tri Attack** · Tackle · **Pay Day** |

### Bird Keeper #3 — Route 13
_Lv 26 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 26 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 2 | Pidgeotto | 26 | Normal/Flying | **Gust** · Quick Attack · **Sand-Attack** · Headbutt |
| 3 | Spearow | 26 | Normal/Flying | **Peck** · **Tri Attack** · Tackle · **Pay Day** |
| 4 | Fearow | 26 | Normal/Flying | **Peck** · Tackle · Headbutt · **Tri Attack** |

### Bird Keeper #4 — Route 14
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Farfetch'd | 33 | Normal/Flying | Headbutt · Swords Dance · Wing Attack · **Peck** |

### Bird Keeper #5 — Route 14
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Spearow | 29 | Normal/Flying | **Peck** · Tackle · **Tri Attack** · **Pay Day** |
| 2 | Fearow | 29 | Normal/Flying | **Peck** · Tackle · Headbutt · **Tri Attack** |

### Bird Keeper #6 — Route 15
_Lv 26 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgeotto | 26 | Normal/Flying | **Gust** · Quick Attack · **Sand-Attack** · Headbutt |
| 2 | Farfetch'd | 26 | Normal/Flying | **Peck** · Tackle · Headbutt · Swords Dance |
| 3 | Doduo | 26 | Normal/Flying | Peck · **Pay Day** · Tackle · **Tri Attack** |
| 4 | Pidgey | 26 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |

### Bird Keeper #7 — Route 15
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Dodrio | 28 | Normal/Flying | Peck · Tackle · **Pay Day** · **Tri Attack** |
| 2 | Doduo | 28 | Normal/Flying | Peck · **Pay Day** · Tackle · **Tri Attack** |
| 3 | Doduo | 28 | Normal/Flying | Peck · **Pay Day** · Tackle · **Tri Attack** |

### Bird Keeper #8 — Route 18
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Spearow | 29 | Normal/Flying | **Peck** · Tackle · **Tri Attack** · **Pay Day** |
| 2 | Fearow | 29 | Normal/Flying | **Peck** · Tackle · Headbutt · **Tri Attack** |

### Bird Keeper #9 — Route 18
_Lv 34 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Dodrio | 34 | Normal/Flying | Peck · Tackle · **Strength** · Drill Peck |

### Bird Keeper #10 — Route 18
_Lv 26 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Spearow | 26 | Normal/Flying | **Peck** · **Tri Attack** · Tackle · **Pay Day** |
| 2 | Spearow | 26 | Normal/Flying | **Peck** · **Tri Attack** · Tackle · **Pay Day** |
| 3 | Fearow | 26 | Normal/Flying | **Peck** · Tackle · Headbutt · **Tri Attack** |
| 4 | Spearow | 26 | Normal/Flying | **Peck** · **Tri Attack** · Tackle · **Pay Day** |

### Bird Keeper #11 — Route 20
_Lv 30 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Fearow | 30 | Normal/Flying | Tackle · Headbutt · **Peck** · Wing Attack |
| 2 | Fearow | 30 | Normal/Flying | Tackle · Headbutt · **Peck** · Wing Attack |
| 3 | Pidgeotto | 30 | Normal/Flying | **Gust** · Quick Attack · **Sand-Attack** · Headbutt |

### Bird Keeper #12 — Unused
_Lv 39 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgeotto | 39 | Normal/Flying | Quick Attack · Whirlwind · Headbutt · Wing Attack |
| 2 | Pidgeotto | 39 | Normal/Flying | Quick Attack · Whirlwind · Headbutt · Wing Attack |
| 3 | Pidgey | 39 | Normal/Flying | Quick Attack · Whirlwind · Wing Attack · Agility |
| 4 | Pidgeotto | 39 | Normal/Flying | Quick Attack · Whirlwind · Headbutt · Wing Attack |

### Bird Keeper #13 — Unused
_Lv 42 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Farfetch'd | 42 | Normal/Flying | Swords Dance · Wing Attack · Agility · Slash |
| 2 | Fearow | 42 | Normal/Flying | Headbutt · Mirror Move · Wing Attack · Drill Peck |

### Bird Keeper #14 — Route 14
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 28 | Normal/Flying | Tackle · Quick Attack · **Sand-Attack** · Wing Attack |
| 2 | Doduo | 28 | Normal/Flying | Peck · **Pay Day** · Tackle · **Tri Attack** |
| 3 | Pidgeotto | 28 | Normal/Flying | **Gust** · Quick Attack · **Sand-Attack** · Headbutt |

### Bird Keeper #15 — Route 14
_Lv 26 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgey | 26 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 2 | Spearow | 26 | Normal/Flying | **Peck** · **Tri Attack** · Tackle · **Pay Day** |
| 3 | Pidgey | 26 | Normal/Flying | Sand-Attack · Tackle · Quick Attack · **Gust** |
| 4 | Fearow | 26 | Normal/Flying | **Peck** · Tackle · Headbutt · **Tri Attack** |

### Bird Keeper #16 — Route 14
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Pidgeotto | 29 | Normal/Flying | **Gust** · Quick Attack · **Sand-Attack** · Headbutt |
| 2 | Fearow | 29 | Normal/Flying | **Peck** · Tackle · Headbutt · **Tri Attack** |

### Bird Keeper #17 — Route 14
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Spearow | 28 | Normal/Flying | **Peck** · **Tri Attack** · Tackle · **Pay Day** |
| 2 | Doduo | 28 | Normal/Flying | Peck · **Pay Day** · Tackle · **Tri Attack** |
| 3 | Fearow | 28 | Normal/Flying | **Peck** · Tackle · Headbutt · **Tri Attack** |


---

## Blackbelt

### Blackbelt #1 — Fighting Dojo
_Lv 37 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Hitmonlee | 37 | Fighting | Low Kick · Meditate · **Stone Edge** · **Aura Sphere** |
| 2 | Hitmonchan | 37 | Fighting | Agility · Karate Chop · Low Kick · Fire Punch |

### Blackbelt #2 — Fighting Dojo
_Lv 31 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Mankey | 31 | Fighting | **Tackle** · Low Kick · Slash · **Aura Sphere** |
| 2 | Mankey | 31 | Fighting | **Tackle** · Low Kick · Slash · **Aura Sphere** |
| 3 | Primeape | 31 | Fighting | **Low Kick** · Slash · **Karate Chop** · Headbutt |

### Blackbelt #3 — Fighting Dojo
_Lv 32 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 32 | Fighting | Karate Chop · Low Kick · **Earthquake** · **Aura Sphere** |
| 2 | Machoke | 32 | Fighting | Karate Chop · Low Kick · **Aura Sphere** · **Earthquake** |

### Blackbelt #4 — Fighting Dojo
_Lv 36 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Primeape | 36 | Fighting | **Low Kick** · Slash · **Karate Chop** · Headbutt |

### Blackbelt #5 — Fighting Dojo
_Lv 31 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 31 | Fighting | Karate Chop · Low Kick · **Aura Sphere** · **Earthquake** |
| 2 | Mankey | 31 | Fighting | **Tackle** · Low Kick · Slash · **Aura Sphere** |
| 3 | Primeape | 31 | Fighting | **Low Kick** · Slash · **Karate Chop** · Headbutt |

### Blackbelt #6 — Viridian Gym
_Lv 40 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 40 | Fighting | Low Kick · **Earthquake** · **Karate Chop** · Seismic Toss |
| 2 | Machoke | 40 | Fighting | Karate Chop · Low Kick · **Earthquake** · **Aura Sphere** |

### Blackbelt #7 — Viridian Gym
_Lv 43 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machoke | 43 | Fighting | Karate Chop · Low Kick · **Earthquake** · **Aura Sphere** |

### Blackbelt #8 — Viridian Gym
_Lv 38 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machoke | 38 | Fighting | Karate Chop · Low Kick · **Earthquake** · **Aura Sphere** |
| 2 | Machop | 38 | Fighting | Karate Chop · Low Kick · **Earthquake** · **Aura Sphere** |
| 3 | Machoke | 38 | Fighting | Karate Chop · Low Kick · **Earthquake** · **Aura Sphere** |

### Blackbelt #9 — Victory Road 2F
_Lv 43 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machoke | 43 | Fighting | Karate Chop · Low Kick · **Earthquake** · **Aura Sphere** |
| 2 | Machop | 43 | Fighting | Low Kick · **Earthquake** · **Karate Chop** · Seismic Toss |
| 3 | Machoke | 43 | Fighting | Karate Chop · Low Kick · **Earthquake** · **Aura Sphere** |


---

## Rival (early)

### Rival (early) #1 — Oak's Lab
_Lv 5 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Eevee | 5 | Normal | Tackle · Tail Whip |

### Rival (early) #2 — Route 22
_Lv 8–9 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Spearow | 9 | Normal/Flying | Peck · Growl · Leer |
| 2 | Eevee | 8 | Normal | Tackle · Tail Whip · Sand-Attack |

### Rival (early) #3 — Cerulean City
_Lv 15–18 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Spearow | 18 | Normal/Flying | Peck · Growl · Leer · Tackle |
| 2 | Sandshrew | 15 | Ground | Tackle · Sand-Attack |
| 3 | Rattata | 15 | Normal | Tackle · Tail Whip · Quick Attack · Bite |
| 4 | Eevee | 17 | Normal | Tackle · Tail Whip · Sand-Attack · Growl |


---

## Prof. Oak

### Prof. Oak #1 — Unused
_Lv 66–70 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Tauros | 66 | Normal | Headbutt · Tail Whip · Leer · Double-Edge |
| 2 | Exeggutor | 67 | Grass/Psychic | Mega Drain · Headbutt · Psybeam · Energy Ball |
| 3 | Arcanine | 68 | Fire | Leer · Roar · Fire Fang · Fire Punch |
| 4 | Blastoise | 69 | Water | Bite · Withdraw · Double-Edge · Hydro Pump |
| 5 | Gyarados | 70 | Water/Flying | Crunch · Hydro Pump · Hyper Beam · Waterfall |

### Prof. Oak #2 — Unused
_Lv 66–70 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Tauros | 66 | Normal | Headbutt · Tail Whip · Leer · Double-Edge |
| 2 | Exeggutor | 67 | Grass/Psychic | Mega Drain · Headbutt · Psybeam · Energy Ball |
| 3 | Arcanine | 68 | Fire | Leer · Roar · Fire Fang · Fire Punch |
| 4 | Venusaur | 69 | Grass/Poison | Growth · Energy Ball · Sleep Powder · Solarbeam |
| 5 | Gyarados | 70 | Water/Flying | Crunch · Hydro Pump · Hyper Beam · Waterfall |

### Prof. Oak #3 — Unused
_Lv 66–70 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Tauros | 66 | Normal | Headbutt · Tail Whip · Leer · Double-Edge |
| 2 | Exeggutor | 67 | Grass/Psychic | Mega Drain · Headbutt · Psybeam · Energy Ball |
| 3 | Arcanine | 68 | Fire | Leer · Roar · Fire Fang · Fire Punch |
| 4 | Charizard | 69 | Fire/Flying | Headbutt · Air Cutter · Slash · Flamethrower |
| 5 | Gyarados | 70 | Water/Flying | Crunch · Hydro Pump · Hyper Beam · Waterfall |


---

## Scientist

### Scientist #1 — Unused
_Lv 34 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 34 | Poison | Tackle · Sludge |
| 2 | Voltorb | 34 | Electric | Thundershock · Sonicboom · Explosion · Light Screen |

### Scientist #2 — Silph Co. 2F
_Lv 26 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Grimer | 26 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 2 | Weezing | 26 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 3 | Koffing | 26 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 4 | Weezing | 26 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Scientist #3 — Silph Co. 2F
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magnemite | 28 | Electric/Steel | **Thunder Wave** · Sonicboom · Thundershock · Mirror Shot |
| 2 | Voltorb | 28 | Electric | **Tackle** · Thundershock · Sonicboom · **Thunder Wave** |
| 3 | Magneton | 28 | Electric/Steel | Sonicboom · **Thunder Wave** · Thundershock · Shock Wave |

### Scientist #4 — Silph Co. 3F/Mansion 1F
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Electrode | 29 | Electric | Thundershock · **Sonicboom** · Shock Wave · **Thunder Wave** |
| 2 | Weezing | 29 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Scientist #5 — Silph Co. 4F
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Electrode | 33 | Electric | Thundershock · **Sonicboom** · Shock Wave · **Thunder Wave** |

### Scientist #6 — Silph Co. 5F
_Lv 26 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magneton | 26 | Electric/Steel | Sonicboom · **Thunder Wave** · Thundershock · Shock Wave |
| 2 | Koffing | 26 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 3 | Weezing | 26 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 4 | Magnemite | 26 | Electric/Steel | Tackle · Sonicboom · Thundershock · **Thunder Wave** |

### Scientist #7 — Silph Co. 6F
_Lv 25 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Voltorb | 25 | Electric | **Tackle** · Thundershock · Sonicboom · **Thunder Wave** |
| 2 | Koffing | 25 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 3 | Magneton | 25 | Electric/Steel | Sonicboom · **Thunder Wave** · Thundershock · Shock Wave |
| 4 | Magnemite | 25 | Electric/Steel | Tackle · Sonicboom · Thundershock · **Thunder Wave** |
| 5 | Koffing | 25 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Scientist #8 — Silph Co. 7F
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Electrode | 29 | Electric | Thundershock · **Sonicboom** · Shock Wave · **Thunder Wave** |
| 2 | Muk | 29 | Poison | Tackle · **Shock Wave** · **Counter** · **Mega Drain** |

### Scientist #9 — Silph Co. 8F
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Grimer | 29 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 2 | Electrode | 29 | Electric | Thundershock · **Sonicboom** · Shock Wave · **Thunder Wave** |

### Scientist #10 — Silph Co. 9F
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Voltorb | 28 | Electric | **Tackle** · Thundershock · Sonicboom · **Thunder Wave** |
| 2 | Koffing | 28 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 3 | Magneton | 28 | Electric/Steel | Sonicboom · **Thunder Wave** · Thundershock · Shock Wave |

### Scientist #11 — Silph Co. 10F
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magnemite | 29 | Electric/Steel | Sonicboom · Thundershock · Mirror Shot · Supersonic |
| 2 | Koffing | 29 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Scientist #12 — Mansion 3F
_Lv 33 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magnemite | 33 | Electric/Steel | Sonicboom · Thundershock · Mirror Shot · Supersonic |
| 2 | Magneton | 33 | Electric/Steel | Thundershock · Shock Wave · Supersonic · Mirror Shot |
| 3 | Voltorb | 33 | Electric | Thundershock · Sonicboom · **Tackle** · **Thunder Wave** |

### Scientist #13 — Mansion B1F
_Lv 34 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Magnemite | 34 | Electric/Steel | Sonicboom · Thundershock · Mirror Shot · Supersonic |
| 2 | Electrode | 34 | Electric | Thundershock · **Sonicboom** · Shock Wave · **Thunder Wave** |


---

## Giovanni ⭐

### Giovanni #1 — Rocket Hideout B4F
_Lv 24–29 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Onix | 25 | Rock/Ground | Screech · Headbutt · Rock Throw · Rock Slide |
| 2 | Rhyhorn | 24 | Ground/Rock | Headbutt · Bone Club |
| 3 | Persian | 29 | Normal | Growl · Screech · Pay Day · Headbutt |

### Giovanni #2 — Silph Co. 11F
_Lv 35–41 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Nidorino | 37 | Poison | Low Kick · Poison Sting · Cross Poison · Focus Energy |
| 2 | Persian | 35 | Normal | Growl · Screech · Pay Day · Headbutt |
| 3 | Rhyhorn | 37 | Ground/Rock | Headbutt · Bone Club · Tail Whip |
| 4 | Nidoqueen | 41 | Poison/Ground | Low Kick · Cross Poison · Bulldoze · Poison Jab |

### Giovanni #3 — Viridian Gym
_Lv 50–55 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Dugtrio | 50 | Ground | **Earthquake** · **Rock Slide** · **Slash** · **Sand-Attack** |
| 2 | Marowak | 52 | Ground | **Earthquake** · **Stone Edge** · **Double-Edge** · **Focus Energy** |
| 3 | Persian | 53 | Normal | **Bite** · **Slash** · **Thunderbolt** · **Screech** |
| 4 | Nidoqueen | 53 | Poison/Ground | **Earthquake** · **Poison Jab** · **Ice Beam** · **Toxic** |
| 5 | Nidoking | 55 | Poison/Ground | **Earthquake** · **Poison Jab** · **Ice Beam** · **Thunderbolt** |
| 6 | Rhydon | 55 | Ground/Rock | **Earthquake** · **Rock Slide** · **Fire Blast** · **Leer** |


---

## Rocket

### Rocket #1 — Mt. Moon B2F
_Lv 13 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 13 | Normal | Tackle · **Pay Day** · Quick Attack · **Shock Wave** |
| 2 | Zubat | 13 | Poison/Flying | Leech Life · Poison Sting · Supersonic · **Mega Drain** |

### Rocket #2 — Mt. Moon B2F
_Lv 11 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandshrew | 11 | Ground | Tackle · Sand-Attack · **Cut** · **Swift** |
| 2 | Rattata | 11 | Normal | Tackle · **Pay Day** · Quick Attack · **Shock Wave** |
| 3 | Zubat | 11 | Poison/Flying | Leech Life · Poison Sting · Supersonic · **Mega Drain** |

### Rocket #3 — Mt. Moon B2F
_Lv 12 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Zubat | 12 | Poison/Flying | Leech Life · Poison Sting · Supersonic · **Mega Drain** |
| 2 | Ekans | 12 | Poison | Tackle · **Counter** · Poison Sting · **Mega Drain** |

### Rocket #4 — Unused
_Lv 16 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Raticate | 16 | Normal | Tackle · Quick Attack · Tail Whip · Bite |

### Rocket #5 — Cerulean City
_Lv 17 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 17 | Fighting | Karate Chop · **Rock Slide** · **Counter** · **Seismic Toss** |
| 2 | Drowzee | 17 | Psychic | Tackle · Hypnosis · **Tri Attack** · Confusion |

### Rocket #6 — Route 24
_Lv 15 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ekans | 15 | Poison | Tackle · **Counter** · Poison Sting · **Mega Drain** |
| 2 | Zubat | 15 | Poison/Flying | Leech Life · Poison Sting · Supersonic · Bite |

### Rocket #7 — Game Corner
_Lv 20 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Raticate | 20 | Normal | Tackle · Quick Attack · **Tri Attack** · Bite |
| 2 | Zubat | 20 | Poison/Flying | Leech Life · Poison Sting · Supersonic · Bite |

### Rocket #8 — Rocket Hideout B1F
_Lv 21 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Drowzee | 21 | Psychic | Tackle · Hypnosis · **Tri Attack** · Confusion |
| 2 | Machop | 21 | Fighting | Karate Chop · Low Kick · **Rock Slide** · **Counter** |

### Rocket #9 — Rocket Hideout B1F
_Lv 21 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Raticate | 21 | Normal | Tackle · Quick Attack · **Tri Attack** · Bite |
| 2 | Raticate | 21 | Normal | Tackle · Quick Attack · **Tri Attack** · Bite |

### Rocket #10 — Rocket Hideout B1F
_Lv 20 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Grimer | 20 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 2 | Koffing | 20 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 3 | Koffing | 20 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Rocket #11 — Rocket Hideout B1F
_Lv 19 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 19 | Normal | Tackle · **Tri Attack** · Quick Attack · Bite |
| 2 | Raticate | 19 | Normal | Tackle · Quick Attack · **Tri Attack** · Bite |
| 3 | Raticate | 19 | Normal | Tackle · Quick Attack · **Tri Attack** · Bite |
| 4 | Rattata | 19 | Normal | Tackle · **Tri Attack** · Quick Attack · Bite |

### Rocket #12 — Rocket Hideout B1F
_Lv 22 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Grimer | 22 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 2 | Koffing | 22 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Rocket #13 — Rocket Hideout B2F
_Lv 17 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Zubat | 17 | Poison/Flying | Leech Life · Poison Sting · Supersonic · Bite |
| 2 | Koffing | 17 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 3 | Grimer | 17 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 4 | Zubat | 17 | Poison/Flying | Leech Life · Poison Sting · Supersonic · Bite |
| 5 | Raticate | 17 | Normal | Tackle · Quick Attack · **Tri Attack** · Bite |

### Rocket #14 — Rocket Hideout B3F
_Lv 20 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 20 | Normal | Tackle · **Tri Attack** · Quick Attack · Bite |
| 2 | Raticate | 20 | Normal | Tackle · Quick Attack · **Tri Attack** · Bite |
| 3 | Drowzee | 20 | Psychic | Tackle · Hypnosis · **Tri Attack** · Confusion |

### Rocket #15 — Rocket Hideout B3F
_Lv 21 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 21 | Fighting | Karate Chop · Low Kick · **Rock Slide** · **Counter** |
| 2 | Machop | 21 | Fighting | Karate Chop · Low Kick · **Rock Slide** · **Counter** |

### Rocket #16 — Unused
_Lv 23 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandshrew | 23 | Ground | Tackle · Sand-Attack · Bulldoze · Slash |
| 2 | Ekans | 23 | Poison | Tackle · Leer · Poison Sting · Bite |
| 3 | Sandslash | 23 | Ground | Tackle · Sand-Attack · Bulldoze · Slash |

### Rocket #17 — Unused
_Lv 23 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ekans | 23 | Poison | Tackle · Leer · Poison Sting · Bite |
| 2 | Sandshrew | 23 | Ground | Tackle · Sand-Attack · Bulldoze · Slash |
| 3 | Arbok | 23 | Poison | Tackle · Leer · Bite · Cross Poison |

### Rocket #18 — Rocket Hideout B4F
_Lv 21 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 21 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 2 | Zubat | 21 | Poison/Flying | Poison Sting · **Leech Life** · Bite · Confuse Ray |

### Rocket #19 — Unused
_Lv 25 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Zubat | 25 | Poison/Flying | Poison Sting · Supersonic · Bite · Confuse Ray |
| 2 | Zubat | 25 | Poison/Flying | Poison Sting · Supersonic · Bite · Confuse Ray |
| 3 | Golbat | 25 | Poison/Flying | Poison Sting · Supersonic · Confuse Ray · Cross Poison |

### Rocket #20 — Unused
_Lv 26 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 26 | Poison | Tackle · Sludge |
| 2 | Drowzee | 26 | Psychic | Hypnosis · Disable · Confusion · Headbutt |

### Rocket #21 — Unused
_Lv 23 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Zubat | 23 | Poison/Flying | Poison Sting · Supersonic · Bite · Confuse Ray |
| 2 | Rattata | 23 | Normal | Tail Whip · Quick Attack · Bite · Focus Energy |
| 3 | Raticate | 23 | Normal | Quick Attack · Tail Whip · Bite · Headbutt |
| 4 | Zubat | 23 | Poison/Flying | Poison Sting · Supersonic · Bite · Confuse Ray |

### Rocket #22 — Unused
_Lv 26 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Drowzee | 26 | Psychic | Hypnosis · Disable · Confusion · Headbutt |
| 2 | Koffing | 26 | Poison | Tackle · Sludge |

### Rocket #23 — Silph Co. 2F
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Cubone | 29 | Ground | Bone Club · **Tackle** · Headbutt · **Bubblebeam** |
| 2 | Zubat | 29 | Poison/Flying | **Poison Sting** · Bite · Confuse Ray · Wing Attack |

### Rocket #24 — Silph Co. 2F
_Lv 25 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Golbat | 25 | Poison/Flying | Poison Sting · **Bite** · **Screech** · Cross Poison |
| 2 | Zubat | 25 | Poison/Flying | Poison Sting · **Leech Life** · Bite · Confuse Ray |
| 3 | Zubat | 25 | Poison/Flying | Poison Sting · **Leech Life** · Bite · Confuse Ray |
| 4 | Raticate | 25 | Normal | Quick Attack · **Tackle** · Bite · Headbutt |
| 5 | Zubat | 25 | Poison/Flying | Poison Sting · **Leech Life** · Bite · Confuse Ray |

### Rocket #25 — Silph Co. 3F
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Raticate | 28 | Normal | **Quick Attack** · Bite · Headbutt · **Tackle** |
| 2 | Hypno | 28 | Psychic | **Confusion** · Hypnosis · Psybeam · Headbutt |
| 3 | Raticate | 28 | Normal | **Quick Attack** · Bite · Headbutt · **Tackle** |

### Rocket #26 — Silph Co. 4F
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 29 | Fighting | Karate Chop · Low Kick · **Counter** · **Rock Slide** |
| 2 | Drowzee | 29 | Psychic | **Tackle** · Confusion · Headbutt · **Hypnosis** |

### Rocket #27 — Silph Co. 4F
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ekans | 28 | Poison | **Tackle** · Poison Sting · Bite · Glare |
| 2 | Zubat | 28 | Poison/Flying | **Poison Sting** · Bite · Confuse Ray · Wing Attack |
| 3 | Cubone | 28 | Ground | Bone Club · **Tackle** · Headbutt · **Bubblebeam** |

### Rocket #28 — Silph Co. 5F
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Arbok | 33 | Poison | **Poison Sting** · Bite · Cross Poison · Glare |

### Rocket #29 — Silph Co. 5F
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Hypno | 33 | Psychic | Hypnosis · Psybeam · Headbutt · **Confusion** |

### Rocket #30 — Silph Co. 6F
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machop | 29 | Fighting | Karate Chop · Low Kick · **Counter** · **Rock Slide** |
| 2 | Machoke | 29 | Fighting | Karate Chop · Low Kick · **Counter** · **Rock Slide** |

### Rocket #31 — Silph Co. 6F
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Zubat | 28 | Poison/Flying | **Poison Sting** · Bite · Confuse Ray · Wing Attack |
| 2 | Zubat | 28 | Poison/Flying | **Poison Sting** · Bite · Confuse Ray · Wing Attack |
| 3 | Golbat | 28 | Poison/Flying | Poison Sting · **Bite** · **Screech** · Cross Poison |

### Rocket #32 — Silph Co. 7F
_Lv 26 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Raticate | 26 | Normal | Quick Attack · **Tackle** · Bite · Headbutt |
| 2 | Arbok | 26 | Poison | Tackle · **Poison Sting** · Bite · Cross Poison |
| 3 | Koffing | 26 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 4 | Golbat | 26 | Poison/Flying | Poison Sting · **Bite** · **Screech** · Cross Poison |

### Rocket #33 — Silph Co. 7F
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Cubone | 29 | Ground | Bone Club · **Tackle** · Headbutt · **Bubblebeam** |
| 2 | Cubone | 29 | Ground | Bone Club · **Tackle** · Headbutt · **Bubblebeam** |

### Rocket #34 — Silph Co. 7F
_Lv 29 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandshrew | 29 | Ground | Sand-Attack · Bulldoze · Slash · Poison Sting |
| 2 | Sandslash | 29 | Ground | Sand-Attack · Bulldoze · Slash · Poison Sting |

### Rocket #35 — Silph Co. 8F
_Lv 26 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Raticate | 26 | Normal | Quick Attack · **Tackle** · Bite · Headbutt |
| 2 | Zubat | 26 | Poison/Flying | Poison Sting · **Leech Life** · Bite · Confuse Ray |
| 3 | Golbat | 26 | Poison/Flying | Poison Sting · **Bite** · **Screech** · Cross Poison |
| 4 | Rattata | 26 | Normal | **Tackle** · Quick Attack · Bite · **Tri Attack** |

### Rocket #36 — Silph Co. 8F
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weezing | 28 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 2 | Golbat | 28 | Poison/Flying | Poison Sting · **Bite** · **Screech** · Cross Poison |
| 3 | Koffing | 28 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Rocket #37 — Silph Co. 9F
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Drowzee | 28 | Psychic | Hypnosis · **Tackle** · Confusion · Headbutt |
| 2 | Grimer | 28 | Poison | Tackle · **Counter** · **Mega Drain** · **Shock Wave** |
| 3 | Machop | 28 | Fighting | Karate Chop · Low Kick · **Counter** · **Rock Slide** |

### Rocket #38 — Silph Co. 9F
_Lv 28 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Golbat | 28 | Poison/Flying | Poison Sting · **Bite** · **Screech** · Cross Poison |
| 2 | Drowzee | 28 | Psychic | Hypnosis · **Tackle** · Confusion · Headbutt |
| 3 | Hypno | 28 | Psychic | **Confusion** · Hypnosis · Psybeam · Headbutt |

### Rocket #39 — Silph Co. 10F
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Machoke | 33 | Fighting | Karate Chop · Low Kick · **Aura Sphere** · **Earthquake** |

### Rocket #40 — Silph Co. 11F
_Lv 25 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rattata | 25 | Normal | **Tackle** · Quick Attack · Bite · **Tri Attack** |
| 2 | Rattata | 25 | Normal | **Tackle** · Quick Attack · Bite · **Tri Attack** |
| 3 | Zubat | 25 | Poison/Flying | Poison Sting · **Leech Life** · Bite · Confuse Ray |
| 4 | Rattata | 25 | Normal | **Tackle** · Quick Attack · Bite · **Tri Attack** |
| 5 | Ekans | 25 | Poison | **Tackle** · Poison Sting · Bite · Glare |

### Rocket #41 — Unused
_Lv 32 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Cubone | 32 | Ground | Tail Whip · Headbutt · Leer · Focus Energy |
| 2 | Drowzee | 32 | Psychic | Confusion · Headbutt · Poison Gas · Psychic |
| 3 | Marowak | 32 | Ground | Bone Club · Tail Whip · Headbutt · Leer |

### Rocket #42 — Mt. Moon B2F
_Lv 14 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ekans | 14 | Poison | Tackle · **Counter** · Poison Sting · **Mega Drain** |
| 2 | Meowth | 14 | Normal | Tackle · **Shock Wave** · Bite · **Pay Day** |
| 3 | Koffing | 14 | Poison | Tackle · **Double Team** · **Shock Wave** · **Counter** |

### Rocket #43 — Rocket Hideout B4F
_Lv 25 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 25 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |
| 2 | Meowth | 25 | Normal | **Tackle** · Bite · Pay Day · Screech |
| 3 | Ekans | 25 | Poison | **Tackle** · Poison Sting · Bite · Glare |

### Rocket #44 — Pokémon Tower 7F
_Lv 27 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Meowth | 27 | Normal | **Tackle** · Bite · Pay Day · Screech |
| 2 | Arbok | 27 | Poison | **Poison Sting** · Bite · Cross Poison · Glare |
| 3 | Weezing | 27 | Poison | Tackle · Sludge · **Shock Wave** · **Counter** |

### Rocket #45 — Silph Co. 11F
_Lv 31 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weezing | 31 | Poison | Tackle · Sludge · **Sludge Bomb** · **Thunderbolt** |
| 2 | Arbok | 31 | Poison | **Poison Sting** · Bite · Cross Poison · Glare |
| 3 | Meowth | 31 | Normal | **Tackle** · Bite · Pay Day · Screech |

### Rocket #46 — Unused
_Lv 16 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 16 | Poison | Tackle · Sludge |

### Rocket #47 — Unused
_Lv 27 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Koffing | 27 | Poison | Tackle · Sludge |

### Rocket #48 — Unused
_Lv 29 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weezing | 29 | Poison | Tackle · Sludge |

### Rocket #49 — Unused
_Lv 33 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weezing | 33 | Poison | Tackle · Sludge |


---

## Cooltrainer♂

### Cooltrainer♂ #1 — Viridian Gym
_Lv 39 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Nidorino | 39 | Poison | Low Kick · Poison Sting · Cross Poison · **Headbutt** |
| 2 | Nidoking | 39 | Poison/Ground | **Headbutt** · Cross Poison · Bulldoze · Poison Jab |

### Cooltrainer♂ #2 — Victory Road 3F
_Lv 43 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Exeggutor | 43 | Grass/Psychic | Mega Drain · **Hypnosis** · Psybeam · Energy Ball |
| 2 | Cloyster | 43 | Water/Ice | Razor Shell · Supersonic · **Aurora Beam** · Ice Fang |
| 3 | Arcanine | 43 | Fire | **Crunch** · **Ember** · Fire Fang · Fire Punch |

### Cooltrainer♂ #3 — Victory Road 3F
_Lv 43 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Kingler | 43 | Water | Headbutt · **Water Gun** · Razor Shell · **Swords Dance** |
| 2 | Tentacruel | 43 | Water/Poison | Bubblebeam · Sludge · **Acid** · **Supersonic** |
| 3 | Blastoise | 43 | Water | Bubblebeam · Bite · **Water Gun** · **Tackle** |

### Cooltrainer♂ #4 — Unused
_Lv 45 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Kingler | 45 | Water | Headbutt · Leer · Razor Shell · Crabhammer |
| 2 | Starmie | 45 | Water/Light | Harden · Bubblebeam · Aurora Beam · Surf |

### Cooltrainer♂ #5 — Victory Road 1F
_Lv 42 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ivysaur | 42 | Grass/Poison | **Vine Whip** · Razor Leaf · Sludge · Growth |
| 2 | Wartortle | 42 | Water | Bubblebeam · Bite · **Water Gun** · **Tackle** |
| 3 | Charmeleon | 42 | Fire | **Ember** · Headbutt · Slash · Flamethrower |
| 4 | Charizard | 42 | Fire/Flying | **Ember** · Headbutt · Air Cutter · Slash |

### Cooltrainer♂ #6 — Unused
_Lv 44 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ivysaur | 44 | Grass/Poison | Poisonpowder · Razor Leaf · Sludge · Growth |
| 2 | Wartortle | 44 | Water | Bubblebeam · Bite · Withdraw · Double-Edge |
| 3 | Charmeleon | 44 | Fire | Leer · Headbutt · Slash · Flamethrower |

### Cooltrainer♂ #7 — Unused
_Lv 49 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Nidoking | 49 | Poison/Ground | Low Kick · Cross Poison · Bulldoze · Poison Jab |

### Cooltrainer♂ #8 — Unused
_Lv 44 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Kingler | 44 | Water | Headbutt · Leer · Razor Shell · Crabhammer |
| 2 | Cloyster | 44 | Water/Ice | Razor Shell · Supersonic · Withdraw · Ice Fang |

### Cooltrainer♂ #9 — Viridian Gym
_Lv 39 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandslash | 39 | Ground | Bulldoze · Slash · **Sand-Attack** · Swift |
| 2 | Dugtrio | 39 | Ground | **Earthquake** · **Tackle** · Sand-Attack · Slash |

### Cooltrainer♂ #10 — Viridian Gym
_Lv 43 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Rhyhorn | 43 | Ground/Rock | Headbutt · Bone Club · **Stone Edge** · **Earthquake** |


---

## Cooltrainer♀

### Cooltrainer♀ #1 — Celadon Gym
_Lv 24 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Weepinbell | 24 | Grass/Poison | **Vine Whip** · **Tackle** · Sleep Powder · **Mega Drain** |
| 2 | Gloom | 24 | Grass/Poison | Mega Drain · **Cut** · **Counter** · Sleep Powder |
| 3 | Ivysaur | 24 | Grass/Poison | **Tackle** · Leech Seed · Vine Whip · **Mega Drain** |

### Cooltrainer♀ #2 — Victory Road 3F
_Lv 43 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Bellsprout | 43 | Grass/Poison | **Vine Whip** · **Sleep Powder** · Razor Leaf · Headbutt |
| 2 | Weepinbell | 43 | Grass/Poison | **Vine Whip** · **Sleep Powder** · Cross Poison · Razor Leaf |
| 3 | Victreebel | 43 | Grass/Poison | **Razor Leaf** · **Sleep Powder** · Cross Poison · Energy Ball |

### Cooltrainer♀ #3 — Victory Road 3F
_Lv 43 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Parasect | 43 | Bug/Grass | **Leech Life** · Razor Leaf · Spore · Slash |
| 2 | Dewgong | 43 | Water/Ice | **Headbutt** · **Aurora Beam** · Bubblebeam · Icy Wind |
| 3 | Chansey | 43 | Normal | Tri Attack · Sing · **Hyper Voice** · **Tackle** |

### Cooltrainer♀ #4 — Unused
_Lv 46 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Vileplume | 46 | Grass/Poison | Sleep Powder · Stun Spore · Poisonpowder · Sludge |
| 2 | Butterfree | 46 | Bug/Flying | Gust · Air Cutter · Psybeam · Bug Buzz |

### Cooltrainer♀ #5 — Victory Road 1F
_Lv 44 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Persian | 44 | Normal | **Bite** · Headbutt · **Screech** · Strength |
| 2 | Ninetales | 44 | Fire | **Quick Attack** · **Ember** · Flame Burst · Flamethrower |

### Cooltrainer♀ #6 — Unused
_Lv 45 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ivysaur | 45 | Grass/Poison | Poisonpowder · Razor Leaf · Sludge · Growth |
| 2 | Venusaur | 45 | Grass/Poison | Poisonpowder · Razor Leaf · Sludge · Growth |

### Cooltrainer♀ #7 — Unused
_Lv 45 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Nidorina | 45 | Poison | Poison Sting · Cross Poison · Tail Whip · Bite |
| 2 | Nidoqueen | 45 | Poison/Ground | Low Kick · Cross Poison · Bulldoze · Poison Jab |

### Cooltrainer♀ #8 — Unused
_Lv 43 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Persian | 43 | Normal | Pay Day · Headbutt · Slash · Strength |
| 2 | Ninetales | 43 | Fire | Roar · Tail Whip · Flame Burst · Flamethrower |
| 3 | Raichu | 43 | Electric | Spark · Growl · Thunder Wave · Thunderbolt |


---

## Bruno ⭐

### Bruno #1
_Lv 53–58 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Onix | 53 | Rock/Ground | **Stone Edge** · **Earthquake** · **Iron Head** · **Screech** |
| 2 | Golem | 54 | Rock/Ground | **Stone Edge** · **Earthquake** · **Fire Blast** · **Defense Curl** |
| 3 | Hitmonlee | 55 | Fighting | **Hi Jump Kick** · **Stone Edge** · **Double-Edge** · **Meditate** |
| 4 | Hitmonchan | 55 | Fighting | **Hi Jump Kick** · **Ice Punch** · **Thunderpunch** · **Agility** |
| 5 | Poliwrath | 56 | Water/Fighting | **Waterfall** · **Aura Sphere** · **Ice Beam** · **Hypnosis** |
| 6 | Machamp | 58 | Fighting | **Hi Jump Kick** · **Earthquake** · **Rock Slide** · **Focus Energy** |


---

## Brock ⭐

### Brock #1
_Lv 10–14 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Diglett | 10 | Ground | **Dig** · **Rock Slide** · **Double Team** · **Substitute** |
| 2 | Geodude | 10 | Rock/Ground | **Rock Slide** · **Dig** · **Toxic** · **Double Team** |
| 3 | Sandshrew | 11 | Ground | **Dig** · **Rock Slide** · **Swords Dance** · **Sand-Attack** |
| 4 | Cubone | 11 | Ground | **Bone Club** · **Rock Slide** · **Dig** · **Growl** |
| 5 | Rhyhorn | 12 | Ground/Rock | **Rock Slide** · **Dig** · **Iron Tail** · **Double Team** |
| 6 | Onix | 14 | Rock/Ground | **Rock Slide** · **Earthquake** · **Iron Tail** · **Screech** |


---

## Misty ⭐

### Misty #1
_Lv 18–21 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Psyduck | 18 | Water | **Bubblebeam** · **Ice Beam** · **Dig** · **Double Team** |
| 2 | Seel | 18 | Water | **Bubblebeam** · **Ice Beam** · **Headbutt** · **Double Team** |
| 3 | Shellder | 18 | Water | **Bubblebeam** · **Ice Beam** · **Withdraw** · **Supersonic** |
| 4 | Staryu | 19 | Water/Light | **Bubblebeam** · **Light Ray** · **Thunderbolt** · **Reflect** |
| 5 | Horsea | 19 | Water | **Bubblebeam** · **Ice Beam** · **Smokescreen** · **Double Team** |
| 6 | Starmie | 21 | Water/Light | **Bubblebeam** · **Photon Beam** · **Thunderbolt** · **Reflect** |


---

## Lt. Surge ⭐

### Lt. Surge #1
_Lv 24–28 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Voltorb | 24 | Electric | **Thunderbolt** · **Screech** · **Thunder Wave** · **Explosion** |
| 2 | Magnemite | 24 | Electric/Steel | **Thunderbolt** · **Flash Cannon** · **Thunder Wave** · **Light Screen** |
| 3 | Electrode | 25 | Electric | **Thunderbolt** · **Shock Wave** · **Thunder Wave** · **Explosion** |
| 4 | Electabuzz | 25 | Electric | **Thunderbolt** · **Iron Tail** · **Psychic** · **Leer** |
| 5 | Magneton | 26 | Electric/Steel | **Thunderbolt** · **Flash Cannon** · **Thunder Wave** · **Light Screen** |
| 6 | Raichu | 28 | Electric | **Thunderbolt** · **Iron Tail** · **Thunder Wave** · **Growl** |


---

## Erika ⭐

### Erika #1
_Lv 29–34 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Bellsprout | 29 | Grass/Poison | **Energy Ball** · **Sludge Bomb** · **Sleep Powder** · **Growth** |
| 2 | Tangela | 30 | Grass | **Energy Ball** · **Mega Drain** · **Toxic** · **Double Team** |
| 3 | Clefairy | 31 | Fairy | **Dazzle Gleam** · **Thunderbolt** · **Ice Beam** · **Minimize** |
| 4 | Weepinbell | 32 | Grass/Poison | **Energy Ball** · **Cross Poison** · **Sleep Powder** · **Growth** |
| 5 | Victreebel | 32 | Grass/Poison | **Energy Ball** · **Sludge Bomb** · **Sleep Powder** · **Swords Dance** |
| 6 | Gloom | 34 | Grass/Poison | **Energy Ball** · **Sludge Bomb** · **Sleep Powder** · **Swords Dance** |


---

## Koga ⭐

### Koga #1
_Lv 44–50 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Venonat | 44 | Bug/Poison | **Sludge Bomb** · **Psychic** · **Sleep Powder** · **Supersonic** |
| 2 | Golbat | 45 | Poison/Flying | **Sludge Bomb** · **Air Slash** · **Screech** · **Confuse Ray** |
| 3 | Weezing | 46 | Poison | **Sludge Bomb** · **Hyper Voice** · **Thunderbolt** · **Smokescreen** |
| 4 | Muk | 47 | Poison | **Sludge Bomb** · **Hyper Voice** · **Thunderbolt** · **Minimize** |
| 5 | Arbok | 48 | Poison | **Sludge Bomb** · **Crunch** · **Earthquake** · **Screech** |
| 6 | Venomoth | 50 | Bug/Poison | **Bug Buzz** · **Sludge Bomb** · **Psychic** · **Sleep Powder** |


---

## Blaine ⭐

### Blaine #1
_Lv 46–54 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Ponyta | 46 | Fire | **Flamethrower** · **Flame Burst** · **Double-Edge** · **Growl** |
| 2 | Ninetales | 48 | Fire | **Flamethrower** · **Dazzle Gleam** · **Dig** · **Reflect** |
| 3 | Magmar | 49 | Fire | **Flamethrower** · **Fire Punch** · **Psychic** · **Leer** |
| 4 | Rapidash | 50 | Fire | **Flamethrower** · **Double-Edge** · **Dazzle Gleam** · **Reflect** |
| 5 | Rhydon | 51 | Ground/Rock | **Rock Slide** · **Earthquake** · **Iron Tail** · **Leer** |
| 6 | Arcanine | 54 | Fire | **Flamethrower** · **Crunch** · **Dragon Pulse** · **Reflect** |


---

## Sabrina ⭐

### Sabrina #1
_Lv 48–52 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Slowbro | 48 | Water/Psychic | **Psychic** · **Surf** · **Ice Beam** · **Amnesia** |
| 2 | Hypno | 49 | Psychic | **Psychic** · **Shadow Ball** · **Dazzle Gleam** · **Hypnosis** |
| 3 | Kadabra | 50 | Psychic | **Psychic** · **Dazzle Gleam** · **Shadow Ball** · **Reflect** |
| 4 | Jynx | 50 | Ice/Psychic | **Ice Beam** · **Psychic** · **Dazzle Gleam** · **Lovely Kiss** |
| 5 | Mr. Mime | 50 | Psychic/Fairy | **Psychic** · **Dazzle Gleam** · **Thunderbolt** · **Barrier** |
| 6 | Alakazam | 52 | Psychic | **Psychic** · **Dazzle Gleam** · **Shadow Ball** · **Reflect** |


---

## Gentleman

### Gentleman #1 — SS Anne 1F Rooms
_Lv 18 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Growlithe | 18 | Fire | Bite · **Counter** · Ember · **Swift** |
| 2 | Growlithe | 18 | Fire | Bite · **Counter** · Ember · **Swift** |

### Gentleman #2 — SS Anne 1F Rooms
_Lv 19 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Nidoran♂ | 19 | Poison | **Tackle** · Headbutt · Low Kick · Poison Sting |
| 2 | Nidoran♀ | 19 | Poison | Tackle · **Shock Wave** · Low Kick · Poison Sting |

### Gentleman #3 — SS Anne 2F Rooms/Vermilion Gym
_Lv 22 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Voltorb | 22 | Electric | **Tackle** · Thundershock · Sonicboom · **Thunder Wave** |
| 2 | Magnemite | 22 | Electric/Steel | Tackle · Sonicboom · **Shock Wave** · **Thunder Wave** |

### Gentleman #4 — Unused
_Lv 48 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Primeape | 48 | Fighting | Headbutt · Seismic Toss · Screech · Double-Edge |

### Gentleman #5 — SS Anne 2F Rooms
_Lv 17 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Growlithe | 17 | Fire | Bite · Roar · **Swift** · **Counter** |
| 2 | Ponyta | 17 | Fire | Ember · **Swift** · **Counter** · **Double Team** |


---

## Rival (Silph/mid)

### Rival (Silph/mid) #1 — SS Anne 2F
_Lv 16–20 · 4 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Spearow | 19 | Normal/Flying | Peck · Growl · Leer · Tackle |
| 2 | Rattata | 16 | Normal | Tackle · Tail Whip · Quick Attack · Bite |
| 3 | Sandshrew | 18 | Ground | Tackle · Sand-Attack · Bulldoze · Slash |
| 4 | Eevee | 20 | Normal | Tackle · Tail Whip · Sand-Attack · Growl |

### Rival (Silph/mid) #2 — Pokémon Tower 2F
_Lv 20–25 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Fearow | 25 | Normal/Flying | Leer · Tackle · Headbutt · Mirror Move |
| 2 | Shellder | 23 | Water | Tackle · Withdraw · Supersonic · Razor Shell |
| 3 | Vulpix | 22 | Fire | Ember · Tail Whip · Quick Attack · Roar |
| 4 | Sandshrew | 20 | Ground | Tackle · Sand-Attack · Bulldoze · Slash |
| 5 | Eevee | 25 | Normal | Tail Whip · Sand-Attack · Growl · Quick Attack |

### Rival (Silph/mid) #3 — Pokémon Tower 2F
_Lv 20–25 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Fearow | 25 | Normal/Flying | Leer · Tackle · Headbutt · Mirror Move |
| 2 | Magnemite | 23 | Electric/Steel | Tackle · Sonicboom |
| 3 | Shellder | 22 | Water | Tackle · Withdraw · Supersonic |
| 4 | Sandshrew | 20 | Ground | Tackle · Sand-Attack · Bulldoze · Slash |
| 5 | Eevee | 25 | Normal | Tail Whip · Sand-Attack · Growl · Quick Attack |

### Rival (Silph/mid) #4 — Pokémon Tower 2F
_Lv 20–25 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Fearow | 25 | Normal/Flying | Leer · Tackle · Headbutt · Mirror Move |
| 2 | Vulpix | 23 | Fire | Ember · Tail Whip · Quick Attack · Roar |
| 3 | Magnemite | 22 | Electric/Steel | Tackle · Sonicboom |
| 4 | Sandshrew | 20 | Ground | Tackle · Sand-Attack · Bulldoze · Slash |
| 5 | Eevee | 25 | Normal | Tail Whip · Sand-Attack · Growl · Quick Attack |

### Rival (Silph/mid) #5 — Silph Co. 7F
_Lv 35–40 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandslash | 38 | Ground | Bulldoze · Slash · Poison Sting · Swift |
| 2 | Ninetales | 35 | Fire | Quick Attack · Roar · Tail Whip · Flame Burst |
| 3 | Cloyster | 37 | Water/Ice | Razor Shell · Supersonic · Withdraw · Ice Fang |
| 4 | Kadabra | 35 | Psychic | Confusion · Disable · Psybeam · Recover |
| 5 | Jolteon | 40 | Electric | Sand-Attack · Shock Wave · Low Kick · Fury Cutter |

### Rival (Silph/mid) #6 — Silph Co. 7F
_Lv 35–40 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandslash | 38 | Ground | Bulldoze · Slash · Poison Sting · Swift |
| 2 | Cloyster | 35 | Water/Ice | Razor Shell · Supersonic · Withdraw · Ice Fang |
| 3 | Magneton | 37 | Electric/Steel | Thundershock · Shock Wave · Supersonic · Mirror Shot |
| 4 | Kadabra | 35 | Psychic | Confusion · Disable · Psybeam · Recover |
| 5 | Flareon | 40 | Fire | Tail Whip · Sand-Attack · Bite · Flame Burst |

### Rival (Silph/mid) #7 — Silph Co. 7F
_Lv 35–40 · 5 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandslash | 38 | Ground | Bulldoze · Slash · Poison Sting · Swift |
| 2 | Magneton | 35 | Electric/Steel | Thundershock · Shock Wave · Supersonic · Mirror Shot |
| 3 | Ninetales | 37 | Fire | Quick Attack · Roar · Tail Whip · Flame Burst |
| 4 | Kadabra | 35 | Psychic | Confusion · Disable · Psybeam · Recover |
| 5 | Vaporeon | 40 | Water | Sand-Attack · Bubblebeam · Bite · Aurora Beam |

### Rival (Silph/mid) #8 — Route 22
_Lv 45–53 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandslash | 47 | Ground | Slash · Poison Sting · Swift · Earthquake |
| 2 | Exeggcute | 45 | Grass/Psychic | Leech Seed · Stun Spore · Poisonpowder · Solarbeam |
| 3 | Ninetales | 45 | Fire | Roar · Tail Whip · Flame Burst · Flamethrower |
| 4 | Cloyster | 47 | Water/Ice | Razor Shell · Supersonic · Withdraw · Ice Fang |
| 5 | Kadabra | 50 | Psychic | Psybeam · Recover · Psychic · Reflect |
| 6 | Jolteon | 53 | Electric | Fury Cutter · Thunder Wave · Agility · Thunder |

### Rival (Silph/mid) #9 — Route 22
_Lv 45–53 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandslash | 47 | Ground | Slash · Poison Sting · Swift · Earthquake |
| 2 | Exeggcute | 45 | Grass/Psychic | Leech Seed · Stun Spore · Poisonpowder · Solarbeam |
| 3 | Cloyster | 45 | Water/Ice | Razor Shell · Supersonic · Withdraw · Ice Fang |
| 4 | Magneton | 47 | Electric/Steel | Mirror Shot · Thunder Wave · Flash Cannon · Swift |
| 5 | Kadabra | 50 | Psychic | Psybeam · Recover · Psychic · Reflect |
| 6 | Flareon | 53 | Fire | Flame Burst · Sludge · Leer · Flamethrower |

### Rival (Silph/mid) #10 — Route 22
_Lv 45–53 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandslash | 47 | Ground | Slash · Poison Sting · Swift · Earthquake |
| 2 | Exeggcute | 45 | Grass/Psychic | Leech Seed · Stun Spore · Poisonpowder · Solarbeam |
| 3 | Magneton | 45 | Electric/Steel | Supersonic · Mirror Shot · Thunder Wave · Flash Cannon |
| 4 | Ninetales | 47 | Fire | Roar · Tail Whip · Flame Burst · Flamethrower |
| 5 | Kadabra | 50 | Psychic | Psybeam · Recover · Psychic · Reflect |
| 6 | Vaporeon | 53 | Water | Haze · Mist · Acid Armor · Hydro Pump |


---

## Rival (Champion) ⭐

### Rival (Champion) #1 — Champion's Room
_Lv 59–65 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandslash | 61 | Ground | **Earthquake** · **Rock Slide** · **Iron Tail** · **Swords Dance** |
| 2 | Alakazam | 59 | Psychic | **Psychic** · **Dazzle Gleam** · **Shadow Ball** · **Reflect** |
| 3 | Exeggutor | 61 | Grass/Psychic | **Energy Ball** · **Psychic** · **Hypnosis** · **Explosion** |
| 4 | Cloyster | 61 | Water/Ice | **Ice Beam** · **Razor Shell** · **Withdraw** · **Supersonic** |
| 5 | Ninetales | 63 | Fire | **Flamethrower** · **Fire Blast** · **Dazzle Gleam** · **Reflect** |
| 6 | Jolteon | 65 | Electric | **Thunderbolt** · **Low Kick** · **Thunder Wave** · **Agility** |

### Rival (Champion) #2 — Champion's Room
_Lv 59–65 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandslash | 61 | Ground | **Earthquake** · **Rock Slide** · **Iron Tail** · **Swords Dance** |
| 2 | Alakazam | 59 | Psychic | **Psychic** · **Dazzle Gleam** · **Shadow Ball** · **Reflect** |
| 3 | Exeggutor | 61 | Grass/Psychic | **Energy Ball** · **Psychic** · **Hypnosis** · **Explosion** |
| 4 | Magneton | 61 | Electric/Steel | **Thunderbolt** · **Flash Cannon** · **Thunder Wave** · **Light Screen** |
| 5 | Cloyster | 63 | Water/Ice | **Ice Beam** · **Razor Shell** · **Withdraw** · **Supersonic** |
| 6 | Flareon | 65 | Fire | **Flamethrower** · **Bite** · **Sludge** · **Leer** |

### Rival (Champion) #3 — Champion's Room
_Lv 59–65 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Sandslash | 61 | Ground | **Earthquake** · **Rock Slide** · **Iron Tail** · **Swords Dance** |
| 2 | Alakazam | 59 | Psychic | **Psychic** · **Dazzle Gleam** · **Shadow Ball** · **Reflect** |
| 3 | Exeggutor | 61 | Grass/Psychic | **Energy Ball** · **Psychic** · **Hypnosis** · **Explosion** |
| 4 | Ninetales | 61 | Fire | **Flamethrower** · **Fire Blast** · **Dazzle Gleam** · **Reflect** |
| 5 | Magneton | 63 | Electric/Steel | **Thunderbolt** · **Flash Cannon** · **Thunder Wave** · **Light Screen** |
| 6 | Vaporeon | 65 | Water | **Surf** · **Ice Beam** · **Aurora Beam** · **Acid Armor** |


---

## Lorelei ⭐

### Lorelei #1
_Lv 53–56 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Cloyster | 53 | Water/Ice | **Ice Beam** · **Razor Shell** · **Withdraw** · **Supersonic** |
| 2 | Dewgong | 54 | Water/Ice | **Ice Beam** · **Surf** · **Icy Wind** · **Growl** |
| 3 | Slowbro | 54 | Water/Psychic | **Surf** · **Ice Beam** · **Psychic** · **Amnesia** |
| 4 | Starmie | 55 | Water/Light | **Surf** · **Ice Beam** · **Thunderbolt** · **Reflect** |
| 5 | Jynx | 56 | Ice/Psychic | **Blizzard** · **Psychic** · **Lovely Kiss** · **Icy Wind** |
| 6 | Lapras | 56 | Water/Ice | **Ice Beam** · **Surf** · **Thunderbolt** · **Sing** |


---

## Channeler

### Channeler #1 — Unused
_Lv 22 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 22 | Ghost/Poison | Lick · Night Shade · Confuse Ray |

### Channeler #2 — Unused
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 24 | Ghost/Poison | Lick · Night Shade · Confuse Ray |

### Channeler #3 — Unused
_Lv 23 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 23 | Ghost/Poison | Lick · Night Shade · Confuse Ray |
| 2 | Gastly | 23 | Ghost/Poison | Lick · Night Shade · Confuse Ray |

### Channeler #4 — Unused
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 24 | Ghost/Poison | Lick · Night Shade · Confuse Ray |

### Channeler #5 — Pokémon Tower 3F
_Lv 23 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 23 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #6 — Pokémon Tower 3F
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 24 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #7 — Unused
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Haunter | 24 | Ghost/Poison | Lick · Night Shade · Confuse Ray |

### Channeler #8 — Pokémon Tower 3F
_Lv 22 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 22 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #9 — Pokémon Tower 4F
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 24 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #10 — Pokémon Tower 4F
_Lv 23 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 23 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |
| 2 | Gastly | 23 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #11 — Unused
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 24 | Ghost/Poison | Lick · Night Shade · Confuse Ray |

### Channeler #12 — Pokémon Tower 4F
_Lv 22 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 22 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #13 — Unused
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 24 | Ghost/Poison | Lick · Night Shade · Confuse Ray |

### Channeler #14 — Pokémon Tower 5F
_Lv 23 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Haunter | 23 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #15 — Unused
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 24 | Ghost/Poison | Lick · Night Shade · Confuse Ray |

### Channeler #16 — Pokémon Tower 5F
_Lv 22 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 22 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #17 — Pokémon Tower 5F
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 24 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #18 — Pokémon Tower 5F
_Lv 22 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Haunter | 22 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #19 — Pokémon Tower 6F
_Lv 22 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 22 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |
| 2 | Gastly | 22 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |
| 3 | Gastly | 22 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #20 — Pokémon Tower 6F
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 24 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #21 — Pokémon Tower 6F
_Lv 24 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 24 | Ghost/Poison | Lick · Night Shade · Confuse Ray · **Mega Drain** |

### Channeler #22 — Saffron Gym
_Lv 34 · 2 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 34 | Ghost/Poison | Lick · Night Shade · **Sludge Bomb** · Hypnosis |
| 2 | Haunter | 34 | Ghost/Poison | Night Shade · **Lick** · Hypnosis · Sludge |

### Channeler #23 — Saffron Gym
_Lv 38 · 1 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Haunter | 38 | Ghost/Poison | Hypnosis · Sludge · Psychic · Shadow Ball |

### Channeler #24 — Saffron Gym
_Lv 33 · 3 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Gastly | 33 | Ghost/Poison | Lick · Night Shade · **Sludge Bomb** · Hypnosis |
| 2 | Gastly | 33 | Ghost/Poison | Lick · Night Shade · **Sludge Bomb** · Hypnosis |
| 3 | Haunter | 33 | Ghost/Poison | Night Shade · **Lick** · Hypnosis · Sludge |


---

## Agatha ⭐

### Agatha #1
_Lv 55–60 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Haunter | 55 | Ghost/Poison | **Shadow Ball** · **Sludge Bomb** · **Dark Pulse** · **Hypnosis** |
| 2 | Golbat | 56 | Poison/Flying | **Sludge Bomb** · **Air Slash** · **Bite** · **Confuse Ray** |
| 3 | Weezing | 56 | Poison | **Sludge Bomb** · **Thunderbolt** · **Fire Blast** · **Smokescreen** |
| 4 | Muk | 57 | Poison | **Sludge Bomb** · **Thunderbolt** · **Fire Blast** · **Minimize** |
| 5 | Arbok | 58 | Poison | **Poison Jab** · **Crunch** · **Earthquake** · **Screech** |
| 6 | Gengar | 60 | Ghost/Poison | **Shadow Ball** · **Sludge Bomb** · **Dark Pulse** · **Hypnosis** |


---

## Lance ⭐

### Lance #1
_Lv 56–62 · 6 Pokémon_

| # | Pokémon | Lv | Types | Moves |
|---|---------|----|-------|-------|
| 1 | Dragonair | 56 | Dragon | **Dragon Pulse** · **Ice Beam** · **Thunderbolt** · **Thunder Wave** |
| 2 | Pidgeot | 57 | Normal/Flying | **Air Slash** · **Double-Edge** · **Agility** · **Sand-Attack** |
| 3 | Gyarados | 58 | Water/Flying | **Hydro Pump** · **Wing Attack** · **Crunch** · **Leer** |
| 4 | Charizard | 58 | Fire/Flying | **Flamethrower** · **Air Slash** · **Earthquake** · **Swords Dance** |
| 5 | Aerodactyl | 60 | Rock/Flying | **Stone Edge** · **Wing Attack** · **Crunch** · **Agility** |
| 6 | Dragonite | 62 | Dragon/Flying | **Outrage** · **Air Slash** · **Ice Beam** · **Thunder Wave** |

