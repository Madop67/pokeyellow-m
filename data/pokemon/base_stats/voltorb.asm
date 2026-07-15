	db DEX_VOLTORB ; pokedex id

	db  40,  30,  50, 100,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 190 ; catch rate
	db 103 ; base exp

	INCBIN "gfx/pokemon/front/voltorb.pic", 0, 1 ; sprite dimensions
	dw VoltorbPicFront, VoltorbPicBack

	db TACKLE, SCREECH, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm FLASH,        TOXIC,        DOUBLE_EDGE,  HYPER_VOICE,  COUNTER,      \
	     THUNDERBOLT,  THUNDER,      SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      SWIFT,        REST,         THUNDER_WAVE, EXPLOSION,    \
	     SUBSTITUTE
	; end

