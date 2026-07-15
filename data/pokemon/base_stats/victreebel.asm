	db DEX_VICTREEBEL ; pokedex id

	db  80, 105,  65,  70, 100,  70
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 191 ; base exp

	INCBIN "gfx/pokemon/front/victreebel.pic", 0, 1 ; sprite dimensions
	dw VictreebelPicFront, VictreebelPicBack

	db ACID, RAZOR_LEAF, SLEEP_POWDER, STUN_SPORE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm CUT,          STRENGTH,     SLUDGE_BOMB,  SWORDS_DANCE, TOXIC,        \
	     ENERGY_BALL,  DOUBLE_EDGE,  HYPER_BEAM,   COUNTER,      MEGA_DRAIN,   \
	     SOLARBEAM,    MIMIC,        DOUBLE_TEAM,  REFLECT,      REST,         \
	     SUBSTITUTE
	; end

