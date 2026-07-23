; Achievements ("Records") system.
;
; Persistent unlock state is a 6-byte bitfield in SRAM (sAchievements) that lives
; outside the save game, so it survives New Game and can be viewed from the main
; menu with no save loaded. All reads/writes go straight to SRAM (WRAM is full, so
; there is no RAM shadow). SyncAchievements (called at save time and on entering the
; Hall of Fame, when WRAM save state is valid) rebuilds the bitfield from persistent
; progress plus any HOOK breadcrumbs. The Records viewer is read-only.
;
; SRAM must be enabled and banked to BANK("Save Data") before calling SetAch /
; TestAchievement / the Sync* helpers; the public entry points wrap that.

; --- local helpers for the DERIVED conditions ------------------------------

; set achievement \2 if event flag \1 is set
MACRO ach_if_event
	CheckEventHL \1
	jr z, .skip\@
	ld a, \2
	call SetAch
.skip\@
ENDM

; set achievement \2 if the mon with pokédex number \1 is owned
MACRO ach_if_dex_owned
	ld a, [wPokedexOwned + ((\1) - 1) / 8]
	bit ((\1) - 1) % 8, a
	jr z, .skip\@
	ld a, \2
	call SetAch
.skip\@
ENDM

; ---------------------------------------------------------------------------

; Unlock a single achievement (index in a) directly in SRAM, keeping the checksum
; valid. Public entry for HOOK sites that prefer an immediate unlock; the in-battle
; HOOKs instead set a wPendingAchievements bit (cheaper) that is folded in at sync.
UnlockAchievement::
	push af
	call AchievementsEnableSRAM
	call ValidateAchievements
	pop af
	call SetAch
	call RecalcAchievementsCheckSum
	jp AchievementsDisableSRAM

; Rebuild the SRAM achievement bitfield from current progress. Only meaningful while
; a game's WRAM save state is loaded (save / Hall of Fame paths).
SyncAchievements::
	call AchievementsEnableSRAM
	call ValidateAchievements
	; fold in HOOK breadcrumbs (wPendingAchievements -> sAchievements)
	ld hl, wPendingAchievements
	ld de, sAchievements
	ld c, NUM_ACHIEVEMENT_BYTES
.orLoop
	ld a, [hl]
	ld b, a
	ld a, [de]
	or b
	ld [de], a
	inc hl
	inc de
	dec c
	jr nz, .orLoop
	; derived conditions
	call SyncBadges
	call SyncDex
	call SyncChampion
	call SyncTraining
	call SyncMoneyItems
	call SyncOakAndPlaytime
	call SyncCapstone
	call RecalcAchievementsCheckSum
	jp AchievementsDisableSRAM

SyncBadges:
; wObtainedBadges bit b -> achievement b (ACH_BADGE_BOULDER..EARTH == 0..7)
	ld a, [wObtainedBadges]
	ld c, 0
.loop
	srl a
	push af
	jr nc, .skip
	ld a, c
	call SetAch
.skip
	pop af
	inc c
	ld b, a
	ld a, c
	cp 8
	ret z
	ld a, b
	jr .loop

SyncDex:
	ld hl, wPokedexOwned
	ld b, wPokedexOwnedEnd - wPokedexOwned
	call CountSetBits
	ld a, [wNumSetBits]
	ld d, a ; owned count
	cp 10
	jr c, .afterOwned
	ld a, ACH_DEX_10
	call SetAch
	ld a, d
	cp 25
	jr c, .afterOwned
	ld a, ACH_DEX_25
	call SetAch
	ld a, d
	cp 50
	jr c, .afterOwned
	ld a, ACH_DEX_50
	call SetAch
	ld a, d
	cp 100
	jr c, .afterOwned
	ld a, ACH_DEX_100
	call SetAch
	ld a, d
	cp 150
	jr c, .afterOwned
	ld a, ACH_DEX_150
	call SetAch
	ld a, d
	cp NUM_POKEMON
	jr c, .afterOwned
	ld a, ACH_DEX_ALL
	call SetAch
