; Smarter trainer AI used by boss trainers (gym leaders, Elite Four, rivals).
;
; Move-selection scratch layout during AIEnemyTrainerChooseMoves (see wBuffer):
;   wBuffer + 0..3   per-slot move scores (lower = better), owned by the dispatcher
;   wBuffer + 4..11  per-slot 16-bit damage estimates (big-endian), layer 4
;   wBuffer + 12..13 best damage estimate seen so far, layer 4
;   wBuffer + 14     loop slot counter, layer 4
;   wBuffer + 20..25 scratch for the item/switch AI (AIPickSwitchTarget etc.)
;
; Score invariant: every layer must keep all slot scores >= 1, since the
; min-filter loop in AIEnemyTrainerChooseMoves decrements them to find the
; minimum. Base is $0A; layer 4 subtracts at most 5 and layer 5 at most 2.

; returns z if the player's active pokemon has type a. clobbers a and c.
AICheckPlayerType:
	ld c, a
	ld a, [wBattleMonType1]
	cp c
	ret z
	ld a, [wBattleMonType2]
	cp c
	ret

; boss AI layer: estimate each damaging move with the real damage formula,
; strongly prefer the highest expected damage, and prefer guaranteed KOs even more
AIMoveChoiceModification4:
	xor a
	ld [wAIScratchFlags], a
	ld [wBuffer + 12], a ; best estimate (high)
	ld [wBuffer + 13], a ; best estimate (low)
	ld [wBuffer + 14], a ; current move slot
.estimateLoop
	ld a, [wBuffer + 14]
	cp NUM_MOVES
	jp z, .scorePass
	ld c, a
	ld b, 0
	ld hl, wEnemyMonMoves
	add hl, bc
	ld a, [hl]
	and a
	jp z, .scorePass ; no more moves in move set
	call ReadMove
	ld de, 0
	ld a, [wEnemyMoveEffect]
	cp OHKO_EFFECT
	jp z, .store ; OHKO moves are too inaccurate to build a plan on
	cp DREAM_EATER_EFFECT
	jr z, .dreamEater
	cp SPECIAL_DAMAGE_EFFECT
	jr z, .specialDamage
	cp SUPER_FANG_EFFECT
	jr z, .superFang
	cp EXPLODE_EFFECT
	jr z, .selfKO
	ld a, [wEnemyMovePower]
	and a
	jp z, .store ; status move: no damage estimate
	callfar AICalcEnemyMoveDamage ; returns the estimate in de
	ld a, [wEnemyMoveEffect]
	cp CHARGE_EFFECT
	jr z, .halveEstimate
	cp FLY_EFFECT
	jp nz, .store
.halveEstimate ; two-turn moves are only worth about half their damage per turn
	srl d
	rr e
	jp .store
.dreamEater
	ld a, [wBattleMonStatus]
	and SLP_MASK
	jr nz, .dreamEaterUsable
; Dream Eater fails against an awake target: effectively forbid it
	ld a, [wBuffer + 14]
	ld c, a
	ld b, 0
	ld hl, wBuffer
	add hl, bc
	ld a, [hl]
	add $14
	ld [hl], a
	ld de, 0
	jr .store
.dreamEaterUsable
	callfar AICalcEnemyMoveDamage
	jr .store
.specialDamage
	ld a, [wEnemyMoveNum]
	ld e, 20
	cp SONICBOOM
	jr z, .fixedDamage
	ld e, 40
	cp DRAGON_RAGE
	jr z, .fixedDamage
	ld a, [wEnemyMonLevel] ; Seismic Toss, Night Shade, ~Psywave
	ld e, a
.fixedDamage
	ld d, 0
	jr .store
.superFang
	ld a, [wBattleMonHP]
	ld d, a
	ld a, [wBattleMonHP + 1]
	ld e, a
	srl d
	rr e ; half the player's current HP
	jr .store
.selfKO
; never treat a self-KO move as the best plan; mildly discourage it
	ld a, [wBuffer + 14]
	ld c, a
	ld b, 0
	ld hl, wBuffer
	add hl, bc
	inc [hl]
	ld de, 0
	; fallthrough
