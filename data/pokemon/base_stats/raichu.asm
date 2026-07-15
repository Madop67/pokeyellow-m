	db DEX_RAICHU ; pokedex id

	db  60,  90,  55, 100,  90,  80
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 75 ; catch rate
	db 122 ; base exp

	INCBIN "gfx/pokemon/front/raichu.pic", 0, 1 ; sprite dimensions
	dw RaichuPicFront, RaichuPicBack

	db THUNDERSHOCK, SPARK, GROWL, THUNDER_WAVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        TOXIC,        DOUBLE_EDGE,  HYPER_BEAM,   \
	     PAY_DAY,      COUNTER,      SEISMIC_TOSS, IRON_TAIL,    THUNDERBOLT,  \
	     THUNDER,      SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     SWIFT,        REST,         THUNDER_WAVE, SUBSTITUTE
	; end

