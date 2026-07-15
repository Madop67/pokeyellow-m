	db DEX_KOFFING ; pokedex id

	db  40,  65,  95,  35,  60,  45
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 190 ; catch rate
	db 114 ; base exp

	INCBIN "gfx/pokemon/front/koffing.pic", 0, 1 ; sprite dimensions
	dw KoffingPicFront, KoffingPicBack

	db TACKLE, SLUDGE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SLUDGE_BOMB, TOXIC,       COUNTER,     THUNDERBOLT, THUNDER,     \
	     SHOCK_WAVE,  MIMIC,       DOUBLE_TEAM, FIRE_BLAST,  REST,        \
	     EXPLOSION,   SUBSTITUTE
	; end

