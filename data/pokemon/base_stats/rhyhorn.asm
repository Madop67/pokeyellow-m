	db DEX_RHYHORN ; pokedex id

	db  80,  85,  95,  25,  30,  30
	;   hp  atk  def  spd  sat  sdf

	db GROUND, ROCK ; type
	db 120 ; catch rate
	db 135 ; base exp

	INCBIN "gfx/pokemon/front/rhyhorn.pic", 0, 1 ; sprite dimensions
	dw RhyhornPicFront, RhyhornPicBack

	db HEADBUTT, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    TOXIC,       STONE_EDGE,  DOUBLE_EDGE, COUNTER,     \
	     IRON_TAIL,   THUNDERBOLT, THUNDER,     EARTHQUAKE,  FISSURE,     \
	     DIG,         SHOCK_WAVE,  MIMIC,       DOUBLE_TEAM, FIRE_BLAST,  \
	     REST,        ROCK_SLIDE,  SUBSTITUTE
	; end

