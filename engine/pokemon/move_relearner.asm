; The pokemon menu's RELEARN option: teach a party mon a move from its own
; level-up learnset that it is already high enough level to have learned, but
; doesn't currently know. Lives in the same bank as EvosMovesPointerTable so it
; can walk a learnset with GetMonLearnset.

; INPUT: [wWhichPokemon] = party slot of the mon to teach
MoveRelearnerMenu::
.loop
	call BuildRelearnableMoveList
	and a ; are there any moves left to relearn?
	jr z, .noMoves
	call DrawRelearnableMoveMenu
	ld hl, hUILayoutFlags
	set BIT_DOUBLE_SPACED_MENU, [hl] ; single-spaced rows
	call HandleMenuInput
	ld hl, hUILayoutFlags
	res BIT_DOUBLE_SPACED_MENU, [hl]
	bit B_PAD_B, a
	ret nz
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wRelearnCount]
	cp b ; is the cursor on the CANCEL entry below the last move?
	ret z
	ld c, b
	ld b, 0
	ld hl, wRelearnMoves
	add hl, bc
	ld a, [hl]
	ld [wMoveNum], a
	ld [wNamedObjectIndex], a
	call GetMoveName
	call CopyToStringBuffer
	predef LearnMove
	jr .loop

.noMoves
	ld hl, NoMovesToRelearnText
	jp PrintText

; Fills wRelearnMoves with every move in the mon's learnset that it is already
; high enough level for and doesn't already know.
; OUTPUT: a = [wRelearnCount]
BuildRelearnableMoveList:
	xor a
	ld [wRelearnCount], a
	ld hl, wPartyMon1Species
	call RelearnGetMonDataPointer
	ld a, [hl]
	ld [wCurPartySpecies], a ; GetMonLearnset reads the species from here
	ld hl, wPartyMon1Level
	call RelearnGetMonDataPointer
	ld a, [hl]
	ld [wRelearnMonLevel], a
	call GetMonLearnset
	ld de, wRelearnMoves
.learnsetLoop
	ld a, [hli] ; level the move is learned at
	and a ; end of the learnset?
	jr z, .done
	ld b, a
	ld a, [wRelearnMonLevel]
	cp b
	ld a, [hli] ; move ID (does not affect flags)
	jr c, .done ; the learnset is sorted by level, so the rest is out of reach
	ld [wRelearnCandidate], a
	call RelearnMoveIsRedundant
	jr c, .learnsetLoop
	ld a, [wRelearnCandidate]
	ld [de], a
	inc de
	ld a, [wRelearnCount]
	inc a
	ld [wRelearnCount], a
	cp MAX_RELEARNABLE_MOVES
	jr c, .learnsetLoop
.done
	ld a, [wRelearnCount]
	and a
	ret

; INPUT: hl = the wPartyMon1 field to read
; OUTPUT: hl = that field for the mon in [wWhichPokemon]
RelearnGetMonDataPointer:
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	jp AddNTimes

; Returns carry if [wRelearnCandidate] is a move the mon already knows or one
; that an earlier learnset entry already added to the list.
RelearnMoveIsRedundant:
	push de
	push hl
	ld hl, wPartyMon1Moves
	call RelearnGetMonDataPointer
	ld c, NUM_MOVES
	call .search
	jr c, .done
	ld hl, wRelearnMoves
	ld a, [wRelearnCount]
	ld c, a
	call .search
.done
	pop hl
	pop de
	ret

; INPUT: hl = list of move IDs, c = its length
.search
	ld a, c
	and a ; an empty list can't contain anything (this also clears carry)
	ret z
	ld a, [wRelearnCandidate]
	ld b, a
.loop
	ld a, [hli]
	cp b
	jr z, .found
	dec c
	jr nz, .loop
	and a ; clear carry
	ret
.found
	scf
	ret

; Draws the list of relearnable moves, with a CANCEL entry below it, and sets up
; the menu variables to match.
DrawRelearnableMoveMenu:
; wipe whatever LearnMove left behind on the previous pass through the list
	call ClearScreen
; the box holds the mon's name, a blank row, every move, and CANCEL
	ld a, [wRelearnCount]
	add 3
	ld b, a
	ld c, 18
	hlcoord 0, 0
	call TextBoxBorder
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	hlcoord 1, 1
	ld de, wNameBuffer
	call PlaceString
	ld a, [wRelearnCount]
	ld b, a
	ld de, wRelearnMoves
	hlcoord 2, 3
.printLoop
	ld a, [de]
	ld [wNamedObjectIndex], a
	push bc
	push de
	call GetMoveName ; preserves hl, returns de = wNameBuffer
	call PlaceString ; preserves hl
	ld de, SCREEN_WIDTH
	add hl, de
	pop de
	inc de
	pop bc
	dec b
	jr nz, .printLoop
	ld de, ListMenuCancelText
	call PlaceString
	ld hl, wTopMenuItemY
	ld a, 3
	ld [hli], a ; wTopMenuItemY
	ld a, 1
	ld [hli], a ; wTopMenuItemX
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl      ; wTileBehindCursor
	ld a, [wRelearnCount]
	ld [hli], a ; wMaxMenuItem (the last entry is CANCEL)
	ld a, PAD_A | PAD_B
	ld [hli], a ; wMenuWatchedKeys
	ld [hl], 0  ; wLastMenuItem
	jp Delay3

NoMovesToRelearnText:
	text "There are no old"
	line "moves to recall!"
	prompt
