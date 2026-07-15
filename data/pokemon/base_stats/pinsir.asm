	db DEX_PINSIR ; pokedex id

	db  65, 125, 100,  85,  55,  70
	;   hp  atk  def  spd  sat  sdf

	db BUG, BUG ; type
	db 45 ; catch rate
	db 200 ; base exp

	INCBIN "gfx/pokemon/front/pinsir.pic", 0, 1 ; sprite dimensions
	dw PinsirPicFront, PinsirPicBack

	db HEADBUTT, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm CUT,          STRENGTH,     SWORDS_DANCE, TOXIC,        DOUBLE_EDGE,  \
	     HYPER_BEAM,   COUNTER,      SEISMIC_TOSS, MIMIC,        DOUBLE_TEAM,  \
	     X_SCISSOR,    BUG_BUZZ,     REST,         SUBSTITUTE
	; end