.afterOwned
	ach_if_dex_owned DEX_ARTICUNO, ACH_CATCH_ARTICUNO
	ach_if_dex_owned DEX_ZAPDOS,   ACH_CATCH_ZAPDOS
	ach_if_dex_owned DEX_MOLTRES,  ACH_CATCH_MOLTRES
	ach_if_dex_owned DEX_MEWTWO,   ACH_CATCH_MEWTWO
	ach_if_dex_owned DEX_MEW,      ACH_CATCH_MEW
	; storm trio: all three birds owned
	ld a, [wPokedexOwned + (DEX_ARTICUNO - 1) / 8]
	bit (DEX_ARTICUNO - 1) % 8, a
	jr z, .noTrio
	ld a, [wPokedexOwned + (DEX_ZAPDOS - 1) / 8]
	bit (DEX_ZAPDOS - 1) % 8, a
	jr z, .noTrio
	ld a, [wPokedexOwned + (DEX_MOLTRES - 1) / 8]
	bit (DEX_MOLTRES - 1) % 8, a
	jr z, .noTrio
	ld a, ACH_STORM_TRIO
	call SetAch
.noTrio
	ach_if_dex_owned DEX_OMANYTE,    ACH_FOSSIL
	ach_if_dex_owned DEX_KABUTO,     ACH_FOSSIL
	ach_if_dex_owned DEX_AERODACTYL, ACH_FOSSIL
	; seen tiers
	ld hl, wPokedexSeen
	ld b, wPokedexSeenEnd - wPokedexSeen
	call CountSetBits
	ld a, [wNumSetBits]
	ld d, a
	cp 75
	jr c, .afterSeen
	ld a, ACH_SEEN_75
	call SetAch
	ld a, d
	cp NUM_POKEMON
	jr c, .afterSeen
	ld a, ACH_SEEN_ALL
	call SetAch
.afterSeen
	ret

SyncChampion:
	ld a, [wNumHoFTeams]
	and a
	ret z
	ld b, a
	ld a, ACH_CHAMPION
	call SetAch
	ld a, b
	cp 3
	ret c
	ld a, ACH_CHAMPION_3
	call SetAch
	ld a, b
	cp 10
	ret c
	ld a, ACH_CHAMPION_10
	call SetAch
	ret

SyncTraining:
	ld a, [wPartyCount]
	cp PARTY_LENGTH
	jr c, .notFull
	ld a, ACH_FULL_TEAM
	call SetAch
.notFull
	ld a, [wPartyCount]
	and a
	jr z, .noLevels
	ld c, a
	ld hl, wPartyMon1 + MON_LEVEL
	ld de, PARTYMON_STRUCT_LENGTH
.levelLoop
	ld a, [hl]
	cp 100
	jr c, .not100
	push hl
	push bc
	ld a, ACH_LEVEL_100
	call SetAch
	pop bc
	pop hl
.not100
	ld a, [hl]
	cp 50
	jr c, .not50
	push hl
	push bc
	ld a, ACH_LEVEL_50
	call SetAch
	pop bc
	pop hl
.not50
	add hl, de
	dec c
	jr nz, .levelLoop
.noLevels
	ld a, [wBoxCount]
	cp MONS_PER_BOX
	jr c, .noBox
	ld a, ACH_BOX_FULL
	call SetAch
.noBox
	ach_if_event EVENT_BEAT_ROUTE22_RIVAL_1ST_BATTLE, ACH_RIVAL_R22
	ret

SyncMoneyItems:
	; wPlayerMoney is 3 big-endian BCD bytes (6 digits)
	ld a, [wPlayerMoney]
	cp $10
	jr c, .no100k
	ld a, ACH_MONEY_100K
	call SetAch
.no100k
	ld a, [wPlayerMoney]
	cp $01
	jr c, .no10k
	ld a, ACH_MONEY_10K
	call SetAch
.no10k
	; wPlayerCoins is 2 big-endian BCD bytes (4 digits)
	ld a, [wPlayerCoins]
	cp $99
	jr nz, .noMaxCoins
	ld a, [wPlayerCoins + 1]
	cp $99
	jr nz, .noMaxCoins
	ld a, ACH_COINS_MAX
	call SetAch
.noMaxCoins
	ach_if_event EVENT_GOT_MASTER_BALL, ACH_MASTER_BALL
	ld b, TERA_ORB
	call IsItemInBag
	jr z, .noOrb
	ld a, ACH_TERA_ORB
	call SetAch
