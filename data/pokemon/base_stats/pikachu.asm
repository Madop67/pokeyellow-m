	db DEX_PIKACHU ; pokedex id

	db  35,  55,  30,  90,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 82 ; base exp

	INCBIN "gfx/pokemon/front/pikachu.pic", 0, 1 ; sprite dimensions
	dw PikachuPicFront, PikachuPicBack

	db THUNDERSHOCK, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        TOXIC,        DOUBLE_EDGE,  PAY_DAY,      \
	     COUNTER,      SEISMIC_TOSS, IRON_TAIL,    THUNDERBOLT,  THUNDER,      \
	     SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  REFLECT,      SWIFT,        \
	     REST,         THUNDER_WAVE, SUBSTITUTE
	; end

