; Yellow entry format:
;	db trainerclass, trainerid
;	repeat { db partymon location, partymon move, move id }
;	db 0
;
; Boss trainers (gym leaders, Elite Four, Champion) get fully-specified
; 4-move sets: STAB, coverage, and a stat-boosting/lowering move, all legal
; for the species (level-up up to its level, or its TM/HM pool). PP for
; overwritten slots is recomputed in read_trainer_party.asm.

SpecialTrainerMoves:

	db YOUNGSTER, 1
	db 1, 2, PAY_DAY
	db 1, 4, SHOCK_WAVE
	db 2, 2, COUNTER
	db 2, 4, MEGA_DRAIN
	db 0

	db YOUNGSTER, 2
	db 1, 2, SWIFT
	db 1, 3, COUNTER
	db 1, 4, PAY_DAY
	db 0

	db YOUNGSTER, 3
	db 1, 2, PAY_DAY
	db 1, 4, SHOCK_WAVE
	db 2, 2, PAY_DAY
	db 2, 4, SHOCK_WAVE
	db 3, 4, MEGA_DRAIN
	db 0

	db YOUNGSTER, 4
	db 1, 2, PAY_DAY
	db 2, 2, COUNTER
	db 2, 4, MEGA_DRAIN
	db 3, 4, MEGA_DRAIN
	db 0

	db YOUNGSTER, 5
	db 1, 2, PAY_DAY
	db 2, 2, PAY_DAY
	db 2, 3, SWIFT
	db 0

	db YOUNGSTER, 6
	db 1, 2, BUBBLEBEAM
	db 1, 3, TRI_ATTACK
	db 1, 4, THUNDER_WAVE
	db 0

	db YOUNGSTER, 7
	db 1, 2, COUNTER
	db 1, 4, MEGA_DRAIN
	db 2, 3, CUT
	db 2, 4, SWIFT
	db 0

	db YOUNGSTER, 8
	db 1, 1, TACKLE
	db 0

	db YOUNGSTER, 9
	db 1, 2, ROCK_SLIDE
	db 0

	db YOUNGSTER, 11
	db 1, 2, TRI_ATTACK
	db 2, 2, TRI_ATTACK
	db 3, 3, TRI_ATTACK
	db 0

	db YOUNGSTER, 12
	db 1, 1, TACKLE
	db 2, 3, BUBBLEBEAM
	db 0

	db YOUNGSTER, 14
	db 1, 4, FISSURE
	db 0

