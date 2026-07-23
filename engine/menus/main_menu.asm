MainMenu:
; Check save file
	call InitOptions
	xor a
	ld [wOptionsInitialized], a
	inc a
	ld [wSaveFileStatus], a
	call CheckForPlayerNameInSRAM
	jr nc, .mainMenuLoop

	predef TryLoadSaveFile

.mainMenuLoop
	ld c, 20
	call DelayFrames
	xor a ; LINK_STATE_NONE
	ld [wLinkState], a
	ld hl, wPartyAndBillsPCSavedMenuItem
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ld [wDefaultMap], a
	ld hl, wStatusFlags4
	res BIT_LINK_CONNECTED, [hl]
	call ClearScreen
	call RunDefaultPaletteCommand
	call LoadTextBoxTilePatterns
	call LoadFontTilePatterns
	ld hl, wStatusFlags5
	set BIT_NO_TEXT_DELAY, [hl]
	call ClearSprites
	ld a, [wSaveFileStatus]
	cp 1
	jr z, .noSaveFile
; --- layout with a save file ---
; top box: Current Save (full width); middle row: New Game | Option;
; bottom box: More... (full width)
	hlcoord 0, 0
	lb bc, 4, 18
	call TextBoxBorder
	hlcoord 4, 1
	ld de, CurrentSaveText
	call PlaceString
	hlcoord 0, 6
	lb bc, 2, 9
	call TextBoxBorder
	hlcoord 2, 7
	ld de, NewGameText
	call PlaceString
	hlcoord 11, 6
	lb bc, 2, 7
	call TextBoxBorder
	hlcoord 13, 7
	ld de, OptionText
	call PlaceString
	hlcoord 0, 10
	lb bc, 2, 18
	call TextBoxBorder
	hlcoord 3, 11
	ld de, MoreText
	call PlaceString
	call FillCurrentSaveBox
	jr .menuReady
.noSaveFile
; --- layout with no save file: Current Save box dropped, everything shifts up ---
	hlcoord 0, 0
	lb bc, 2, 9
	call TextBoxBorder
	hlcoord 2, 1
	ld de, NewGameText
	call PlaceString
	hlcoord 11, 0
	lb bc, 2, 7
	call TextBoxBorder
	hlcoord 13, 1
	ld de, OptionText
	call PlaceString
	hlcoord 0, 4
	lb bc, 2, 18
	call TextBoxBorder
	hlcoord 3, 5
	ld de, MoreText
	call PlaceString
.menuReady
	ld hl, wStatusFlags5
	res BIT_NO_TEXT_DELAY, [hl]
	ld a, $ff ; keep UpdateSprites from clobbering our custom menu OAM
	ld [wUpdateSpritesEnabled], a
	call UpdateSprites
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	call PlaceMainMenuCursor
.inputLoop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and a
	jr z, .inputLoop
	ld b, a
	bit B_PAD_A, b
	jr nz, .selected
	bit B_PAD_B, b
	jp nz, DisplayTitleScreen ; B returns to the title screen
; a direction was pressed: index the current box's neighbour table
	ld a, [wCurrentMenuItem]
	call GetMainMenuNeighbors ; hl -> {up, down, left, right}
	bit B_PAD_UP, b
	jr nz, .move
	inc hl
	bit B_PAD_DOWN, b
	jr nz, .move
	inc hl
	bit B_PAD_LEFT, b
	jr nz, .move
	inc hl
	bit B_PAD_RIGHT, b
	jr nz, .move
	jr .inputLoop
.move
	ld a, [hl]
	cp $ff ; no box in that direction?
	jr z, .inputLoop
	push af
	ld a, [wCurrentMenuItem]
	call EraseMainMenuCursor
	pop af
	ld [wCurrentMenuItem], a
	call PlaceMainMenuCursor
	jr .inputLoop
.selected
	ld a, SFX_PRESS_AB
	call PlaySound
	ld c, 20
	call DelayFrames
	ld a, [wCurrentMenuItem]
	ld b, a
	ld a, [wSaveFileStatus]
	cp 2
	jr z, .skipInc
; With no save file the Current Save slot is absent, so shift the index up to
; keep the action numbers identical to the save-file layout.
	inc b
.skipInc
	ld a, b
	and a
	jr z, .choseContinue
	cp 1
	jp z, StartNewGame
	cp 2
	jr z, .choseOption
	cp 3
	jr z, .choseMore
	jr .inputLoop
.choseMore
	call DisplayMoreMenu
	jp .mainMenuLoop
.choseOption
	call DisplayOptionMenu
	ld a, TRUE
	ld [wOptionsInitialized], a
	jp .mainMenuLoop
.choseContinue
	ld hl, wCurrentMapScriptFlags
	set BIT_CUR_MAP_LOADED_1, [hl]
	call GBPalWhiteOutWithDelay3
	call ClearScreen
	ld a, PLAYER_DIR_DOWN
	ld [wPlayerDirection], a
	ld c, 10
	call DelayFrames
	ld a, [wNumHoFTeams]
	and a
	jp z, SpecialEnterMap
	ld a, [wCurMap]
	cp HALL_OF_FAME
	jp nz, SpecialEnterMap
	xor a
	ld [wDestinationMap], a
	ld hl, wStatusFlags6
	set BIT_FLY_OR_DUNGEON_WARP, [hl]
	call PrepareForSpecialWarp
	jp SpecialEnterMap

