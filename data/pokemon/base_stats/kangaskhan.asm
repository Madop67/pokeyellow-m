	db DEX_KANGASKHAN ; pokedex id

	db 105,  95,  80,  90,  40,  80
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 175 ; base exp

	INCBIN "gfx/pokemon/front/kangaskhan.pic", 0, 1 ; sprite dimensions
	dw KangaskhanPicFront, KangaskhanPicBack

	db TACKLE, HEADBUTT, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SURF,         STRENGTH,     TOXIC,        STONE_EDGE,   DOUBLE_EDGE,  \
	     BUBBLEBEAM,   ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   PAY_DAY,      \
	     COUNTER,      SEISMIC_TOSS, THUNDERBOLT,  THUNDER,      EARTHQUAKE,   \
	     FISSURE,      SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  FIRE_BLAST,   \
	     REST,         EXPLOSION,    ROCK_SLIDE,   TRI_ATTACK,   SUBSTITUTE
	; end