.store
	ld a, [wBuffer + 14]
	add a
	add 4
	ld c, a
	ld b, 0
	ld hl, wBuffer
	add hl, bc
	ld [hl], d
	inc hl
	ld [hl], e
; keep track of the best estimate
	ld a, [wBuffer + 12]
	ld b, a
	ld a, [wBuffer + 13]
	ld c, a ; bc = best estimate so far
	ld a, d
	cp b
	jr c, .nextSlot
	jr nz, .newBest
	ld a, e
	cp c
	jr c, .nextSlot
	jr z, .nextSlot
.newBest
	ld a, d
	ld [wBuffer + 12], a
	ld a, e
	ld [wBuffer + 13], a
.nextSlot
	ld a, [wBuffer + 14]
	inc a
	ld [wBuffer + 14], a
	jp .estimateLoop

.scorePass
	ld a, [wBuffer + 12]
	ld b, a
	ld a, [wBuffer + 13]
	or b
	ret z ; no damaging moves at all
	xor a
	ld [wBuffer + 14], a
.scoreLoop
	ld a, [wBuffer + 14]
	cp NUM_MOVES
	ret z ; scored all 4 slots
	ld c, a
	ld b, 0
	ld hl, wEnemyMonMoves
	add hl, bc
	ld a, [hl]
	and a
	ret z ; end of move set
	ld a, [wBuffer + 14]
	add a
	add 4
	ld c, a
	ld b, 0
	ld hl, wBuffer
	add hl, bc
	ld a, [hli]
	ld d, a
	ld e, [hl] ; de = this slot's estimate
	or e
	jr z, .scoreNext ; skip moves that do no damage
	ld a, [wBuffer + 12]
	cp d
	jr nz, .scoreNext
	ld a, [wBuffer + 13]
	cp e
	jr nz, .scoreNext ; not the best estimate
	ld a, [wBuffer + 14]
	ld c, a
	ld b, 0
	ld hl, wBuffer
	add hl, bc
	dec [hl]
	dec [hl]
	dec [hl] ; strongly prefer the highest expected damage
; is this a guaranteed KO? (estimate >= player's current HP, and no substitute)
	ld a, [wPlayerBattleStatus2]
	bit HAS_SUBSTITUTE_UP, a
	jr nz, .scoreNext
	ld a, [wBattleMonHP]
	ld b, a
	ld a, [wBattleMonHP + 1]
	ld c, a ; bc = player's current HP
	ld a, d
	cp b
	jr c, .scoreNext
	jr nz, .isKO
	ld a, e
	cp c
	jr c, .scoreNext
.isKO
	dec [hl]
	dec [hl] ; prefer guaranteed KOs even more
	ld a, [wAIScratchFlags]
	set 0, a
	ld [wAIScratchFlags], a
.scoreNext
	ld a, [wBuffer + 14]
	inc a
	ld [wBuffer + 14], a
	jr .scoreLoop

; boss AI layer: early-battle planning — prefer putting the player to sleep or
; setting up while healthy, but never instead of a guaranteed KO.
; must run after AIMoveChoiceModification4 (it reads wAIScratchFlags).
AIMoveChoiceModification5:
	ld a, [wAIScratchFlags]
	bit 0, a
	ret nz ; a guaranteed-KO move exists: take the KO instead
	ld a, [wAILayer2Encouragement]
	cp 2
	ret nc ; only during this mon's first two turns
	ld hl, wBuffer - 1 ; temp move selection array (-1 byte offset)
	ld de, wEnemyMonMoves ; enemy moves
	ld b, NUM_MOVES + 1
.nextMove
	dec b
	ret z ; processed all 4 moves
	inc hl
	ld a, [de]
	and a
	ret z ; no more moves in move set
	inc de
	call ReadMove
	ld a, [wEnemyMoveEffect]
	cp SLEEP_EFFECT
	jr z, .sleepMove
	cp ATTACK_UP1_EFFECT
	jr c, .nextMove
	cp BIDE_EFFECT
	jr c, .setupMove
	cp ATTACK_UP2_EFFECT
	jr c, .nextMove
	cp POISON_EFFECT
	jr c, .setupMove
	jr .nextMove
.sleepMove
	ld a, [wBattleMonStatus]
	and a
	jr nz, .nextMove ; a statused target can't be put to sleep
	jr .encourage
.setupMove
	push hl
	push de
	push bc
	ld a, 2
	call AICheckIfHPBelowFraction
	pop bc
	pop de
	pop hl
	jr c, .nextMove ; below half HP: too hurt to spend a turn setting up
.encourage
	dec [hl]
	dec [hl]
	jr .nextMove

; shared deterministic boss item/switch AI, dispatched from TrainerAI.
; b = heal-item tier (0 = Super Potion, 1 = Hyper Potion, 2 = Full Restore)
; hl = X-item routine to use on the first action opportunity (0 = none)
; returns carry if an action consumed the turn.
; wAICount (the per-mon budget from TrainerAIPointers) still caps item uses.
CommonBossAI:
; 1) cure crippling status (sleep/freeze) immediately
	ld a, [wEnemyMonStatus]
	and SLP_MASK | (1 << FRZ)
	jr z, .checkHP
	ld a, b
	cp 2
	jp z, AIUseFullRestore
	jp AIUseFullHeal
