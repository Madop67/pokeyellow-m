	db DEX_MR_MIME ; pokedex id

	db  40,  45,  65,  90, 100, 120
	;   hp  atk  def  spd  sat  sdf

	db PSYCHIC_TYPE, FAIRY ; type
	db 45 ; catch rate
	db 136 ; base exp

	INCBIN "gfx/pokemon/front/mr.mime.pic", 0, 1 ; sprite dimensions
	dw MrMimePicFront, MrMimePicBack

	db CONFUSION, BARRIER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        DAZZLE_GLEAM, TOXIC,        DOUBLE_EDGE,  \
	     HYPER_BEAM,   COUNTER,      SEISMIC_TOSS, SOLARBEAM,    THUNDERBOLT,  \
	     THUNDER,      PSYCHIC_M,    SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  \
	     REFLECT,      METRONOME,    REST,         THUNDER_WAVE, SUBSTITUTE
	; end

