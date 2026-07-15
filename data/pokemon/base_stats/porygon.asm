	db DEX_PORYGON ; pokedex id

	db  65,  60,  70,  40,  85,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 130 ; base exp

	INCBIN "gfx/pokemon/front/porygon.pic", 0, 1 ; sprite dimensions
	dw PorygonPicFront, PorygonPicBack

	db TACKLE, CONVERSION, SHARPEN, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm FLASH,        TOXIC,        DOUBLE_EDGE,  ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   PAY_DAY,      COUNTER,      THUNDERBOLT,  THUNDER,      \
	     PSYCHIC_M,    SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     SWIFT,        REST,         THUNDER_WAVE, LIGHT_SCREEN, EXPLOSION,    \
	     TRI_ATTACK,   SUBSTITUTE
	; end