InitOptions:
	ld a, 1 << BIT_FAST_TEXT_DELAY
	ld [wLetterPrintingDelayFlags], a
	ld a, TEXT_DELAY_MEDIUM
	ld [wOptions], a
	xor a
	ld [wGameplayOptions], a ; default = current fork behavior
	ld a, 64 ; audio?
	ld [wPrinterSettings], a
	ret

Func_5cc1:
; unused?
	ld a, $6d
	cp $80
	ret c ; will always be executed
	ld hl, NotEnoughMemoryText
	call PrintText
	ret

NotEnoughMemoryText:
	text_far _NotEnoughMemoryText
	text_end

StartNewGame:
	ld hl, wStatusFlags6
	; Ensure debug mode is not used when starting a regular new game.
	; Debug mode persists in saved games for both debug and non-debug builds, and is
	; only reset here by the main menu.
	res BIT_DEBUG_MODE, [hl]
	; fallthrough
StartNewGameDebug:
	call OakSpeech
	ld a, $8
	ld [wPlayerMovingDirection], a
	ld c, 20
	call DelayFrames

; enter map after using a special warp or loading the game from the main menu
SpecialEnterMap::
	xor a
	ldh [hJoyPressed], a
	ldh [hJoyHeld], a
	ldh [hJoy5], a
	ld [wCableClubDestinationMap], a
	ld hl, wStatusFlags6
	set BIT_GAME_TIMER_COUNTING, [hl]
	call ResetPlayerSpriteData
	ld c, 20
	call DelayFrames
	call Func_5cc1
	ld a, [wEnteringCableClub]
	and a
	ret nz
	jp EnterMap

CurrentSaveText:
	db "Current Save@"
NewGameText:
	db "New Game@"
OptionText:
	db "Option@"
MoreText:
	db "More...@"

; Fill the Current Save box with money, play time, the party (as pokéballs),
; and the player's overworld sprite.
FillCurrentSaveBox:
	hlcoord 6, 3
	ld de, wPlayerMoney
	ld c, 3 | LEADING_ZEROES | MONEY_SIGN
	call PrintBCDNumber
	hlcoord 6, 4
	call PrintPlayTime
	; fallthrough

DrawCurrentSaveSprites:
; The player's overworld sprite (OBJ tiles $00-$03) as a 2x2 block near the box's
; left edge, then one pokéball per party member to its right.
	call ClearSprites
	xor a
	ld [wWalkBikeSurfState], a
	call LoadPlayerSpriteGraphics
	ld hl, wShadowOAM + 6 * 4 ; sprites 0-5 are reserved for the pokéballs
; top-left
	ld a, 2 * 8 + OAM_Y_OFS
	ld [hli], a
	ld a, 2 * 8 + OAM_X_OFS
	ld [hli], a
	xor a
	ld [hli], a ; tile 0
	ld [hli], a ; attributes
; top-right
	ld a, 2 * 8 + OAM_Y_OFS
	ld [hli], a
	ld a, 3 * 8 + OAM_X_OFS
	ld [hli], a
	ld a, 1
	ld [hli], a
	xor a
	ld [hli], a
; bottom-left
	ld a, 3 * 8 + OAM_Y_OFS
	ld [hli], a
	ld a, 2 * 8 + OAM_X_OFS
	ld [hli], a
	ld a, 2
	ld [hli], a
	xor a
	ld [hli], a
; bottom-right
	ld a, 3 * 8 + OAM_Y_OFS
	ld [hli], a
	ld a, 3 * 8 + OAM_X_OFS
	ld [hli], a
	ld a, 3
	ld [hli], a
	xor a
	ld [hli], a
; pokéballs, reusing the battle HUD helpers (which live in another bank)
	callfar LoadPartyPokeballGfx
	ld hl, wPartyMons
	ld de, wPartyCount
	callfar SetupPokeballs
	ld hl, wBaseCoordX
	ld a, 6 * 8 + OAM_X_OFS ; X of the first ball
	ld [hli], a
	ld a, 2 * 8 + OAM_Y_OFS ; Y of the ball row
	ld [hl], a
	ld a, 8
	ld [wHUDPokeballGfxOffsetX], a
	xor a
	ld [wdef4], a
	ld hl, wShadowOAM
	callfar WritePokeballOAMData
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	ret

; The submenu reached from the main menu's "More..." box.
DisplayMoreMenu:
	call ClearScreen
	call RunDefaultPaletteCommand
	call LoadTextBoxTilePatterns
	call LoadFontTilePatterns
	hlcoord 2, 2
	lb bc, 4, 12
	call TextBoxBorder
	hlcoord 4, 4
	ld de, RecordsMenuText
	call PlaceString
	hlcoord 4, 6
	ld de, PokerMenuText
	call PlaceString
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuJoypadPollCount], a
	ld a, 3
	ld [wTopMenuItemX], a
	ld a, 4
	ld [wTopMenuItemY], a
	ld a, 1
	ld [wMaxMenuItem], a
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	call HandleMenuInput
	bit B_PAD_B, a
	ret nz
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .poker
	callfar DisplayRecordsMenu_
	ret
