	db DEX_CHARMANDER ; pokedex id

	db  39,  52,  43,  65,  60,  50
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 65 ; base exp

	INCBIN "gfx/pokemon/front/charmander.pic", 0, 1 ; sprite dimensions
	dw CharmanderPicFront, CharmanderPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm CUT,          STRENGTH,     SWORDS_DANCE, TOXIC,        DOUBLE_EDGE,  \
	     COUNTER,      SEISMIC_TOSS, FLAMETHROWER, DIG,          MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   SWIFT,        REST,         \
	     SUBSTITUTE
	; end

