; move ids
; indexes for:
; - Moves (see data/moves/moves.asm)
; - MoveNames (see data/moves/names.asm)
; - MoveCategories (see data/moves/categories.asm)
; NOTE: AttackAnimationPointers and MoveSoundTable rows 1-165 remain in
; the ORIGINAL (vanilla) move order and are addressed with the ANIM_*
; constants defined at the bottom of this file, NOT with move ids.
	const_def
	const NO_MOVE      ; 00
	const SPIRAL_BEAM  ; 01
	const KARATE_CHOP  ; 02
	const VACUUM_WAVE  ; 03
	const AURA_SPHERE  ; 04
	const FORCE_PALM   ; 05
	const PAY_DAY      ; 06
	const FIRE_PUNCH   ; 07
	const ICE_PUNCH    ; 08
	const THUNDERPUNCH ; 09
	const FOCUS_BLAST  ; 0a
	const AIR_CUTTER   ; 0b
	const AIR_SLASH    ; 0c
	const RAZOR_WIND   ; 0d
	const SWORDS_DANCE ; 0e
	const CUT          ; 0f
	const GUST         ; 10
	const WING_ATTACK  ; 11
	const WHIRLWIND    ; 12
	const FLY          ; 13
	const HURRICANE    ; 14
	const CROSS_POISON ; 15
	const VINE_WHIP    ; 16
	const POISON_JAB   ; 17
	const GUNK_SHOT    ; 18
	const SLUDGE_BOMB  ; 19
	const SLUDGE_WAVE  ; 1a
	const BULLDOZE     ; 1b
	const SAND_ATTACK  ; 1c
	const HEADBUTT     ; 1d
	const MUD_SLAP     ; 1e
	const MUD_BOMB     ; 1f
	const EARTH_POWER  ; 20
	const TACKLE       ; 21
	const STONE_EDGE   ; 22
	const HEAD_SMASH   ; 23
	const ROCK_BLAST   ; 24
	const ANCIENTPOWER ; 25
	const DOUBLE_EDGE  ; 26
	const TAIL_WHIP    ; 27
	const POISON_STING ; 28
	const POWER_GEM    ; 29
	const METEOR_BEAM  ; 2a
	const LEER         ; 2b
	const BITE         ; 2c
	const GROWL        ; 2d
	const ROAR         ; 2e
	const SING         ; 2f
	const SUPERSONIC   ; 30
	const SONICBOOM    ; 31
	const DISABLE      ; 32
	const ACID         ; 33
	const EMBER        ; 34
	const FLAMETHROWER ; 35
	const MIST         ; 36
	const WATER_GUN    ; 37
	const HYDRO_PUMP   ; 38
	const SURF         ; 39
	const ICE_BEAM     ; 3a
	const BLIZZARD     ; 3b
	const PSYBEAM      ; 3c
	const BUBBLEBEAM   ; 3d
	const AURORA_BEAM  ; 3e
	const HYPER_BEAM   ; 3f
	const PECK         ; 40
	const DRILL_PECK   ; 41
	const SUBMISSION   ; 42
	const LOW_KICK     ; 43
	const COUNTER      ; 44
	const SEISMIC_TOSS ; 45
	const STRENGTH     ; 46
	const FURY_CUTTER  ; 47
	const MEGA_DRAIN   ; 48
	const LEECH_SEED   ; 49
	const GROWTH       ; 4a
	const RAZOR_LEAF   ; 4b
	const SOLARBEAM    ; 4c
	const POISONPOWDER ; 4d
	const STUN_SPORE   ; 4e
	const SLEEP_POWDER ; 4f
	const X_SCISSOR    ; 50
	const STRING_SHOT  ; 51
	const MEGAHORN     ; 52
	const INFESTATION  ; 53
	const THUNDERSHOCK ; 54
	const THUNDERBOLT  ; 55
	const THUNDER_WAVE ; 56
	const THUNDER      ; 57
	const ROCK_THROW   ; 58
	const EARTHQUAKE   ; 59
	const FISSURE      ; 5a
	const DIG          ; 5b
	const TOXIC        ; 5c
	const CONFUSION    ; 5d
	const PSYCHIC_M    ; 5e
	const HYPNOSIS     ; 5f
	const MEDITATE     ; 60
	const AGILITY      ; 61
	const QUICK_ATTACK ; 62
	const SILVER_WIND  ; 63
	const TELEPORT     ; 64
	const NIGHT_SHADE  ; 65
	const MIMIC        ; 66
	const SCREECH      ; 67
	const DOUBLE_TEAM  ; 68
	const RECOVER      ; 69
	const HARDEN       ; 6a
	const MINIMIZE     ; 6b
	const SMOKESCREEN  ; 6c
	const CONFUSE_RAY  ; 6d
	const WITHDRAW     ; 6e
	const DEFENSE_CURL ; 6f
	const BARRIER      ; 70
	const LIGHT_SCREEN ; 71
	const HAZE         ; 72
	const REFLECT      ; 73
	const FOCUS_ENERGY ; 74
	const BUG_BUZZ     ; 75
	const METRONOME    ; 76
	const MIRROR_MOVE  ; 77
	const LOCUST_STORM ; 78
	const ASTONISH     ; 79
	const LICK         ; 7a
	const SHADOW_CLAW  ; 7b
	const SLUDGE       ; 7c
	const BONE_CLUB    ; 7d
	const FIRE_BLAST   ; 7e
	const WATERFALL    ; 7f
	const SHADOW_FORCE ; 80
	const SWIFT        ; 81
	const OMINOUS_WIND ; 82
	const HEX          ; 83
	const SHADOW_BALL  ; 84
	const AMNESIA      ; 85
	const KINESIS      ; 86
	const SOFTBOILED   ; 87
	const HI_JUMP_KICK ; 88
	const GLARE        ; 89
	const SPIRIT_BLAST ; 8a
	const POISON_GAS   ; 8b
	const METAL_CLAW   ; 8c
	const LEECH_LIFE   ; 8d
	const LOVELY_KISS  ; 8e
	const IRON_HEAD    ; 8f
	const TRANSFORM    ; 90
	const METEOR_MASH  ; 91
	const IRON_TAIL    ; 92
	const SPORE        ; 93
	const FLASH        ; 94
	const METAL_SHARD  ; 95
	const SPLASH       ; 96
	const ACID_ARMOR   ; 97
	const CRABHAMMER   ; 98
	const EXPLOSION    ; 99
	const MIRROR_SHOT  ; 9a
	const FLASH_CANNON ; 9b
	const REST         ; 9c
	const ROCK_SLIDE   ; 9d
	const STEEL_BEAM   ; 9e
	const SHARPEN      ; 9f
	const CONVERSION   ; a0
	const TRI_ATTACK   ; a1
	const FLAME_CHARGE ; a2
	const SLASH        ; a3
	const SUBSTITUTE   ; a4
	const STRUGGLE     ; a5
	const FIRE_FANG    ; a6
	const FLARE_BLITZ  ; a7
	const FLAME_BURST  ; a8
	const AQUA_JET     ; a9
	const RAZOR_SHELL  ; aa
	const LEAF_BLADE   ; ab
	const WOOD_HAMMER  ; ac
	const LEAFAGE      ; ad
	const ENERGY_BALL  ; ae
	const NUZZLE       ; af
	const SPARK        ; b0
	const WILD_CHARGE  ; b1
	const SHOCK_WAVE   ; b2
	const MIND_SPIKE   ; b3
	const PSYCHO_CUT   ; b4
	const ZEN_HEADBUTT ; b5
	const MIND_CRUSH   ; b6
	const PSYCHO_BOOST ; b7
	const ICE_SHARD    ; b8
	const ICE_FANG     ; b9
	const ICICLE_CRASH ; ba
	const POWDER_SNOW  ; bb
	const ICY_WIND     ; bc
	const DRAGON_TAIL  ; bd
	const DRAGON_CLAW  ; be
	const DRAGON_RUSH  ; bf
	const OUTRAGE      ; c0
	const TWISTER      ; c1
	const DRAGONBREATH ; c2
	const DRAGON_PULSE ; c3
	const DRACO_METEOR ; c4
	const PURSUIT      ; c5
	const CRUNCH       ; c6
	const NIGHT_SLASH  ; c7
	const SNARL        ; c8
	const NIGHT_RAY    ; c9
	const DARK_PULSE   ; ca
	const DARK_STORM   ; cb
	const PIXIE_STRIKE ; cc
	const SPIRIT_BREAK ; cd
	const PLAY_ROUGH   ; ce
	const STAR_SMASH   ; cf
	const FAIRY_WIND   ; d0
	const DRAIN_KISS   ; d1
	const DAZZLE_GLEAM ; d2
	const MOONBLAST    ; d3
	const ECHO_JAB     ; d4
	const SONIC_SLAM   ; d5
	const ECHO_CRASH   ; d6
	const SONIC_SMASH  ; d7
	const ROUND_M      ; d8
	const HYPER_VOICE  ; d9
	const BOOMBURST    ; da
	const GLOW_PUNCH   ; db
	const FLASH_KICK   ; dc
	const PRISM_BLADE  ; dd
	const NOVA_STRIKE  ; de
	const LIGHT_RAY    ; df
	const PHOTON_BEAM  ; e0
	const SUPERNOVA    ; e1

