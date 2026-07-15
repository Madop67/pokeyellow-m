	db DEX_MEOWTH ; pokedex id

	db  40,  45,  35,  90,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 255 ; catch rate
	db 69 ; base exp

	INCBIN "gfx/pokemon/front/meowth.pic", 0, 1 ; sprite dimensions
	dw MeowthPicFront, MeowthPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    TOXIC,       DOUBLE_EDGE, BUBBLEBEAM,  HYPER_VOICE, \
	     HYPER_BEAM,  PAY_DAY,     COUNTER,     THUNDERBOLT, THUNDER,     \
	     SHOCK_WAVE,  MIMIC,       DOUBLE_TEAM, SWIFT,       REST,        \
	     EXPLOSION,   TRI_ATTACK,  SUBSTITUTE
	; end

