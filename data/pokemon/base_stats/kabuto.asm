	db DEX_KABUTO ; pokedex id

	db  30,  80,  90,  55,  55,  45
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 119 ; base exp

	INCBIN "gfx/pokemon/front/kabuto.pic", 0, 1 ; sprite dimensions
	dw KabutoPicFront, KabutoPicBack

	db TACKLE, HARDEN, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SURF,        STRENGTH,    TOXIC,       STONE_EDGE,  DOUBLE_EDGE, \
	     BUBBLEBEAM,  ICE_BEAM,    BLIZZARD,    COUNTER,     MIMIC,       \
	     DOUBLE_TEAM, REFLECT,     REST,        ROCK_SLIDE,  SUBSTITUTE
	; end

