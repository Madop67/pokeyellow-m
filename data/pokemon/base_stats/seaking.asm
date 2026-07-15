	db DEX_SEAKING ; pokedex id

	db  80,  92,  65,  68,  65,  80
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 60 ; catch rate
	db 170 ; base exp

	INCBIN "gfx/pokemon/front/seaking.pic", 0, 1 ; sprite dimensions
	dw SeakingPicFront, SeakingPicBack

	db PECK, SUPERSONIC, TAIL_WHIP, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SURF,        TOXIC,       DOUBLE_EDGE, BUBBLEBEAM,  HYPER_VOICE, \
	     ICE_BEAM,    BLIZZARD,    HYPER_BEAM,  COUNTER,     MIMIC,       \
	     DOUBLE_TEAM, SWIFT,       REST,        SUBSTITUTE
	; end

