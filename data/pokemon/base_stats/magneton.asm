	db DEX_MAGNETON ; pokedex id

	db  50,  60,  95,  70, 120,  70
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, STEEL ; type
	db 60 ; catch rate
	db 161 ; base exp

	INCBIN "gfx/pokemon/front/magneton.pic", 0, 1 ; sprite dimensions
	dw MagnetonPicFront, MagnetonPicBack

	db SONICBOOM, TACKLE, THUNDERSHOCK, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm FLASH,        TOXIC,        DOUBLE_EDGE,  HYPER_VOICE,  HYPER_BEAM,   \
	     COUNTER,      IRON_TAIL,    THUNDERBOLT,  THUNDER,      SHOCK_WAVE,   \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      FLASH_CANNON, PHOTON_BEAM,  \
	     SWIFT,        REST,         THUNDER_WAVE, LIGHT_SCREEN, SUBSTITUTE
	; end