; --- Gym Leaders ---

	db BUG_CATCHER, 11
	db 1, 1, INFESTATION
	db 1, 2, CONFUSION
	db 1, 4, MEGA_DRAIN
	db 0

	db BUG_CATCHER, 13
	db 1, 2, SWORDS_DANCE
	db 1, 3, CUT
	db 1, 4, MEGA_DRAIN
	db 2, 2, SWORDS_DANCE
	db 2, 3, CUT
	db 2, 4, MEGA_DRAIN
	db 0

	db BUG_CATCHER, 14
	db 3, 2, MEGA_DRAIN
	db 0

	db BUG_CATCHER, 15
	db 2, 2, TACKLE
	db 2, 3, STRING_SHOT
	db 0

	db LASS, 1
	db 1, 3, PAY_DAY
	db 1, 4, SWIFT
	db 2, 3, PAY_DAY
	db 2, 4, SWIFT
	db 0

	db LASS, 2
	db 1, 2, PAY_DAY
	db 1, 4, SHOCK_WAVE
	db 2, 3, COUNTER
	db 2, 4, SHOCK_WAVE
	db 0

	db LASS, 3
	db 1, 3, COUNTER
	db 1, 4, SHOCK_WAVE
	db 0

	db LASS, 4
	db 1, 2, X_SCISSOR
	db 2, 2, X_SCISSOR
	db 3, 2, TACKLE
	db 0

	db LASS, 5
	db 1, 2, CUT
	db 1, 3, COUNTER
	db 1, 4, DOUBLE_TEAM
	db 2, 2, SWORDS_DANCE
	db 2, 3, CUT
	db 2, 4, MEGA_DRAIN
	db 0

	db LASS, 6
	db 1, 2, COUNTER
	db 1, 4, SHOCK_WAVE
	db 0

	db LASS, 7
	db 2, 2, COUNTER
	db 2, 4, SHOCK_WAVE
	db 0

	db LASS, 8
	db 2, 2, COUNTER
	db 2, 4, SHOCK_WAVE
	db 0

	db LASS, 9
	db 1, 2, SHOCK_WAVE
	db 1, 3, COUNTER
	db 2, 2, COUNTER
	db 2, 4, SHOCK_WAVE
	db 0

	db LASS, 10
	db 1, 2, CUT
	db 1, 3, COUNTER
	db 1, 4, DOUBLE_TEAM
	db 3, 2, CUT
	db 3, 3, COUNTER
	db 3, 4, DOUBLE_TEAM
	db 0

	db LASS, 11
	db 2, 2, SHOCK_WAVE
	db 0

	db LASS, 12
	db 1, 3, BUBBLEBEAM
	db 1, 4, TRI_ATTACK
	db 0

	db LASS, 13
	db 1, 1, TACKLE
	db 1, 4, SHOCK_WAVE
	db 2, 1, TACKLE
	db 0

	db LASS, 14
	db 1, 1, TACKLE
	db 2, 1, TACKLE
	db 3, 1, TACKLE
	db 0

	db LASS, 15
	db 1, 4, GUST
	db 2, 2, TRI_ATTACK
	db 3, 2, SHOCK_WAVE
	db 4, 2, TRI_ATTACK
	db 5, 1, TACKLE
	db 0

	db LASS, 16
	db 1, 2, TRI_ATTACK
	db 1, 4, BUBBLEBEAM
	db 2, 2, TRI_ATTACK
	db 2, 4, BUBBLEBEAM
	db 0

	db LASS, 17
	db 1, 2, VINE_WHIP
	db 1, 4, MEGA_DRAIN
	db 2, 1, VINE_WHIP
	db 2, 2, TACKLE
	db 2, 4, MEGA_DRAIN
	db 0

	db LASS, 18
	db 1, 2, CUT
	db 1, 3, COUNTER
	db 2, 2, CUT
	db 2, 3, COUNTER
	db 0

	db LASS, 19
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 0

	db SAILOR, 1
	db 1, 2, ROCK_SLIDE
	db 1, 3, COUNTER
	db 1, 4, SEISMIC_TOSS
	db 2, 2, TRI_ATTACK
	db 2, 4, BUBBLEBEAM
	db 0

	db SAILOR, 2
	db 1, 2, ROCK_SLIDE
	db 1, 3, COUNTER
	db 1, 4, SEISMIC_TOSS
	db 2, 4, BUBBLEBEAM
	db 0

	db SAILOR, 3
	db 1, 2, TRI_ATTACK
	db 1, 4, BUBBLEBEAM
	db 0

	db SAILOR, 4
	db 1, 2, SWIFT
	db 1, 3, BUBBLEBEAM
	db 1, 4, COUNTER
	db 2, 2, SWIFT
	db 2, 3, BUBBLEBEAM
	db 2, 4, TRI_ATTACK
	db 3, 4, BUBBLEBEAM
	db 0

	db SAILOR, 5
	db 2, 3, BUBBLEBEAM
	db 2, 4, THUNDER_WAVE
	db 0

	db SAILOR, 6
	db 1, 2, SWIFT
	db 1, 3, BUBBLEBEAM
	db 1, 4, COUNTER
	db 2, 2, SWIFT
	db 2, 3, BUBBLEBEAM
	db 2, 4, COUNTER
	db 3, 2, SWIFT
	db 3, 3, BUBBLEBEAM
	db 3, 4, COUNTER
	db 0

	db SAILOR, 7
	db 1, 3, ROCK_SLIDE
	db 1, 4, COUNTER
	db 0

	db SAILOR, 8
	db 1, 3, SHOCK_WAVE
	db 1, 4, THUNDER_WAVE
	db 0

	db JR_TRAINER_M, 1
	db 1, 2, CUT
	db 1, 3, COUNTER
	db 1, 4, DOUBLE_TEAM
	db 2, 2, CUT
	db 2, 3, SWIFT
	db 2, 4, SWORDS_DANCE
	db 0

	db JR_TRAINER_M, 2
	db 1, 2, PAY_DAY
	db 2, 2, COUNTER
	db 2, 4, MEGA_DRAIN
	db 0

	db JR_TRAINER_M, 3
	db 1, 2, SHOCK_WAVE
	db 1, 4, ROCK_SLIDE
	db 0

	db JR_TRAINER_M, 5
	db 1, 2, TRI_ATTACK
	db 1, 3, PAY_DAY
	db 2, 3, TRI_ATTACK
	db 0

	db JR_TRAINER_M, 8
	db 1, 2, TRI_ATTACK
	db 2, 2, ROCK_SLIDE
	db 2, 4, CUT
	db 3, 2, ROCK_SLIDE
	db 0

	db JR_TRAINER_M, 9
	db 1, 4, TACKLE
	db 2, 4, HEADBUTT
	db 0

	db JR_TRAINER_M, 10
	db 1, 3, MEGA_DRAIN
	db 1, 4, SWORDS_DANCE
	db 0

	db JR_TRAINER_F, 1
	db 1, 2, SWIFT
	db 1, 4, BUBBLEBEAM
	db 0

	db JR_TRAINER_F, 5
	db 1, 2, COUNTER
	db 1, 4, CUT
	db 2, 1, VINE_WHIP
	db 2, 3, MEGA_DRAIN
	db 3, 2, COUNTER
	db 3, 4, CUT
	db 4, 1, VINE_WHIP
	db 4, 3, MEGA_DRAIN
	db 0

	db JR_TRAINER_F, 6
	db 1, 2, TRI_ATTACK
	db 0

	db JR_TRAINER_F, 7
	db 1, 3, BUBBLEBEAM
	db 1, 4, TRI_ATTACK
	db 2, 2, TRI_ATTACK
	db 2, 4, BUBBLEBEAM
	db 0

	db JR_TRAINER_F, 8
	db 1, 4, GUST
	db 2, 4, GUST
	db 0

	db JR_TRAINER_F, 9
	db 1, 3, BUBBLEBEAM
	db 1, 4, TRI_ATTACK
	db 2, 4, GUST
	db 3, 2, TRI_ATTACK
	db 0

	db JR_TRAINER_F, 10
	db 1, 2, CUT
	db 1, 3, COUNTER
	db 2, 1, TACKLE
	db 2, 4, MEGA_DRAIN
	db 0

	db JR_TRAINER_F, 11
	db 1, 1, TACKLE
	db 1, 4, MEGA_DRAIN
	db 2, 1, TACKLE
	db 2, 4, MEGA_DRAIN
	db 0

	db JR_TRAINER_F, 12
	db 1, 4, GUST
	db 2, 1, TACKLE
	db 3, 1, TACKLE
	db 3, 4, TRI_ATTACK
	db 4, 4, GUST
	db 5, 1, TACKLE
	db 0

	db JR_TRAINER_F, 13
	db 1, 4, BUBBLEBEAM
	db 2, 4, BUBBLEBEAM
	db 0

	db JR_TRAINER_F, 14
	db 1, 4, GUST
	db 2, 1, TACKLE
	db 3, 4, GUST
	db 4, 1, GUST
	db 4, 3, SAND_ATTACK
	db 0

	db JR_TRAINER_F, 15
	db 1, 2, BUBBLEBEAM
	db 2, 4, BUBBLEBEAM
	db 3, 3, BUBBLEBEAM
	db 3, 4, SWIFT
	db 0

	db JR_TRAINER_F, 16
	db 1, 2, SURF
	db 2, 2, PECK
	db 0

	db JR_TRAINER_F, 17
	db 1, 2, VINE_WHIP
	db 1, 4, MEGA_DRAIN
	db 2, 2, TRI_ATTACK
	db 2, 4, BUBBLEBEAM
	db 0

	db JR_TRAINER_F, 18
	db 1, 2, TRI_ATTACK
	db 2, 2, CUT
	db 2, 3, COUNTER
	db 3, 4, GUST
	db 0

	db JR_TRAINER_F, 19
	db 1, 4, GUST
	db 2, 2, TRI_ATTACK
	db 3, 2, TRI_ATTACK
	db 4, 1, VINE_WHIP
	db 4, 3, MEGA_DRAIN
	db 0

	db JR_TRAINER_F, 20
	db 1, 1, MEGA_DRAIN
	db 1, 2, CUT
	db 2, 1, MEGA_DRAIN
	db 2, 2, CUT
	db 3, 1, MEGA_DRAIN
	db 3, 2, CUT
	db 0

	db JR_TRAINER_F, 21
	db 1, 3, SAND_ATTACK
	db 2, 1, GUST
	db 2, 3, SAND_ATTACK
	db 0

	db JR_TRAINER_F, 22
	db 1, 2, TACKLE
	db 1, 4, DAZZLE_GLEAM
	db 0

	db JR_TRAINER_F, 23
	db 1, 1, VINE_WHIP
	db 1, 3, TACKLE
	db 2, 1, MEGA_DRAIN
	db 2, 2, CUT
	db 0

	db JR_TRAINER_F, 24
	db 1, 2, ACID
	db 2, 3, BUBBLEBEAM
	db 2, 4, SWIFT
	db 3, 3, PAY_DAY
	db 3, 4, BUBBLEBEAM
	db 0

	db JR_TRAINER_F, 25
	db 1, 1, TACKLE
	db 1, 3, BUBBLEBEAM
	db 0

	db POKEMANIAC, 1
	db 1, 3, ROCK_SLIDE
	db 1, 4, SHOCK_WAVE
	db 2, 3, BUBBLEBEAM
	db 2, 4, TACKLE
	db 0

	db POKEMANIAC, 2
	db 1, 1, TACKLE
	db 1, 3, BUBBLEBEAM
	db 2, 2, THUNDER_WAVE
	db 2, 3, BUBBLEBEAM
	db 2, 4, TRI_ATTACK
	db 0

	db POKEMANIAC, 3
	db 1, 2, THUNDER_WAVE
	db 1, 3, BUBBLEBEAM
	db 1, 4, TRI_ATTACK
	db 2, 2, THUNDER_WAVE
	db 2, 3, BUBBLEBEAM
	db 2, 4, TRI_ATTACK
	db 3, 2, THUNDER_WAVE
	db 3, 3, BUBBLEBEAM
	db 3, 4, TRI_ATTACK
	db 0

	db POKEMANIAC, 4
	db 1, 1, TACKLE
	db 1, 3, SWIFT
	db 2, 1, TACKLE
	db 2, 3, BUBBLEBEAM
	db 0

	db POKEMANIAC, 5
	db 1, 2, THUNDER_WAVE
	db 1, 4, BUBBLEBEAM
	db 0

	db POKEMANIAC, 6
	db 1, 1, EMBER
	db 1, 2, TACKLE
	db 2, 2, BUBBLEBEAM
	db 2, 3, SING
	db 3, 2, HYPER_VOICE
	db 3, 3, TACKLE
	db 3, 4, SUPERSONIC
	db 0

	db POKEMANIAC, 7
	db 1, 1, TACKLE
	db 1, 3, BUBBLEBEAM
	db 2, 2, THUNDER_WAVE
	db 2, 4, BUBBLEBEAM
	db 0

	db SUPER_NERD, 1
	db 1, 2, SHOCK_WAVE
	db 1, 3, SWIFT
	db 1, 4, THUNDER_WAVE
	db 2, 2, THUNDER_WAVE
	db 2, 4, SHOCK_WAVE
	db 0

	db SUPER_NERD, 2
	db 1, 2, COUNTER
	db 1, 3, MEGA_DRAIN
	db 1, 4, SHOCK_WAVE
	db 2, 2, THUNDER_WAVE
	db 2, 4, SHOCK_WAVE
	db 3, 2, DOUBLE_TEAM
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 0

	db SUPER_NERD, 3
	db 1, 2, THUNDER_WAVE
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 3, 2, THUNDER_WAVE
	db 4, 2, SHOCK_WAVE
	db 4, 3, SWIFT
	db 4, 4, THUNDER_WAVE
	db 0

	db SUPER_NERD, 4
	db 1, 2, COUNTER
	db 1, 3, MEGA_DRAIN
	db 1, 4, SHOCK_WAVE
	db 2, 2, SHOCK_WAVE
	db 2, 3, COUNTER
	db 2, 4, MEGA_DRAIN
	db 3, 2, COUNTER
	db 3, 3, MEGA_DRAIN
	db 3, 4, SHOCK_WAVE
	db 0

	db SUPER_NERD, 5
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 0

	db SUPER_NERD, 9
	db 1, 2, EMBER
	db 2, 2, EMBER
	db 3, 2, EMBER
	db 3, 3, FLAMETHROWER
	db 0

	db SUPER_NERD, 10
	db 1, 2, STRENGTH
	db 1, 4, FLAMETHROWER
	db 2, 2, TACKLE
	db 3, 1, EMBER
	db 3, 3, FLAMETHROWER
	db 4, 1, BITE
	db 4, 3, FLAMETHROWER
	db 4, 4, CRUNCH
	db 0

	db SUPER_NERD, 11
	db 1, 2, EMBER
	db 1, 3, FLAMETHROWER
	db 0

	db SUPER_NERD, 12
	db 1, 1, BITE
	db 1, 3, FLAMETHROWER
	db 1, 4, CRUNCH
	db 2, 2, EMBER
	db 0

	db HIKER, 1
	db 1, 2, COUNTER
	db 1, 3, SEISMIC_TOSS
	db 1, 4, DOUBLE_TEAM
	db 2, 2, COUNTER
	db 2, 3, SEISMIC_TOSS
	db 2, 4, DOUBLE_TEAM
	db 3, 3, COUNTER
	db 3, 4, DOUBLE_TEAM
	db 0

	db HIKER, 2
	db 1, 2, COUNTER
	db 1, 3, SEISMIC_TOSS
	db 1, 4, DOUBLE_TEAM
	db 2, 3, COUNTER
	db 2, 4, SEISMIC_TOSS
	db 0

	db HIKER, 3
	db 1, 3, COUNTER
	db 1, 4, SEISMIC_TOSS
	db 2, 3, COUNTER
	db 2, 4, SEISMIC_TOSS
	db 3, 2, COUNTER
	db 3, 3, SEISMIC_TOSS
	db 3, 4, DOUBLE_TEAM
	db 4, 3, COUNTER
	db 4, 4, SEISMIC_TOSS
	db 0

	db HIKER, 4
	db 1, 4, ROCK_SLIDE
	db 0

	db HIKER, 5
	db 1, 2, ROCK_SLIDE
	db 1, 4, COUNTER
	db 0

	db HIKER, 6
	db 1, 2, COUNTER
	db 1, 4, ROCK_SLIDE
	db 2, 3, ROCK_SLIDE
	db 2, 4, COUNTER
	db 3, 2, COUNTER
	db 3, 4, ROCK_SLIDE
	db 0

	db HIKER, 7
	db 1, 2, ROCK_SLIDE
	db 1, 4, COUNTER
	db 0

	db HIKER, 8
	db 2, 2, COUNTER
	db 2, 4, ROCK_SLIDE
	db 0

	db HIKER, 9
	db 1, 2, ROCK_SLIDE
	db 1, 4, COUNTER
	db 2, 2, ROCK_SLIDE
	db 2, 4, COUNTER
	db 3, 2, ROCK_SLIDE
	db 3, 4, COUNTER
	db 0

	db HIKER, 10
	db 1, 2, ROCK_SLIDE
	db 1, 4, COUNTER
	db 0

	db HIKER, 11
	db 1, 3, ROCK_SLIDE
	db 1, 4, COUNTER
	db 0

	db HIKER, 12
	db 1, 2, COUNTER
	db 1, 4, ROCK_SLIDE
	db 2, 2, ROCK_SLIDE
	db 2, 3, COUNTER
	db 2, 4, SEISMIC_TOSS
	db 3, 2, COUNTER
	db 3, 4, ROCK_SLIDE
	db 4, 2, COUNTER
	db 4, 4, ROCK_SLIDE
	db 0

	db HIKER, 13
	db 3, 2, COUNTER
	db 3, 4, ROCK_SLIDE
	db 0

	db HIKER, 14
	db 1, 2, ROCK_SLIDE
	db 1, 4, COUNTER
	db 2, 2, ROCK_SLIDE
	db 2, 4, COUNTER
	db 0

	db BIKER, 1
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 0

	db BIKER, 2
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 2, COUNTER
	db 2, 3, MEGA_DRAIN
	db 2, 4, SHOCK_WAVE
	db 0

	db BIKER, 3
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 4, 3, SHOCK_WAVE
	db 4, 4, COUNTER
	db 5, 2, COUNTER
	db 5, 3, MEGA_DRAIN
	db 5, 4, SHOCK_WAVE
	db 0

	db BIKER, 4
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 2, COUNTER
	db 2, 3, MEGA_DRAIN
	db 2, 4, SHOCK_WAVE
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 0

	db BIKER, 5
	db 1, 2, COUNTER
	db 1, 3, MEGA_DRAIN
	db 1, 4, SHOCK_WAVE
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 0

	db BIKER, 6
	db 1, 3, SLUDGE_BOMB
	db 1, 4, THUNDERBOLT
	db 0

	db BIKER, 7
	db 1, 2, COUNTER
	db 1, 3, MEGA_DRAIN
	db 1, 4, SHOCK_WAVE
	db 2, 2, COUNTER
	db 2, 3, MEGA_DRAIN
	db 2, 4, SHOCK_WAVE
	db 3, 2, COUNTER
	db 3, 3, MEGA_DRAIN
	db 3, 4, SHOCK_WAVE
	db 4, 2, COUNTER
	db 4, 3, MEGA_DRAIN
	db 4, 4, SHOCK_WAVE
	db 0

	db BIKER, 8
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 0

	db BIKER, 9
	db 1, 2, SLUDGE_BOMB
	db 1, 3, STRENGTH
	db 1, 4, HYPER_VOICE
	db 0

	db BIKER, 10
	db 1, 3, TACKLE
	db 1, 4, THUNDER_WAVE
	db 2, 3, TACKLE
	db 2, 4, THUNDER_WAVE
	db 0

	db BIKER, 11
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 2, SHOCK_WAVE
	db 2, 3, COUNTER
	db 2, 4, MEGA_DRAIN
	db 0

	db BIKER, 12
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 4, 3, SHOCK_WAVE
	db 4, 4, COUNTER
	db 5, 3, SHOCK_WAVE
	db 5, 4, COUNTER
	db 0

	db BIKER, 13
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 3, 2, COUNTER
	db 3, 3, MEGA_DRAIN
	db 3, 4, SHOCK_WAVE
	db 4, 3, SHOCK_WAVE
	db 4, 4, COUNTER
	db 0

	db BIKER, 14
	db 1, 2, COUNTER
	db 1, 3, MEGA_DRAIN
	db 1, 4, SHOCK_WAVE
	db 2, 2, COUNTER
	db 2, 3, MEGA_DRAIN
	db 2, 4, SHOCK_WAVE
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 0

	db BIKER, 15
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 2, SHOCK_WAVE
	db 2, 3, COUNTER
	db 2, 4, MEGA_DRAIN
	db 0

	db BURGLAR, 4
	db 1, 1, BITE
	db 1, 3, FLAMETHROWER
	db 1, 4, CRUNCH
	db 2, 2, EMBER
	db 3, 2, EMBER
	db 3, 3, FLAMETHROWER
	db 0

	db BURGLAR, 5
	db 1, 1, EMBER
	db 1, 3, FLAMETHROWER
	db 0

	db BURGLAR, 6
	db 1, 2, EMBER
	db 2, 1, BITE
	db 2, 3, FLAMETHROWER
	db 2, 4, CRUNCH
	db 0

	db BURGLAR, 7
	db 1, 2, TACKLE
	db 2, 1, EMBER
	db 2, 2, TACKLE
	db 0

	db BURGLAR, 8
	db 1, 1, QUICK_ATTACK
	db 1, 2, EMBER
	db 0

	db BURGLAR, 9
	db 1, 1, BITE
	db 1, 3, FLAMETHROWER
	db 1, 4, CRUNCH
	db 2, 2, STRENGTH
	db 2, 4, FLAMETHROWER
	db 0

	db ENGINEER, 2
	db 1, 3, SHOCK_WAVE
	db 1, 4, THUNDER_WAVE
	db 0

	db ENGINEER, 3
	db 1, 2, SHOCK_WAVE
	db 1, 3, SWIFT
	db 1, 4, THUNDER_WAVE
	db 2, 2, SHOCK_WAVE
	db 2, 3, SWIFT
	db 2, 4, THUNDER_WAVE
	db 3, 4, THUNDER_WAVE
	db 0

	db FISHER, 1
	db 1, 2, COUNTER
	db 1, 3, BUBBLEBEAM
	db 1, 4, SWIFT
	db 2, 4, BUBBLEBEAM
	db 3, 2, COUNTER
	db 3, 3, BUBBLEBEAM
	db 3, 4, SWIFT
	db 0

	db FISHER, 2
	db 1, 4, BUBBLEBEAM
	db 2, 3, BUBBLEBEAM
	db 2, 4, THUNDER_WAVE
	db 3, 2, SWIFT
	db 3, 3, BUBBLEBEAM
	db 3, 4, TRI_ATTACK
	db 0

	db FISHER, 3
	db 1, 2, SWIFT
	db 1, 4, BUBBLEBEAM
	db 2, 3, COUNTER
	db 2, 4, BUBBLEBEAM
	db 3, 2, SWIFT
	db 3, 4, BUBBLEBEAM
	db 0

	db FISHER, 4
	db 1, 2, ACID
	db 2, 2, BUBBLEBEAM
	db 0

	db FISHER, 5
	db 1, 2, BUBBLEBEAM
	db 0

	db FISHER, 6
	db 1, 3, COUNTER
	db 1, 4, BUBBLEBEAM
	db 2, 2, TRI_ATTACK
	db 2, 4, BUBBLEBEAM
	db 3, 2, SWIFT
	db 3, 4, BUBBLEBEAM
	db 4, 3, SWIFT
	db 4, 4, BUBBLEBEAM
	db 0

	db FISHER, 7
	db 1, 2, PECK
	db 2, 2, BUBBLEBEAM
	db 3, 2, PECK
	db 4, 2, PECK
	db 0

	db FISHER, 8
	db 1, 1, TACKLE
	db 2, 3, AURORA_BEAM
	db 0

	db FISHER, 10
	db 1, 2, PECK
	db 2, 2, SURF
	db 0

	db SWIMMER, 1
	db 1, 2, SWIFT
	db 1, 3, BUBBLEBEAM
	db 1, 4, COUNTER
	db 2, 2, SWIFT
	db 2, 3, BUBBLEBEAM
	db 2, 4, TRI_ATTACK
	db 0

	db SWIMMER, 2
	db 1, 2, ACID
	db 2, 1, TACKLE
	db 0

	db SWIMMER, 3
	db 1, 2, BUBBLEBEAM
	db 2, 3, BUBBLEBEAM
	db 2, 4, SWIFT
	db 3, 2, TACKLE
	db 3, 3, THUNDER_WAVE
	db 0

	db SWIMMER, 4
	db 1, 4, BUBBLEBEAM
	db 0

	db SWIMMER, 5
	db 1, 3, BUBBLEBEAM
	db 1, 4, SWIFT
	db 2, 2, ACID
	db 3, 2, ACID
	db 4, 2, BUBBLEBEAM
	db 0

	db SWIMMER, 6
	db 1, 2, BUBBLEBEAM
	db 2, 2, BUBBLEBEAM
	db 3, 2, PECK
	db 0

	db SWIMMER, 7
	db 1, 3, BUBBLEBEAM
	db 1, 4, SWIFT
	db 2, 3, BUBBLEBEAM
	db 2, 4, SWIFT
	db 0

	db SWIMMER, 8
	db 1, 2, ACID
	db 2, 2, ACID
	db 3, 3, BUBBLEBEAM
	db 3, 4, THUNDER_WAVE
	db 4, 3, BUBBLEBEAM
	db 4, 4, SWIFT
	db 5, 1, ACID
	db 0

	db SWIMMER, 9
	db 1, 1, TACKLE
	db 2, 3, AURORA_BEAM
	db 0

	db SWIMMER, 10
	db 1, 1, WATER_GUN
	db 1, 2, THUNDER_WAVE
	db 0

	db SWIMMER, 11
	db 1, 3, BUBBLEBEAM
	db 1, 4, SWIFT
	db 2, 3, BUBBLEBEAM
	db 2, 4, SWIFT
	db 3, 4, SWIFT
	db 4, 3, BUBBLEBEAM
	db 4, 4, SWIFT
	db 0

	db SWIMMER, 12
	db 1, 4, DRAGON_PULSE
	db 2, 2, ACID
	db 0

	db SWIMMER, 13
	db 1, 1, LIGHT_RAY
	db 1, 2, THUNDER_WAVE
	db 0

	db SWIMMER, 14
	db 1, 1, WATER_GUN
	db 1, 2, THUNDER_WAVE
	db 2, 1, WATER_GUN
	db 2, 4, TACKLE
	db 0

	db SWIMMER, 15
	db 2, 2, ACID
	db 3, 4, DRAGON_PULSE
	db 0

	db CUE_BALL, 1
	db 1, 3, COUNTER
	db 1, 4, ROCK_SLIDE
	db 2, 1, TACKLE
	db 2, 4, ROCK_SLIDE
	db 3, 3, COUNTER
	db 3, 4, ROCK_SLIDE
	db 0

	db CUE_BALL, 2
	db 1, 1, TACKLE
	db 1, 4, ROCK_SLIDE
	db 2, 3, COUNTER
	db 2, 4, ROCK_SLIDE
	db 0

	db CUE_BALL, 3
	db 1, 3, EARTHQUAKE
	db 1, 4, AURA_SPHERE
	db 0

	db CUE_BALL, 4
	db 1, 1, TACKLE
	db 1, 4, ROCK_SLIDE
	db 2, 1, LOW_KICK
	db 2, 3, KARATE_CHOP
	db 0

	db CUE_BALL, 5
	db 1, 3, COUNTER
	db 1, 4, ROCK_SLIDE
	db 2, 3, COUNTER
	db 2, 4, ROCK_SLIDE
	db 0

	db CUE_BALL, 6
	db 1, 3, AURA_SPHERE
	db 1, 4, EARTHQUAKE
	db 0

	db CUE_BALL, 7
	db 1, 2, ROCK_SLIDE
	db 2, 2, ROCK_SLIDE
	db 3, 3, COUNTER
	db 3, 4, ROCK_SLIDE
	db 4, 3, COUNTER
	db 4, 4, ROCK_SLIDE
	db 0

	db CUE_BALL, 8
	db 1, 1, LOW_KICK
	db 1, 3, KARATE_CHOP
	db 2, 3, COUNTER
	db 2, 4, ROCK_SLIDE
	db 0

	db CUE_BALL, 9
	db 1, 2, ACID
	db 2, 2, ACID
	db 3, 2, ACID
	db 0

	db GAMBLER, 1
	db 1, 3, COUNTER
	db 1, 4, BUBBLEBEAM
	db 2, 2, SWIFT
	db 2, 3, BUBBLEBEAM
	db 2, 4, COUNTER
	db 0

	db GAMBLER, 2
	db 1, 1, VINE_WHIP
	db 1, 3, MEGA_DRAIN
	db 2, 2, COUNTER
	db 2, 4, CUT
	db 0

	db GAMBLER, 3
	db 1, 2, THUNDER_WAVE
	db 2, 2, SHOCK_WAVE
	db 2, 3, SWIFT
	db 2, 4, THUNDER_WAVE
	db 0

	db GAMBLER, 4
	db 1, 2, COUNTER
	db 1, 4, SWIFT
	db 2, 2, COUNTER
	db 2, 4, SWIFT
	db 0

	db GAMBLER, 5
	db 1, 3, COUNTER
	db 1, 4, BUBBLEBEAM
	db 2, 3, COUNTER
	db 2, 4, BUBBLEBEAM
	db 3, 4, COUNTER
	db 0

	db GAMBLER, 7
	db 1, 2, SWIFT
	db 1, 4, COUNTER
	db 2, 2, SWIFT
	db 2, 4, COUNTER
	db 0

	db BEAUTY, 1
	db 1, 2, CUT
	db 1, 3, COUNTER
	db 2, 2, VINE_WHIP
	db 2, 4, MEGA_DRAIN
	db 3, 2, CUT
	db 3, 3, COUNTER
	db 4, 2, VINE_WHIP
	db 4, 4, MEGA_DRAIN
	db 0

	db BEAUTY, 2
	db 1, 2, VINE_WHIP
	db 1, 4, MEGA_DRAIN
	db 2, 2, VINE_WHIP
	db 2, 4, MEGA_DRAIN
	db 0

	db BEAUTY, 3
	db 1, 4, MEGA_DRAIN
	db 0

	db BEAUTY, 4
	db 1, 1, TACKLE
	db 1, 4, TRI_ATTACK
	db 2, 2, SWIFT
	db 2, 4, COUNTER
	db 3, 1, TACKLE
	db 3, 4, TRI_ATTACK
	db 0

	db BEAUTY, 5
	db 1, 2, BUBBLEBEAM
	db 1, 4, TRI_ATTACK
	db 2, 1, TACKLE
	db 0

	db BEAUTY, 6
	db 1, 2, PECK
	db 0

	db BEAUTY, 7
	db 1, 1, TACKLE
	db 2, 1, TACKLE
	db 3, 3, AURORA_BEAM
	db 0

	db BEAUTY, 8
	db 2, 2, PECK
	db 0

	db BEAUTY, 9
	db 1, 1, GUST
	db 1, 3, SAND_ATTACK
	db 2, 2, TACKLE
	db 2, 3, BUBBLEBEAM
	db 0

	db BEAUTY, 10
	db 1, 3, TACKLE
	db 2, 1, TACKLE
	db 2, 4, MEGA_DRAIN
	db 0

	db BEAUTY, 12
	db 1, 4, BUBBLEBEAM
	db 2, 2, BUBBLEBEAM
	db 3, 2, PECK
	db 4, 2, BUBBLEBEAM
	db 5, 4, BUBBLEBEAM
	db 0

	db BEAUTY, 13
	db 1, 2, BUBBLEBEAM
	db 2, 2, PECK
	db 0

	db BEAUTY, 14
	db 1, 2, TACKLE
	db 1, 3, THUNDER_WAVE
	db 2, 2, TACKLE
	db 2, 3, THUNDER_WAVE
	db 3, 2, TACKLE
	db 3, 3, THUNDER_WAVE
	db 0

	db BEAUTY, 15
	db 1, 4, SWIFT
	db 2, 3, BUBBLEBEAM
	db 2, 4, SWIFT
	db 3, 4, SWIFT
	db 0

	db PSYCHIC_TR, 1
	db 1, 2, TACKLE
	db 1, 4, KINESIS
	db 2, 2, PSYCHIC_M
	db 2, 4, THUNDER_WAVE
	db 3, 2, CONFUSION
	db 3, 4, THUNDER_WAVE
	db 4, 2, TACKLE
	db 4, 4, KINESIS
	db 0

	db PSYCHIC_TR, 2
	db 1, 2, CONFUSION
	db 1, 4, THUNDER_WAVE
	db 2, 2, TACKLE
	db 2, 4, KINESIS
	db 0

	db PSYCHIC_TR, 3
	db 1, 1, CONFUSION
	db 1, 3, THUNDER_WAVE
	db 2, 1, CONFUSION
	db 2, 3, THUNDER_WAVE
	db 3, 1, CONFUSION
	db 3, 3, THUNDER_WAVE
	db 0

	db PSYCHIC_TR, 4
	db 1, 2, CONFUSION
	db 1, 4, THUNDER_WAVE
	db 0

	db ROCKER, 1
	db 1, 2, THUNDER_WAVE
	db 2, 2, THUNDER_WAVE
	db 3, 2, THUNDER_WAVE
	db 0

	db ROCKER, 2
	db 1, 3, TACKLE
	db 1, 4, THUNDER_WAVE
	db 2, 2, SONICBOOM
	db 2, 4, THUNDER_WAVE
	db 0

	db JUGGLER, 1
	db 1, 1, TACKLE
	db 1, 3, KINESIS
	db 2, 2, SHOCK_WAVE
	db 2, 4, THUNDER_WAVE
	db 0

	db JUGGLER, 2
	db 1, 2, CONFUSION
	db 1, 4, HYPNOSIS
	db 2, 3, HYPNOSIS
	db 3, 1, TACKLE
	db 3, 3, KINESIS
	db 4, 1, TACKLE
	db 4, 3, KINESIS
	db 0

	db JUGGLER, 3
	db 1, 1, TACKLE
	db 1, 4, HYPNOSIS
	db 2, 1, TACKLE
	db 2, 4, HYPNOSIS
	db 3, 2, TACKLE
	db 3, 4, KINESIS
	db 4, 1, TACKLE
	db 4, 4, HYPNOSIS
	db 0

	db JUGGLER, 4
	db 1, 3, HYPNOSIS
	db 2, 4, CONFUSION
	db 0

	db JUGGLER, 5
	db 1, 2, PSYBEAM
	db 1, 3, CONFUSION
	db 1, 4, THUNDER_WAVE
	db 0

	db JUGGLER, 7
	db 1, 3, HYPNOSIS
	db 0

	db JUGGLER, 8
	db 1, 3, HYPNOSIS
	db 2, 2, TACKLE
	db 2, 4, KINESIS
	db 0

	db TAMER, 1
	db 2, 1, POISON_STING
	db 0

	db TAMER, 2
	db 1, 1, POISON_STING
	db 3, 1, POISON_STING
	db 0

	db TAMER, 3
	db 1, 3, STONE_EDGE
	db 1, 4, EARTHQUAKE
	db 0

	db TAMER, 4
	db 1, 4, POISON_STING
	db 2, 3, EARTHQUAKE
	db 2, 4, STRENGTH
	db 0

	db TAMER, 5
	db 1, 1, BITE
	db 1, 3, SCREECH
	db 2, 1, TACKLE
	db 0

	db BIRD_KEEPER, 1
	db 1, 3, SAND_ATTACK
	db 2, 1, GUST
	db 2, 3, SAND_ATTACK
	db 0

	db BIRD_KEEPER, 2
	db 1, 1, PECK
	db 1, 2, TRI_ATTACK
	db 1, 4, PAY_DAY
	db 2, 4, GUST
	db 3, 4, GUST
	db 4, 1, PECK
	db 4, 2, TRI_ATTACK
	db 4, 4, PAY_DAY
	db 5, 1, PECK
	db 5, 2, TRI_ATTACK
	db 5, 4, PAY_DAY
	db 0

	db BIRD_KEEPER, 3
	db 1, 4, GUST
	db 2, 1, GUST
	db 2, 3, SAND_ATTACK
	db 3, 1, PECK
	db 3, 2, TRI_ATTACK
	db 3, 4, PAY_DAY
	db 4, 1, PECK
	db 4, 4, TRI_ATTACK
	db 0

	db BIRD_KEEPER, 4
	db 1, 4, PECK
	db 0

	db BIRD_KEEPER, 5
	db 1, 1, PECK
	db 1, 3, TRI_ATTACK
	db 1, 4, PAY_DAY
	db 2, 1, PECK
	db 2, 4, TRI_ATTACK
	db 0

	db BIRD_KEEPER, 6
	db 1, 1, GUST
	db 1, 3, SAND_ATTACK
	db 2, 1, PECK
	db 3, 2, PAY_DAY
	db 3, 4, TRI_ATTACK
	db 4, 4, GUST
	db 0

	db BIRD_KEEPER, 7
	db 1, 3, PAY_DAY
	db 1, 4, TRI_ATTACK
	db 2, 2, PAY_DAY
	db 2, 4, TRI_ATTACK
	db 3, 2, PAY_DAY
	db 3, 4, TRI_ATTACK
	db 0

	db BIRD_KEEPER, 8
	db 1, 1, PECK
	db 1, 3, TRI_ATTACK
	db 1, 4, PAY_DAY
	db 2, 1, PECK
	db 2, 4, TRI_ATTACK
	db 0

	db BIRD_KEEPER, 9
	db 1, 3, STRENGTH
	db 0

	db BIRD_KEEPER, 10
	db 1, 1, PECK
	db 1, 2, TRI_ATTACK
	db 1, 4, PAY_DAY
	db 2, 1, PECK
	db 2, 2, TRI_ATTACK
	db 2, 4, PAY_DAY
	db 3, 1, PECK
	db 3, 4, TRI_ATTACK
	db 4, 1, PECK
	db 4, 2, TRI_ATTACK
	db 4, 4, PAY_DAY
	db 0

	db BIRD_KEEPER, 11
	db 1, 3, PECK
	db 2, 3, PECK
	db 3, 1, GUST
	db 3, 3, SAND_ATTACK
	db 0

	db BIRD_KEEPER, 14
	db 1, 3, SAND_ATTACK
	db 2, 2, PAY_DAY
	db 2, 4, TRI_ATTACK
	db 3, 1, GUST
	db 3, 3, SAND_ATTACK
	db 0

	db BIRD_KEEPER, 15
	db 1, 4, GUST
	db 2, 1, PECK
	db 2, 2, TRI_ATTACK
	db 2, 4, PAY_DAY
	db 3, 4, GUST
	db 4, 1, PECK
	db 4, 4, TRI_ATTACK
	db 0

	db BIRD_KEEPER, 16
	db 1, 1, GUST
	db 1, 3, SAND_ATTACK
	db 2, 1, PECK
	db 2, 4, TRI_ATTACK
	db 0

	db BIRD_KEEPER, 17
	db 1, 1, PECK
	db 1, 2, TRI_ATTACK
	db 1, 4, PAY_DAY
	db 2, 2, PAY_DAY
	db 2, 4, TRI_ATTACK
	db 3, 1, PECK
	db 3, 4, TRI_ATTACK
	db 0

	db BLACKBELT, 1
	db 1, 3, STONE_EDGE
	db 1, 4, AURA_SPHERE
	db 0

	db BLACKBELT, 2
	db 1, 1, TACKLE
	db 1, 4, AURA_SPHERE
	db 2, 1, TACKLE
	db 2, 4, AURA_SPHERE
	db 3, 1, LOW_KICK
	db 3, 3, KARATE_CHOP
	db 0

	db BLACKBELT, 3
	db 1, 3, EARTHQUAKE
	db 1, 4, AURA_SPHERE
	db 2, 3, AURA_SPHERE
	db 2, 4, EARTHQUAKE
	db 0

	db BLACKBELT, 4
	db 1, 1, LOW_KICK
	db 1, 3, KARATE_CHOP
	db 0

	db BLACKBELT, 5
	db 1, 3, AURA_SPHERE
	db 1, 4, EARTHQUAKE
	db 2, 1, TACKLE
	db 2, 4, AURA_SPHERE
	db 3, 1, LOW_KICK
	db 3, 3, KARATE_CHOP
	db 0

	db BLACKBELT, 6
	db 1, 2, EARTHQUAKE
	db 1, 3, KARATE_CHOP
	db 2, 3, EARTHQUAKE
	db 2, 4, AURA_SPHERE
	db 0

	db BLACKBELT, 7
	db 1, 3, EARTHQUAKE
	db 1, 4, AURA_SPHERE
	db 0

	db BLACKBELT, 8
	db 1, 3, EARTHQUAKE
	db 1, 4, AURA_SPHERE
	db 2, 3, EARTHQUAKE
	db 2, 4, AURA_SPHERE
	db 3, 3, EARTHQUAKE
	db 3, 4, AURA_SPHERE
	db 0

	db BLACKBELT, 9
	db 1, 3, EARTHQUAKE
	db 1, 4, AURA_SPHERE
	db 2, 2, EARTHQUAKE
	db 2, 3, KARATE_CHOP
	db 3, 3, EARTHQUAKE
	db 3, 4, AURA_SPHERE
	db 0

	db SCIENTIST, 2
	db 1, 2, COUNTER
	db 1, 3, MEGA_DRAIN
	db 1, 4, SHOCK_WAVE
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 4, 3, SHOCK_WAVE
	db 4, 4, COUNTER
	db 0

	db SCIENTIST, 3
	db 1, 1, THUNDER_WAVE
	db 2, 1, TACKLE
	db 2, 4, THUNDER_WAVE
	db 3, 2, THUNDER_WAVE
	db 0

	db SCIENTIST, 4
	db 1, 2, SONICBOOM
	db 1, 4, THUNDER_WAVE
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 0

	db SCIENTIST, 5
	db 1, 2, SONICBOOM
	db 1, 4, THUNDER_WAVE
	db 0

	db SCIENTIST, 6
	db 1, 2, THUNDER_WAVE
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 4, 4, THUNDER_WAVE
	db 0

	db SCIENTIST, 7
	db 1, 1, TACKLE
	db 1, 4, THUNDER_WAVE
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 3, 2, THUNDER_WAVE
	db 4, 4, THUNDER_WAVE
	db 5, 3, SHOCK_WAVE
	db 5, 4, COUNTER
	db 0

	db SCIENTIST, 8
	db 1, 2, SONICBOOM
	db 1, 4, THUNDER_WAVE
	db 2, 2, SHOCK_WAVE
	db 2, 3, COUNTER
	db 2, 4, MEGA_DRAIN
	db 0

	db SCIENTIST, 9
	db 1, 2, COUNTER
	db 1, 3, MEGA_DRAIN
	db 1, 4, SHOCK_WAVE
	db 2, 2, SONICBOOM
	db 2, 4, THUNDER_WAVE
	db 0

	db SCIENTIST, 10
	db 1, 1, TACKLE
	db 1, 4, THUNDER_WAVE
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 3, 2, THUNDER_WAVE
	db 0

	db SCIENTIST, 11
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 0

	db SCIENTIST, 12
	db 3, 3, TACKLE
	db 3, 4, THUNDER_WAVE
	db 0

	db SCIENTIST, 13
	db 2, 2, SONICBOOM
	db 2, 4, THUNDER_WAVE
	db 0

	db GIOVANNI, 3
	; Dugtrio
	db 1, 1, EARTHQUAKE
	db 1, 2, ROCK_SLIDE
	db 1, 3, SLASH
	db 1, 4, SAND_ATTACK
	; Marowak
	db 2, 1, EARTHQUAKE
	db 2, 2, STONE_EDGE
	db 2, 3, DOUBLE_EDGE
	db 2, 4, FOCUS_ENERGY
	; Persian
	db 3, 1, BITE
	db 3, 2, SLASH
	db 3, 3, THUNDERBOLT
	db 3, 4, SCREECH
	; Nidoqueen
	db 4, 1, EARTHQUAKE
	db 4, 2, POISON_JAB
	db 4, 3, ICE_BEAM
	db 4, 4, TOXIC
	; Nidoking
	db 5, 1, EARTHQUAKE
	db 5, 2, POISON_JAB
	db 5, 3, ICE_BEAM
	db 5, 4, THUNDERBOLT
	; Rhydon (ace)
	db 6, 1, EARTHQUAKE
	db 6, 2, ROCK_SLIDE
	db 6, 3, FIRE_BLAST
	db 6, 4, LEER
	db 0

