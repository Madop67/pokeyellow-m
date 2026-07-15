	db DEX_EEVEE ; pokedex id

	db  55,  55,  50,  55,  45,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 92 ; base exp

	INCBIN "gfx/pokemon/front/eevee.pic", 0, 1 ; sprite dimensions
	dw EeveePicFront, EeveePicBack

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    TOXIC,       DOUBLE_EDGE, HYPER_BEAM,  PAY_DAY,     \
	     COUNTER,     MIMIC,       DOUBLE_TEAM, REFLECT,     SWIFT,       \
	     REST,        EXPLOSION,   TRI_ATTACK,  SUBSTITUTE
	; end

