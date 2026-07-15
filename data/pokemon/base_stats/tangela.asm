	db DEX_TANGELA ; pokedex id

	db  65,  55, 115,  60, 100,  40
	;   hp  atk  def  spd  sat  sdf

	db GRASS, GRASS ; type
	db 45 ; catch rate
	db 166 ; base exp

	INCBIN "gfx/pokemon/front/tangela.pic", 0, 1 ; sprite dimensions
	dw TangelaPicFront, TangelaPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CUT,          STRENGTH,     SWORDS_DANCE, TOXIC,        ENERGY_BALL,  \
	     DOUBLE_EDGE,  HYPER_BEAM,   COUNTER,      MEGA_DRAIN,   SOLARBEAM,    \
	     MIMIC,        DOUBLE_TEAM,  REST,         SUBSTITUTE
	; end

