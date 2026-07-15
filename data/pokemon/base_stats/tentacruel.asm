	db DEX_TENTACRUEL ; pokedex id

	db  80,  70,  65, 100,  80, 120
	;   hp  atk  def  spd  sat  sdf

	db WATER, POISON ; type
	db 60 ; catch rate
	db 205 ; base exp

	INCBIN "gfx/pokemon/front/tentacruel.pic", 0, 1 ; sprite dimensions
	dw TentacruelPicFront, TentacruelPicBack

	db ACID, TACKLE, SUPERSONIC, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm CUT,          SURF,         SLUDGE_BOMB,  SWORDS_DANCE, TOXIC,        \
	     DOUBLE_EDGE,  BUBBLEBEAM,   HYPER_VOICE,  ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   COUNTER,      MEGA_DRAIN,   MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      REST,         SUBSTITUTE
	; end

