	db DEX_CHARIZARD ; pokedex id

	db  78,  84,  78, 100, 109,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 45 ; catch rate
	db 209 ; base exp

	INCBIN "gfx/pokemon/front/charizard.pic", 0, 1 ; sprite dimensions
	dw CharizardPicFront, CharizardPicBack

	db EMBER, TACKLE, GROWL, LEER ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm CUT,          FLY,          STRENGTH,     AIR_SLASH,    SWORDS_DANCE, \
	     TOXIC,        DOUBLE_EDGE,  HYPER_BEAM,   COUNTER,      SEISMIC_TOSS, \
	     FLAMETHROWER, EARTHQUAKE,   FISSURE,      DIG,          MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   SWIFT,        DRAGON_PULSE, \
	     REST,         SUBSTITUTE
	; end

