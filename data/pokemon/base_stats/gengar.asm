	db DEX_GENGAR ; pokedex id

	db  60,  65,  60, 110, 130,  75
	;   hp  atk  def  spd  sat  sdf

	db GHOST, POISON ; type
	db 45 ; catch rate
	db 190 ; base exp

	INCBIN "gfx/pokemon/front/gengar.pic", 0, 1 ; sprite dimensions
	dw GengarPicFront, GengarPicBack

	db LICK, NIGHT_SHADE, CONFUSE_RAY, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     SLUDGE_BOMB,  SHADOW_BALL,  TOXIC,        CRUNCH,       \
	     DOUBLE_EDGE,  HYPER_BEAM,   COUNTER,      SEISMIC_TOSS, MEGA_DRAIN,   \
	     THUNDERBOLT,  THUNDER,      PSYCHIC_M,    SHOCK_WAVE,   MIMIC,        \
	     DOUBLE_TEAM,  DARK_PULSE,   METRONOME,    REST,         EXPLOSION,    \
	     SUBSTITUTE
	; end

