	db DEX_DIGLETT ; pokedex id

	db  10,  55,  25,  95,  35,  45
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 255 ; catch rate
	db 81 ; base exp

	INCBIN "gfx/pokemon/front/diglett.pic", 0, 1 ; sprite dimensions
	dw DiglettPicFront, DiglettPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CUT,         STRENGTH,    TOXIC,       DOUBLE_EDGE, COUNTER,     \
	     EARTHQUAKE,  FISSURE,     DIG,         MIMIC,       DOUBLE_TEAM, \
	     REST,        ROCK_SLIDE,  SUBSTITUTE
	; end

