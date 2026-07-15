	db DEX_BUTTERFREE ; pokedex id

	db  60,  45,  50,  70,  90,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, FLYING ; type
	db 45 ; catch rate
	db 160 ; base exp

	INCBIN "gfx/pokemon/front/butterfree.pic", 0, 1 ; sprite dimensions
	dw ButterfreePicFront, ButterfreePicBack

	db CONFUSION, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm FLASH,       AIR_SLASH,   TOXIC,       DOUBLE_EDGE, HYPER_VOICE, \
	     HYPER_BEAM,  COUNTER,     MEGA_DRAIN,  SOLARBEAM,   PSYCHIC_M,   \
	     MIMIC,       DOUBLE_TEAM, REFLECT,     SWIFT,       X_SCISSOR,   \
	     BUG_BUZZ,    REST,        SUBSTITUTE
	; end

