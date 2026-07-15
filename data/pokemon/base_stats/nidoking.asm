	db DEX_NIDOKING ; pokedex id

	db  81,  92,  77,  85,  85,  75
	;   hp  atk  def  spd  sat  sdf

	db POISON, GROUND ; type
	db 45 ; catch rate
	db 195 ; base exp

	INCBIN "gfx/pokemon/front/nidoking.pic", 0, 1 ; sprite dimensions
	dw NidokingPicFront, NidokingPicBack

	db POISON_STING, TACKLE, HEADBUTT, DOUBLE_EDGE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SURF,         STRENGTH,     SLUDGE_BOMB,  TOXIC,        STONE_EDGE,   \
	     DOUBLE_EDGE,  BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     PAY_DAY,      COUNTER,      SEISMIC_TOSS, THUNDERBOLT,  THUNDER,      \
	     EARTHQUAKE,   FISSURE,      DIG,          SHOCK_WAVE,   MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   REST,         ROCK_SLIDE,   \
	     SUBSTITUTE
	; end

