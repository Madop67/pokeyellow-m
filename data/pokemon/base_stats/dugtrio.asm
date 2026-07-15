	db DEX_DUGTRIO ; pokedex id

	db  35,  80,  50, 120,  50,  70
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 50 ; catch rate
	db 153 ; base exp

	INCBIN "gfx/pokemon/front/dugtrio.pic", 0, 1 ; sprite dimensions
	dw DugtrioPicFront, DugtrioPicBack

	db TACKLE, DIG, GROWL, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CUT,         STRENGTH,    TOXIC,       DOUBLE_EDGE, HYPER_BEAM,  \
	     COUNTER,     EARTHQUAKE,  FISSURE,     DIG,         MIMIC,       \
	     DOUBLE_TEAM, REST,        ROCK_SLIDE,  SUBSTITUTE
	; end

