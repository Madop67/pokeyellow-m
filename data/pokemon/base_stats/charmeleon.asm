	db DEX_CHARMELEON ; pokedex id

	db  58,  64,  58,  80,  80,  65
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 142 ; base exp

	INCBIN "gfx/pokemon/front/charmeleon.pic", 0, 1 ; sprite dimensions
	dw CharmeleonPicFront, CharmeleonPicBack

	db EMBER, TACKLE, GROWL, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm CUT,          STRENGTH,     SWORDS_DANCE, TOXIC,        DOUBLE_EDGE,  \
	     COUNTER,      SEISMIC_TOSS, FLAMETHROWER, DIG,          MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   SWIFT,        REST,         \
	     SUBSTITUTE
	; end

