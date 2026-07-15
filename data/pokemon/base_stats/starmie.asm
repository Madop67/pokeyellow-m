	db DEX_STARMIE ; pokedex id

	db  60,  75,  85, 115, 100,  85
	;   hp  atk  def  spd  sat  sdf

	db WATER, LIGHT ; type
	db 60 ; catch rate
	db 207 ; base exp

	INCBIN "gfx/pokemon/front/starmie.pic", 0, 1 ; sprite dimensions
	dw StarmiePicFront, StarmiePicBack

	db LIGHT_RAY, TACKLE, WATER_GUN, HARDEN ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SURF,         FLASH,        DAZZLE_GLEAM, TOXIC,        DOUBLE_EDGE,  \
	     BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   COUNTER,      \
	     THUNDERBOLT,  THUNDER,      PSYCHIC_M,    SHOCK_WAVE,   MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      PHOTON_BEAM,  SWIFT,        REST,         \
	     THUNDER_WAVE, LIGHT_SCREEN, TRI_ATTACK,   SUBSTITUTE
	; end

