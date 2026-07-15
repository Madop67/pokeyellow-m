	db DEX_VENUSAUR ; pokedex id

	db  80,  82,  83,  80, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 208 ; base exp

	INCBIN "gfx/pokemon/front/venusaur.pic", 0, 1 ; sprite dimensions
	dw VenusaurPicFront, VenusaurPicBack

	db TACKLE, VINE_WHIP, GROWL, LEECH_SEED ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm CUT,          STRENGTH,     SLUDGE_BOMB,  SWORDS_DANCE, TOXIC,        \
	     ENERGY_BALL,  DOUBLE_EDGE,  HYPER_BEAM,   COUNTER,      MEGA_DRAIN,   \
	     SOLARBEAM,    MIMIC,        DOUBLE_TEAM,  REFLECT,      REST,         \
	     SUBSTITUTE
	; end

