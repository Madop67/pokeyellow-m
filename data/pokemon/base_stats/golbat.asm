	db DEX_GOLBAT ; pokedex id

	db  75,  80,  70,  90,  65,  75
	;   hp  atk  def  spd  sat  sdf

	db POISON, FLYING ; type
	db 90 ; catch rate
	db 171 ; base exp

	INCBIN "gfx/pokemon/front/golbat.pic", 0, 1 ; sprite dimensions
	dw GolbatPicFront, GolbatPicBack

	db BITE, LEECH_LIFE, SCREECH, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm SLUDGE_BOMB, AIR_SLASH,   TOXIC,       DOUBLE_EDGE, HYPER_VOICE, \
	     HYPER_BEAM,  COUNTER,     MEGA_DRAIN,  MIMIC,       DOUBLE_TEAM, \
	     SWIFT,       REST,        SUBSTITUTE
	; end

