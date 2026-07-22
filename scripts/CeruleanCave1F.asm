CeruleanCave1F_Script:
	call EnableAutoTextBoxDrawing
	ld hl, CeruleanCave1F_ScriptPointers
	ld a, [wCeruleanCave1FCurScript]
	jp CallFunctionInTable

CeruleanCave1F_ScriptPointers:
	def_script_pointers
	dw_const CeruleanCave1FDefaultScript,        SCRIPT_CERULEANCAVE1F_DEFAULT
	dw_const CeruleanCave1FOakStartBattleScript, SCRIPT_CERULEANCAVE1F_OAK_START_BATTLE
	dw_const CeruleanCave1FOakAfterBattleScript, SCRIPT_CERULEANCAVE1F_OAK_AFTER_BATTLE

CeruleanCave1FSetDefaultScript:
	xor a ; SCRIPT_CERULEANCAVE1F_DEFAULT
	ld [wJoyIgnore], a
	ld [wCeruleanCave1FCurScript], a
CeruleanCave1FDefaultScript:
	ret

; postgame Prof. Oak battle 3 of 3, started from CeruleanCave1FOakText
CeruleanCave1FOakStartBattleScript:
	ld a, OPP_PROF_OAK
	ld [wCurOpponent], a
	ld a, 3
	ld [wTrainerNo], a
	ld hl, CeruleanCave1FOakDefeatedText
	ld de, CeruleanCave1FOakVictoryText
	call SaveEndBattleTextPointers
	ld hl, wStatusFlags3
	set BIT_TALKED_TO_TRAINER, [hl]
	set BIT_PRINT_END_BATTLE_TEXT, [hl]
	ld a, SCRIPT_CERULEANCAVE1F_OAK_AFTER_BATTLE
	ld [wCeruleanCave1FCurScript], a
	ret

CeruleanCave1FOakAfterBattleScript:
	ld a, [wIsInBattle]
	cp $ff
	jr z, CeruleanCave1FSetDefaultScript ; blacked out, leave the challenge available
	ld a, [wBattleResult]
	and a
	jr nz, CeruleanCave1FSetDefaultScript ; didn't win
	SetEvent EVENT_BEAT_PROF_OAK_3
	jr CeruleanCave1FSetDefaultScript

CeruleanCave1F_TextPointers:
	def_text_pointers
	dw_const PickUpItemText,        TEXT_CERULEANCAVE1F_RARE_CANDY
	dw_const PickUpItemText,        TEXT_CERULEANCAVE1F_MAX_ELIXER
	dw_const PickUpItemText,        TEXT_CERULEANCAVE1F_MAX_REVIVE
	dw_const PickUpItemText,        TEXT_CERULEANCAVE1F_ULTRA_BALL
	dw_const CeruleanCave1FOakText, TEXT_CERULEANCAVE1F_OAK

CeruleanCave1FOakText:
	text_asm
	CheckEvent EVENT_BEAT_PROF_OAK_3
	jr nz, .already_beat_oak
	ld hl, CeruleanCave1FOakChallengeText
	call PrintText
	ld a, SCRIPT_CERULEANCAVE1F_OAK_START_BATTLE
	ld [wCeruleanCave1FCurScript], a
	jp TextScriptEnd
.already_beat_oak
	ld hl, CeruleanCave1FOakAfterBattleText
	call PrintText
	jp TextScriptEnd

CeruleanCave1FOakChallengeText:
	text_far _CeruleanCave1FOakChallengeText
	text_end

CeruleanCave1FOakDefeatedText:
	text_far _CeruleanCave1FOakDefeatedText
	text_end

CeruleanCave1FOakVictoryText:
	text_far _CeruleanCave1FOakVictoryText
	text_end

CeruleanCave1FOakAfterBattleText:
	text_far _CeruleanCave1FOakAfterBattleText
	text_end
