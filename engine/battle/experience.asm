GainExperience:
	ld a, [wLinkState]
	cp LINK_STATE_BATTLING
	ret z ; return if link battle
; every conscious party member gains full experience, whether or not it
; participated in the battle (modern exp mechanics); exp is not divided,
; so wPartyGainExpFlags is ignored here
	ld hl, wPartyMon1
	xor a
	ld [wWhichPokemon], a
.partyMonLoop ; loop over each mon and add gained exp
	inc hl
	ld a, [hli]
	or [hl] ; is mon's HP 0?
	jp z, .nextMon ; if so, go to next mon
	ld de, (MON_HP_EXP + 1) - (MON_HP + 1)
	add hl, de
	ld d, h
	ld e, l ; de = ptr to the mon's HP EVs (low byte of the old stat exp field)
; sum the mon's current EVs into hMultiplicand (16-bit) for the 510 total cap
	ld h, d
	ld l, e
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld c, NUM_EV_STATS
.sumEvLoop
	ld a, [hli]
	inc hl
	ld b, a
	ldh a, [hMultiplicand + 1]
	add b
	ldh [hMultiplicand + 1], a
	jr nc, .sumEvNoCarry
	ldh a, [hMultiplicand]
	inc a
	ldh [hMultiplicand], a
.sumEvNoCarry
	dec c
	jr nz, .sumEvLoop
; look up the defeated species' EV yield
	push de
	ld a, [wEnemyMonSpecies]
	ld [wPokedexNum], a
	predef IndexToPokedex
	ld a, [wPokedexNum]
	dec a
	ld c, a
	ld b, 0
	ld hl, EvYields
	add hl, bc
	sla c
	rl b
	sla c
	rl b
	add hl, bc ; hl = EvYields + (dex number - 1) * NUM_EV_STATS
	pop de
	ld c, NUM_EV_STATS
.gainEvLoop
	ld a, [hli]
	ld b, a ; b = this stat's EV yield
.addEvLoop
	ld a, b
	and a
	jr z, .nextEv
	dec b
; enforce the 510 total EV cap
	ldh a, [hMultiplicand]
	cp HIGH(MAX_TOTAL_EV)
	jr c, .totalEvOk
	ldh a, [hMultiplicand + 1]
	cp LOW(MAX_TOTAL_EV)
	jr nc, .nextEv
.totalEvOk
; enforce the 252 per-stat EV cap
	ld a, [de]
	cp MAX_STAT_EV
	jr nc, .nextEv
	inc a
	ld [de], a
	ldh a, [hMultiplicand + 1]
	inc a
	ldh [hMultiplicand + 1], a
	jr nz, .addEvLoop
	ldh a, [hMultiplicand]
	inc a
	ldh [hMultiplicand], a
	jr .addEvLoop
.nextEv
; clear the high byte of the old stat exp field; EVs only use the low byte
	dec de
	xor a
	ld [de], a
	inc de
	dec c
	jr z, .statExpDone
	inc de
	inc de
	jr .gainEvLoop
.statExpDone
	xor a
	ldh [hMultiplicand], a
	ldh [hMultiplicand + 1], a
	ld a, [wEnemyMonBaseExp]
	ldh [hMultiplicand + 2], a
	ld a, [wEnemyMonLevel]
	ldh [hMultiplier], a
	call Multiply
	ld a, 7
	ldh [hDivisor], a
	ld b, 4
	call Divide
	ld hl, MON_OTID - (MON_DVS - 1)
	add hl, de
	ld b, [hl] ; wPartyMon*OTID
	inc hl
	ld a, [wPlayerID]
	cp b
	jr nz, .tradedMon
	ld b, [hl]
	ld a, [wPlayerID + 1]
	cp b
	ld a, 0
	jr z, .next
.tradedMon
	call BoostExp ; traded mon exp boost
	ld a, 1
.next
	ld [wGainBoostedExp], a
	ld a, [wIsInBattle]
	dec a ; is it a trainer battle?
	call nz, BoostExp ; if so, boost exp
	inc hl
	inc hl
	inc hl
; add the gained exp to the party mon's exp
	ld b, [hl]
	ldh a, [hQuotient + 3]
	ld [wExpAmountGained + 1], a
	add b
	ld [hld], a
	ld b, [hl]
	ldh a, [hQuotient + 2]
	ld [wExpAmountGained], a
	adc b
	ld [hl], a
	jr nc, .noCarry
	dec hl
	inc [hl]
	inc hl
.noCarry
; calculate exp for the mon at max level, and cap the exp at that value
	inc hl
	push hl
	ld a, [wWhichPokemon]
	ld c, a
	ld b, 0
	ld hl, wPartySpecies
	add hl, bc
	ld a, [hl]
	ld [wCurSpecies], a
	call GetMonHeader
	ld d, MAX_LEVEL
	callfar CalcExperience ; get max exp
; compare max exp with current exp
	ldh a, [hExperience]
	ld b, a
	ldh a, [hExperience + 1]
	ld c, a
	ldh a, [hExperience + 2]
	ld d, a
	pop hl
	ld a, [hld]
	sub d
	ld a, [hld]
	sbc c
	ld a, [hl]
	sbc b
	jr c, .next2
; the mon's exp is greater than the max exp, so overwrite it with the max exp
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, d
	ld [hld], a
	dec hl
