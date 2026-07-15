	db DEX_PRIMEAPE ; pokedex id

	db  65, 105,  60,  95,  60,  70
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 75 ; catch rate
	db 149 ; base exp

	INCBIN "gfx/pokemon/front/primeape.pic", 0, 1 ; sprite dimensions
	dw PrimeapePicFront, PrimeapePicBack

	db KARATE_CHOP, TACKLE, LOW_KICK, LEER ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     TOXIC,        STONE_EDGE,   DOUBLE_EDGE,  HYPER_VOICE,  \
	     HYPER_BEAM,   PAY_DAY,      AURA_SPHERE,  COUNTER,      SEISMIC_TOSS, \
	     THUNDERBOLT,  THUNDER,      DIG,          SHOCK_WAVE,   MIMIC,        \
	     DOUBLE_TEAM,  METRONOME,    SWIFT,        REST,         ROCK_SLIDE,   \
	     SUBSTITUTE
	; end

