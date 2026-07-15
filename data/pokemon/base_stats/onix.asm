	db DEX_ONIX ; pokedex id

	db  35,  45, 160,  70,  30,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, GROUND ; type
	db 45 ; catch rate
	db 108 ; base exp

	INCBIN "gfx/pokemon/front/onix.pic", 0, 1 ; sprite dimensions
	dw OnixPicFront, OnixPicBack

	db TACKLE, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    TOXIC,       STONE_EDGE,  DOUBLE_EDGE, HYPER_VOICE, \
	     COUNTER,     IRON_TAIL,   EARTHQUAKE,  FISSURE,     DIG,         \
	     MIMIC,       DOUBLE_TEAM, REST,        EXPLOSION,   ROCK_SLIDE,  \
	     SUBSTITUTE
	; end