.noOrb
	; HM master: all 5 HMs (HM01..HM01+4) in the bag
	ld b, HM01
	call IsItemInBag
	jr z, .noHM
	ld b, HM01 + 1
	call IsItemInBag
	jr z, .noHM
	ld b, HM01 + 2
	call IsItemInBag
	jr z, .noHM
	ld b, HM01 + 3
	call IsItemInBag
	jr z, .noHM
	ld b, HM01 + 4
	call IsItemInBag
	jr z, .noHM
	ld a, ACH_HM_MASTER
	call SetAch
.noHM
	ret

SyncOakAndPlaytime:
	ld a, [wPlayTimeHours]
	cp 1
	jr c, .no1
	ld a, ACH_PLAYTIME_1
	call SetAch
.no1
	ld a, [wPlayTimeHours]
	cp 10
	jr c, .no10
	ld a, ACH_PLAYTIME_10
	call SetAch
.no10
	; Oak: at least one of the three battles
	CheckEventHL EVENT_BEAT_PROF_OAK_1
	jr nz, .oakOne
	CheckEventHL EVENT_BEAT_PROF_OAK_2
	jr nz, .oakOne
	CheckEventHL EVENT_BEAT_PROF_OAK_3
	jr z, .afterOne
.oakOne
	ld a, ACH_OAK_ONE
	call SetAch
.afterOne
	; Oak: all three
	CheckEventHL EVENT_BEAT_PROF_OAK_1
	jr z, .afterAll
	CheckEventHL EVENT_BEAT_PROF_OAK_2
	jr z, .afterAll
	CheckEventHL EVENT_BEAT_PROF_OAK_3
	jr z, .afterAll
	ld a, ACH_OAK_ALL
	call SetAch
.afterAll
	ret

SyncCapstone:
; ACH_MASTER unlocks when every other achievement (bits 0..46) is set
	ld a, [sAchievements + 0]
	cp $ff
	ret nz
	ld a, [sAchievements + 1]
	cp $ff
	ret nz
	ld a, [sAchievements + 2]
	cp $ff
	ret nz
	ld a, [sAchievements + 3]
	cp $ff
	ret nz
	ld a, [sAchievements + 4]
	cp $ff
	ret nz
	ld a, [sAchievements + 5]
	and $7f ; bits 40..46 (exclude the capstone bit itself)
	cp $7f
	ret nz
	ld a, ACH_MASTER
	jp SetAch

; Set achievement bit (index in a) in sAchievements. SRAM must be enabled.
SetAch:
	push hl
	push de
	push bc
	ld c, a ; index
	and 7
	ld b, a ; bit position within byte
	ld a, c
	srl a
	srl a
	srl a ; byte offset
	ld e, a
	ld d, 0
	ld hl, sAchievements
	add hl, de
	ld a, 1
	inc b
.shift
	dec b
	jr z, .shifted
	add a
	jr .shift
.shifted
	or [hl]
	ld [hl], a
	pop bc
	pop de
	pop hl
	ret

; Test achievement bit (index in a) in sAchievements. SRAM must be enabled.
; Returns a = 0 when locked, nonzero when unlocked. Preserves hl and de.
TestAchievement:
	push hl
	push de
	push bc
	ld c, a ; index
	and 7
	ld b, a ; bit position within byte
	ld a, c
	srl a
	srl a
	srl a ; byte offset
	ld e, a
	ld d, 0
	ld hl, sAchievements
	add hl, de
	ld a, 1
	inc b
.shift
	dec b
	jr z, .shifted
	add a
	jr .shift
.shifted
	and [hl]
	pop bc
	pop de
	pop hl
	ret

; --- SRAM plumbing (SRAM must be enabled for these) ------------------------

CalcAchievementsCheckSum:
; sum of the sAchievements bytes, complemented (as CalcCheckSum does); result in a
	ld hl, sAchievements
	ld c, NUM_ACHIEVEMENT_BYTES
	ld d, 0
.loop
	ld a, [hli]
	add d
	ld d, a
	dec c
	jr nz, .loop
	ld a, d
	cpl
	ret

