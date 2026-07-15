	db DEX_WEEZING ; pokedex id

	db  65,  90, 120,  60,  85,  70
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 60 ; catch rate
	db 173 ; base exp

	INCBIN "gfx/pokemon/front/weezing.pic", 0, 1 ; sprite dimensions
	dw WeezingPicFront, WeezingPicBack

	db TACKLE, SLUDGE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SLUDGE_BOMB, TOXIC,       HYPER_BEAM,  COUNTER,     THUNDERBOLT, \
	     THUNDER,     SHOCK_WAVE,  MIMIC,       DOUBLE_TEAM, FIRE_BLAST,  \
	     REST,        EXPLOSION,   SUBSTITUTE
	; end

