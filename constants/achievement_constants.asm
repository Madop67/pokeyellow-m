; Achievement ("Records") bit indices.
; Stored as a 6-byte bitfield in SRAM (sAchievements) outside the save game, so
; they persist across New Game and are viewable from the main menu without a save.
; Most are DERIVED from persistent save state by SyncAchievements; the ones marked
; HOOK are set as WRAM breadcrumbs (wPendingAchievements) at their trigger site and
; folded into SRAM at the next sync.
;
; The 8 badge indices (0-7) must line up 1:1 with the wObtainedBadges bit order.

	const_def
	; byte 0 - gym badges (DERIVED from wObtainedBadges)
	const ACH_BADGE_BOULDER  ; 0
	const ACH_BADGE_CASCADE  ; 1
	const ACH_BADGE_THUNDER  ; 2
	const ACH_BADGE_RAINBOW  ; 3
	const ACH_BADGE_SOUL     ; 4
	const ACH_BADGE_MARSH    ; 5
	const ACH_BADGE_VOLCANO  ; 6
	const ACH_BADGE_EARTH    ; 7
	; byte 1 - Pokédex owned tiers + first legendary catches (DERIVED)
	const ACH_DEX_10         ; 8
	const ACH_DEX_25         ; 9
	const ACH_DEX_50         ; 10
	const ACH_DEX_100        ; 11
	const ACH_DEX_150        ; 12
	const ACH_DEX_ALL        ; 13
	const ACH_CATCH_ARTICUNO ; 14
	const ACH_CATCH_ZAPDOS   ; 15
	; byte 2 - legendaries + champion (DERIVED)
	const ACH_CATCH_MOLTRES  ; 16
	const ACH_CATCH_MEWTWO   ; 17
	const ACH_CATCH_MEW      ; 18
	const ACH_STORM_TRIO     ; 19
	const ACH_CHAMPION       ; 20
	const ACH_CHAMPION_3     ; 21
	const ACH_CHAMPION_10    ; 22
	const ACH_RIVAL_R22      ; 23
	; byte 3 - training & collection
	const ACH_FULL_TEAM      ; 24
	const ACH_LEVEL_100      ; 25
	const ACH_EVOLVE         ; 26 (HOOK)
	const ACH_HOLDEM_100K    ; 27 (HOOK) win 100,000 money in Texas Hold'em
	const ACH_BOX_FULL       ; 28
	const ACH_MASTER_BALL    ; 29
	const ACH_FOSSIL         ; 30
	const ACH_SEEN_ALL       ; 31
	; byte 4 - money, coins, items, playtime, Prof. Oak
	const ACH_MONEY_100K     ; 32
	const ACH_HOLDEM_9999    ; 33 (HOOK) win 9,999 coins in Texas Hold'em
	const ACH_COINS_MAX      ; 34
	const ACH_HM_MASTER      ; 35
	const ACH_PLAYTIME_1     ; 36
	const ACH_PLAYTIME_10    ; 37
	const ACH_OAK_ONE        ; 38
	const ACH_OAK_ALL        ; 39
	; byte 5 - Chromatic fork mechanics + capstone
	const ACH_TERA_BATTLE    ; 40 (HOOK)
	const ACH_TERA_OFFTYPE   ; 41 (HOOK)
	const ACH_TERA_PICKER    ; 42 (HOOK)
	const ACH_TERA_ORB       ; 43
	const ACH_SEEN_75        ; 44
	const ACH_LEVEL_50       ; 45
	const ACH_MONEY_10K      ; 46
	const ACH_MASTER         ; 47 (capstone: all others unlocked)
DEF NUM_ACHIEVEMENTS EQU const_value ; 48

DEF NUM_ACHIEVEMENT_BYTES EQU (NUM_ACHIEVEMENTS + 7) / 8 ; 6
DEF NUM_RECORDS_PER_PAGE EQU 12
DEF NUM_RECORDS_PAGES EQU (NUM_ACHIEVEMENTS + NUM_RECORDS_PER_PAGE - 1) / NUM_RECORDS_PER_PAGE ; 4