RecalcAchievementsCheckSum:
	call CalcAchievementsCheckSum
	ld [sAchievementsCheckSum], a
	ret

; If the stored checksum does not match (uninitialized / corrupt / wiped SRAM),
; zero the achievement region and write a fresh checksum so reads are consistent.
ValidateAchievements:
	call CalcAchievementsCheckSum
	ld hl, sAchievementsCheckSum
	cp [hl]
	ret z
	xor a
	ld hl, sAchievements
	ld b, NUM_ACHIEVEMENT_BYTES
.zero
	ld [hli], a
	dec b
	jr nz, .zero
	jp RecalcAchievementsCheckSum

AchievementsEnableSRAM:
	ld a, BMODE_ADVANCED
	ld [rBMODE], a
	ld a, RAMG_SRAM_ENABLE
	ld [rRAMG], a
	ld a, BANK("Save Data")
	ld [rRAMB], a
	ret

AchievementsDisableSRAM:
	ld a, BMODE_SIMPLE
	ld [rBMODE], a
	ASSERT RAMG_SRAM_DISABLE == BMODE_SIMPLE
	ld [rRAMG], a
	ret

; --- Records viewer (opened from the main menu) ----------------------------
; Reuses wOptionsCursorLocation as the page counter (the options menu is not
; active on the main-menu path).

DisplayRecordsMenu_::
	call AchievementsEnableSRAM
	call ValidateAchievements ; also initializes a fresh cartridge to "all locked"
	call InitRecordsScreen
.loop
	call JoypadLowSensitivity
	ldh a, [hJoy5]
	and PAD_B | PAD_START
	jr nz, .exit
	ldh a, [hJoy5]
	and PAD_DOWN
	jr nz, .nextPage
	ldh a, [hJoy5]
	and PAD_UP
	jr nz, .prevPage
	call DelayFrame
	jr .loop
.nextPage
	ld a, [wOptionsCursorLocation]
	inc a
	cp NUM_RECORDS_PAGES
	jr c, .setPage
	xor a
.setPage
	ld [wOptionsCursorLocation], a
	call DrawRecordsPage
	jr .loop
.prevPage
	ld a, [wOptionsCursorLocation]
	and a
	jr nz, .decPage
	ld a, NUM_RECORDS_PAGES
.decPage
	dec a
	ld [wOptionsCursorLocation], a
	call DrawRecordsPage
	jr .loop
.exit
	jp AchievementsDisableSRAM

InitRecordsScreen:
	xor a
	ld [wOptionsCursorLocation], a
	ldh [hAutoBGTransferEnabled], a
	hlcoord 0, 0
	lb bc, SCREEN_HEIGHT - 2, SCREEN_WIDTH - 2
	call TextBoxBorder
	hlcoord 1, 1
	ld de, RecordsTitleText
	call PlaceString
	ld hl, sAchievements
	ld b, NUM_ACHIEVEMENT_BYTES
	call CountSetBits
	hlcoord 10, 1
	ld de, wNumSetBits
	lb bc, 1, 2
	call PrintNumber
	hlcoord 12, 1
	ld de, RecordsTotalText
	call PlaceString
	call DrawRecordsPage
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	jp Delay3

DrawRecordsPage:
	xor a
	ldh [hAutoBGTransferEnabled], a
	; blank the 12 entry rows (y=3..14), inner columns 1..18
	hlcoord 1, 3
	ld c, NUM_RECORDS_PER_PAGE
.blankRow
	push hl
	ld b, SCREEN_WIDTH - 2
.blankCol
	ld [hl], ' '
	inc hl
	dec b
	jr nz, .blankCol
	pop hl
	ld de, SCREEN_WIDTH
	add hl, de
	dec c
	jr nz, .blankRow
	ld b, 0 ; row 0..11
.entryLoop
	call RecordsBaseIndex ; a = page * NUM_RECORDS_PER_PAGE
	add b
	cp NUM_ACHIEVEMENTS
	jr nc, .entryDone ; remaining rows stay blank
	push bc
	call DrawRecordsEntry
	pop bc
	inc b
	ld a, b
	cp NUM_RECORDS_PER_PAGE
	jr nz, .entryLoop
.entryDone
	ld a, 1
	ldh [hAutoBGTransferEnabled], a
	ret

