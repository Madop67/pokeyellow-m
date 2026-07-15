	db DEX_KABUTOPS ; pokedex id

	db  60, 115, 105,  80,  65,  70
	;   hp  atk  def  spd  sat  sdf

	db ROCK, WATER ; type
	db 45 ; catch rate
	db 201 ; base exp

	INCBIN "gfx/pokemon/front/kabutops.pic", 0, 1 ; sprite dimensions
	dw KabutopsPicFront, KabutopsPicBack

	db TACKLE, MEGA_DRAIN, HARDEN, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CUT,          SURF,         STRENGTH,     SWORDS_DANCE, TOXIC,        \
	     STONE_EDGE,   DOUBLE_EDGE,  BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   COUNTER,      SEISMIC_TOSS, MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      REST,         ROCK_SLIDE,   SUBSTITUTE
	; end

