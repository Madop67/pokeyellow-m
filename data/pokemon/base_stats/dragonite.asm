	db DEX_DRAGONITE ; pokedex id

	db  91, 134,  95,  80, 100, 100
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, FLYING ; type
	db 9 ; catch rate
	db 218 ; base exp

	INCBIN "gfx/pokemon/front/dragonite.pic", 0, 1 ; sprite dimensions
	dw DragonitePicFront, DragonitePicBack

	db TACKLE, AGILITY, LEER, THUNDER_WAVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SURF,         STRENGTH,     AIR_SLASH,    TOXIC,        CRUNCH,       \
	     DOUBLE_EDGE,  BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     COUNTER,      IRON_TAIL,    THUNDERBOLT,  THUNDER,      SHOCK_WAVE,   \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   SWIFT,        \
	     DRAGON_PULSE, REST,         THUNDER_WAVE, LIGHT_SCREEN, SUBSTITUTE
	; end

