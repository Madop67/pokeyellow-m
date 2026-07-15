	db DEX_ELECTABUZZ ; pokedex id

	db  65,  83,  57, 105,  95,  85
	;   hp  atk  def  spd  sat  sdf

	db ELECTRIC, ELECTRIC ; type
	db 45 ; catch rate
	db 156 ; base exp

	INCBIN "gfx/pokemon/front/electabuzz.pic", 0, 1 ; sprite dimensions
	dw ElectabuzzPicFront, ElectabuzzPicBack

	db QUICK_ATTACK, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        TOXIC,        DOUBLE_EDGE,  HYPER_VOICE,  \
	     HYPER_BEAM,   COUNTER,      SEISMIC_TOSS, THUNDERBOLT,  THUNDER,      \
	     PSYCHIC_M,    SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     METRONOME,    SWIFT,        REST,         THUNDER_WAVE, SUBSTITUTE
	; end

