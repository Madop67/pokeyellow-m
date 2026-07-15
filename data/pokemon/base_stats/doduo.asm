	db DEX_DODUO ; pokedex id

	db  35,  85,  45,  75,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 190 ; catch rate
	db 96 ; base exp

	INCBIN "gfx/pokemon/front/doduo.pic", 0, 1 ; sprite dimensions
	dw DoduoPicFront, DoduoPicBack

	db PECK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm FLY,         STRENGTH,    AIR_SLASH,   TOXIC,       DOUBLE_EDGE, \
	     HYPER_BEAM,  PAY_DAY,     COUNTER,     MIMIC,       DOUBLE_TEAM, \
	     REFLECT,     REST,        EXPLOSION,   TRI_ATTACK,  SUBSTITUTE
	; end

