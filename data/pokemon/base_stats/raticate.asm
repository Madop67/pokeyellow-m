	db DEX_RATICATE ; pokedex id

	db  55,  81,  60,  97,  50,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 90 ; catch rate
	db 116 ; base exp

	INCBIN "gfx/pokemon/front/raticate.pic", 0, 1 ; sprite dimensions
	dw RaticatePicFront, RaticatePicBack

	db TACKLE, QUICK_ATTACK, TAIL_WHIP, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    TOXIC,       CRUNCH,      DOUBLE_EDGE, BUBBLEBEAM,  \
	     ICE_BEAM,    BLIZZARD,    HYPER_BEAM,  PAY_DAY,     COUNTER,     \
	     THUNDERBOLT, THUNDER,     DIG,         SHOCK_WAVE,  MIMIC,       \
	     DOUBLE_TEAM, SWIFT,       REST,        EXPLOSION,   TRI_ATTACK,  \
	     SUBSTITUTE
	; end

