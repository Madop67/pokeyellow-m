	db DEX_SLOWPOKE ; pokedex id

	db  90,  65,  65,  15,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db WATER, PSYCHIC_TYPE ; type
	db 190 ; catch rate
	db 99 ; base exp

	INCBIN "gfx/pokemon/front/slowpoke.pic", 0, 1 ; sprite dimensions
	dw SlowpokePicFront, SlowpokePicBack

	db CONFUSION, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SURF,         STRENGTH,     FLASH,        TOXIC,        DOUBLE_EDGE,  \
	     BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     PAY_DAY,      COUNTER,      \
	     EARTHQUAKE,   FISSURE,      DIG,          PSYCHIC_M,    MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   SWIFT,        REST,         \
	     THUNDER_WAVE, TRI_ATTACK,   SUBSTITUTE
	; end

