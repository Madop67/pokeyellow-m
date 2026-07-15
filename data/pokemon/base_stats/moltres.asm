	db DEX_MOLTRES ; pokedex id

	db  90, 100,  90,  90, 125,  85
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 3 ; catch rate
	db 217 ; base exp

	INCBIN "gfx/pokemon/front/moltres.pic", 0, 1 ; sprite dimensions
	dw MoltresPicFront, MoltresPicBack

	db PECK, FLAME_BURST, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm FLY,          AIR_SLASH,    TOXIC,        DOUBLE_EDGE,  HYPER_BEAM,   \
	     COUNTER,      FLAMETHROWER, MIMIC,        DOUBLE_TEAM,  REFLECT,      \
	     FIRE_BLAST,   SWIFT,        REST,         LIGHT_SCREEN, SUBSTITUTE
	; end

