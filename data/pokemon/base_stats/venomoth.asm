	db DEX_VENOMOTH ; pokedex id

	db  70,  65,  60,  90,  90,  75
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 75 ; catch rate
	db 138 ; base exp

	INCBIN "gfx/pokemon/front/venomoth.pic", 0, 1 ; sprite dimensions
	dw VenomothPicFront, VenomothPicBack

	db CONFUSION, TACKLE, DISABLE, SUPERSONIC ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm FLASH,       SLUDGE_BOMB, TOXIC,       DOUBLE_EDGE, HYPER_VOICE, \
	     HYPER_BEAM,  COUNTER,     MEGA_DRAIN,  SOLARBEAM,   PSYCHIC_M,   \
	     MIMIC,       DOUBLE_TEAM, REFLECT,     SWIFT,       X_SCISSOR,   \
	     BUG_BUZZ,    REST,        SUBSTITUTE
	; end

