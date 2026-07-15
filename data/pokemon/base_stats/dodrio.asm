	db DEX_DODRIO ; pokedex id

	db  60, 110,  70, 100,  60,  60
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, FLYING ; type
	db 45 ; catch rate
	db 158 ; base exp

	INCBIN "gfx/pokemon/front/dodrio.pic", 0, 1 ; sprite dimensions
	dw DodrioPicFront, DodrioPicBack

	db PECK, TACKLE, GROWL, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm FLY,         STRENGTH,    AIR_SLASH,   TOXIC,       DOUBLE_EDGE, \
	     HYPER_BEAM,  PAY_DAY,     COUNTER,     MIMIC,       DOUBLE_TEAM, \
	     REFLECT,     REST,        EXPLOSION,   TRI_ATTACK,  SUBSTITUTE
	; end

