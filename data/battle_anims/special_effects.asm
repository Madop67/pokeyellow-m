MACRO anim_special_effect
	db \1
	dw \2
ENDM

AnimationIdSpecialEffects:
	; animation id (= move id or special anim id), effect routine address
	anim_special_effect FORCE_PALM,   AnimationFlashScreen
	anim_special_effect HEADBUTT,     AnimationFlashScreen
	anim_special_effect STONE_EDGE,   DoRockSlideSpecialEffects
	anim_special_effect ANCIENTPOWER, DoRockSlideSpecialEffects
	anim_special_effect TAIL_WHIP,    TailWhipAnimationUnused
	anim_special_effect METEOR_BEAM,  FlashScreenEveryFourFrameBlocks
	anim_special_effect GROWL,        DoGrowlSpecialEffects
	anim_special_effect DISABLE,      AnimationFlashScreen
	anim_special_effect BLIZZARD,     DoBlizzardSpecialEffects
	anim_special_effect BUBBLEBEAM,   AnimationFlashScreen
	anim_special_effect HYPER_BEAM,   FlashScreenEveryFourFrameBlocks
	anim_special_effect THUNDERBOLT,  FlashScreenEveryEightFrameBlocks
	anim_special_effect REFLECT,      AnimationFlashScreen
	anim_special_effect IRON_HEAD,    AnimationFlashScreen
	anim_special_effect SPORE,        FlashScreenEveryFourFrameBlocks
	anim_special_effect EXPLOSION,    DoExplodeSpecialEffects
	anim_special_effect ROCK_SLIDE,   DoRockSlideSpecialEffects
	anim_special_effect STEEL_BEAM,   FlashScreenEveryFourFrameBlocks
	anim_special_effect WILD_CHARGE,  FlashScreenEveryEightFrameBlocks
	anim_special_effect SHOCK_WAVE,   FlashScreenEveryEightFrameBlocks
	anim_special_effect ZEN_HEADBUTT, AnimationFlashScreen
	anim_special_effect ICICLE_CRASH, DoRockSlideSpecialEffects
	anim_special_effect SNARL,        DoGrowlSpecialEffects
	anim_special_effect SPIRIT_BREAK, AnimationFlashScreen
	anim_special_effect SONIC_SMASH,  FlashScreenEveryFourFrameBlocks
	anim_special_effect BOOMBURST,    FlashScreenEveryFourFrameBlocks
	anim_special_effect NOVA_STRIKE,  FlashScreenEveryFourFrameBlocks
	anim_special_effect SUPERNOVA,    FlashScreenEveryFourFrameBlocks
	anim_special_effect TRADE_BALL_DROP_ANIM, TradeHidePokemon
	anim_special_effect TRADE_BALL_SHAKE_ANIM, TradeShakePokeball
	anim_special_effect TRADE_BALL_TILT_ANIM, TradeJumpPokeball
	anim_special_effect TOSS_ANIM,    DoBallTossSpecialEffects
	anim_special_effect SHAKE_ANIM,   DoBallShakeSpecialEffects
	anim_special_effect POOF_ANIM,    DoPoofSpecialEffects
	anim_special_effect GREATTOSS_ANIM, DoBallTossSpecialEffects
	anim_special_effect ULTRATOSS_ANIM, DoBallTossSpecialEffects
	db -1 ; end
