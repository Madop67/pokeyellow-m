	db DEX_MUK ; pokedex id

	db 105, 105,  75,  50,  65, 100
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 75 ; catch rate
	db 157 ; base exp

	INCBIN "gfx/pokemon/front/muk.pic", 0, 1 ; sprite dimensions
	dw MukPicFront, MukPicBack

	db TACKLE, DISABLE, POISON_GAS, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    SLUDGE_BOMB, TOXIC,       HYPER_VOICE, HYPER_BEAM,  \
	     COUNTER,     MEGA_DRAIN,  THUNDERBOLT, THUNDER,     SHOCK_WAVE,  \
	     MIMIC,       DOUBLE_TEAM, FIRE_BLAST,  REST,        EXPLOSION,   \
	     SUBSTITUTE
	; end

