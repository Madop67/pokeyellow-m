	db DEX_SNORLAX ; pokedex id

	db 160, 110,  65,  30,  65, 110
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 25 ; catch rate
	db 154 ; base exp

	INCBIN "gfx/pokemon/front/snorlax.pic", 0, 1 ; sprite dimensions
	dw SnorlaxPicFront, SnorlaxPicBack

	db HEADBUTT, AMNESIA, REST, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SURF,         STRENGTH,     TOXIC,        STONE_EDGE,   CRUNCH,       \
	     DOUBLE_EDGE,  BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     PAY_DAY,      COUNTER,      SEISMIC_TOSS, SOLARBEAM,    THUNDERBOLT,  \
	     THUNDER,      EARTHQUAKE,   FISSURE,      PSYCHIC_M,    SHOCK_WAVE,   \
	     MIMIC,        DOUBLE_TEAM,  REFLECT,      METRONOME,    FIRE_BLAST,   \
	     REST,         EXPLOSION,    ROCK_SLIDE,   TRI_ATTACK,   SUBSTITUTE
	; end

