# Pokémon Chromatic Yellow

Pokémon Yellow with its aging Gen 1 battle engine ripped out and replaced by modern,
Gen 6+ mechanics — same Kanto, same 151 Pokémon, same story, same Pikachu at your heels.
Below is everything that's changed from vanilla Yellow.

---

## ⚔️ Battle mechanics — brought up to the modern day

- **Full Gen 6+ type chart**, with new types added: **Steel**, **Dark**, **Fairy**,
  **Stellar** (neutral vs. everything), **Sound**, **Light**, and **???** (typeless).
  Ghost hits Psychic, Bug/Poison no longer maul each other, Steel resistances apply, and
  many moves are retyped off Normal (Karate Chop → Fighting, Bite → Dark, Growl → Sound).
- **Physical/Special split** — every move carries its own damage category (Gen 4+
  assignments) instead of it being decided by the move's type. Counter now counters *any*
  physical move.
- **Separate Sp. Atk and Sp. Def** — the single "Special" stat is split into two modern
  base values. The summary screen now shows all six stats.
- **Modern EVs** — defeating a Pokémon awards its modern EV yield, capped at **252 per
  stat / 510 total**. Vitamins give +10 within the caps.
- **Modern critical hits** — staged rates (1/24 base, 1/8 high-crit, 1/2 with Focus
  Energy, guaranteed at stage 3+), dealing **1.5×** on unmodified stats.
- **Status immunities** — Steel types can't be poisoned; Electric types can't be paralyzed.
- **Modern EXP sharing** — the whole party earns experience whenever an enemy is knocked
  out *or caught*, not just the Pokémon that fought. (This makes **Exp. All** redundant, so
  it's deprecated.)

## ✨ Terastallization

The Gen 9 Terastal phenomenon, adapted for Kanto:

- The **Viridian Mart clerk** hands over a **Tera Orb** along with Prof. Oak's parcel.
- Every Pokémon has a **Tera Type** (default: its primary type), changeable at any time by
  pressing **SELECT on the stats screen** — any type except ??? and Stellar.
- In battle, press **START on the move menu** to prime Terastallization. It triggers once
  per battle when your move executes, turning the Pokémon into a pure Tera-Type for the
  rest of the fight (backing out or switching doesn't waste it). A three-letter type tag
  (e.g. "GHO") appears on the battle nameplate.
- **STAB follows Gen 9 rules** — tera-type and original-type moves both get 1.5×; if the
  Tera Type matches an original type, that type's moves hit at **2×**.
- **Boss aces terastallize too** — gym leaders, Giovanni, the Elite Four and the rival all
  Terastallize their last Pokémon the moment it's sent out.

## 🔄 Complete move overhaul

- The move list was **redone from scratch — 225 moves**. Every attacking type gets one
  move in each power band (weak / moderate / strong / strongest × physical / special).
- All **55 original status moves** survive with their original IDs.
- **Every learnset and TM was rebuilt** to match the new move list.

## 🧠 Trainer & AI overhaul

- **Boss teams rebuilt** into competitive six-Pokémon parties with item-aware AI.
- **Regular trainers** given curated, level-capped movesets (STAB + coverage + one utility).

## 🃏 New minigame — Texas Hold'em

- A **Texas Hold'em poker** minigame is now playable at **every Pokémon Center** and the
  **Game Corner**.
- **Heads-up mode** (you vs. the dealer) lets you play for money or coins; a **4-max table**
  (you + 3 AI) plays for coins.

## 🐛 Fixed vanilla bugs

- The **1/256-miss glitch** is gone — 100%-accuracy moves can't miss.
- The **Focus Energy bug** is fixed (it now correctly *raises* your crit rate).
- `GetName` no longer corrupts Pokémon names for IDs ≥ `$C4`.

---

## 📖 Reference documentation

Generated straight from the game data — the fastest way to see the current balance:

- **`docs/pokemon_reference.md`** — all 151 Pokémon (split stats, EV yields, catch rate,
  base exp, evolutions, locations, movesets, TM/HM compatibility) plus the full type chart
  and move table.
- **`docs/trainer_reference.md`** — every trainer battle: class, location, party, levels,
  and the exact moveset each Pokémon uses.

## 💾 Save compatibility

Saved games carry over between builds — the engine re-derives the map pointers cached in a
save when you continue, so a save file from an older build keeps working.

---

*Built on the [pret/pokeyellow](https://github.com/pret/pokeyellow) disassembly. Pokémon is
© Nintendo / Creatures Inc. / GAME FREAK Inc. Non-commercial fan project; no copyrighted
ROM is distributed.*
