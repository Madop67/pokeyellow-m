# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

**Pokémon Chromatic Yellow** — a **heavily modified fork** of the
[pret/pokeyellow](https://github.com/pret/pokeyellow)
disassembly of **Pokémon Yellow** (Game Boy Color), built with `rgbds`.
The hack's name appears on the title screen (`gfx/title/pokemon_logo.png` +
`pokemon_logo.tilemap`) and in the cartridge header title (`PKMN CHROMATIC`,
set via `RGBFIXFLAGS` in the Makefile; the header field caps at 15 chars). Nearly all source
is Game Boy Z80 assembly (`.asm`); there is no application/business logic outside of the
game's own code.

**This is not vanilla Yellow.** The game data and engine have been substantially edited —
most visibly, combat mechanics are modernized (see [Fork mechanics](#fork-mechanics-not-vanilla)
below). As a result **the ROM will NOT match `roms.sha1`** and `make compare` is expected
to *fail*. Do not treat a hash mismatch as a build error, and do not "fix" changes to
restore byte-exactness against the original release — divergence from vanilla is the point
of this fork. Use a plain successful `make` (assembles + links + produces the `.gbc`) as
the build-passed signal instead.

## Build commands

Requires **rgbds 1.0.1** exactly (see `.rgbds-version`) — newer/older versions can break
the build or produce a non-matching ROM. Also requires `make` and a C compiler (the
in-tree `tools/` are built automatically as part of the ROM build).

```bash
make                       # build pokeyellow.gbc and pokeyellow_debug.gbc
make yellow                # build just pokeyellow.gbc
make yellow_debug          # build just pokeyellow_debug.gbc (has -D _DEBUG, debug menu)
make yellow_vc             # build the Virtual Console patch (pokeyellow.patch)
make compare                # build + diff ROMs against roms.sha1 — EXPECTED TO FAIL in this fork (see below)
make clean                  # remove generated ROMs/objects and generated gfx/audio intermediates
make tidy                   # remove generated ROMs/objects but keep gfx/audio intermediates
make tools                  # build only the tools/ C utilities
make DEBUG=1                # also emit .sym/.map info for easier debugging
make RGBDS=path/to/rgbds/   # use a local rgbds install instead of one on PATH
make -j$(nproc)             # parallel build (recommended, CI does this)
```

There is no test suite. In the upstream project, correctness is verified by rebuilding and
diffing against the known-good ROM hashes in `roms.sha1` (`make compare`) — but **this fork
has diverged from vanilla, so `roms.sha1` no longer matches and `make compare` will report
a mismatch.** That mismatch is expected and is not a failure of the build. After a source
change, run `make -j$(nproc)` and treat a clean assemble+link (a freshly produced `.gbc`,
no `rgbasm`/`rgblink` errors) as success. If you want to know exactly what your change did
to the ROM, keep a copy of the previous `.gbc` and diff against that, not against
`roms.sha1`. (Note: CI's `checkdiff.sh` step and the `pret`-only `compare` step in
`.github/workflows/main.yml` assume vanilla and will likewise not pass unmodified here.)

There's no linter; `RGBASMFLAGS`/`RGBLINKFLAGS`/`RGBFIXFLAGS` all build with
`-Weverything`, so warnings surface directly from `make`.

## Big-picture architecture

### Source layout — assembled by inclusion, not by directory scanning

The ROM is built from a handful of top-level `.o` targets defined in `Makefile`
(`audio.o`, `home.o`, `main.o`, `maps.o`, `ram.o`, `text.o`, plus `gfx/*.o`), each
compiled from a same-named top-level `.asm` file (e.g. `main.asm` → `main.o`). Those
top-level files don't contain much code themselves — they're mostly `INCLUDE` directives
that pull in `.asm` files from `home/`, `engine/`, `data/`, `maps/`, `scripts/`, `text/`,
`gfx/`, etc., grouped into `SECTION`s (i.e. ROM banks, e.g. `SECTION "bank1", ROMX`).
**To find where a symbol lives, search for it directly — its home directory does not
necessarily match the top-level `.o` grouping.** `includes.asm` is prepended to every
compilation unit (`-P includes.asm`) and pulls in all macros and constants globally, so
constants/macros defined there don't need explicit per-file `INCLUDE`s.

Key top-level files/dirs:
- `main.asm` / `home.asm` / `maps.asm` / `text.asm` / `ram.asm` / `audio.asm` — top-level
  INCLUDE manifests, organized by ROM bank (`SECTION`s).
- `home/` — code assembled into the fixed "Home" bank (`$0000–$3FFF`), callable from any
  bank without bankswitching. Common low-level helpers (`copy.asm`, `delay.asm`,
  `joypad.asm`, `lcd.asm`, `fade.asm`, etc.).
- `engine/` — game logic, organized by subsystem (`battle/`, `overworld/`, `menus/`,
  `pokemon/`, `events/`, `items/`, `link/`, `audio/` via `audio.asm`, `printer/`,
  `slots/`, `pikachu/`, `debug/`, etc.). This is almost always where behavior changes go.
- `data/` — static data tables paired with `engine/` code (movesets, trainer parties,
  item effects/prices, base stats references, animation data, tilemaps, etc.).
- `maps/` — map layout blocks (`.blk`) and headers/objects per map.
- `scripts/` — one `.asm` file per map, containing that map's event script, NPC/sign
  text pointer tables, and text-script logic. Scripting uses a macro DSL from
  `macros/scripts/` (`ResetEvent`, `CheckEvent`, `text_far`, `text_asm`, etc.) rather than
  hand-rolled control flow.
- `text/` — the actual dialogue/menu strings referenced by `scripts/`.
- `constants/` — `EQU`/`const` definitions (map IDs, item IDs, move IDs, event flags,
  event constants, `hardware.inc`, etc.) shared across the whole codebase via
  `includes.asm`.
- `ram/` (via `ram.asm`) — WRAM/HRAM/SRAM/VRAM variable declarations (`wSomething`
  labels used throughout `engine/`).
- `macros/` — the assembly-level DSL: `macros/scripts/` for map/event scripting,
  `macros/data.asm` for data-table macros, `macros/code.asm`/`const.asm`/`ram.asm` for
  general code/constant/RAM declaration helpers, `macros/gfx.asm`/`coords.asm` for
  graphics.
- `gfx/` — graphics sources (`.png` checked in, `.2bpp`/`.1bpp`/`.pic` generated at
  build time by `tools/gfx` + `rgbgfx`) and their own `SECTION`s built as `gfx/*.o`.
- `audio/` — music/sound engine sources and `audio/pikachu_cries/` (`.wav` → `.pcm` via
  `tools/pcm`).
- `layout.link` — the linker script: defines every ROM bank layout and section
  placement/order. Changing which bank something lives in, or overflowing a bank, means
  editing here or reorganizing includes.
- `vc/` — Virtual Console-specific constants/patch template, only used for the
  `yellow_vc` / patch build path (`_YELLOW_VC` conditional).
- `tools/` — small C command-line utilities used only by the build (`gfx.c` — PNG↔GB
  tile conversion, `pkmncompress.c` — Pokémon front/back sprite compression,
  `make_patch.c` — VC patch generation, `pcm.c` — audio conversion, `scan_includes.c` —
  computes Makefile dependencies from `INCLUDE`s). Not part of the game itself.
- `docs/bugs_and_glitches.md` — catalog of known upstream (vanilla) game bugs with diffs
  showing the fix. Useful context when explaining original-game behavior; note some of
  these are already fixed in this fork (see mechanics changes below).
- `docs/pokemon_reference.md` — **generated** reference for all 151 Pokémon and every move
  *as they exist in this fork* (stats incl. split Sp. Atk/Sp. Def, EV yields, catch rate,
  base exp, growth rate, evolutions, locations, level-up movesets, TM/HM compatibility,
  plus the full type chart and move table). It is produced by
  `tools/gen_pokemon_docs.py` from the game data files — **do not hand-edit it; rerun that
  script after changing any Pokémon/move data** so the doc stays in sync. It is the fastest
  way to see the fork's current balance without decoding the raw data tables.

### Build dependency system

`tools/scan_includes` parses `INCLUDE`s recursively to generate accurate Makefile
dependencies per object file — there's no manual dependency list to maintain when adding
`INCLUDE`s to existing files. Graphics (`%.png` → `%.2bpp`/`%.1bpp` via `rgbgfx`, then
optionally further processed by `tools/gfx`) and audio (`%.wav` → `%.pcm` via `tools/pcm`)
have their own pattern rules near the bottom of `Makefile`; some individual graphics
targets have special flags (e.g. `--trim-whitespace`, `--interleave`) set per-file right
above the catch-all rules — check there before assuming the generic rule applies.

## Fork mechanics (not vanilla)

This fork modernizes Yellow's combat mechanics. When reasoning about gameplay, battle
code, or data, assume these rather than Gen 1 behavior (`docs/pokemon_reference.md` is the
authoritative, generated summary):

- **Type chart** — full Gen 6+ chart, with added types **Steel, Dark, Fairy, Stellar**
  (neutral vs. everything), **Sound, Light**, and **???** (typeless, used by Struggle).
  Many moves are retyped from Normal (e.g. Karate Chop→Fighting, Bite→Dark, Growl→Sound).
- **Physical/Special split** — damage category is per-move (Gen 4+ assignments), not
  determined by type. Counter counters any physical move.
- **Special stat split** — Sp. Atk and Sp. Def are separate stats (they share one DV and
  one EV, Gen-2 style). The summary screen shows all six stats.
- **Modern EVs** — modern EV yields on defeat (Sp. Atk + Sp. Def merged into a shared
  Special EV), caps of **252 per stat / 510 total**. Stat formula:
  `(2×(Base+DV) + EV/4) × Level/100 + 5`. Vitamins give +10 within the caps.
- **Crits** — modern staged rates (1/24 base, 1/8 high-crit, 1/2 with Focus Energy,
  guaranteed at stage 3+), **1.5×** on unmodified stats; the Focus Energy bug is fixed.
- **Fixed vanilla bugs/quirks** — the 1/256-miss glitch (100%-accuracy moves can't miss),
  Steel can't be poisoned / Electric can't be paralyzed, Exp. All no longer halves the
  enemy's base stats/catch rate, and `GetName` no longer corrupts names for ids ≥ $C4.
- **Complete move overhaul** — the move list was redone from scratch (225 moves,
  `NUM_ATTACKS` = 225): every attacking type has one move per power band
  (weak/moderate/strong/strongest × physical/special), all 55 vanilla status moves and a
  few signature moves survive with their original ids, and every learnset/TM was rebuilt.
  Design doc: `docs/move_overhaul_plan.md`; applied by `tools/apply_move_overhaul.py`
  (which requires the pre-overhaul data files to re-run). New moves reuse vanilla
  animations via their `AttackAnimationPointers` rows — the `move` macro's first byte must
  stay equal to the move's own id (`ReadMove` copies it into `wPlayerMoveNum`).

Because the game data is edited freely here, most changes to `engine/`, `data/`,
`home/`, or `scripts/` are **intended** to change the resulting ROM. There is no
byte-exactness constraint to preserve — verify changes by their in-game effect (or by
diffing against your own previous build), not against `roms.sha1`.
