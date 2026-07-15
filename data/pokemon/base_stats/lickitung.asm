	db DEX_LICKITUNG ; pokedex id

	db  90,  55,  75,  30,  60,  75
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 127 ; base exp

	INCBIN "gfx/pokemon/front/lickitung.pic", 0, 1 ; sprite dimensions
	dw LickitungPicFront, LickitungPicBack

	db TACKLE, SUPERSONIC, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CUT,          SURF,         STRENGTH,     SWORDS_DANCE, TOXIC,        \
	     DOUBLE_EDGE,  BUBBLEBEAM,   HYPER_VOICE,  ICE_BEAM,     BLIZZARD,     \
	     HYPER_BEAM,   PAY_DAY,      COUNTER,      SEISMIC_TOSS, THUNDERBOLT,  \
	     THUNDER,      EARTHQUAKE,   FISSURE,      SHOCK_WAVE,   MIMIC,        \
	     DOUBLE_TEAM,  FIRE_BLAST,   REST,         EXPLOSION,    TRI_ATTACK,   \
	     SUBSTITUTE
	; end

