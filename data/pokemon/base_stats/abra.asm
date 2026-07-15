	db DEX_ABRA ; pokedex id

	db  25,  20,  15,  90, 105,  55
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 200 ; catch rate
	db 73 ; base exp

	INCBIN "gfx/pokemon/front/abra.pic", 0, 1 ; sprite dimensions
	dw AbraPicFront, AbraPicBack

	db TELEPORT, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        DAZZLE_GLEAM, TOXIC,        DOUBLE_EDGE,  \
	     COUNTER,      SEISMIC_TOSS, PSYCHIC_M,    MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      METRONOME,    REST,         THUNDER_WAVE, LIGHT_SCREEN, \
	     TRI_ATTACK,   SUBSTITUTE
	; end

