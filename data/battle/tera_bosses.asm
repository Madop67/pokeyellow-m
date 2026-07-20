; Boss trainers whose last party mon (the ace) terastallizes on send-out.
; Aces cross-checked against docs/trainer_reference.md.
; table format: trainer class, trainer instance number, tera type
BossTeraTable:
	db BROCK,    1, ROCK         ; Onix
	db MISTY,    1, LIGHT        ; Starmie
	db LT_SURGE, 1, ELECTRIC     ; Raichu
	db ERIKA,    1, GRASS        ; Gloom
	db KOGA,     1, SOUND        ; Venomoth
	db BLAINE,   1, FIRE         ; Arcanine
	db SABRINA,  1, PSYCHIC_TYPE ; Alakazam
	db GIOVANNI, 1, NORMAL       ; Rocket Hideout Persian
	db GIOVANNI, 2, GROUND       ; Silph Co. Nidoqueen
	db GIOVANNI, 3, GROUND       ; Viridian Gym Rhydon
	db LORELEI,  1, ICE          ; Lapras
	db BRUNO,    1, FIGHTING     ; Machamp
	db AGATHA,   1, FAIRY        ; Gengar
	db LANCE,    1, STELLAR       ; Dragonite
	; rival fights (instance 1 of RIVAL1, Oak's Lab, predates the Tera Orb)
	db RIVAL1,   2, NORMAL       ; Route 22 Eevee
	db RIVAL1,   3, NORMAL       ; Cerulean City Eevee
	db RIVAL2,   1, NORMAL       ; SS Anne Eevee
	db RIVAL2,   2, NORMAL       ; Pokémon Tower Eevee
	db RIVAL2,   3, NORMAL       ; Pokémon Tower Eevee
	db RIVAL2,   4, NORMAL       ; Pokémon Tower Eevee
	db RIVAL2,   5, ELECTRIC     ; Silph Co. Jolteon
	db RIVAL2,   6, FIRE         ; Silph Co. Flareon
	db RIVAL2,   7, WATER        ; Silph Co. Vaporeon
	db RIVAL2,   8, ELECTRIC     ; Route 22 rematch Jolteon
	db RIVAL2,   9, FIRE         ; Route 22 rematch Flareon
	db RIVAL2,  10, WATER        ; Route 22 rematch Vaporeon
	db RIVAL3,   1, ELECTRIC     ; Champion Jolteon
	db RIVAL3,   2, FIRE         ; Champion Flareon
	db RIVAL3,   3, WATER        ; Champion Vaporeon
	db -1 ; end