; --- Elite Four & Champion ---

	db ROCKET, 1
	db 1, 2, PAY_DAY
	db 1, 4, SHOCK_WAVE
	db 2, 4, MEGA_DRAIN
	db 0

	db ROCKET, 2
	db 1, 3, CUT
	db 1, 4, SWIFT
	db 2, 2, PAY_DAY
	db 2, 4, SHOCK_WAVE
	db 3, 4, MEGA_DRAIN
	db 0

	db ROCKET, 3
	db 1, 4, MEGA_DRAIN
	db 2, 2, COUNTER
	db 2, 4, MEGA_DRAIN
	db 0

	db ROCKET, 5
	db 1, 2, ROCK_SLIDE
	db 1, 3, COUNTER
	db 1, 4, SEISMIC_TOSS
	db 2, 3, TRI_ATTACK
	db 0

	db ROCKET, 6
	db 1, 2, COUNTER
	db 1, 4, MEGA_DRAIN
	db 0

	db ROCKET, 7
	db 1, 3, TRI_ATTACK
	db 0

	db ROCKET, 8
	db 1, 3, TRI_ATTACK
	db 2, 3, ROCK_SLIDE
	db 2, 4, COUNTER
	db 0

	db ROCKET, 9
	db 1, 3, TRI_ATTACK
	db 2, 3, TRI_ATTACK
	db 0

	db ROCKET, 10
	db 1, 2, COUNTER
	db 1, 3, MEGA_DRAIN
	db 1, 4, SHOCK_WAVE
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 0

	db ROCKET, 11
	db 1, 2, TRI_ATTACK
	db 2, 3, TRI_ATTACK
	db 3, 3, TRI_ATTACK
	db 4, 2, TRI_ATTACK
	db 0

	db ROCKET, 12
	db 1, 2, COUNTER
	db 1, 3, MEGA_DRAIN
	db 1, 4, SHOCK_WAVE
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 0

	db ROCKET, 13
	db 2, 3, SHOCK_WAVE
	db 2, 4, COUNTER
	db 3, 2, COUNTER
	db 3, 3, MEGA_DRAIN
	db 3, 4, SHOCK_WAVE
	db 5, 3, TRI_ATTACK
	db 0

	db ROCKET, 14
	db 1, 2, TRI_ATTACK
	db 2, 3, TRI_ATTACK
	db 3, 3, TRI_ATTACK
	db 0

	db ROCKET, 15
	db 1, 3, ROCK_SLIDE
	db 1, 4, COUNTER
	db 2, 3, ROCK_SLIDE
	db 2, 4, COUNTER
	db 0

	db ROCKET, 18
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 2, LEECH_LIFE
	db 0

	db ROCKET, 23
	db 1, 2, TACKLE
	db 1, 4, BUBBLEBEAM
	db 2, 1, POISON_STING
	db 0

	db ROCKET, 24
	db 1, 2, BITE
	db 1, 3, SCREECH
	db 2, 2, LEECH_LIFE
	db 3, 2, LEECH_LIFE
	db 4, 2, TACKLE
	db 5, 2, LEECH_LIFE
	db 0

	db ROCKET, 25
	db 1, 1, QUICK_ATTACK
	db 1, 4, TACKLE
	db 2, 1, CONFUSION
	db 3, 1, QUICK_ATTACK
	db 3, 4, TACKLE
	db 0

	db ROCKET, 26
	db 1, 3, COUNTER
	db 1, 4, ROCK_SLIDE
	db 2, 1, TACKLE
	db 2, 4, HYPNOSIS
	db 0

	db ROCKET, 27
	db 1, 1, TACKLE
	db 2, 1, POISON_STING
	db 3, 2, TACKLE
	db 3, 4, BUBBLEBEAM
	db 0

	db ROCKET, 28
	db 1, 1, POISON_STING
	db 0

	db ROCKET, 29
	db 1, 4, CONFUSION
	db 0

	db ROCKET, 30
	db 1, 3, COUNTER
	db 1, 4, ROCK_SLIDE
	db 2, 3, COUNTER
	db 2, 4, ROCK_SLIDE
	db 0

	db ROCKET, 31
	db 1, 1, POISON_STING
	db 2, 1, POISON_STING
	db 3, 2, BITE
	db 3, 3, SCREECH
	db 0

	db ROCKET, 32
	db 1, 2, TACKLE
	db 2, 2, POISON_STING
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 4, 2, BITE
	db 4, 3, SCREECH
	db 0

	db ROCKET, 33
	db 1, 2, TACKLE
	db 1, 4, BUBBLEBEAM
	db 2, 2, TACKLE
	db 2, 4, BUBBLEBEAM
	db 0

	db ROCKET, 35
	db 1, 2, TACKLE
	db 2, 2, LEECH_LIFE
	db 3, 2, BITE
	db 3, 3, SCREECH
	db 4, 1, TACKLE
	db 4, 4, TRI_ATTACK
	db 0

	db ROCKET, 36
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 2, BITE
	db 2, 3, SCREECH
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 0

	db ROCKET, 37
	db 1, 2, TACKLE
	db 2, 2, COUNTER
	db 2, 3, MEGA_DRAIN
	db 2, 4, SHOCK_WAVE
	db 3, 3, COUNTER
	db 3, 4, ROCK_SLIDE
	db 0

	db ROCKET, 38
	db 1, 2, BITE
	db 1, 3, SCREECH
	db 2, 2, TACKLE
	db 3, 1, CONFUSION
	db 0

	db ROCKET, 39
	db 1, 3, AURA_SPHERE
	db 1, 4, EARTHQUAKE
	db 0

	db ROCKET, 40
	db 1, 1, TACKLE
	db 1, 4, TRI_ATTACK
	db 2, 1, TACKLE
	db 2, 4, TRI_ATTACK
	db 3, 2, LEECH_LIFE
	db 4, 1, TACKLE
	db 4, 4, TRI_ATTACK
	db 5, 1, TACKLE
	db 0

	db ROCKET, 42
	db 1, 2, COUNTER
	db 1, 4, MEGA_DRAIN
	db 2, 2, SHOCK_WAVE
	db 2, 4, PAY_DAY
	db 3, 2, DOUBLE_TEAM
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 0

	db ROCKET, 43
	db 1, 3, SHOCK_WAVE
	db 1, 4, COUNTER
	db 2, 1, TACKLE
	db 3, 1, TACKLE
	db 0

	db ROCKET, 44
	db 1, 1, TACKLE
	db 2, 1, POISON_STING
	db 3, 3, SHOCK_WAVE
	db 3, 4, COUNTER
	db 0

	db ROCKET, 45
	db 1, 3, SLUDGE_BOMB
	db 1, 4, THUNDERBOLT
	db 2, 1, POISON_STING
	db 3, 1, TACKLE
	db 0

	db COOLTRAINER_M, 1
	db 1, 4, HEADBUTT
	db 2, 1, HEADBUTT
	db 0

	db COOLTRAINER_M, 2
	db 1, 2, HYPNOSIS
	db 2, 3, AURORA_BEAM
	db 3, 1, CRUNCH
	db 3, 2, EMBER
	db 0

	db COOLTRAINER_M, 3
	db 1, 2, WATER_GUN
	db 1, 4, SWORDS_DANCE
	db 2, 3, ACID
	db 2, 4, SUPERSONIC
	db 3, 3, WATER_GUN
	db 3, 4, TACKLE
	db 0

	db COOLTRAINER_M, 5
	db 1, 1, VINE_WHIP
	db 2, 3, WATER_GUN
	db 2, 4, TACKLE
	db 3, 1, EMBER
	db 4, 1, EMBER
	db 0

	db COOLTRAINER_M, 9
	db 1, 3, SAND_ATTACK
	db 2, 1, EARTHQUAKE
	db 2, 2, TACKLE
	db 0

	db COOLTRAINER_M, 10
	db 1, 3, STONE_EDGE
	db 1, 4, EARTHQUAKE
	db 0

	db COOLTRAINER_F, 1
	db 1, 1, VINE_WHIP
	db 1, 2, TACKLE
	db 1, 4, MEGA_DRAIN
	db 2, 2, CUT
	db 2, 3, COUNTER
	db 3, 1, TACKLE
	db 3, 4, MEGA_DRAIN
	db 0

	db COOLTRAINER_F, 2
	db 1, 1, VINE_WHIP
	db 1, 2, SLEEP_POWDER
	db 2, 1, VINE_WHIP
	db 2, 2, SLEEP_POWDER
	db 3, 1, RAZOR_LEAF
	db 3, 2, SLEEP_POWDER
	db 0

	db COOLTRAINER_F, 3
	db 1, 1, LEECH_LIFE
	db 2, 1, HEADBUTT
	db 2, 2, AURORA_BEAM
	db 3, 3, HYPER_VOICE
	db 3, 4, TACKLE
	db 0

	db COOLTRAINER_F, 5
	db 1, 1, BITE
	db 1, 3, SCREECH
	db 2, 1, QUICK_ATTACK
	db 2, 2, EMBER
	db 0

	db BRUNO, 1
	; Onix
	db 1, 1, STONE_EDGE
	db 1, 2, EARTHQUAKE
	db 1, 3, IRON_HEAD
	db 1, 4, SCREECH
	; Golem
	db 2, 1, STONE_EDGE
	db 2, 2, EARTHQUAKE
	db 2, 3, FIRE_BLAST
	db 2, 4, DEFENSE_CURL
	; Hitmonlee
	db 3, 1, HI_JUMP_KICK
	db 3, 2, STONE_EDGE
	db 3, 3, DOUBLE_EDGE
	db 3, 4, MEDITATE
	; Hitmonchan
	db 4, 1, HI_JUMP_KICK
	db 4, 2, ICE_PUNCH
	db 4, 3, THUNDERPUNCH
	db 4, 4, AGILITY
	; Poliwrath
	db 5, 1, WATERFALL
	db 5, 2, AURA_SPHERE
	db 5, 3, ICE_BEAM
	db 5, 4, HYPNOSIS
	; Machamp (ace)
	db 6, 1, HI_JUMP_KICK
	db 6, 2, EARTHQUAKE
	db 6, 3, ROCK_SLIDE
	db 6, 4, FOCUS_ENERGY
	db 0

	db BROCK, 1
	; Diglett
	db 1, 1, DIG
	db 1, 2, ROCK_SLIDE
	db 1, 3, DOUBLE_TEAM
	db 1, 4, SUBSTITUTE
	; Geodude
	db 2, 1, ROCK_SLIDE
	db 2, 2, DIG
	db 2, 3, TOXIC
	db 2, 4, DOUBLE_TEAM
	; Sandshrew
	db 3, 1, DIG
	db 3, 2, ROCK_SLIDE
	db 3, 3, SWORDS_DANCE
	db 3, 4, SAND_ATTACK
	; Cubone
	db 4, 1, BONE_CLUB
	db 4, 2, ROCK_SLIDE
	db 4, 3, DIG
	db 4, 4, GROWL
	; Rhyhorn
	db 5, 1, ROCK_SLIDE
	db 5, 2, DIG
	db 5, 3, IRON_TAIL
	db 5, 4, DOUBLE_TEAM
	; Onix (ace)
	db 6, 1, ROCK_SLIDE
	db 6, 2, EARTHQUAKE
	db 6, 3, IRON_TAIL
	db 6, 4, SCREECH
	db 0

	db MISTY, 1
	; Psyduck
	db 1, 1, BUBBLEBEAM
	db 1, 2, ICE_BEAM
	db 1, 3, DIG
	db 1, 4, DOUBLE_TEAM
	; Seel
	db 2, 1, BUBBLEBEAM
	db 2, 2, ICE_BEAM
	db 2, 3, HEADBUTT
	db 2, 4, DOUBLE_TEAM
	; Shellder
	db 3, 1, BUBBLEBEAM
	db 3, 2, ICE_BEAM
	db 3, 3, WITHDRAW
	db 3, 4, SUPERSONIC
	; Staryu
	db 4, 1, BUBBLEBEAM
	db 4, 2, LIGHT_RAY
	db 4, 3, THUNDERBOLT
	db 4, 4, REFLECT
	; Horsea
	db 5, 1, BUBBLEBEAM
	db 5, 2, ICE_BEAM
	db 5, 3, SMOKESCREEN
	db 5, 4, DOUBLE_TEAM
	; Starmie (ace)
	db 6, 1, BUBBLEBEAM
	db 6, 2, PHOTON_BEAM
	db 6, 3, THUNDERBOLT
	db 6, 4, REFLECT
	db 0

	db LT_SURGE, 1
	; Voltorb
	db 1, 1, THUNDERBOLT
	db 1, 2, SCREECH
	db 1, 3, THUNDER_WAVE
	db 1, 4, EXPLOSION
	; Magnemite
	db 2, 1, THUNDERBOLT
	db 2, 2, FLASH_CANNON
	db 2, 3, THUNDER_WAVE
	db 2, 4, LIGHT_SCREEN
	; Electrode
	db 3, 1, THUNDERBOLT
	db 3, 2, SHOCK_WAVE
	db 3, 3, THUNDER_WAVE
	db 3, 4, EXPLOSION
	; Electabuzz
	db 4, 1, THUNDERBOLT
	db 4, 2, IRON_TAIL
	db 4, 3, PSYCHIC_M
	db 4, 4, LEER
	; Magneton
	db 5, 1, THUNDERBOLT
	db 5, 2, FLASH_CANNON
	db 5, 3, THUNDER_WAVE
	db 5, 4, LIGHT_SCREEN
	; Raichu (ace)
	db 6, 1, THUNDERBOLT
	db 6, 2, IRON_TAIL
	db 6, 3, THUNDER_WAVE
	db 6, 4, GROWL
	db 0

	db ERIKA, 1
	; Bellsprout
	db 1, 1, ENERGY_BALL
	db 1, 2, SLUDGE_BOMB
	db 1, 3, SLEEP_POWDER
	db 1, 4, GROWTH
	; Tangela
	db 2, 1, ENERGY_BALL
	db 2, 2, MEGA_DRAIN
	db 2, 3, TOXIC
	db 2, 4, DOUBLE_TEAM
	; Clefairy
	db 3, 1, DAZZLE_GLEAM
	db 3, 2, THUNDERBOLT
	db 3, 3, ICE_BEAM
	db 3, 4, MINIMIZE
	; Weepinbell
	db 4, 1, ENERGY_BALL
	db 4, 2, CROSS_POISON
	db 4, 3, SLEEP_POWDER
	db 4, 4, GROWTH
	; Victreebel
	db 5, 1, ENERGY_BALL
	db 5, 2, SLUDGE_BOMB
	db 5, 3, SLEEP_POWDER
	db 5, 4, SWORDS_DANCE
	; Gloom (ace)
	db 6, 1, ENERGY_BALL
	db 6, 2, SLUDGE_BOMB
	db 6, 3, SLEEP_POWDER
	db 6, 4, SWORDS_DANCE
	db 0

	db KOGA, 1
	; Venonat
	db 1, 1, SLUDGE_BOMB
	db 1, 2, PSYCHIC_M
	db 1, 3, SLEEP_POWDER
	db 1, 4, SUPERSONIC
	; Golbat
	db 2, 1, SLUDGE_BOMB
	db 2, 2, AIR_SLASH
	db 2, 3, SCREECH
	db 2, 4, CONFUSE_RAY
	; Weezing
	db 3, 1, SLUDGE_BOMB
	db 3, 2, HYPER_VOICE
	db 3, 3, THUNDERBOLT
	db 3, 4, SMOKESCREEN
	; Muk
	db 4, 1, SLUDGE_BOMB
	db 4, 2, HYPER_VOICE
	db 4, 3, THUNDERBOLT
	db 4, 4, MINIMIZE
	; Arbok
	db 5, 1, SLUDGE_BOMB
	db 5, 2, CRUNCH
	db 5, 3, EARTHQUAKE
	db 5, 4, SCREECH
	; Venomoth (ace)
	db 6, 1, BUG_BUZZ
	db 6, 2, SLUDGE_BOMB
	db 6, 3, PSYCHIC_M
	db 6, 4, SLEEP_POWDER
	db 0

	db BLAINE, 1
	; Ponyta
	db 1, 1, FLAMETHROWER
	db 1, 2, FLAME_BURST
	db 1, 3, DOUBLE_EDGE
	db 1, 4, GROWL
	; Ninetales
	db 2, 1, FLAMETHROWER
	db 2, 2, DAZZLE_GLEAM
	db 2, 3, DIG
	db 2, 4, REFLECT
	; Magmar
	db 3, 1, FLAMETHROWER
	db 3, 2, FIRE_PUNCH
	db 3, 3, PSYCHIC_M
	db 3, 4, LEER
	; Rapidash
	db 4, 1, FLAMETHROWER
	db 4, 2, DOUBLE_EDGE
	db 4, 3, DAZZLE_GLEAM
	db 4, 4, REFLECT
	; Rhydon
	db 5, 1, ROCK_SLIDE
	db 5, 2, EARTHQUAKE
	db 5, 3, IRON_TAIL
	db 5, 4, LEER
	; Arcanine (ace)
	db 6, 1, FLAMETHROWER
	db 6, 2, CRUNCH
	db 6, 3, DRAGON_PULSE
	db 6, 4, REFLECT
	db 0

	db SABRINA, 1
	; Slowbro
	db 1, 1, PSYCHIC_M
	db 1, 2, SURF
	db 1, 3, ICE_BEAM
	db 1, 4, AMNESIA
	; Hypno
	db 2, 1, PSYCHIC_M
	db 2, 2, SHADOW_BALL
	db 2, 3, DAZZLE_GLEAM
	db 2, 4, HYPNOSIS
	; Kadabra
	db 3, 1, PSYCHIC_M
	db 3, 2, DAZZLE_GLEAM
	db 3, 3, SHADOW_BALL
	db 3, 4, REFLECT
	; Jynx
	db 4, 1, ICE_BEAM
	db 4, 2, PSYCHIC_M
	db 4, 3, DAZZLE_GLEAM
	db 4, 4, LOVELY_KISS
	; Mr. Mime
	db 5, 1, PSYCHIC_M
	db 5, 2, DAZZLE_GLEAM
	db 5, 3, THUNDERBOLT
	db 5, 4, BARRIER
	; Alakazam (ace)
	db 6, 1, PSYCHIC_M
	db 6, 2, DAZZLE_GLEAM
	db 6, 3, SHADOW_BALL
	db 6, 4, REFLECT
	db 0

	db GENTLEMAN, 1
	db 1, 2, COUNTER
	db 1, 4, SWIFT
	db 2, 2, COUNTER
	db 2, 4, SWIFT
	db 0

	db GENTLEMAN, 2
	db 1, 1, TACKLE
	db 2, 2, SHOCK_WAVE
	db 0

	db GENTLEMAN, 3
	db 1, 1, TACKLE
	db 1, 4, THUNDER_WAVE
	db 2, 3, SHOCK_WAVE
	db 2, 4, THUNDER_WAVE
	db 0

	db GENTLEMAN, 5
	db 1, 3, SWIFT
	db 1, 4, COUNTER
	db 2, 2, SWIFT
	db 2, 3, COUNTER
	db 2, 4, DOUBLE_TEAM
	db 0

	db LORELEI, 1
	; Cloyster
	db 1, 1, ICE_BEAM
	db 1, 2, RAZOR_SHELL
	db 1, 3, WITHDRAW
	db 1, 4, SUPERSONIC
	; Dewgong
	db 2, 1, ICE_BEAM
	db 2, 2, SURF
	db 2, 3, ICY_WIND
	db 2, 4, GROWL
	; Slowbro
	db 3, 1, SURF
	db 3, 2, ICE_BEAM
	db 3, 3, PSYCHIC_M
	db 3, 4, AMNESIA
	; Starmie
	db 4, 1, SURF
	db 4, 2, ICE_BEAM
	db 4, 3, THUNDERBOLT
	db 4, 4, REFLECT
	; Jynx
	db 5, 1, BLIZZARD
	db 5, 2, PSYCHIC_M
	db 5, 3, LOVELY_KISS
	db 5, 4, ICY_WIND
	; Lapras (ace)
	db 6, 1, ICE_BEAM
	db 6, 2, SURF
	db 6, 3, THUNDERBOLT
	db 6, 4, SING
	db 0

	db CHANNELER, 5
	db 1, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 6
	db 1, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 8
	db 1, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 9
	db 1, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 10
	db 1, 4, MEGA_DRAIN
	db 2, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 12
	db 1, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 14
	db 1, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 16
	db 1, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 17
	db 1, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 18
	db 1, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 19
	db 1, 4, MEGA_DRAIN
	db 2, 4, MEGA_DRAIN
	db 3, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 20
	db 1, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 21
	db 1, 4, MEGA_DRAIN
	db 0

	db CHANNELER, 22
	db 1, 3, SLUDGE_BOMB
	db 2, 2, LICK
	db 0

	db CHANNELER, 24
	db 1, 3, SLUDGE_BOMB
	db 2, 3, SLUDGE_BOMB
	db 3, 2, LICK
	db 0

	db AGATHA, 1
	; Haunter
	db 1, 1, SHADOW_BALL
	db 1, 2, SLUDGE_BOMB
	db 1, 3, DARK_PULSE
	db 1, 4, HYPNOSIS
	; Golbat
	db 2, 1, SLUDGE_BOMB
	db 2, 2, AIR_SLASH
	db 2, 3, BITE
	db 2, 4, CONFUSE_RAY
	; Weezing
	db 3, 1, SLUDGE_BOMB
	db 3, 2, THUNDERBOLT
	db 3, 3, FIRE_BLAST
	db 3, 4, SMOKESCREEN
	; Muk
	db 4, 1, SLUDGE_BOMB
	db 4, 2, THUNDERBOLT
	db 4, 3, FIRE_BLAST
	db 4, 4, MINIMIZE
	; Arbok
	db 5, 1, POISON_JAB
	db 5, 2, CRUNCH
	db 5, 3, EARTHQUAKE
	db 5, 4, SCREECH
	; Gengar (ace)
	db 6, 1, SHADOW_BALL
	db 6, 2, SLUDGE_BOMB
	db 6, 3, DARK_PULSE
	db 6, 4, HYPNOSIS
	db 0

	db LANCE, 1
	; Dragonair
	db 1, 1, DRAGON_PULSE
	db 1, 2, ICE_BEAM
	db 1, 3, THUNDERBOLT
	db 1, 4, THUNDER_WAVE
	; Pidgeot
	db 2, 1, AIR_SLASH
	db 2, 2, DOUBLE_EDGE
	db 2, 3, AGILITY
	db 2, 4, SAND_ATTACK
	; Gyarados
	db 3, 1, HYDRO_PUMP
	db 3, 2, WING_ATTACK
	db 3, 3, CRUNCH
	db 3, 4, LEER
	; Charizard
	db 4, 1, FLAMETHROWER
	db 4, 2, AIR_SLASH
	db 4, 3, EARTHQUAKE
	db 4, 4, SWORDS_DANCE
	; Aerodactyl
	db 5, 1, STONE_EDGE
	db 5, 2, WING_ATTACK
	db 5, 3, CRUNCH
	db 5, 4, AGILITY
	; Dragonite (ace)
	db 6, 1, OUTRAGE
	db 6, 2, AIR_SLASH
	db 6, 3, ICE_BEAM
	db 6, 4, THUNDER_WAVE
	db 0

	db RIVAL3, 1 ; Jolteon branch
	; Sandslash
	db 1, 1, EARTHQUAKE
	db 1, 2, ROCK_SLIDE
	db 1, 3, IRON_TAIL
	db 1, 4, SWORDS_DANCE
	; Alakazam
	db 2, 1, PSYCHIC_M
	db 2, 2, DAZZLE_GLEAM
	db 2, 3, SHADOW_BALL
	db 2, 4, REFLECT
	; Exeggutor
	db 3, 1, ENERGY_BALL
	db 3, 2, PSYCHIC_M
	db 3, 3, HYPNOSIS
	db 3, 4, EXPLOSION
	; Cloyster
	db 4, 1, ICE_BEAM
	db 4, 2, RAZOR_SHELL
	db 4, 3, WITHDRAW
	db 4, 4, SUPERSONIC
	; Ninetales
	db 5, 1, FLAMETHROWER
	db 5, 2, FIRE_BLAST
	db 5, 3, DAZZLE_GLEAM
	db 5, 4, REFLECT
	; Jolteon (ace)
	db 6, 1, THUNDERBOLT
	db 6, 2, LOW_KICK
	db 6, 3, THUNDER_WAVE
	db 6, 4, AGILITY
	db 0

	db RIVAL3, 2 ; Flareon branch
	; Sandslash
	db 1, 1, EARTHQUAKE
	db 1, 2, ROCK_SLIDE
	db 1, 3, IRON_TAIL
	db 1, 4, SWORDS_DANCE
	; Alakazam
	db 2, 1, PSYCHIC_M
	db 2, 2, DAZZLE_GLEAM
	db 2, 3, SHADOW_BALL
	db 2, 4, REFLECT
	; Exeggutor
	db 3, 1, ENERGY_BALL
	db 3, 2, PSYCHIC_M
	db 3, 3, HYPNOSIS
	db 3, 4, EXPLOSION
	; Magneton
	db 4, 1, THUNDERBOLT
	db 4, 2, FLASH_CANNON
	db 4, 3, THUNDER_WAVE
	db 4, 4, LIGHT_SCREEN
	; Cloyster
	db 5, 1, ICE_BEAM
	db 5, 2, RAZOR_SHELL
	db 5, 3, WITHDRAW
	db 5, 4, SUPERSONIC
	; Flareon (ace)
	db 6, 1, FLAMETHROWER
	db 6, 2, BITE
	db 6, 3, SLUDGE
	db 6, 4, LEER
	db 0

	db RIVAL3, 3 ; Vaporeon branch
	; Sandslash
	db 1, 1, EARTHQUAKE
	db 1, 2, ROCK_SLIDE
	db 1, 3, IRON_TAIL
	db 1, 4, SWORDS_DANCE
	; Alakazam
	db 2, 1, PSYCHIC_M
	db 2, 2, DAZZLE_GLEAM
	db 2, 3, SHADOW_BALL
	db 2, 4, REFLECT
	; Exeggutor
	db 3, 1, ENERGY_BALL
	db 3, 2, PSYCHIC_M
	db 3, 3, HYPNOSIS
	db 3, 4, EXPLOSION
	; Ninetales
	db 4, 1, FLAMETHROWER
	db 4, 2, FIRE_BLAST
	db 4, 3, DAZZLE_GLEAM
	db 4, 4, REFLECT
	; Magneton
	db 5, 1, THUNDERBOLT
	db 5, 2, FLASH_CANNON
	db 5, 3, THUNDER_WAVE
	db 5, 4, LIGHT_SCREEN
	; Vaporeon (ace)
	db 6, 1, SURF
	db 6, 2, ICE_BEAM
	db 6, 3, AURORA_BEAM
	db 6, 4, ACID_ARMOR
	db 0

	db PROF_OAK, 1 ; Oak's Lab, Blastoise branch
	; Tauros
	db 1, 1, DOUBLE_EDGE
	db 1, 2, EARTHQUAKE
	db 1, 3, ICE_BEAM
	db 1, 4, THUNDERBOLT
	; Exeggutor
	db 2, 1, ENERGY_BALL
	db 2, 2, PSYCHIC_M
	db 2, 3, HYPNOSIS
	db 2, 4, REFLECT
	; Arcanine
	db 3, 1, FIRE_BLAST
	db 3, 2, CRUNCH
	db 3, 3, DRAGON_PULSE
	db 3, 4, REFLECT
	; Gyarados
	db 4, 1, HYDRO_PUMP
	db 4, 2, CRUNCH
	db 4, 3, AIR_SLASH
	db 4, 4, ICE_BEAM
	; Nidoking
	db 5, 1, EARTHQUAKE
	db 5, 2, SLUDGE_BOMB
	db 5, 3, ICE_BEAM
	db 5, 4, THUNDERBOLT
	; Blastoise (ace)
	db 6, 1, HYDRO_PUMP
	db 6, 2, ICE_BEAM
	db 6, 3, EARTHQUAKE
	db 6, 4, WITHDRAW
	db 0

	db PROF_OAK, 2 ; Route 22, Venusaur branch
	; Tauros
	db 1, 1, DOUBLE_EDGE
	db 1, 2, EARTHQUAKE
	db 1, 3, ICE_BEAM
	db 1, 4, THUNDERBOLT
	; Exeggutor
	db 2, 1, ENERGY_BALL
	db 2, 2, PSYCHIC_M
	db 2, 3, HYPNOSIS
	db 2, 4, EXPLOSION
	; Arcanine
	db 3, 1, FLAMETHROWER
	db 3, 2, CRUNCH
	db 3, 3, DIG
	db 3, 4, DOUBLE_EDGE
	; Gyarados
	db 4, 1, HYDRO_PUMP
	db 4, 2, CRUNCH
	db 4, 3, ICE_BEAM
	db 4, 4, IRON_TAIL
	; Aerodactyl
	db 5, 1, STONE_EDGE
	db 5, 2, AIR_SLASH
	db 5, 3, CRUNCH
	db 5, 4, AGILITY
	; Venusaur (ace)
	db 6, 1, SOLARBEAM
	db 6, 2, SLUDGE_BOMB
	db 6, 3, EARTH_POWER
	db 6, 4, SLEEP_POWDER
	db 0

	db PROF_OAK, 3 ; Cerulean Cave 1F, Charizard branch
	; Tauros
	db 1, 1, DOUBLE_EDGE
	db 1, 2, EARTHQUAKE
	db 1, 3, ICE_BEAM
	db 1, 4, FIRE_BLAST
	; Exeggutor
	db 2, 1, ENERGY_BALL
	db 2, 2, PSYCHIC_M
	db 2, 3, HYPNOSIS
	db 2, 4, EXPLOSION
	; Arcanine
	db 3, 1, FIRE_BLAST
	db 3, 2, CRUNCH
	db 3, 3, DRAGON_PULSE
	db 3, 4, DOUBLE_EDGE
	; Gyarados
	db 4, 1, HYDRO_PUMP
	db 4, 2, CRUNCH
	db 4, 3, ICE_BEAM
	db 4, 4, AIR_SLASH
	; Snorlax
	db 5, 1, DOUBLE_EDGE
	db 5, 2, EARTHQUAKE
	db 5, 3, ICE_PUNCH
	db 5, 4, AMNESIA
	; Charizard (ace)
	db 6, 1, FIRE_BLAST
	db 6, 2, AIR_SLASH
	db 6, 3, DRAGON_PULSE
	db 6, 4, EARTHQUAKE
	db 0

	db -1 ; end
