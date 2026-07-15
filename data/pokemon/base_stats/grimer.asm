	db DEX_GRIMER ; pokedex id

	db  80,  80,  50,  25,  40,  50
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 190 ; catch rate
	db 90 ; base exp

	INCBIN "gfx/pokemon/front/grimer.pic", 0, 1 ; sprite dimensions
	dw GrimerPicFront, GrimerPicBack

	db TACKLE, DISABLE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    SLUDGE_BOMB, TOXIC,       HYPER_VOICE, COUNTER,     \
	     MEGA_DRAIN,  THUNDERBOLT, THUNDER,     SHOCK_WAVE,  MIMIC,       \
	     DOUBLE_TEAM, FIRE_BLAST,  REST,        EXPLOSION,   SUBSTITUTE
	; end

