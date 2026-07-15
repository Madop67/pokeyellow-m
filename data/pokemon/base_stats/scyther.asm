	db DEX_SCYTHER ; pokedex id

	db  70, 110,  80, 105,  55,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 45 ; catch rate
	db 187 ; base exp

	INCBIN "gfx/pokemon/front/scyther.pic", 0, 1 ; sprite dimensions
	dw ScytherPicFront, ScytherPicBack

	db QUICK_ATTACK, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CUT,          AIR_SLASH,    SWORDS_DANCE, TOXIC,        DOUBLE_EDGE,  \
	     HYPER_BEAM,   COUNTER,      MIMIC,        DOUBLE_TEAM,  SWIFT,        \
	     X_SCISSOR,    BUG_BUZZ,     REST,         SUBSTITUTE
	; end

