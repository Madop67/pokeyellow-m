; Terastallization (Gen 9 mechanic, adapted).
;
; The player toggles "tera pending" with START on the move menu
; (TryToggleTeraPending); the transformation applies when the chosen move
; executes (CheckAndApplyPlayerTera), so backing out or switching never
; consumes the once-per-battle charge. Boss trainers terastallize their last
; party mon on send-out (CheckEnemyTeraOnSendOut). A terastallized mon
; becomes pure tera type; the STAB changes live in AdjustDamageForMoveType
; (GetTeraStabLevel) in the battle core.
;
; All state lives in wTeraState/wPlayerTera*/wEnemyTera*, zeroed each battle
; by InitBattleVariables.

; START pressed on the move menu: toggle the pending flag if allowed.
TryToggleTeraPending::
	ld a, [wGameplayOptions]
	bit BIT_NO_TERA, a
	ret nz ; Terastallization disabled in Options -> MECHANICS
	ld a, [wTeraState]
	bit BIT_TERA_PLAYER_DONE, a
	jr nz, .alreadyUsed
	ld b, TERA_ORB
	call IsItemInBag
	jr z, .noOrb
	ld hl, wTeraState
	ld a, [hl]
	xor 1 << BIT_TERA_PLAYER_PENDING
	ld [hl], a
	ret
.alreadyUsed
	ld hl, AlreadyTerastallizedText
	jp PrintText
.noOrb
	ld hl, NoTeraOrbText
	jp PrintText

; Called from ExecutePlayerMove before the move resolves.
CheckAndApplyPlayerTera::
	ld hl, wTeraState
	bit BIT_TERA_PLAYER_PENDING, [hl]
	ret z
	res BIT_TERA_PLAYER_PENDING, [hl]
	set BIT_TERA_PLAYER_DONE, [hl]
	ld a, [wPlayerMonNumber]
	ld [wPlayerTeraMonIndex], a
	ld hl, wPartyMon1TeraType
	ld bc, PARTYMON_STRUCT_LENGTH
	call AddNTimes
	ld a, [hl]
	call ValidateBattleTeraType
	ld [wPlayerTeraType], a
	ld d, a
	ld hl, wBattleMonType1
	ld a, [hli]
	ld [wPlayerTeraOrigTypes], a
	ld a, [hl]
	ld [wPlayerTeraOrigTypes + 1], a
	ld a, d
	ld [hld], a ; the mon becomes pure tera type
	ld [hl], a
	ld [wNamedObjectIndex], a
	farcall CopyTypeNameToStringBuffer
	ld hl, TerastallizedText
	jp PrintText

; The stored value comes from a repurposed struct byte; saves from before the
; feature hold a raw catch rate there. Fall back to the mon's current type 1.
; in/out: a = tera type
ValidateBattleTeraType:
	cp STEEL + 1
	ret c              ; physical-group type ids
	cp FIRE
	jr c, .invalid     ; the unused $0A-$13 gap
	cp LIGHT + 1
	ret c              ; special-group type ids
.invalid
	ldh a, [hWhoseTurn]
	and a
	jr nz, .enemy
	ld a, [wBattleMonType1]
	ret
.enemy
	ld a, [wEnemyMonType1]
	ret

