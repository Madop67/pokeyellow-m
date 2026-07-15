	db DEX_POLIWAG ; pokedex id

	db  40,  50,  40,  90,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 255 ; catch rate
	db 77 ; base exp

	INCBIN "gfx/pokemon/front/poliwag.pic", 0, 1 ; sprite dimensions
	dw PoliwagPicFront, PoliwagPicBack

	db WATER_GUN, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SURF,        STRENGTH,    TOXIC,       DOUBLE_EDGE, BUBBLEBEAM,  \
	     ICE_BEAM,    BLIZZARD,    COUNTER,     PSYCHIC_M,   MIMIC,       \
	     DOUBLE_TEAM, REST,        SUBSTITUTE
	; end

