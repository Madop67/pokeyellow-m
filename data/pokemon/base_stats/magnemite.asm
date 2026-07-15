	db DEX_MAGNEMITE ; pokedex id

	db  25,  35,  70,  45,  95,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL ; type
	db 190 ; catch rate
	db 89 ; base exp

	INCBIN "gfx/pokemon/front/magnemite.pic", 0, 1 ; sprite dimensions
	dw MagnemitePicFront, MagnemitePicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm FLASH,        TOXIC,        DOUBLE_EDGE,  HYPER_VOICE,  COUNTER,      \
	     IRON_TAIL,    THUNDERBOLT,  THUNDER,      SHOCK_WAVE,   MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      FLASH_CANNON, PHOTON_BEAM,  SWIFT,        \
	     REST,         THUNDER_WAVE, LIGHT_SCREEN, SUBSTITUTE
	; end

