	db DEX_PIDGEY ; pokedex id

	db  40,  45,  40,  56,  35,  35
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 255 ; catch rate
	db 55 ; base exp

	INCBIN "gfx/pokemon/front/pidgey.pic", 0, 1 ; sprite dimensions
	dw PidgeyPicFront, PidgeyPicBack

	db GUST, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm FLY,         AIR_SLASH,   TOXIC,       DOUBLE_EDGE, HYPER_BEAM,  \
	     PAY_DAY,     COUNTER,     MIMIC,       DOUBLE_TEAM, REFLECT,     \
	     SWIFT,       REST,        EXPLOSION,   TRI_ATTACK,  SUBSTITUTE
	; end

