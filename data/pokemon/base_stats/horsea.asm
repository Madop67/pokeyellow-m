	db DEX_HORSEA ; pokedex id

	db  30,  40,  70,  60,  70,  25
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 225 ; catch rate
	db 83 ; base exp

	INCBIN "gfx/pokemon/front/horsea.pic", 0, 1 ; sprite dimensions
	dw HorseaPicFront, HorseaPicBack

	db WATER_GUN, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SURF,        TOXIC,       DOUBLE_EDGE, BUBBLEBEAM,  ICE_BEAM,    \
	     BLIZZARD,    COUNTER,     MIMIC,       DOUBLE_TEAM, SWIFT,       \
	     REST,        SUBSTITUTE
	; end

