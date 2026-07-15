	db DEX_NIDORAN_M ; pokedex id

	db  46,  57,  40,  50,  40,  40
	;   hp  atk  def  spd  sat  sdf

	db POISON, POISON ; type
	db 235 ; catch rate
	db 60 ; base exp

	INCBIN "gfx/pokemon/front/nidoranm.pic", 0, 1 ; sprite dimensions
	dw NidoranMPicFront, NidoranMPicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,    SLUDGE_BOMB, TOXIC,       DOUBLE_EDGE, BLIZZARD,    \
	     COUNTER,     THUNDERBOLT, THUNDER,     SHOCK_WAVE,  MIMIC,       \
	     DOUBLE_TEAM, REFLECT,     REST,        SUBSTITUTE
	; end

