	db DEX_KINGLER ; pokedex id

	db  55, 130, 115,  75,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db WATER, WATER ; type
	db 60 ; catch rate
	db 206 ; base exp

	INCBIN "gfx/pokemon/front/kingler.pic", 0, 1 ; sprite dimensions
	dw KinglerPicFront, KinglerPicBack

	db WATER_GUN, HEADBUTT, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CUT,          SURF,         STRENGTH,     SWORDS_DANCE, TOXIC,        \
	     DOUBLE_EDGE,  BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     COUNTER,      MIMIC,        DOUBLE_TEAM,  X_SCISSOR,    REST,         \
	     SUBSTITUTE
	; end

