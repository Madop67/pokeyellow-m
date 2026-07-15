	db DEX_SANDSHREW ; pokedex id

	db  50,  75,  85,  40,  20,  30
	;   hp  atk  def  spd  sat  sdf

	db GROUND, GROUND ; type
	db 255 ; catch rate
	db 93 ; base exp

	INCBIN "gfx/pokemon/front/sandshrew.pic", 0, 1 ; sprite dimensions
	dw SandshrewPicFront, SandshrewPicBack

	db TACKLE, NO_MOVE, NO_MOVE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CUT,          STRENGTH,     SWORDS_DANCE, TOXIC,        DOUBLE_EDGE,  \
	     COUNTER,      SEISMIC_TOSS, EARTHQUAKE,   FISSURE,      DIG,          \
	     MIMIC,        DOUBLE_TEAM,  SWIFT,        REST,         ROCK_SLIDE,   \
	     SUBSTITUTE
	; end

