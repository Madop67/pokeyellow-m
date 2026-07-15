	db DEX_RHYDON ; pokedex id

	db 105, 130, 120,  40,  45,  45
	;   hp  atk  def  spd  sat  sdf

	db GROUND, ROCK ; type
	db 60 ; catch rate
	db 204 ; base exp

	INCBIN "gfx/pokemon/front/rhydon.pic", 0, 1 ; sprite dimensions
	dw RhydonPicFront, RhydonPicBack

	db TACKLE, HEADBUTT, TAIL_WHIP, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SURF,         STRENGTH,     TOXIC,        STONE_EDGE,   DOUBLE_EDGE,  \
	     BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   PAY_DAY,      \
	     COUNTER,      SEISMIC_TOSS, IRON_TAIL,    THUNDERBOLT,  THUNDER,      \
	     EARTHQUAKE,   FISSURE,      DIG,          SHOCK_WAVE,   MIMIC,        \
	     DOUBLE_TEAM,  FIRE_BLAST,   REST,         ROCK_SLIDE,   SUBSTITUTE
	; end

