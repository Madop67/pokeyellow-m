	db DEX_AERODACTYL ; pokedex id

	db  80, 105,  65, 130,  60,  75
	;   hp  atk  def  spd  sat  sdf

	db ROCK, FLYING ; type
	db 45 ; catch rate
	db 202 ; base exp

	INCBIN "gfx/pokemon/front/aerodactyl.pic", 0, 1 ; sprite dimensions
	dw AerodactylPicFront, AerodactylPicBack

	db WING_ATTACK, AGILITY, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm FLY,          AIR_SLASH,    TOXIC,        STONE_EDGE,   CRUNCH,       \
	     DOUBLE_EDGE,  HYPER_VOICE,  HYPER_BEAM,   COUNTER,      MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   SWIFT,        DRAGON_PULSE, \
	     REST,         ROCK_SLIDE,   SUBSTITUTE
	; end

