TrainerAIPointers:
	table_width 3
	; one entry per trainer class
	; first byte, number of times (per Pokémon) it can occur
	; next two bytes, pointer to AI subroutine for trainer class
	; subroutines are defined in engine/battle/trainer_ai.asm
	dbw 3, GenericAI ; youngster
	dbw 3, GenericAI ; bug catcher
	dbw 3, GenericAI ; lass
	dbw 3, GenericAI ; sailor
	dbw 3, GenericAI ; jr trainer m
	dbw 3, GenericAI ; jr trainer f
	dbw 3, GenericAI ; pokemaniac
	dbw 3, GenericAI ; super nerd
	dbw 3, GenericAI ; hiker
	dbw 3, GenericAI ; biker
	dbw 3, GenericAI ; burglar
	dbw 3, GenericAI ; engineer
	dbw 3, JugglerAI ; unused_juggler
	dbw 3, GenericAI ; fisher
	dbw 3, GenericAI ; swimmer
	dbw 3, GenericAI ; cue ball
	dbw 3, GenericAI ; gambler
	dbw 3, GenericAI ; beauty
	dbw 3, GenericAI ; psychic
	dbw 3, GenericAI ; rocker
	dbw 3, JugglerAI ; juggler
	dbw 3, GenericAI ; tamer
	dbw 3, GenericAI ; bird keeper
	dbw 2, BlackbeltAI ; blackbelt
	dbw 1, Rival1AI ; rival1
	dbw 3, ProfOakAI ; prof oak
	dbw 1, GenericAI ; chief
	dbw 3, GenericAI ; scientist
	dbw 2, GiovanniAI ; giovanni
	dbw 3, GenericAI ; rocket
	dbw 2, CooltrainerMAI ; cooltrainerm
	dbw 2, CooltrainerFAI ; cooltrainerf
	dbw 3, BrunoAI ; bruno
	dbw 2, BrockAI ; brock
	dbw 2, MistyAI ; misty
	dbw 2, LtSurgeAI ; surge
	dbw 2, ErikaAI ; erika
	dbw 2, KogaAI ; koga
	dbw 2, BlaineAI ; blaine
	dbw 2, SabrinaAI ; sabrina
	dbw 3, GenericAI ; gentleman
	dbw 2, Rival2AI ; rival2
	dbw 3, Rival3AI ; rival3
	dbw 3, LoreleiAI ; lorelei
	dbw 3, GenericAI ; channeler
	dbw 3, AgathaAI ; agatha
	dbw 3, LanceAI ; lance
	assert_table_length NUM_TRAINERS
