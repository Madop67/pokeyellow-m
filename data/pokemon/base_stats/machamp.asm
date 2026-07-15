	db DEX_MACHAMP ; pokedex id

	db  90, 130,  80,  55,  65,  85
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 193 ; base exp

	INCBIN "gfx/pokemon/front/machamp.pic", 0, 1 ; sprite dimensions
	dw MachampPicFront, MachampPicBack

	db KARATE_CHOP, LOW_KICK, LEER, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     TOXIC,        STONE_EDGE,   DOUBLE_EDGE,  HYPER_BEAM,   \
	     AURA_SPHERE,  COUNTER,      SEISMIC_TOSS, EARTHQUAKE,   FISSURE,      \
	     DIG,          MIMIC,        DOUBLE_TEAM,  METRONOME,    FIRE_BLAST,   \
	     REST,         ROCK_SLIDE,   SUBSTITUTE
	; end

