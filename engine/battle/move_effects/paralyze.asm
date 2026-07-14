ParalyzeEffect_:
	ld hl, wEnemyMonStatus
	ld de, wPlayerMoveType
	ldh a, [hWhoseTurn]
	and a
	jp z, .next
	ld hl, wBattleMonStatus
	ld de, wEnemyMoveType
.next
	ld a, [hl]
	and a ; does the target already have a status ailment?
	jr nz, .didntAffect
; electric-type targets can't be paralyzed (modern behavior)
	ld b, h
	ld c, l
	inc bc
	ld a, [bc]
	cp ELECTRIC
	jr z, .doesntAffect
	inc bc
	ld a, [bc]
	cp ELECTRIC
	jr z, .doesntAffect
; check if the target is immune due to types
	ld a, [de]
	cp ELECTRIC
	jr nz, .hitTest
	ld a, [bc]
	cp GROUND
	jr z, .doesntAffect
	dec bc
	ld a, [bc]
	cp GROUND
	jr z, .doesntAffect
.hitTest
	push hl
	callfar MoveHitTest
	pop hl
	ld a, [wMoveMissed]
	and a
	jr nz, .didntAffect
	set PAR, [hl]
	callfar QuarterSpeedDueToParalysis
	ld c, 30
	call DelayFrames
	callfar PlayCurrentMoveAnimation
	jpfar PrintMayNotAttackText
.didntAffect
	ld c, 50
	call DelayFrames
	jpfar PrintDidntAffectText
.doesntAffect
	ld c, 50
	call DelayFrames
	jpfar PrintDoesntAffectText
