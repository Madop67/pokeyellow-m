	db DEX_PARASECT ; pokedex id

	db  60,  95,  80,  30,  60,  80
	;   hp  atk  def  spd  sat  sdf

	db BUG, GRASS ; type
	db 75 ; catch rate
	db 128 ; base exp

	INCBIN "gfx/pokemon/front/parasect.pic", 0, 1 ; sprite dimensions
	dw ParasectPicFront, ParasectPicBack

	db TACKLE, LEECH_LIFE, STUN_SPORE, NO_MOVE ; level 1 learnset
	db GROWTH_MEDIUM_FAST ; growth rate

	; tm/hm learnset
	tmhm CUT,          STRENGTH,     SWORDS_DANCE, TOXIC,        ENERGY_BALL,  \
	     DOUBLE_EDGE,  HYPER_BEAM,   COUNTER,      MEGA_DRAIN,   SOLARBEAM,    \
	     DIG,          MIMIC,        DOUBLE_TEAM,  REFLECT,      X_SCISSOR,    \
	     BUG_BUZZ,     REST,         SUBSTITUTE
	; end

