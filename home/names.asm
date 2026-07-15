GetMonName::
	push hl
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(MonsterNames)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ld a, [wNamedObjectIndex]
	dec a
	ld hl, MonsterNames
	ld c, NAME_LENGTH - 1
	ld b, 0
	call AddNTimes
	ld de, wNameBuffer
	push de
	ld bc, NAME_LENGTH - 1
	call CopyData
	ld hl, wNameBuffer + NAME_LENGTH - 1
	ld [hl], '@'
	pop de
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	pop hl
	ret

GetItemName::
; given an item ID at [wNamedObjectIndex], store the name of the item in wNameBuffer
	push hl
	push bc
	ld a, [wNamedObjectIndex]
	cp HM01 ; is this a TM/HM?
	jr nc, .Machine

	ld [wNameListIndex], a
	ld a, ITEM_NAME
	ld [wNameListType], a
	ld a, BANK(ItemNames)
	ld [wPredefBank], a
	call GetName
	jr .Finish

.Machine
	call GetMachineName
.Finish
	ld de, wNameBuffer
	pop bc
	pop hl
	ret

GetMachineName::
; copies the name of the move contained in the TM/HM in [wNamedObjectIndex]
; to wNameBuffer, so TM/HM items display as the move they teach
	push hl
	push de
	push bc
	ld a, [wNamedObjectIndex]
	push af ; save the item ID so we can restore it afterwards
; convert the item ID into a 0-based index into TechnicalMachines
	sub TM01
	jr nc, .gotMachineIndex ; TMs are TM01 and up
; HMs sit just below TM01, and their moves follow the TMs in the table
	add TM01
	sub HM01
	add NUM_TMS
.gotMachineIndex
	ld c, a
	ld b, 0
	ldh a, [hLoadedROMBank]
	push af
	ld a, BANK(TechnicalMachines)
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	ld hl, TechnicalMachines
	add hl, bc
	ld a, [hl] ; the move taught by this TM/HM
	ld [wNamedObjectIndex], a
	pop af
	ldh [hLoadedROMBank], a
	ld [rROMB], a
	call GetMoveName
	pop af
	ld [wNamedObjectIndex], a ; restore the item ID
	pop bc
	pop de
	pop hl
	ret

; sets carry if item is HM, clears carry if item is not HM
; Input: a = item ID
IsItemHM::
	cp HM01
	jr c, .notHM
	cp TM01
	ret
.notHM
	and a
	ret

; sets carry if move is an HM, clears carry if move is not an HM
; Input: a = move ID
IsMoveHM::
	ld hl, HMMoves
	ld de, 1
	jp IsInArray

HMMoves::
INCLUDE "data/moves/hm_moves.asm"

GetMoveName::
	push hl
	ld a, MOVE_NAME
	ld [wNameListType], a
	ld a, [wNamedObjectIndex]
	ld [wNameListIndex], a
	ld a, BANK(MoveNames)
	ld [wPredefBank], a
	call GetName
	ld de, wNameBuffer
	pop hl
	ret
