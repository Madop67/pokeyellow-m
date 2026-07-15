	db DEX_MAGMAR ; pokedex id

	db  65,  95,  57,  93, 100,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 167 ; base exp

	INCBIN "gfx/pokemon/front/magmar.pic", 0, 1 ; sprite dimensions
	dw MagmarPicFront, MagmarPicBack

	db EMBER, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     TOXIC,        DOUBLE_EDGE,  HYPER_BEAM,   COUNTER,      \
	     SEISMIC_TOSS, FLAMETHROWER, PSYCHIC_M,    MIMIC,        DOUBLE_TEAM,  \
	     METRONOME,    FIRE_BLAST,   REST,         SUBSTITUTE
	; end

