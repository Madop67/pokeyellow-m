; [wCurSpecies] = pokemon ID
; hl = dest addr
PrintMonType:
	call GetPredefRegisters
	push hl
	call GetMonHeader
	pop hl
	push hl
	ld a, [wMonHType1]
	call PrintType
	ld a, [wMonHType1]
	ld b, a
	ld a, [wMonHType2]
	cp b
	pop hl
	jr z, EraseType2Text
	ld bc, SCREEN_WIDTH * 2
	add hl, bc

; a = type
; hl = dest addr
PrintType:
	push hl
	jr PrintType_

; erase "TYPE2/" if the mon only has 1 type
EraseType2Text:
	ld a, ' '
	ld bc, $13
	add hl, bc
	ld bc, $6
	jp FillMemory

; Copy the name of type [wNamedObjectIndex] into wStringBuffer
; (for text_ram in battle messages).
CopyTypeNameToStringBuffer::
	ld a, [wNamedObjectIndex]
	add a
	ld hl, TypeNames
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wStringBuffer
	ld bc, NAME_BUFFER_LENGTH ; the "@" terminator is within this range
	jp CopyData

; [wNamedObjectIndex] = type id
; hl = dest addr
PrintTypeName:
	call GetPredefRegisters
	ld a, [wNamedObjectIndex]
	push hl
	jr PrintType_

PrintMoveType:
	call GetPredefRegisters
	push hl
	ld a, [wPlayerMoveType]
; fall through

PrintType_:
; show NORMAL for Sound/Light when they're disabled (Options -> MECHANICS).
; Inlined rather than sharing the Battle Core copy of NormalizeExtraType, since
; this code lives in a different ROM bank.
	ld b, a
	ld a, [wGameplayOptions]
	bit BIT_VANILLA_TYPES, a
	ld a, b
	jr z, .gotType
	cp SOUND
	jr c, .gotType
	cp TYPELESS
	jr nc, .gotType
	ld a, NORMAL
.gotType
	add a
	ld hl, TypeNames
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	ld e, a
	ld d, [hl]
	pop hl
	jp PlaceString

INCLUDE "data/types/names.asm"