.checkHP
; 2) heal when it actually matters: below 1/3 of max HP
	push hl
	push bc
	ld a, 3
	call AICheckIfHPBelowFraction
	pop bc
	pop hl
	jr nc, .checkXItem
	ld a, b
	and a
	jp z, AIUseSuperPotion
	dec a
	jp z, AIUseHyperPotion
	jp AIUseFullRestore
.checkXItem
; 3) open with the class's X item, once per deployment
; (wAILayer2Encouragement only counts attacks, so an item turn wouldn't
; advance it — track the use in wAISwitchedOut bit 1 instead)
	ld a, h
	or l
	jr z, .checkSwitch
	ld a, [wAISwitchedOut]
	and %10
	jr nz, .checkSwitch ; already used the X item for this mon
	ld a, [wAILayer2Encouragement]
	and a
	jr nz, .checkSwitch ; only before this mon's first attack
	ld a, [wAISwitchedOut]
	or %10
	ld [wAISwitchedOut], a
	jp hl
.checkSwitch
; 4) switch out of a bad matchup, at most once per deployment
	ld a, [wAISwitchedOut]
	and %01
	jr nz, .noAction
	callfar AIGetPlayerStabVsEnemy
	ld a, [wTypeEffectiveness]
	cp SUPER_EFFECTIVE
	jr c, .noAction ; the player doesn't threaten us super effectively
	call AIBestOwnEffectiveness
	cp EFFECTIVE
	jr nc, .noAction ; we still have neutral-or-better coverage: stay in
	callfar AIPickSwitchTarget
	ld a, [wAISwitchTarget]
	inc a
	jr z, .noAction ; no switch-in improves the matchup
	call AISwitchIfEnoughMons
	ret nc
	ld a, [wAISwitchedOut]
	or %01
	ld [wAISwitchedOut], a
	scf
	ret
.noAction
	and a
	ret

; returns in a the best compounded type effectiveness (x10) among the enemy's
; damaging moves against the player's active pokemon
AIBestOwnEffectiveness:
	xor a
	ld [wBuffer + 25], a ; best effectiveness so far
	ld hl, wEnemyMonMoves
	ld b, NUM_MOVES + 1
.loop
	dec b
	jr z, .done
	ld a, [hli]
	and a
	jr z, .done
	call ReadMove
	ld a, [wEnemyMovePower]
	and a
	jr z, .loop ; only damaging moves count as coverage
	push hl
	push bc
	callfar AIGetTypeEffectiveness
	pop bc
	pop hl
	ld a, [wTypeEffectiveness]
	ld d, a
	ld a, [wBuffer + 25]
	cp d
	jr nc, .loop
	ld a, d
	ld [wBuffer + 25], a
	jr .loop
.done
	ld a, [wBuffer + 25]
	ret
