	db DEX_ELECTRODE ; pokedex id

	db  60,  50,  70, 140,  80,  80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 60 ; catch rate
	db 150 ; base exp

	INCBIN "gfx/pokemon/front/electrode.pic", 0, 1 ; sprite dimensions
	dw ElectrodePicFront, ElectrodePicBack

	db SONICBOOM, TACKLE, SCREECH, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm FLASH,        TOXIC,        DOUBLE_EDGE,  HYPER_VOICE,  HYPER_BEAM,   \
	     COUNTER,      THUNDERBOLT,  THUNDER,      SHOCK_WAVE,   MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      SWIFT,        REST,         THUNDER_WAVE, \
	     EXPLOSION,    SUBSTITUTE
	; end

