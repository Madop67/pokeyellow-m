	db DEX_MEWTWO ; pokedex id

	db 106, 110,  90, 130, 154,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 3 ; catch rate
	db 220 ; base exp

	INCBIN "gfx/pokemon/front/mewtwo.pic", 0, 1 ; sprite dimensions
	dw MewtwoPicFront, MewtwoPicBack

	db CONFUSION, PSYCHO_CUT, SWIFT, PSYCHIC_M ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        SHADOW_BALL,  DAZZLE_GLEAM, TOXIC,        \
	     DOUBLE_EDGE,  BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     AURA_SPHERE,  COUNTER,      SEISMIC_TOSS, SOLARBEAM,    THUNDERBOLT,  \
	     THUNDER,      PSYCHIC_M,    SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      DARK_PULSE,   METRONOME,    PHOTON_BEAM,  FIRE_BLAST,   \
	     REST,         THUNDER_WAVE, LIGHT_SCREEN, EXPLOSION,    TRI_ATTACK,   \
	     SUBSTITUTE
	; end

