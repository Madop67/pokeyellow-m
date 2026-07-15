	db DEX_PERSIAN ; pokedex id

	db  65,  70,  60, 115,  65,  65
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 148 ; base exp

	INCBIN "gfx/pokemon/front/persian.pic", 0, 1 ; sprite dimensions
	dw PersianPicFront, PersianPicBack

	db TACKLE, BITE, GROWL, SCREECH ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    TOXIC,       DOUBLE_EDGE, BUBBLEBEAM,  HYPER_VOICE, \
	     HYPER_BEAM,  PAY_DAY,     COUNTER,     THUNDERBOLT, THUNDER,     \
	     SHOCK_WAVE,  MIMIC,       DOUBLE_TEAM, SWIFT,       REST,        \
	     EXPLOSION,   TRI_ATTACK,  SUBSTITUTE
	; end

