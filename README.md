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
  resistances apply, etc.
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
  redundant, so it is **deprecated**.

### Complete move overhaul

The move list was redone from scratch (**225 moves**). Every attacking type gets one
move in each power band (weak / moderate / strong / strongest × physical / special),
all 55 original status moves survive with their original IDs, and every learnset and TM
was rebuilt to match. Design rationale in [docs/move_overhaul_plan.md](docs/move_overhaul_plan.md).

### Trainer & AI overhaul

- Boss teams rebuilt into competitive six-Pokémon parties with item-aware AI.
- Regular trainers given curated, level-capped movesets (STAB + coverage + one utility).
- See [docs/trainer_overhaul_plan.html](docs/trainer_overhaul_plan.html) and
  [docs/trainer_overhaul_phase4.html](docs/trainer_overhaul_phase4.html) for the design specs.

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

## Credits

Built on the [pret/pokeyellow](https://github.com/pret/pokeyellow) disassembly of
Pokémon Yellow. Thanks to the [pret](https://pret.github.io/) community for the
disassembly this is based on.

Pokémon is © Nintendo / Creatures Inc. / GAME FREAK Inc. This is a non-commercial fan project; no copyrighted ROM is distributed.
