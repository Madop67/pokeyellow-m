	db DEX_FARFETCHD ; pokedex id

	db  52,  65,  55,  60,  58,  62
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 94 ; base exp

	INCBIN "gfx/pokemon/front/farfetchd.pic", 0, 1 ; sprite dimensions
	dw FarfetchdPicFront, FarfetchdPicBack

	db PECK, SAND_ATTACK, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CUT,          FLY,          STRENGTH,     AIR_SLASH,    SWORDS_DANCE, \
	     TOXIC,        DOUBLE_EDGE,  HYPER_BEAM,   PAY_DAY,      COUNTER,      \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      SWIFT,        REST,         \
	     EXPLOSION,    TRI_ATTACK,   SUBSTITUTE
	; end

