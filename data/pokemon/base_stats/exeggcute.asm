	db DEX_EXEGGCUTE ; pokedex id

	db  60,  40,  80,  40,  60,  45
	;   hp  atk  def  spd  sat  sdf

	db GRASS, PSYCHIC_TYPE ; type
	db 90 ; catch rate
	db 98 ; base exp

	INCBIN "gfx/pokemon/front/exeggcute.pic", 0, 1 ; sprite dimensions
	dw ExeggcutePicFront, ExeggcutePicBack

	db TACKLE, HYPNOSIS, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    TOXIC,       ENERGY_BALL, DOUBLE_EDGE, COUNTER,     \
	     MEGA_DRAIN,  SOLARBEAM,   PSYCHIC_M,   MIMIC,       DOUBLE_TEAM, \
	     REFLECT,     REST,        EXPLOSION,   SUBSTITUTE
	; end

