# Pokémon Chromatic Yellow

**Pokémon Chromatic Yellow** is a ROM hack of **Pokémon Yellow** (Game Boy Color)
that keeps the original game intact — Kanto, the 151 Pokémon, the story, Pikachu at
your heels — but rips out the aging Gen 1 battle engine and replaces it with modern,
Gen 6+ combat mechanics and a completely rebuilt move list.

## What's changed

### Battle mechanics — brought up to the modern day

- **Full Gen 6+ type chart**, plus new types: **Steel**, **Dark**, **Fairy**,
  **Stellar** (neutral vs. everything), **Sound**, **Light**, and **???** (typeless,
  used by Struggle). Ghost hits Psychic, Bug/Poison no longer maul each other, Steel
  resistances apply, etc. (The non-standard **Sound** and **Light** types can be turned
  off — see [the MECHANICS menu](#make-it-yours--the-mechanics-menu).)
- **Physical/Special split** — every move carries its own damage category (Gen 4+
  assignments) instead of it being decided by the move's type. Counter now counters any
  physical move.
- **Separate Sp. Atk and Sp. Def** — the old single "Special" stat is split into two
  modern base values (they share one DV and one EV, Gen 2 style). The summary screen
  shows all six stats.
- **Modern EVs** — defeating a Pokémon awards its modern EV yield (Sp. Atk + Sp. Def
  merged into a shared Special EV), with caps of **252 per stat / 510 total**.
  Vitamins give +10 within the caps.
- **Modern critical hits** — staged rates (1/24 base, 1/8 for high-crit moves, 1/2 with
  Focus Energy, guaranteed at stage 3+), dealing **1.5×** on unmodified stats. The Gen 1
  Focus Energy bug is fixed.
- **Status immunities** — Steel types can't be poisoned; Electric types can't be
  paralyzed.
- **Modern EXP sharing** — the whole party earns experience whenever an enemy is knocked
  out *or* caught, not just the Pokémon that fought. This makes the **Exp. All** item
  redundant, so it is **deprecated**. (Can be switched back to classic Gen 1 EXP — see
  [the MECHANICS menu](#make-it-yours--the-mechanics-menu).)

### Terastallization

The Gen 9 Terastal phenomenon, adapted for Kanto:

- The Viridian Mart clerk hands over a **Tera Orb** along with Prof. Oak's parcel.
- Every Pokémon has a **Tera Type** (default: its primary type), stored in the
  repurposed legacy catch-rate byte, and changeable at any time by pressing
  **SELECT on the stats screen** — any type except ??? and Stellar.
- In battle, press **START on the move menu** to prime Terastallization (a "TERA"
  marker appears); it triggers once per battle when your move executes, turning the
  Pokémon into a pure Tera-Type for the rest of the battle (backing out or
  switching doesn't consume it). While a Pokémon is terastallized, a three-letter
  type tag (e.g. "GHO") shows on its battle nameplate next to the level.
- STAB follows Gen 9 rules: tera-type moves and original-type moves both get 1.5×;
  if the Tera Type matches an original type, that type's moves hit at **2×**.
- **Boss aces terastallize too** — gym leaders, Giovanni, the Elite Four and the
  rival Terastallize their last Pokémon the moment it's sent out.

### Make it yours — the MECHANICS menu

Not every change is mandatory. The in-game **Options** screen has a new **MECHANICS**
entry that opens a sub-menu where three of the fork's headline mechanics can be toggled
on or off at any time. Choices are saved with your game and default to the full fork
experience:

| Option | Values | What it does |
|--------|--------|--------------|
| **TYPE ADD** | `GEN6/SL` · `GEN 6` | `GEN6/SL` keeps the fork's added **Sound** and **Light** types. `GEN 6` retires them — Sound/Light moves and Pokémon are treated as **Normal** everywhere (matchups, STAB, displays), leaving a standard Gen 6 type chart (Steel/Dark/Fairy). |
| **EXP RULES** | `MODERN` · `CLASSIC` | `MODERN` gives the whole party full, undivided EXP. `CLASSIC` restores Gen 1 rules — only the Pokémon that fought earn EXP, split among them. (Modern EV yields stay on either way.) |
| **TERA** | `ON` · `OFF` | Turns Terastallization off entirely — no START prompt, no Tera-type picker on the stats screen, and boss aces won't Terastallize. |

### Complete move overhaul

The move list was redone from scratch (**225 moves**). Every attacking type gets one
move in each power band (weak / moderate / strong / strongest × physical / special),
all 55 original status moves survive with their original IDs, and every learnset and TM
was rebuilt to match.

### Trainer & AI overhaul

- Boss teams rebuilt into competitive six-Pokémon parties with item-aware AI.
- Regular trainers given curated, level-capped movesets (STAB + coverage + one utility).
  
### Fixed vanilla bugs

- The 1/256-miss glitch is gone — 100%-accuracy moves can't miss.
- `GetName` no longer corrupts names for IDs ≥ `$C4`.

## Reference documentation

These are **generated from the game data** — the fastest way to see the fork's current
balance without decoding the raw tables:

- **[docs/pokemon_reference.md](docs/pokemon_reference.md)** — all 151 Pokémon (split
  stats, EV yields, catch rate, base exp, growth, evolutions, locations, level-up
  movesets, TM/HM compatibility), plus the full type chart and complete move table.
- **[docs/trainer_reference.md](docs/trainer_reference.md)** — every trainer battle in
  the game: class, location, party, levels, and the exact moveset each Pokémon uses.

## Building

Requires **rgbds 1.0.1** exactly (see [.rgbds-version](.rgbds-version)), plus `make` and
a C compiler. Full toolchain setup is in [INSTALL.md](INSTALL.md).

```bash
make                 # build pokeyellow.gbc and pokeyellow_debug.gbc
make yellow          # build just pokeyellow.gbc
make yellow_debug    # debug build with the debug menu
make -j$(nproc)      # parallel build (recommended)
make clean           # remove generated ROMs/objects and intermediates
```

`make compare` diffs against vanilla hashes and **will report a mismatch** in this fork —
that's expected, not a build failure. To see what a change did to the ROM, keep a copy of
your previous `.gbc` and diff against that.

Saved games carry over between builds: the engine re-derives the map pointers cached in
the save when you continue, so a save file from an older build of the ROM keeps working.

## Credits

Built on the [pret/pokeyellow](https://github.com/pret/pokeyellow) disassembly of
Pokémon Yellow. Thanks to the [pret](https://pret.github.io/) community for the
disassembly this is based on.

Pokémon is © Nintendo / Creatures Inc. / GAME FREAK Inc. This is a non-commercial fan project; no copyrighted ROM is distributed.
