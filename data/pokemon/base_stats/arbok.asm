	db DEX_ARBOK ; pokedex id

	db  60,  85,  69,  80,  65,  79
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 90 ; catch rate
	db 147 ; base exp

	INCBIN "gfx/pokemon/front/arbok.pic", 0, 1 ; sprite dimensions
	dw ArbokPicFront, ArbokPicBack

	db POISON_STING, TACKLE, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    SLUDGE_BOMB, TOXIC,       CRUNCH,      DOUBLE_EDGE, \
	     HYPER_VOICE, HYPER_BEAM,  COUNTER,     MEGA_DRAIN,  EARTHQUAKE,  \
	     FISSURE,     DIG,         MIMIC,       DOUBLE_TEAM, REST,        \
	     ROCK_SLIDE,  SUBSTITUTE
	; end

