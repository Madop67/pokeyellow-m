	db DEX_OMASTAR ; pokedex id

	db  70,  60, 125,  55, 115,  70
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 199 ; base exp

	INCBIN "gfx/pokemon/front/omastar.pic", 0, 1 ; sprite dimensions
	dw OmastarPicFront, OmastarPicBack

	db WATER_GUN, HEADBUTT, WITHDRAW, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SURF,         STRENGTH,     TOXIC,        STONE_EDGE,   DOUBLE_EDGE,  \
	     BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   COUNTER,      \
	     SEISMIC_TOSS, MIMIC,        DOUBLE_TEAM,  REFLECT,      REST,         \
	     ROCK_SLIDE,   SUBSTITUTE
	; end

