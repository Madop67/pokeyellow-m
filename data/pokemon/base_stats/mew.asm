	db DEX_MEW ; pokedex id

	db 100, 100, 100, 100, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 45 ; catch rate
	db 64 ; base exp

	INCBIN "gfx/pokemon/front/mew.pic", 0, 1 ; sprite dimensions
	dw MewPicFront, MewPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm CUT,          FLY,          SURF,         STRENGTH,     FLASH,        \
	     SLUDGE_BOMB,  AIR_SLASH,    SWORDS_DANCE, SHADOW_BALL,  DAZZLE_GLEAM, \
	     TOXIC,        STONE_EDGE,   CRUNCH,       ENERGY_BALL,  DOUBLE_EDGE,  \
	     BUBBLEBEAM,   HYPER_VOICE,  ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     PAY_DAY,      AURA_SPHERE,  COUNTER,      SEISMIC_TOSS, FLAMETHROWER, \
	     MEGA_DRAIN,   SOLARBEAM,    IRON_TAIL,    THUNDERBOLT,  THUNDER,      \
	     EARTHQUAKE,   FISSURE,      DIG,          PSYCHIC_M,    SHOCK_WAVE,   \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      DARK_PULSE,   METRONOME,    \
	     FLASH_CANNON, PHOTON_BEAM,  FIRE_BLAST,   SWIFT,        X_SCISSOR,    \
	     SOFTBOILED,   DRAGON_PULSE, BUG_BUZZ,     REST,         THUNDER_WAVE, \
	     LIGHT_SCREEN, EXPLOSION,    ROCK_SLIDE,   TRI_ATTACK,   SUBSTITUTE
	; end

