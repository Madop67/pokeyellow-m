	db DEX_MANKEY ; pokedex id

	db  40,  80,  35,  70,  35,  45
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 190 ; catch rate
	db 74 ; base exp

	INCBIN "gfx/pokemon/front/mankey.pic", 0, 1 ; sprite dimensions
	dw MankeyPicFront, MankeyPicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     TOXIC,        STONE_EDGE,   DOUBLE_EDGE,  HYPER_VOICE,  \
	     PAY_DAY,      AURA_SPHERE,  COUNTER,      SEISMIC_TOSS, THUNDERBOLT,  \
	     THUNDER,      DIG,          SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  \
	     METRONOME,    SWIFT,        REST,         ROCK_SLIDE,   SUBSTITUTE
	; end