DEF NUM_ATTACKS EQU const_value - 1

DEF CANNOT_MOVE EQU $ff

	; Special battle animation ids (share the id space with moves).
	; The unused ids ANIM_A8, ANIM_B2-ANIM_B9 and ANIM_BB were removed
	; to make room for the expanded move list.
	const SHOWPIC_ANIM
	const STATUS_AFFECTED_ANIM
	const ENEMY_HUD_SHAKE_ANIM
	const TRADE_BALL_DROP_ANIM
	const TRADE_BALL_SHAKE_ANIM
	const TRADE_BALL_TILT_ANIM
	const TRADE_BALL_POOF_ANIM
	const XSTATITEM_ANIM ; use X Attack/Defense/Speed/Special
	const XSTATITEM_DUPLICATE_ANIM ; enemy variant (XSTATITEM_ANIM + 1)
	const SHRINKING_SQUARE_ANIM
	const ANIM_B1 ; enemy variant (SHRINKING_SQUARE_ANIM + 1)
	const BURN_PSN_ANIM ; plays when a monster is burned or poisoned
	const SLP_PLAYER_ANIM
	const SLP_ANIM ; sleeping monster
	const CONF_PLAYER_ANIM
	const CONF_ANIM ; confused monster
	const SLIDE_DOWN_ANIM
	const TOSS_ANIM ; toss Poké Ball
	const SHAKE_ANIM ; shaking Poké Ball when catching monster
	const POOF_ANIM ; puff of smoke
	const BLOCKBALL_ANIM ; trainer knocks away Poké Ball
	const GREATTOSS_ANIM ; toss Great Ball
	const ULTRATOSS_ANIM ; toss Ultra Ball or Master Ball
	const SHAKE_SCREEN_ANIM
	const HIDEPIC_ANIM ; monster disappears
	const ROCK_ANIM ; throw rock
	const BAIT_ANIM ; throw bait