; a = current page * NUM_RECORDS_PER_PAGE (12). Clobbers b, c.
RecordsBaseIndex:
	ld a, [wOptionsCursorLocation]
	add a
	add a ; *4
	ld c, a
	add a ; *8
	add c ; *12
	ret

; a = achievement index, b = row (0..11)
DrawRecordsEntry:
	push af ; index
	; row base coord = (col 0, row 3 + b)
	ld hl, wTileMap + 3 * SCREEN_WIDTH
	ld de, SCREEN_WIDTH
	inc b
.rowLoop
	dec b
	jr z, .rowReady
	add hl, de
	jr .rowLoop
.rowReady
	; hl = row col0
	pop af ; index
	push af
	call TestAchievement ; a = unlock state; preserves hl
	push hl ; save row col0
	inc hl ; col1 = marker
	and a
	jr z, .locked
	ld [hl], '▶'
	jr .marked
.locked
	ld [hl], ' '
.marked
	pop hl ; row col0
	inc hl
	inc hl
	inc hl ; col3 = name dest
	pop af ; index
	ld e, a
	ld d, 0
	push hl ; name dest
	ld hl, AchievementNames
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld d, h
	ld e, l ; de = name string ptr
	pop hl ; hl = name dest
	jp PlaceString

RecordsTitleText:
	db "RECORDS@"
RecordsTotalText:
	db "/48@"

AchievementNames:
	dw .boulder,  .cascade,  .thunder,  .rainbow
	dw .soul,     .marsh,    .volcano,  .earth
	dw .dex10,    .dex25,    .dex50,    .dex100
	dw .dex150,   .dexall,   .articuno, .zapdos
	dw .moltres,  .mewtwo,   .mew,      .stormtrio
	dw .champion, .champion3,.champion10,.rival
	dw .fullteam, .level100, .evolve,   .holdem100k
	dw .boxfull,  .masterball,.fossil,  .seenall
	dw .money100k,.holdem9999,.coinsmax,.hmmaster
	dw .playtime1,.playtime10,.oakone,  .oakall
	dw .terabtl,  .teraoff,  .terapick, .teraorb
	dw .seen75,   .level50,  .money10k, .master

.boulder:    db "Boulder Badge@"
.cascade:    db "Cascade Badge@"
.thunder:    db "Thunder Badge@"
.rainbow:    db "Rainbow Badge@"
.soul:       db "Soul Badge@"
.marsh:      db "Marsh Badge@"
.volcano:    db "Volcano Badge@"
.earth:      db "Earth Badge@"
.dex10:      db "Dex: 10@"
.dex25:      db "Dex: 25@"
.dex50:      db "Dex: 50@"
.dex100:     db "Dex: 100@"
.dex150:     db "Dex: 150@"
.dexall:     db "Living Dex@"
.articuno:   db "Articuno@"
.zapdos:     db "Zapdos@"
.moltres:    db "Moltres@"
.mewtwo:     db "Mewtwo@"
.mew:        db "Mew@"
.stormtrio:  db "Storm Trio@"
.champion:   db "Champion@"
.champion3:  db "3x Champion@"
.champion10: db "10x Champion@"
.rival:      db "Rival Bested@"
.fullteam:   db "Full Party@"
.level100:   db "Level 100@"
.evolve:     db "Evolution@"
.holdem100k: db "Holdem 100K@"
.boxfull:    db "PC Box Full@"
.masterball: db "Master Ball@"
.fossil:     db "Fossil Reborn@"
.seenall:    db "Seen Them All@"
.money100k:  db "100K Cash@"
.holdem9999: db "Holdem 9999@"
.coinsmax:   db "Coin Master@"
.hmmaster:   db "HM Master@"
.playtime1:  db "1 Hour Play@"
.playtime10: db "10 Hours Play@"
.oakone:     db "Oak Beaten@"
.oakall:     db "Oak Trounced@"
.terabtl:    db "Terastallize@"
.teraoff:    db "Off Type Tera@"
.terapick:   db "Tera Picker@"
.teraorb:    db "Tera Orb@"
.seen75:     db "Seen 75@"
.level50:    db "Level 50@"
.money10k:   db "10K Cash@"
.master:     db "Completionist@"
