	db DEX_NINETALES ; pokedex id

	db  73,  76,  75, 100,  81, 100
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FIRE ; type
	db 75 ; catch rate
	db 178 ; base exp

	INCBIN "gfx/pokemon/front/ninetales.pic", 0, 1 ; sprite dimensions
	dw NinetalesPicFront, NinetalesPicBack

	db EMBER, QUICK_ATTACK, ROAR, TAIL_WHIP ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     DAZZLE_GLEAM, TOXIC,        DOUBLE_EDGE,  HYPER_VOICE,  \
	     HYPER_BEAM,   COUNTER,      FLAMETHROWER, DIG,          MIMIC,        \
	     DOUBLE_TEAM,  REFLECT,      FIRE_BLAST,   SWIFT,        REST,         \
	     SUBSTITUTE
	; end

