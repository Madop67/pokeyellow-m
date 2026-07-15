	db DEX_HAUNTER ; pokedex id

	db  45,  50,  45,  95, 115,  55
	;   hp  atk  def  spd  sat  sdf

	db GHOST, POISON ; type
	db 90 ; catch rate
	db 126 ; base exp

	INCBIN "gfx/pokemon/front/haunter.pic", 0, 1 ; sprite dimensions
	dw HaunterPicFront, HaunterPicBack

	db LICK, NIGHT_SHADE, CONFUSE_RAY, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SLUDGE_BOMB, SHADOW_BALL, TOXIC,       COUNTER,     MEGA_DRAIN,  \
	     THUNDERBOLT, THUNDER,     PSYCHIC_M,   SHOCK_WAVE,  MIMIC,       \
	     DOUBLE_TEAM, DARK_PULSE,  REST,        EXPLOSION,   SUBSTITUTE
	; end