; Called at the end of LoadBattleMonFromParty: a terastallized mon keeps its
; tera typing when it is switched back in (the loader re-copies the party
; struct's types over wBattleMonType).
ReapplyPlayerTera::
	ld a, [wTeraState]
	bit BIT_TERA_PLAYER_DONE, a
	ret z
	ld a, [wPlayerTeraMonIndex]
	ld b, a
	ld a, [wWhichPokemon]
	cp b
	ret nz
	ld a, [wPlayerTeraType]
	ld hl, wBattleMonType1
	ld [hli], a
	ld [hl], a
	ret

; Called at the end of EnemySendOutFirstMon. Boss trainers terastallize
; their last party mon the moment it enters the battle.
CheckEnemyTeraOnSendOut::
	ld a, [wGameplayOptions]
	bit BIT_NO_TERA, a
	ret nz ; Terastallization disabled in Options -> MECHANICS
	ld a, [wIsInBattle]
	cp 2
	ret nz ; trainer battles only
	ld a, [wLinkState]
	and a
	ret nz
	ld a, [wTeraState]
	bit BIT_TERA_ENEMY_DONE, a
	jr nz, .maybeReapply
; only the trainer's last mon (the ace) terastallizes
	ld a, [wEnemyPartyCount]
	dec a
	ld b, a
	ld a, [wEnemyMonPartyPos]
	cp b
	ret nz
; look the trainer up in the boss table
	ld a, [wTrainerClass]
	ld b, a
	ld a, [wTrainerNo]
	ld c, a
	ld hl, BossTeraTable
.tableLoop
	ld a, [hli]
	cp -1
	ret z
	cp b
	jr nz, .skipInstance
	ld a, [hli]
	cp c
	jr nz, .skipType
	ld d, [hl] ; d = the ace's tera type
	jr .apply
.skipInstance
	inc hl
.skipType
	inc hl
	jr .tableLoop
.apply
	ld hl, wTeraState
	set BIT_TERA_ENEMY_DONE, [hl]
	ld a, [wEnemyMonPartyPos]
	ld [wEnemyTeraMonIndex], a
	ld a, d
	ld [wEnemyTeraType], a
	ld hl, wEnemyMonType1
	ld a, [hli]
	ld [wEnemyTeraOrigTypes], a
	ld a, [hl]
	ld [wEnemyTeraOrigTypes + 1], a
	ld a, d
	ld [hld], a ; the ace becomes pure tera type
	ld [hl], a
	ld [wNamedObjectIndex], a
	farcall CopyTypeNameToStringBuffer
	ld hl, EnemyTerastallizedText
	jp PrintText
.maybeReapply
; this fork's trainer AI can voluntarily switch, so the terastallized ace
; may leave and come back
	ld a, [wEnemyTeraMonIndex]
	ld b, a
	ld a, [wEnemyMonPartyPos]
	cp b
	ret nz
	ld a, [wEnemyTeraType]
	ld hl, wEnemyMonType1
	ld [hli], a
	ld [hl], a
	ret

; Called from DrawPlayerHUDAndHPBar: tag a terastallized mon's nameplate
; with the first three letters of its tera type. The HUD is cleared and
; redrawn every turn, so the tag persists while the mon is out and vanishes
; when another mon is sent in.
DrawPlayerTeraMarker::
	ld a, [wTeraState]
	bit BIT_TERA_PLAYER_DONE, a
	ret z
	ld a, [wPlayerTeraMonIndex]
	ld b, a
	ld a, [wPlayerMonNumber]
	cp b
	ret nz
	ld a, [wPlayerTeraType]
	hlcoord 10, 8
	jr DrawTeraMarker

; Called from DrawEnemyHUDAndHPBar.
DrawEnemyTeraMarker::
	ld a, [wTeraState]
	bit BIT_TERA_ENEMY_DONE, a
	ret z
	ld a, [wEnemyTeraMonIndex]
	ld b, a
	ld a, [wEnemyMonPartyPos]
	cp b
	ret nz
	ld a, [wEnemyTeraType]
	hlcoord 0, 1
	; fallthrough
DrawTeraMarker:
	ld [wNamedObjectIndex], a
	push hl
	farcall CopyTypeNameToStringBuffer
	pop hl
	ld de, wStringBuffer
	ld b, 3 ; every type name is at least 3 letters, and the prefixes are unique
.copyLoop
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .copyLoop
	ret

TerastallizedText:
	text_far _TerastallizedText
	text_end

EnemyTerastallizedText:
	text_far _EnemyTerastallizedText
	text_end

AlreadyTerastallizedText:
	text_far _AlreadyTerastallizedText
	text_end

NoTeraOrbText:
	text_far _NoTeraOrbText
	text_end

INCLUDE "data/battle/tera_bosses.asm"
