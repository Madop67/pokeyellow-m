	db DEX_VILEPLUME ; pokedex id

	db  75,  80,  85,  50, 110,  90
	;   hp  atk  def  spd  sat  sdf

	db GRASS, POISON ; type
	db 45 ; catch rate
	db 184 ; base exp

	INCBIN "gfx/pokemon/front/vileplume.pic", 0, 1 ; sprite dimensions
	dw VileplumePicFront, VileplumePicBack

	db ACID, ENERGY_BALL, SLEEP_POWDER, STUN_SPORE ; level 1 learnset
	db GROWTH_MEDIUM_SLOW ; growth rate

	; tm/hm learnset
	tmhm CUT,          STRENGTH,     SLUDGE_BOMB,  SWORDS_DANCE, TOXIC,        \
	     ENERGY_BALL,  DOUBLE_EDGE,  HYPER_BEAM,   COUNTER,      MEGA_DRAIN,   \
	     SOLARBEAM,    MIMIC,        DOUBLE_TEAM,  REFLECT,      REST,         \
	     SUBSTITUTE
	; end

