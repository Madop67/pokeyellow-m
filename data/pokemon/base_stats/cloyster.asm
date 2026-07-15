	db DEX_CLOYSTER ; pokedex id

	db  50,  95, 180,  70,  85,  45
	;   hp  atk  def  spd  sat  sdf

	db WATER, ICE ; type
	db 60 ; catch rate
	db 203 ; base exp

	INCBIN "gfx/pokemon/front/cloyster.pic", 0, 1 ; sprite dimensions
	dw CloysterPicFront, CloysterPicBack

	db AURORA_BEAM, RAZOR_SHELL, SUPERSONIC, WITHDRAW ; level 1 learnset
	db GROWTH_SLOW ; growth rate

	; tm/hm learnset
	tmhm SURF,        TOXIC,       DOUBLE_EDGE, BUBBLEBEAM,  HYPER_VOICE, \
	     ICE_BEAM,    BLIZZARD,    HYPER_BEAM,  COUNTER,     MIMIC,       \
	     DOUBLE_TEAM, REFLECT,     SWIFT,       REST,        EXPLOSION,   \
	     TRI_ATTACK,  SUBSTITUTE
	; end

