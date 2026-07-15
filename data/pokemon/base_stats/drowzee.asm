	db DEX_DROWZEE ; pokedex id

	db  60,  48,  45,  42,  43,  90
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 102 ; base exp

	INCBIN "gfx/pokemon/front/drowzee.pic", 0, 1 ; sprite dimensions
	dw DrowzeePicFront, DrowzeePicBack

	db TACKLE, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        SHADOW_BALL,  TOXIC,        DOUBLE_EDGE,  \
	     COUNTER,      SEISMIC_TOSS, PSYCHIC_M,    MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      METRONOME,    REST,         THUNDER_WAVE, LIGHT_SCREEN, \
	     TRI_ATTACK,   SUBSTITUTE
	; end

