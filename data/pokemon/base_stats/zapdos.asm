	db DEX_ZAPDOS ; pokedex id

	db  90,  90,  85, 100, 125,  90
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, FLYING ; type
	db 3 ; catch rate
	db 216 ; base exp

	INCBIN "gfx/pokemon/front/zapdos.pic", 0, 1 ; sprite dimensions
	dw ZapdosPicFront, ZapdosPicBack

	db THUNDERSHOCK, DRILL_PECK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm FLY,          FLASH,        AIR_SLASH,    TOXIC,        DOUBLE_EDGE,  \
	     HYPER_BEAM,   COUNTER,      THUNDERBOLT,  THUNDER,      SHOCK_WAVE,   \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      SWIFT,        REST,         \
	     THUNDER_WAVE, LIGHT_SCREEN, SUBSTITUTE
	; end

