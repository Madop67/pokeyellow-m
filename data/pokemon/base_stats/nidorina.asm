	db DEX_NIDORINA ; pokedex id

	db  70,  62,  67,  56,  55,  55
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 120 ; catch rate
	db 117 ; base exp

	INCBIN "gfx/pokemon/front/nidorina.pic", 0, 1 ; sprite dimensions
	dw NidorinaPicFront, NidorinaPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    SLUDGE_BOMB, TOXIC,       DOUBLE_EDGE, BUBBLEBEAM,  \
	     ICE_BEAM,    BLIZZARD,    COUNTER,     THUNDERBOLT, THUNDER,     \
	     SHOCK_WAVE,  MIMIC,       DOUBLE_TEAM, REFLECT,     REST,        \
	     SUBSTITUTE
	; end

