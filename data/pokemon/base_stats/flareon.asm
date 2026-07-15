	db DEX_FLAREON ; pokedex id

	db  65, 130,  60,  65,  95, 110
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 45 ; catch rate
	db 198 ; base exp

	INCBIN "gfx/pokemon/front/flareon.pic", 0, 1 ; sprite dimensions
	dw FlareonPicFront, FlareonPicBack

	db EMBER, TACKLE, QUICK_ATTACK, TAIL_WHIP ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     TOXIC,        DOUBLE_EDGE,  HYPER_BEAM,   COUNTER,      \
	     FLAMETHROWER, MIMIC,        DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   \
	     SWIFT,        REST,         LIGHT_SCREEN, SUBSTITUTE
	; end

