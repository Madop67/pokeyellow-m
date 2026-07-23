# Achievements ("Records")

Chromatic Yellow tracks **48 achievements**, viewable from the **`Records`** option on
the main menu (available with or without a save loaded). Unlock state is a 6-byte bitfield
stored in SRAM **outside** the save game (`sAchievements`), so it persists across New Game
and every playthrough. A full **Clear Save** (factory reset) is the only thing that wipes it.

**How they unlock:**
- **Derived** — recomputed from your saved progress by `SyncAchievements`, which runs every
  time you **save** and when you enter the **Hall of Fame**. Most achievements are derived, so
  they may only light up on your next save after you meet the condition.
- **Hook** — a one-time in-game moment (evolving, Terastallizing). These are flagged the instant
  they happen and confirmed at your next save.

The in-game viewer shows each entry with a `▶` marker once unlocked, the display name, and a
`nn/48` unlocked counter in the header.

> Implementation: `engine/menus/achievements.asm`, indices in
> `constants/achievement_constants.asm`, storage in `ram/sram.asm`. This doc is hand-maintained —
> update it if the roster changes.

## Gym Badges

| # | Name | How to unlock | Type |
|---|------|---------------|------|
| 1 | Boulder Badge | Defeat Brock | Derived |
| 2 | Cascade Badge | Defeat Misty | Derived |
| 3 | Thunder Badge | Defeat Lt. Surge | Derived |
| 4 | Rainbow Badge | Defeat Erika | Derived |
| 5 | Soul Badge | Defeat Koga | Derived |
| 6 | Marsh Badge | Defeat Sabrina | Derived |
| 7 | Volcano Badge | Defeat Blaine | Derived |
| 8 | Earth Badge | Defeat Giovanni | Derived |

## Pokédex

| # | Name | How to unlock | Type |
|---|------|---------------|------|
| 9  | Dex: 10 | Own 10 species | Derived |
| 10 | Dex: 25 | Own 25 species | Derived |
| 11 | Dex: 50 | Own 50 species | Derived |
| 12 | Dex: 100 | Own 100 species | Derived |
| 13 | Dex: 150 | Own 150 species | Derived |
| 14 | Living Dex | Own all 151 species | Derived |
| 15 | Seen 75 | Register 75 species as seen | Derived |
| 16 | Seen Them All | Register all 151 species as seen | Derived |

## Legendaries

| # | Name | How to unlock | Type |
|---|------|---------------|------|
| 17 | Articuno | Catch Articuno | Derived |
| 18 | Zapdos | Catch Zapdos | Derived |
| 19 | Moltres | Catch Moltres | Derived |
| 20 | Storm Trio | Own all three legendary birds | Derived |
| 21 | Mewtwo | Catch Mewtwo | Derived |
| 22 | Mew | Obtain Mew | Derived |

## Champion & Rival

| # | Name | How to unlock | Type |
|---|------|---------------|------|
| 23 | Champion | Enter the Hall of Fame | Derived |
| 24 | 3x Champion | Enter the Hall of Fame 3 times | Derived |
| 25 | 10x Champion | Enter the Hall of Fame 10 times | Derived |
| 26 | Rival Bested | Beat your rival on Route 22 (first battle) | Derived |

## Professor Oak

| # | Name | How to unlock | Type |
|---|------|---------------|------|
| 27 | Oak Beaten | Win any one of the three Professor Oak battles | Derived |
| 28 | Oak Trounced | Win all three Professor Oak battles | Derived |

## Training & Collection

| # | Name | How to unlock | Type |
|---|------|---------------|------|
| 29 | Full Party | Carry a full party of 6 | Derived |
| 30 | Level 50 | Raise a party Pokémon to Lv. 50 | Derived |
| 31 | Level 100 | Raise a party Pokémon to Lv. 100 | Derived |
| 32 | PC Box Full | Fill a PC box (20 Pokémon) | Derived |
| 33 | Evolution | Evolve a Pokémon | Hook |
| 34 | Fossil Reborn | Own Omanyte, Kabuto, or Aerodactyl | Derived |
| 35 | HM Master | Hold all 5 HMs in your bag | Derived |

## Money & Items

| # | Name | How to unlock | Type |
|---|------|---------------|------|
| 36 | 10K Cash | Hold 10,000 money | Derived |
| 37 | 100K Cash | Hold 100,000 money | Derived |
| 38 | Coin Master | Hold the maximum 9,999 Game Corner coins | Derived |
| 39 | Master Ball | Obtain the Master Ball | Derived |
| 40 | Tera Orb | Obtain the Tera Orb | Derived |

## Texas Hold'em

| # | Name | How to unlock | Type |
|---|------|---------------|------|
| 41 | Holdem 100K | Cash out with 100,000+ money from a Texas Hold'em session | Hook |
| 42 | Holdem 9999 | Cash out the 9,999 coin cap from a Texas Hold'em session | Hook |

## Playtime

| # | Name | How to unlock | Type |
|---|------|---------------|------|
| 43 | 1 Hour Play | Play for 1 hour | Derived |
| 44 | 10 Hours Play | Play for 10 hours | Derived |

## Terastallization (Chromatic mechanics)

| # | Name | How to unlock | Type |
|---|------|---------------|------|
| 45 | Terastallize | Terastallize a Pokémon in battle | Hook |
| 46 | Off Type Tera | Terastallize into a type different from the Pokémon's own | Hook |
| 47 | Tera Picker | Change a Pokémon's Tera Type in the picker | Hook |

## Capstone

| # | Name | How to unlock | Type |
|---|------|---------------|------|
| 48 | Completionist | Unlock every other achievement | Derived |
