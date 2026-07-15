	db DEX_BEEDRILL ; pokedex id

	db  65,  80,  40,  75,  45,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, POISON ; type
	db 45 ; catch rate
	db 159 ; base exp

	INCBIN "gfx/pokemon/front/beedrill.pic", 0, 1 ; sprite dimensions
	dw BeedrillPicFront, BeedrillPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CUT,          SLUDGE_BOMB,  SWORDS_DANCE, TOXIC,        DOUBLE_EDGE,  \
	     HYPER_BEAM,   COUNTER,      MEGA_DRAIN,   MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      SWIFT,        X_SCISSOR,    BUG_BUZZ,     REST,         \
	     SUBSTITUTE
	; end

