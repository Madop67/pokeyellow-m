; Applies per-slot move overrides from the SpecialTrainerMoves table to the
; freshly built enemy roster, then recomputes each mon's PP and the trainer's
; prize money. This is the tail of ReadTrainer (engine/battle/read_trainer_party.asm),
; extracted into its own routine so it can live in the same floating bank as the
; SpecialTrainerMoves table — the table outgrew "Battle Engine 6" once every
; regular trainer got a full moveset (Phase 4). Reached via `callfar` from
; ReadTrainer; the table is read same-bank from here.
ApplySpecialTrainerMoves::
; does the trainer have additional move data?
	ld a, [wTrainerClass]
	ld b, a
	ld a, [wTrainerNo]
	ld c, a
	ld hl, SpecialTrainerMoves
.loopAdditionalMoveData
	ld a, [hli]
	cp $ff
	jr z, .FinishUp
	cp b
	jr nz, .loopSkipTrainer
	ld a, [hli]
	cp c
	jr nz, .loopSkipTrainer
	ld d, h
	ld e, l
.writeAdditionalMoveDataLoop
	ld a, [de]
	inc de
	and a
	jp z, .FinishUp
	dec a
	ld hl, wEnemyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [de]
	inc de
	dec a
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [de]
	inc de
	ld [hl], a
	jr .writeAdditionalMoveDataLoop
.loopSkipTrainer
	ld a, [hli]
	and a
	jr nz, .loopSkipTrainer
	jr .loopAdditionalMoveData
.FinishUp
; SpecialTrainerMoves can overwrite move slots that WriteMonMoves left empty
; (an empty slot is assigned 0 PP). Recompute every roster mon's PP so any
; move added this way is actually usable instead of being stuck at 0 PP.
	ld a, [wEnemyPartyCount]
	and a
	jr z, .clearMoneyWon
	ld c, a ; number of party mons
	ld b, 0 ; current mon index
.recomputePPLoop
	push bc
	ld a, b
	ld hl, wEnemyMon1Moves
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes ; hl = this mon's moves
	push hl
	ld de, MON_PP - MON_MOVES - 1
	add hl, de
	ld d, h
	ld e, l ; de = this mon's PP - 1
	pop hl
	predef LoadMovePPs
	pop bc
	inc b
	ld a, b
	cp c
	jr nz, .recomputePPLoop
.clearMoneyWon
; clear wAmountMoneyWon addresses
	xor a
	ld de, wAmountMoneyWon
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	ld a, [wCurEnemyLevel]
	ld b, a
.LastLoop
; update wAmountMoneyWon addresses (money to win) based on enemy's level
	ld hl, wTrainerBaseMoney + 1
	ld c, 2 ; wAmountMoneyWon is a 3-byte number
	push bc
	predef AddBCDPredef
	pop bc
	inc de
	inc de
	dec b
	jr nz, .LastLoop ; repeat wCurEnemyLevel times
	ret

INCLUDE "data/trainers/special_moves.asm"
