	db DEX_GYARADOS ; pokedex id

	db  95, 125,  79,  81,  60, 100
	;   hp  atk  def  spd  sat  sdf

	db WATER, FLYING ; type
	db 45 ; catch rate
	db 214 ; base exp

	INCBIN "gfx/pokemon/front/gyarados.pic", 0, 1 ; sprite dimensions
	dw GyaradosPicFront, GyaradosPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SURF,         STRENGTH,     AIR_SLASH,    TOXIC,        CRUNCH,       \
	     DOUBLE_EDGE,  BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     COUNTER,      IRON_TAIL,    THUNDERBOLT,  THUNDER,      SHOCK_WAVE,   \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   DRAGON_PULSE, \
	     REST,         SUBSTITUTE
	; end

