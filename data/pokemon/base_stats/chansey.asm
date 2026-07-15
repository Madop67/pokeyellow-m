	db DEX_CHANSEY ; pokedex id

	db 250,   5,   5,  50,  35, 105
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 30 ; catch rate
	db 255 ; base exp

	INCBIN "gfx/pokemon/front/chansey.pic", 0, 1 ; sprite dimensions
	dw ChanseyPicFront, ChanseyPicBack

	db TACKLE, TAIL_WHIP, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        TOXIC,        DOUBLE_EDGE,  BUBBLEBEAM,   \
	     HYPER_VOICE,  ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   PAY_DAY,      \
	     COUNTER,      SEISMIC_TOSS, SOLARBEAM,    THUNDERBOLT,  THUNDER,      \
	     PSYCHIC_M,    SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     METRONOME,    FIRE_BLAST,   SOFTBOILED,   REST,         THUNDER_WAVE, \
	     LIGHT_SCREEN, EXPLOSION,    TRI_ATTACK,   SUBSTITUTE
	; end

