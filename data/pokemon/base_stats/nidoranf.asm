	db DEX_NIDORAN_F ; pokedex id

	db  55,  47,  52,  41,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 235 ; catch rate
	db 59 ; base exp

	INCBIN "gfx/pokemon/front/nidoranf.pic", 0, 1 ; sprite dimensions
	dw NidoranFPicFront, NidoranFPicBack

	db TACKLE, GROWL, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    SLUDGE_BOMB, TOXIC,       DOUBLE_EDGE, BLIZZARD,    \
	     COUNTER,     THUNDERBOLT, THUNDER,     SHOCK_WAVE,  MIMIC,       \
	     DOUBLE_TEAM, REFLECT,     REST,        SUBSTITUTE
	; end

