	db DEX_KADABRA ; pokedex id

	db  40,  35,  30, 105, 120,  70
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, PSYCHIC_TYPE ; type
	db 100 ; catch rate
	db 145 ; base exp

	INCBIN "gfx/pokemon/front/kadabra.pic", 0, 1 ; sprite dimensions
	dw KadabraPicFront, KadabraPicBack

	db TACKLE, KINESIS, TELEPORT, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        SHADOW_BALL,  DAZZLE_GLEAM, TOXIC,        \
	     DOUBLE_EDGE,  COUNTER,      SEISMIC_TOSS, DIG,          PSYCHIC_M,    \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      METRONOME,    REST,         \
	     THUNDER_WAVE, LIGHT_SCREEN, TRI_ATTACK,   SUBSTITUTE
	; end

