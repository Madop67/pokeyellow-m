	db DEX_LAPRAS ; pokedex id

	db 130,  85,  80,  60,  85,  95
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE ; type
	db 45 ; catch rate
	db 219 ; base exp

	INCBIN "gfx/pokemon/front/lapras.pic", 0, 1 ; sprite dimensions
	dw LaprasPicFront, LaprasPicBack

	db WATER_GUN, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SURF,         STRENGTH,     TOXIC,        DOUBLE_EDGE,  BUBBLEBEAM,   \
	     HYPER_VOICE,  ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   COUNTER,      \
	     SOLARBEAM,    THUNDERBOLT,  THUNDER,      PSYCHIC_M,    SHOCK_WAVE,   \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      DRAGON_PULSE, REST,         \
	     LIGHT_SCREEN, SUBSTITUTE
	; end