.poker
	callfar HoldemFreePlay
	ret

RecordsMenuText:
	db "Records@"
PokerMenuText:
	db "Poker@"

; --- 2D box-to-box cursor for the main menu ---

PlaceMainMenuCursor:
; a = box position
	call GetMainMenuCursorCoord
	ld [hl], '▶'
	ret

EraseMainMenuCursor:
; a = box position
	call GetMainMenuCursorCoord
	ld [hl], ' '
	ret

GetMainMenuCursorCoord:
; in: a = box position; out: hl = tilemap address of that box's cursor tile
	push af
	call GetMainMenuCursorTable ; hl = table base
	pop af
	add a ; entries are 2 bytes (x, y)
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli] ; x
	ld c, a
	ld a, [hl]  ; y
	ld b, a
	ld hl, wTileMap
	ld de, SCREEN_WIDTH
	inc b
.rowLoop
	dec b
	jr z, .rowsDone
	add hl, de
	jr .rowLoop
.rowsDone
	ld e, c
	ld d, 0
	add hl, de
	ret

GetMainMenuCursorTable:
	ld a, [wSaveFileStatus]
	cp 1 ; no save file?
	jr z, .noSave
	ld hl, SaveCursorCoords
	ret
.noSave
	ld hl, NoSaveCursorCoords
	ret

GetMainMenuNeighbors:
; in: a = box position; out: hl -> 4 bytes {up, down, left, right}; b preserved
	ld hl, SaveMenuNeighbors
	push af
	ld a, [wSaveFileStatus]
	cp 1 ; no save file?
	jr nz, .haveBase
	pop af
	ld hl, NoSaveMenuNeighbors
	jr .index
.haveBase
	pop af
.index
	add a
	add a ; entries are 4 bytes
	ld e, a
	ld d, 0
	add hl, de
	ret

SaveCursorCoords:
; x, y of each box's cursor tile
	db  2,  1 ; Current Save
	db  1,  7 ; New Game
	db 12,  7 ; Option
	db  1, 11 ; More...

NoSaveCursorCoords:
	db  1,  1 ; New Game
	db 12,  1 ; Option
	db  1,  5 ; More...

SaveMenuNeighbors:
; up, down, left, right target positions ($ff = no box that way)
	db $ff,   1, $ff, $ff ; Current Save
	db   0,   3, $ff,   2 ; New Game
	db   0,   3,   1, $ff ; Option
	db   1, $ff, $ff, $ff ; More...

NoSaveMenuNeighbors:
	db $ff,   2, $ff,   1 ; New Game
	db $ff,   2,   0, $ff ; Option
	db   0, $ff, $ff, $ff ; More...

PrintSaveScreenText:
	xor a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 4, 0
	lb bc, 8, 14
	call TextBoxBorder
	call LoadTextBoxTilePatterns
	call UpdateSprites
	hlcoord 5, 2
	ld de, SaveScreenInfoText
	call PlaceString
	hlcoord 12, 2
	ld de, wPlayerName
	call PlaceString
	hlcoord 17, 4
	call PrintNumBadges
	hlcoord 16, 6
	call PrintNumOwnedMons
	hlcoord 13, 8
	call PrintPlayTime
	ld a, $1
	ldh [hAutoBGTransferEnabled], a
	ld c, 30
	jp DelayFrames

PrintNumBadges:
	push hl
	ld hl, wObtainedBadges
	ld b, $1
	call CountSetBits
	pop hl
	ld de, wNumSetBits
	lb bc, 1, 2
	jp PrintNumber

PrintNumOwnedMons:
	push hl
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	pop hl
	ld de, wNumSetBits
	lb bc, 1, 3
	jp PrintNumber

PrintPlayTime:
	ld de, wPlayTimeHours
	lb bc, 1, 3
	call PrintNumber
	ld [hl], $6d
	inc hl
	ld de, wPlayTimeMinutes
	lb bc, LEADING_ZEROES | 1, 2
	jp PrintNumber

SaveScreenInfoText:
	db   "Player"
	next "Badges    "
	next "#Dex    "
	next "Time@"

DisplayOptionMenu:
	callfar DisplayOptionMenu_
	ret

CheckForPlayerNameInSRAM:
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	ASSERT BANK(sPlayerName) == BMODE_ADVANCED
	ld [rRAMB], a
	ld b, NAME_LENGTH
	ld hl, sPlayerName
.loop
	ld a, [hli]
	cp '@'
	jr z, .found
	dec b
	jr nz, .loop
	xor a
	ld [rRAMG], a
	ld [rBMODE], a
	and a
	ret
.found
	xor a
	ld [rRAMG], a
	ld [rBMODE], a
	scf
	ret
