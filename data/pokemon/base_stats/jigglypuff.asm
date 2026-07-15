	db DEX_JIGGLYPUFF ; pokedex id

	db 115,  45,  20,  20,  45,  25
	;   hp  atk  def  spd  sat  sdf

	db SOUND, FAIRY ; type
	db 170 ; catch rate
	db 76 ; base exp

	INCBIN "gfx/pokemon/front/jigglypuff.pic", 0, 1 ; sprite dimensions
	dw JigglypuffPicFront, JigglypuffPicBack

	db SING, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        DAZZLE_GLEAM, TOXIC,        DOUBLE_EDGE,  \
	     BUBBLEBEAM,   HYPER_VOICE,  ICE_BEAM,     BLIZZARD,     COUNTER,      \
	     SEISMIC_TOSS, SOLARBEAM,    THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   \
	     REST,         THUNDER_WAVE, LIGHT_SCREEN, TRI_ATTACK,   SUBSTITUTE
	; end

