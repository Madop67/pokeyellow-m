; Tera Type picker, opened with SELECT on page 1 of a party mon's status screen.
; Presents the 20 selectable tera types (every type except BIRD, STELLAR and
; the "???" TYPELESS type) in two columns of 10.

DEF NUM_TERA_TYPES      EQU 20
DEF TERA_TYPES_PER_COL  EQU 10
DEF TERA_MENU_TOP_ROW   EQU 3

TeraTypeList:
	db NORMAL, FIGHTING, FLYING, POISON, GROUND
	db ROCK, BUG, GHOST, STEEL, FIRE
	db WATER, GRASS, ELECTRIC, PSYCHIC_TYPE, ICE
	db DRAGON, DARK, FAIRY, SOUND, LIGHT

; Let the player choose the Tera Type of party mon [wWhichPokemon].
; The caller (StatusScreen) redraws the screen afterwards.
TeraTypePicker::
	ld a, [wGameplayOptions]
	bit BIT_NO_TERA, a
	ret nz ; Terastallization disabled in Options -> MECHANICS; SELECT does nothing
	ld a, [wCurrentMenuItem]
	push af
	call ClearScreen
	hlcoord 0, 0
	lb bc, 16, 18
	call TextBoxBorder
	hlcoord 2, 1
	ld de, TeraPickerTitleText
	call PlaceString
; print the type names in two columns of 10
	xor a
.printLoop
	push af
	call GetTeraListEntry
	ld [wNamedObjectIndex], a
	pop af
	push af
	call GetTeraEntryCoord ; clobbers a, so look the entry up first
	predef PrintTypeName
	pop af
	inc a
	cp NUM_TERA_TYPES
	jr nz, .printLoop
; start the cursor on the mon's current tera type
	call ValidateLoadedMonTeraType
	ld b, a
	ld hl, TeraTypeList
	ld c, 0
.findCurrentLoop
	ld a, [hli]
	cp b
	jr z, .foundCurrent
	inc c
	ld a, c
	cp NUM_TERA_TYPES
	jr nz, .findCurrentLoop
	ld c, 0 ; not in the list; default to the first entry
.foundCurrent
	ld a, c
	ld [wCurrentMenuItem], a
	call PlaceTeraCursor
.inputLoop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and a
	jr z, .inputLoop
	bit B_PAD_A, a
	jr nz, .confirm
	bit B_PAD_B, a
	jr nz, .done
	ld b, a
	ld a, [wCurrentMenuItem]
	bit B_PAD_UP, b
	jr nz, .up
	bit B_PAD_DOWN, b
	jr nz, .down
	ld a, b
	and PAD_LEFT | PAD_RIGHT
	jr z, .inputLoop
	ld a, [wCurrentMenuItem]
; LEFT/RIGHT hop to the same row of the other column
	cp TERA_TYPES_PER_COL
	jr nc, .toLeftColumn
	add TERA_TYPES_PER_COL
	jr .moveTo
.toLeftColumn
	sub TERA_TYPES_PER_COL
	jr .moveTo
.up
	ld c, a
	cp TERA_TYPES_PER_COL
	jr c, .upRow
	sub TERA_TYPES_PER_COL
.upRow
	and a ; top row of the column?
	ld a, c
	jr nz, .upSimple
	add TERA_TYPES_PER_COL - 1 ; wrap to the bottom
	jr .moveTo
.upSimple
	dec a
	jr .moveTo
.down
	ld c, a
	cp TERA_TYPES_PER_COL
	jr c, .downRow
	sub TERA_TYPES_PER_COL
.downRow
	cp TERA_TYPES_PER_COL - 1 ; bottom row of the column?
	ld a, c
	jr nz, .downSimple
	sub TERA_TYPES_PER_COL - 1 ; wrap to the top
	jr .moveTo
.downSimple
	inc a
.moveTo
	push af
	ld a, [wCurrentMenuItem]
	call GetTeraEntryCoord
	dec hl
	ld [hl], ' '
	pop af
	ld [wCurrentMenuItem], a
	call PlaceTeraCursor
	jr .inputLoop
.confirm
	ld a, SFX_PRESS_AB
	call PlaySound
	ld hl, wPartyMon1TeraType
	ld bc, PARTYMON_STRUCT_LENGTH
	ld a, [wWhichPokemon]
	call AddNTimes
	push hl
	ld a, [wCurrentMenuItem]
	call GetTeraListEntry
	pop hl
	ld [hl], a
	ld [wLoadedMonTeraType], a
.done
	pop af
	ld [wCurrentMenuItem], a
	ret

; in: a = list index; out: a = type id from TeraTypeList
GetTeraListEntry:
	ld hl, TeraTypeList
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hl]
	ret

; draw the cursor next to entry [wCurrentMenuItem]
PlaceTeraCursor:
	ld a, [wCurrentMenuItem]
	call GetTeraEntryCoord
	dec hl
	ld [hl], '▶'
	ret

; in: a = list index (0-19); out: hl = tilemap coord of the entry's name
GetTeraEntryCoord:
	cp TERA_TYPES_PER_COL
	jr c, .leftColumn
	sub TERA_TYPES_PER_COL
	ld c, a
	hlcoord 11, TERA_MENU_TOP_ROW
	jr .addRows
.leftColumn
	ld c, a
	hlcoord 2, TERA_MENU_TOP_ROW
.addRows
	ld de, SCREEN_WIDTH
	inc c
.rowLoop
	dec c
	ret z
	add hl, de
	jr .rowLoop

TeraPickerTitleText:
	db "Choose Tera type@"
