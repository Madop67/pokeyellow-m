	db DEX_CLEFABLE ; pokedex id

	db  95,  70,  73,  60,  95,  90
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY ; type
	db 25 ; catch rate
	db 129 ; base exp

	INCBIN "gfx/pokemon/front/clefable.pic", 0, 1 ; sprite dimensions
	dw ClefablePicFront, ClefablePicBack

	db TACKLE, DRAIN_KISS, METRONOME, MINIMIZE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        DAZZLE_GLEAM, TOXIC,        DOUBLE_EDGE,  \
	     BUBBLEBEAM,   HYPER_VOICE,  ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     COUNTER,      SEISMIC_TOSS, SOLARBEAM,    THUNDERBOLT,  THUNDER,      \
	     PSYCHIC_M,    SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     METRONOME,    FIRE_BLAST,   REST,         THUNDER_WAVE, LIGHT_SCREEN, \
	     TRI_ATTACK,   SUBSTITUTE
	; end

