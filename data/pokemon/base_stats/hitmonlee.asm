	db DEX_HITMONLEE ; pokedex id

	db  50, 120,  53,  87,  35, 110
	;   hp  atk  def  spd  sat  sdf

	db FIGHTING, FIGHTING ; type
	db 45 ; catch rate
	db 139 ; base exp

	INCBIN "gfx/pokemon/front/hitmonlee.pic", 0, 1 ; sprite dimensions
	dw HitmonleePicFront, HitmonleePicBack

	db LOW_KICK, MEDITATE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm STRENGTH,     TOXIC,        STONE_EDGE,   DOUBLE_EDGE,  AURA_SPHERE,  \
	     COUNTER,      SEISMIC_TOSS, MIMIC,        DOUBLE_TEAM,  METRONOME,    \
	     SWIFT,        REST,         SUBSTITUTE
	; end