.next2
	push hl
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, GainedText
	call PrintText
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	call LoadMonData
	pop hl
	ld bc, MON_LEVEL - MON_EXP
	add hl, bc
	push hl
	farcall CalcLevelFromExperience
	pop hl
	ld a, [hl] ; current level
	cp d
	jp z, .nextMon ; if level didn't change, go to next mon
	ld a, [wCurEnemyLevel]
	push af
	push hl
	ld a, d
	ld [wCurEnemyLevel], a
	ld [hl], a
	ld bc, MON_SPECIES - MON_LEVEL
	add hl, bc
	ld a, [hl]
	ld [wCurSpecies], a
	ld [wPokedexNum], a
	call GetMonHeader
	ld bc, (MON_MAXHP + 1) - MON_SPECIES
	add hl, bc
	push hl
	ld a, [hld]
	ld c, a
	ld b, [hl]
	push bc ; push max HP (from before levelling up)
	ld d, h
	ld e, l
	ld bc, (MON_HP_EXP - 1) - MON_MAXHP
	add hl, bc
	ld b, $1 ; consider stat exp when calculating stats
	call CalcStats
	pop bc ; pop max HP (from before levelling up)
	pop hl
	ld a, [hld]
	sub c
	ld c, a
	ld a, [hl]
	sbc b
	ld b, a ; bc = difference between old max HP and new max HP after levelling
	ld de, (MON_HP + 1) - MON_MAXHP
	add hl, de
; add to the current HP the amount of max HP gained when levelling
	ld a, [hl] ; wPartyMon*HP + 1
	add c
	ld [hld], a
	ld a, [hl] ; wPartyMon*HP + 1
	adc b
	ld [hl], a ; wPartyMon*HP
	ld a, [wPlayerMonNumber]
	ld b, a
	ld a, [wWhichPokemon]
	cp b ; is the current mon in battle?
	jr nz, .printGrewLevelText
; current mon is in battle
	ld de, wBattleMonHP
; copy party mon HP to battle mon HP
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
; copy other stats from party mon to battle mon
	ld bc, MON_LEVEL - (MON_HP + 1)
	add hl, bc
	push hl
	ld de, wBattleMonLevel
	ld bc, 1 + NUM_STATS * 2 ; size of stats
	call CopyData
	pop hl
	ld a, [wPlayerBattleStatus3]
	bit TRANSFORMED, a
	jr nz, .recalcStatChanges
; the mon is not transformed, so update the unmodified stats
	ld de, wPlayerMonUnmodifiedLevel
	ld bc, 1 + NUM_STATS * 2
	call CopyData
.recalcStatChanges
	xor a ; battle mon
	ld [wCalculateWhoseStats], a
	ld hl, CalculateModifiedStats
	call CallBattleCore
	ld hl, ApplyBurnAndParalysisPenaltiesToPlayer
	call CallBattleCore
	ld hl, ApplyBadgeStatBoosts
	call CallBattleCore
	ld hl, DrawPlayerHUDAndHPBar
	call CallBattleCore
	ld hl, PrintEmptyString
	call CallBattleCore
	call SaveScreenTilesToBuffer1
.printGrewLevelText
	farcall_ModifyPikachuHappiness PIKAHAPPY_LEVELUP
	ld hl, GrewLevelText
	call PrintText
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	call LoadMonData
	ld d, LEVEL_UP_STATS_BOX
	callfar PrintStatsBox
	call WaitForTextScrollButtonPress
	call LoadScreenTilesFromBuffer1
	xor a ; PLAYER_PARTY_DATA
	ld [wMonDataLocation], a
	ld a, [wCurSpecies]
	ld [wPokedexNum], a
	predef LearnMoveFromLevelUp
	ld hl, wCanEvolveFlags
	ld a, [wWhichPokemon]
	ld c, a
	ld b, FLAG_SET
	predef FlagActionPredef
	pop hl
	pop af
	ld [wCurEnemyLevel], a

.nextMon
	ld a, [wPartyCount]
	ld b, a
	ld a, [wWhichPokemon]
	inc a
	cp b
	jr z, .done
	ld [wWhichPokemon], a
	ld bc, PARTYMON_STRUCT_LENGTH
	ld hl, wPartyMon1
	call AddNTimes
	jp .partyMonLoop
.done
	ld hl, wPartyGainExpFlags
	xor a
	ld [hl], a ; clear gain exp flags
	ld a, [wPlayerMonNumber]
	ld c, a
	ld b, FLAG_SET
	push bc
	predef FlagActionPredef ; set the gain exp flag for the mon that is currently out
	ld hl, wPartyFoughtCurrentEnemyFlags
	xor a
	ld [hl], a
	pop bc
	predef_jump FlagActionPredef ; set the fought current enemy flag for the mon that is currently out

; multiplies exp by 1.5
BoostExp:
	ldh a, [hQuotient + 2]
	ld b, a
	ldh a, [hQuotient + 3]
	ld c, a
	srl b
	rr c
	add c
	ldh [hQuotient + 3], a
	ldh a, [hQuotient + 2]
	adc b
	ldh [hQuotient + 2], a
	ret

CallBattleCore:
	ld b, BANK(BattleCore)
	jp Bankswitch

GainedText:
	text_far _GainedText
	text_asm
	ld a, [wBoostExpByExpAll]
	ld hl, WithExpAllText
	and a
	ret nz
	ld hl, ExpPointsText
	ld a, [wGainBoostedExp]
	and a
	ret z
	ld hl, BoostedText
	ret

WithExpAllText:
	text_far _WithExpAllText
	text_asm
	ld hl, ExpPointsText
	ret

BoostedText:
	text_far _BoostedText

ExpPointsText:
	text_far _ExpPointsText
	text_end

GrewLevelText:
	text_far _GrewLevelText
	sound_level_up
	text_end

INCLUDE "data/pokemon/ev_yields.asm"
