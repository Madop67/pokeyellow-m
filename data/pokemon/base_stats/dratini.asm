	db DEX_DRATINI ; pokedex id

	db  41,  64,  45,  50,  50,  50
	;   hp  atk  def  spd  sat  sdf

	db DRAGON, DRAGON ; type
	db 45 ; catch rate
	db 67 ; base exp

	INCBIN "gfx/pokemon/front/dratini.pic", 0, 1 ; sprite dimensions
	dw DratiniPicFront, DratiniPicBack

	db TACKLE, LEER, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SURF,         STRENGTH,     TOXIC,        DOUBLE_EDGE,  BUBBLEBEAM,   \
	     ICE_BEAM,     BLIZZARD,     COUNTER,      THUNDERBOLT,  THUNDER,      \
	     SHOCK_WAVE,   MIMIC,        DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   \
	     SWIFT,        DRAGON_PULSE, REST,         THUNDER_WAVE, SUBSTITUTE
	; end

