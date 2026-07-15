	db DEX_EKANS ; pokedex id

	db  35,  60,  44,  55,  40,  54
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 255 ; catch rate
	db 62 ; base exp

	INCBIN "gfx/pokemon/front/ekans.pic", 0, 1 ; sprite dimensions
	dw EkansPicFront, EkansPicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    SLUDGE_BOMB, TOXIC,       CRUNCH,      DOUBLE_EDGE, \
	     HYPER_VOICE, COUNTER,     MEGA_DRAIN,  EARTHQUAKE,  FISSURE,     \
	     DIG,         MIMIC,       DOUBLE_TEAM, REST,        ROCK_SLIDE,  \
	     SUBSTITUTE
	; end

