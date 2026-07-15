	db DEX_TAUROS ; pokedex id

	db  75, 100,  95, 110,  40,  70
	;   hp  atk  def  spd  sat  sdf

	db NORMAL, NORMAL ; type
	db 45 ; catch rate
	db 211 ; base exp

	INCBIN "gfx/pokemon/front/tauros.pic", 0, 1 ; sprite dimensions
	dw TaurosPicFront, TaurosPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    TOXIC,       DOUBLE_EDGE, ICE_BEAM,    BLIZZARD,    \
	     HYPER_BEAM,  PAY_DAY,     COUNTER,     THUNDERBOLT, THUNDER,     \
	     EARTHQUAKE,  FISSURE,     SHOCK_WAVE,  MIMIC,       DOUBLE_TEAM, \
	     FIRE_BLAST,  REST,        EXPLOSION,   TRI_ATTACK,  SUBSTITUTE
	; end

