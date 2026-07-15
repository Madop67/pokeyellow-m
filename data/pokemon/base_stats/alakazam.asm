	db DEX_ALAKAZAM ; pokedex id

	db  55,  50,  45, 120, 135,  95
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 50 ; catch rate
	db 186 ; base exp

	INCBIN "gfx/pokemon/front/alakazam.pic", 0, 1 ; sprite dimensions
	dw AlakazamPicFront, AlakazamPicBack

	db TACKLE, KINESIS, TELEPORT, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        SHADOW_BALL,  DAZZLE_GLEAM, TOXIC,        \
	     DOUBLE_EDGE,  HYPER_BEAM,   COUNTER,      SEISMIC_TOSS, DIG,          \
	     PSYCHIC_M,    MIMIC,        DOUBLE_TEAM,  REFLECT,      METRONOME,    \
	     REST,         THUNDER_WAVE, LIGHT_SCREEN, TRI_ATTACK,   SUBSTITUTE
	; end

