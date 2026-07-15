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
	db BUG_CATCHER, 15
	db 2, 2, TACKLE
	db 2, 3, STRING_SHOT
	db 0

	db YOUNGSTER, 14
	db 1, 4, FISSURE
	db 0

; --- Gym Leaders ---

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

	db -1 ; end
