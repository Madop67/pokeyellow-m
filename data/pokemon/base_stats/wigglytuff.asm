	db DEX_WIGGLYTUFF ; pokedex id

	db 140,  70,  45,  45,  85,  50
	;   hp  atk  def  spd  sat  sdf

	db SOUND, FAIRY ; type
	db 50 ; catch rate
	db 109 ; base exp

	INCBIN "gfx/pokemon/front/wigglytuff.pic", 0, 1 ; sprite dimensions
	dw WigglytuffPicFront, WigglytuffPicBack

	db TACKLE, ROUND_M, DEFENSE_CURL, DISABLE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        DAZZLE_GLEAM, TOXIC,        DOUBLE_EDGE,  \
	     BUBBLEBEAM,   HYPER_VOICE,  ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   \
	     COUNTER,      SEISMIC_TOSS, SOLARBEAM,    THUNDERBOLT,  THUNDER,      \
	     PSYCHIC_M,    SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     FIRE_BLAST,   REST,         THUNDER_WAVE, LIGHT_SCREEN, TRI_ATTACK,   \
	     SUBSTITUTE
	; end