DEF NUM_ATTACK_ANIMS EQU const_value - 1

; Animation-script/sound ids: the animation SCRIPTS (and MoveSoundTable)
; keep the original games' 165 entries in vanilla move order. These
; constants are used by the battle_anim sound bytes in
; data/moves/animations.asm. Which script a MOVE plays is decided by
; its row in AttackAnimationPointers (indexed by move id).
DEF ANIM_POUND        EQU $01
DEF ANIM_KARATE_CHOP  EQU $02
DEF ANIM_DOUBLESLAP   EQU $03
DEF ANIM_COMET_PUNCH  EQU $04
DEF ANIM_MEGA_PUNCH   EQU $05
DEF ANIM_PAY_DAY      EQU $06
DEF ANIM_FIRE_PUNCH   EQU $07
DEF ANIM_ICE_PUNCH    EQU $08
DEF ANIM_THUNDERPUNCH EQU $09
DEF ANIM_SCRATCH      EQU $0A
DEF ANIM_VICEGRIP     EQU $0B
DEF ANIM_GUILLOTINE   EQU $0C
DEF ANIM_RAZOR_WIND   EQU $0D
DEF ANIM_SWORDS_DANCE EQU $0E
DEF ANIM_CUT          EQU $0F
DEF ANIM_GUST         EQU $10
DEF ANIM_WING_ATTACK  EQU $11
DEF ANIM_WHIRLWIND    EQU $12
DEF ANIM_FLY          EQU $13
DEF ANIM_BIND         EQU $14
DEF ANIM_SLAM         EQU $15
DEF ANIM_VINE_WHIP    EQU $16
DEF ANIM_STOMP        EQU $17
DEF ANIM_DOUBLE_KICK  EQU $18
DEF ANIM_MEGA_KICK    EQU $19
DEF ANIM_JUMP_KICK    EQU $1A
DEF ANIM_ROLLING_KICK EQU $1B
DEF ANIM_SAND_ATTACK  EQU $1C
DEF ANIM_HEADBUTT     EQU $1D
DEF ANIM_HORN_ATTACK  EQU $1E
DEF ANIM_FURY_ATTACK  EQU $1F
DEF ANIM_HORN_DRILL   EQU $20
DEF ANIM_TACKLE       EQU $21
DEF ANIM_BODY_SLAM    EQU $22
DEF ANIM_WRAP         EQU $23
DEF ANIM_TAKE_DOWN    EQU $24
DEF ANIM_THRASH       EQU $25
DEF ANIM_DOUBLE_EDGE  EQU $26
DEF ANIM_TAIL_WHIP    EQU $27
DEF ANIM_POISON_STING EQU $28
DEF ANIM_TWINEEDLE    EQU $29
DEF ANIM_PIN_MISSILE  EQU $2A
DEF ANIM_LEER         EQU $2B
DEF ANIM_BITE         EQU $2C
DEF ANIM_GROWL        EQU $2D
DEF ANIM_ROAR         EQU $2E
DEF ANIM_SING         EQU $2F
DEF ANIM_SUPERSONIC   EQU $30
DEF ANIM_SONICBOOM    EQU $31
DEF ANIM_DISABLE      EQU $32
DEF ANIM_ACID         EQU $33
DEF ANIM_EMBER        EQU $34
DEF ANIM_FLAMETHROWER EQU $35
DEF ANIM_MIST         EQU $36
DEF ANIM_WATER_GUN    EQU $37
DEF ANIM_HYDRO_PUMP   EQU $38
DEF ANIM_SURF         EQU $39
DEF ANIM_ICE_BEAM     EQU $3A
DEF ANIM_BLIZZARD     EQU $3B
DEF ANIM_PSYBEAM      EQU $3C
DEF ANIM_BUBBLEBEAM   EQU $3D
DEF ANIM_AURORA_BEAM  EQU $3E
DEF ANIM_HYPER_BEAM   EQU $3F
DEF ANIM_PECK         EQU $40
DEF ANIM_DRILL_PECK   EQU $41
DEF ANIM_SUBMISSION   EQU $42
DEF ANIM_LOW_KICK     EQU $43
DEF ANIM_COUNTER      EQU $44
DEF ANIM_SEISMIC_TOSS EQU $45
DEF ANIM_STRENGTH     EQU $46
DEF ANIM_ABSORB       EQU $47
DEF ANIM_MEGA_DRAIN   EQU $48
DEF ANIM_LEECH_SEED   EQU $49
DEF ANIM_GROWTH       EQU $4A
DEF ANIM_RAZOR_LEAF   EQU $4B
DEF ANIM_SOLARBEAM    EQU $4C
DEF ANIM_POISONPOWDER EQU $4D
DEF ANIM_STUN_SPORE   EQU $4E
DEF ANIM_SLEEP_POWDER EQU $4F
DEF ANIM_PETAL_DANCE  EQU $50
DEF ANIM_STRING_SHOT  EQU $51
DEF ANIM_DRAGON_RAGE  EQU $52
DEF ANIM_FIRE_SPIN    EQU $53
DEF ANIM_THUNDERSHOCK EQU $54
DEF ANIM_THUNDERBOLT  EQU $55
DEF ANIM_THUNDER_WAVE EQU $56
DEF ANIM_THUNDER      EQU $57
DEF ANIM_ROCK_THROW   EQU $58
DEF ANIM_EARTHQUAKE   EQU $59
DEF ANIM_FISSURE      EQU $5A
DEF ANIM_DIG          EQU $5B
DEF ANIM_TOXIC        EQU $5C
DEF ANIM_CONFUSION    EQU $5D
DEF ANIM_PSYCHIC_M    EQU $5E
DEF ANIM_HYPNOSIS     EQU $5F
DEF ANIM_MEDITATE     EQU $60
DEF ANIM_AGILITY      EQU $61
DEF ANIM_QUICK_ATTACK EQU $62
DEF ANIM_RAGE         EQU $63
DEF ANIM_TELEPORT     EQU $64
DEF ANIM_NIGHT_SHADE  EQU $65
DEF ANIM_MIMIC        EQU $66
DEF ANIM_SCREECH      EQU $67
DEF ANIM_DOUBLE_TEAM  EQU $68
DEF ANIM_RECOVER      EQU $69
DEF ANIM_HARDEN       EQU $6A
DEF ANIM_MINIMIZE     EQU $6B
DEF ANIM_SMOKESCREEN  EQU $6C
DEF ANIM_CONFUSE_RAY  EQU $6D
DEF ANIM_WITHDRAW     EQU $6E
DEF ANIM_DEFENSE_CURL EQU $6F
DEF ANIM_BARRIER      EQU $70
DEF ANIM_LIGHT_SCREEN EQU $71
DEF ANIM_HAZE         EQU $72
DEF ANIM_REFLECT      EQU $73
DEF ANIM_FOCUS_ENERGY EQU $74
DEF ANIM_BIDE         EQU $75
DEF ANIM_METRONOME    EQU $76
DEF ANIM_MIRROR_MOVE  EQU $77
DEF ANIM_SELFDESTRUCT EQU $78
DEF ANIM_EGG_BOMB     EQU $79
DEF ANIM_LICK         EQU $7A
DEF ANIM_SMOG         EQU $7B
DEF ANIM_SLUDGE       EQU $7C
DEF ANIM_BONE_CLUB    EQU $7D
DEF ANIM_FIRE_BLAST   EQU $7E
DEF ANIM_WATERFALL    EQU $7F
DEF ANIM_CLAMP        EQU $80
DEF ANIM_SWIFT        EQU $81
DEF ANIM_SKULL_BASH   EQU $82
DEF ANIM_SPIKE_CANNON EQU $83
DEF ANIM_CONSTRICT    EQU $84
DEF ANIM_AMNESIA      EQU $85
DEF ANIM_KINESIS      EQU $86
DEF ANIM_SOFTBOILED   EQU $87
DEF ANIM_HI_JUMP_KICK EQU $88
DEF ANIM_GLARE        EQU $89
DEF ANIM_DREAM_EATER  EQU $8A
DEF ANIM_POISON_GAS   EQU $8B
DEF ANIM_BARRAGE      EQU $8C
DEF ANIM_LEECH_LIFE   EQU $8D
DEF ANIM_LOVELY_KISS  EQU $8E
DEF ANIM_SKY_ATTACK   EQU $8F
DEF ANIM_TRANSFORM    EQU $90
DEF ANIM_BUBBLE       EQU $91
DEF ANIM_DIZZY_PUNCH  EQU $92
DEF ANIM_SPORE        EQU $93
DEF ANIM_FLASH        EQU $94
DEF ANIM_PSYWAVE      EQU $95
DEF ANIM_SPLASH       EQU $96
DEF ANIM_ACID_ARMOR   EQU $97
DEF ANIM_CRABHAMMER   EQU $98
DEF ANIM_EXPLOSION    EQU $99
DEF ANIM_FURY_SWIPES  EQU $9A
DEF ANIM_BONEMERANG   EQU $9B
DEF ANIM_REST         EQU $9C
DEF ANIM_ROCK_SLIDE   EQU $9D
DEF ANIM_HYPER_FANG   EQU $9E
DEF ANIM_SHARPEN      EQU $9F
DEF ANIM_CONVERSION   EQU $A0
DEF ANIM_TRI_ATTACK   EQU $A1
DEF ANIM_SUPER_FANG   EQU $A2
DEF ANIM_SLASH        EQU $A3
DEF ANIM_SUBSTITUTE   EQU $A4
DEF ANIM_STRUGGLE     EQU $A5

DEF NUM_MOVE_ANIMS EQU ANIM_STRUGGLE ; number of MoveSoundTable rows
