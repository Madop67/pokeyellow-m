	db DEX_POLIWRATH ; pokedex id

	db  90,  85,  95,  70,  70,  90
	;   hp  atk  def  spd  sat  sdf

	db WATER, FIGHTING ; type
	db 45 ; catch rate
	db 185 ; base exp

	INCBIN "gfx/pokemon/front/poliwrath.pic", 0, 1 ; sprite dimensions
	dw PoliwrathPicFront, PoliwrathPicBack

	db TACKLE, WATER_GUN, STRENGTH, HYPNOSIS ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm SURF,         STRENGTH,     TOXIC,        DOUBLE_EDGE,  BUBBLEBEAM,   \
	     ICE_BEAM,     BLIZZARD,     HYPER_BEAM,   AURA_SPHERE,  COUNTER,      \
	     SEISMIC_TOSS, EARTHQUAKE,   FISSURE,      PSYCHIC_M,    MIMIC,        \
	     DOUBLE_TEAM,  METRONOME,    REST,         SUBSTITUTE
	; end

