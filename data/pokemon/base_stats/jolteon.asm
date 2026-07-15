	db DEX_JOLTEON ; pokedex id

	db  65,  65,  60, 130, 110,  95
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 197 ; base exp

	INCBIN "gfx/pokemon/front/jolteon.pic", 0, 1 ; sprite dimensions
	dw JolteonPicFront, JolteonPicBack

	db TACKLE, THUNDERSHOCK, QUICK_ATTACK, TAIL_WHIP ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        TOXIC,        DOUBLE_EDGE,  HYPER_BEAM,   \
	     COUNTER,      THUNDERBOLT,  THUNDER,      SHOCK_WAVE,   MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      SWIFT,        REST,         THUNDER_WAVE, \
	     LIGHT_SCREEN, SUBSTITUTE
	; end

