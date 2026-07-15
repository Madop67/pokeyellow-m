	db DEX_CLEFAIRY ; pokedex id

	db  70,  45,  48,  35,  60,  65
	;   hp  atk  def  spd  sat  sdf

	db FAIRY, FAIRY ; type
	db 150 ; catch rate
	db 68 ; base exp

	INCBIN "gfx/pokemon/front/clefairy.pic", 0, 1 ; sprite dimensions
	dw ClefairyPicFront, ClefairyPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     FLASH,        DAZZLE_GLEAM, TOXIC,        DOUBLE_EDGE,  \
	     BUBBLEBEAM,   HYPER_VOICE,  ICE_BEAM,     BLIZZARD,     COUNTER,      \
	     SEISMIC_TOSS, SOLARBEAM,    THUNDERBOLT,  THUNDER,      PSYCHIC_M,    \
	     SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  REFLECT,      METRONOME,    \
	     FIRE_BLAST,   REST,         THUNDER_WAVE, LIGHT_SCREEN, TRI_ATTACK,   \
	     SUBSTITUTE
	; end

