DEF OFF EQU $11
DEF ON  EQU $15

MACRO toggle_consts_for
	DEF TOGGLEMAP{\1}_ID EQU const_value
	DEF TOGGLEMAP{\1}_NAME EQUS "\1"
ENDM

; ToggleableObjectStates indexes (see data/maps/toggleable_objects.asm)
; This lists the object_events that can be toggled by ShowObject/HideObject.
; The constants marked with an X are never used, because those object_events
; are not toggled on/off in any map's script.
; (The X-ed ones are either items or static Pokemon encounters that deactivate
; after battle and are detected in wToggleableObjectList.)

	const_def

	toggle_consts_for PALLET_TOWN
	const TOGGLE_PALLET_TOWN_OAK              ; 00

	toggle_consts_for VIRIDIAN_CITY
	const TOGGLE_LYING_OLD_MAN                ; 01
	const TOGGLE_OLD_MAN_1                    ; 02
	const TOGGLE_OLD_MAN_2                    ; 03

	toggle_consts_for PEWTER_CITY
	const TOGGLE_MUSEUM_GUY                   ; 04
	const TOGGLE_GYM_GUY                      ; 05

	toggle_consts_for CERULEAN_CITY
	const TOGGLE_CERULEAN_RIVAL               ; 06
	const TOGGLE_CERULEAN_ROCKET              ; 07
	const TOGGLE_CERULEAN_GUARD_1             ; 08
	const TOGGLE_CERULEAN_CAVE_GUY            ; 09
	const TOGGLE_CERULEAN_GUARD_2             ; 0A

	toggle_consts_for SAFFRON_CITY
	const TOGGLE_SAFFRON_CITY_1               ; 0B
	const TOGGLE_SAFFRON_CITY_2               ; 0C
	const TOGGLE_SAFFRON_CITY_3               ; 0D
	const TOGGLE_SAFFRON_CITY_4               ; 0E
	const TOGGLE_SAFFRON_CITY_5               ; 0F
	const TOGGLE_SAFFRON_CITY_6               ; 10
	const TOGGLE_SAFFRON_CITY_7               ; 11
	const TOGGLE_SAFFRON_CITY_8               ; 12
	const TOGGLE_SAFFRON_CITY_9               ; 13
	const TOGGLE_SAFFRON_CITY_A               ; 14
	const TOGGLE_SAFFRON_CITY_B               ; 15
	const TOGGLE_SAFFRON_CITY_C               ; 16
	const TOGGLE_SAFFRON_CITY_D               ; 17
	const TOGGLE_SAFFRON_CITY_E               ; 18
	const TOGGLE_SAFFRON_CITY_F               ; 19

	toggle_consts_for ROUTE_2
	const TOGGLE_ROUTE_2_ITEM_1               ; 1A X
	const TOGGLE_ROUTE_2_ITEM_2               ; 1B X

	toggle_consts_for ROUTE_4
	const TOGGLE_ROUTE_4_ITEM                 ; 1C X

	toggle_consts_for ROUTE_9
	const TOGGLE_ROUTE_9_ITEM                 ; 1D X

	toggle_consts_for ROUTE_12
	const TOGGLE_ROUTE_12_SNORLAX             ; 1E
	const TOGGLE_ROUTE_12_ITEM_1              ; 1F X
	const TOGGLE_ROUTE_12_ITEM_2              ; 20 X

	toggle_consts_for ROUTE_15
	const TOGGLE_ROUTE_15_ITEM                ; 21 X

	toggle_consts_for ROUTE_16
	const TOGGLE_ROUTE_16_SNORLAX             ; 22

	toggle_consts_for ROUTE_22
	const TOGGLE_ROUTE_22_RIVAL_1             ; 23
	const TOGGLE_ROUTE_22_RIVAL_2             ; 24
	const TOGGLE_ROUTE_22_OAK                 ; 25

	toggle_consts_for ROUTE_24
	const TOGGLE_NUGGET_BRIDGE_GUY            ; 26
	const TOGGLE_ROUTE_24_ITEM                ; 27 X

	toggle_consts_for ROUTE_25
	const TOGGLE_ROUTE_25_ITEM                ; 28 X

	toggle_consts_for BLUES_HOUSE
	const TOGGLE_DAISY_SITTING                ; 29
	const TOGGLE_DAISY_WALKING                ; 2A
	const TOGGLE_TOWN_MAP                     ; 2B

	toggle_consts_for OAKS_LAB
	const TOGGLE_OAKS_LAB_RIVAL               ; 2C
	const TOGGLE_STARTER_BALL_1               ; 2D
	const TOGGLE_OAKS_LAB_OAK_1               ; 2E
	const TOGGLE_POKEDEX_1                    ; 2F
	const TOGGLE_POKEDEX_2                    ; 30
	const TOGGLE_OAKS_LAB_OAK_2               ; 31

	toggle_consts_for VIRIDIAN_GYM
	const TOGGLE_VIRIDIAN_GYM_GIOVANNI        ; 32
	const TOGGLE_VIRIDIAN_GYM_ITEM            ; 33 X

	toggle_consts_for MUSEUM_1F
	const TOGGLE_OLD_AMBER                    ; 34

	toggle_consts_for CERULEAN_MELANIES_HOUSE
	const TOGGLE_CERULEAN_BULBASAUR           ; 35

	toggle_consts_for CERULEAN_CAVE_1F
	const TOGGLE_CERULEAN_CAVE_1F_ITEM_1      ; 36 X
	const TOGGLE_CERULEAN_CAVE_1F_ITEM_2      ; 37 X
	const TOGGLE_CERULEAN_CAVE_1F_ITEM_3      ; 38 X
	const TOGGLE_CERULEAN_CAVE_1F_ITEM_4      ; 39 X
	const TOGGLE_CERULEAN_CAVE_1F_OAK         ; 3A

	toggle_consts_for POKEMON_TOWER_2F
	const TOGGLE_POKEMON_TOWER_2F_RIVAL       ; 3B

	toggle_consts_for POKEMON_TOWER_3F
	const TOGGLE_POKEMON_TOWER_3F_ITEM        ; 3C X

	toggle_consts_for POKEMON_TOWER_4F
	const TOGGLE_POKEMON_TOWER_4F_ITEM_1      ; 3D X
	const TOGGLE_POKEMON_TOWER_4F_ITEM_2      ; 3E X
	const TOGGLE_POKEMON_TOWER_4F_ITEM_3      ; 3F X

	toggle_consts_for POKEMON_TOWER_5F
	const TOGGLE_POKEMON_TOWER_5F_ITEM        ; 40 X

	toggle_consts_for POKEMON_TOWER_6F
	const TOGGLE_POKEMON_TOWER_6F_ITEM_1      ; 41 X
	const TOGGLE_POKEMON_TOWER_6F_ITEM_2      ; 42 X

	toggle_consts_for POKEMON_TOWER_7F
	const TOGGLE_POKEMON_TOWER_7F_JESSIE      ; 43
	const TOGGLE_POKEMON_TOWER_7F_JAMES       ; 44
	const TOGGLE_POKEMON_TOWER_7F_MR_FUJI     ; 45

	toggle_consts_for MR_FUJIS_HOUSE
	const TOGGLE_MR_FUJIS_HOUSE_MR_FUJI       ; 46

	toggle_consts_for CELADON_MANSION_ROOF_HOUSE
	const TOGGLE_CELADON_MANSION_EEVEE_GIFT   ; 47

	toggle_consts_for GAME_CORNER
	const TOGGLE_GAME_CORNER_ROCKET           ; 48

	toggle_consts_for WARDENS_HOUSE
	const TOGGLE_WARDENS_HOUSE_ITEM           ; 49 X

	toggle_consts_for POKEMON_MANSION_1F
	const TOGGLE_POKEMON_MANSION_1F_ITEM_1    ; 4A X
	const TOGGLE_POKEMON_MANSION_1F_ITEM_2    ; 4B X

	toggle_consts_for FIGHTING_DOJO
	const TOGGLE_FIGHTING_DOJO_GIFT_1         ; 4C
	const TOGGLE_FIGHTING_DOJO_GIFT_2         ; 4D

	toggle_consts_for SILPH_CO_1F
	const TOGGLE_SILPH_CO_1F_RECEPTIONIST     ; 4E

	toggle_consts_for POWER_PLANT
	const TOGGLE_VOLTORB_1                    ; 4F X
	const TOGGLE_VOLTORB_2                    ; 50 X
	const TOGGLE_VOLTORB_3                    ; 51 X
	const TOGGLE_ELECTRODE_1                  ; 52 X
	const TOGGLE_VOLTORB_4                    ; 53 X
	const TOGGLE_VOLTORB_5                    ; 54 X
	const TOGGLE_ELECTRODE_2                  ; 55 X
	const TOGGLE_VOLTORB_6                    ; 56 X
	const TOGGLE_ZAPDOS                       ; 57 X
	const TOGGLE_POWER_PLANT_ITEM_1           ; 58 X
	const TOGGLE_POWER_PLANT_ITEM_2           ; 59 X
	const TOGGLE_POWER_PLANT_ITEM_3           ; 5A X
	const TOGGLE_POWER_PLANT_ITEM_4           ; 5B X
	const TOGGLE_POWER_PLANT_ITEM_5           ; 5C X

	toggle_consts_for VICTORY_ROAD_2F
	const TOGGLE_MOLTRES                      ; 5D X
	const TOGGLE_VICTORY_ROAD_2F_ITEM_1       ; 5E X
	const TOGGLE_VICTORY_ROAD_2F_ITEM_2       ; 5F X
	const TOGGLE_VICTORY_ROAD_2F_ITEM_3       ; 60 X
	const TOGGLE_VICTORY_ROAD_2F_ITEM_4       ; 61 X
	const TOGGLE_VICTORY_ROAD_2F_BOULDER      ; 62

	toggle_consts_for BILLS_HOUSE
	const TOGGLE_BILL_POKEMON                 ; 63
	const TOGGLE_BILL_1                       ; 64
	const TOGGLE_BILL_2                       ; 65

	toggle_consts_for VIRIDIAN_FOREST
	const TOGGLE_VIRIDIAN_FOREST_ITEM_1       ; 66 X
	const TOGGLE_VIRIDIAN_FOREST_ITEM_2       ; 67 X
	const TOGGLE_VIRIDIAN_FOREST_ITEM_3       ; 68 X

	toggle_consts_for MT_MOON_1F
	const TOGGLE_MT_MOON_1F_ITEM_1            ; 69 X
	const TOGGLE_MT_MOON_1F_ITEM_2            ; 6A X
	const TOGGLE_MT_MOON_1F_ITEM_3            ; 6B X
	const TOGGLE_MT_MOON_1F_ITEM_4            ; 6C X
	const TOGGLE_MT_MOON_1F_ITEM_5            ; 6D X
	const TOGGLE_MT_MOON_1F_ITEM_6            ; 6E X

	toggle_consts_for MT_MOON_B2F
	const TOGGLE_MT_MOON_B2F_JESSIE           ; 6F
	const TOGGLE_MT_MOON_B2F_JAMES            ; 70
	const TOGGLE_MT_MOON_B2F_FOSSIL_1         ; 71
	const TOGGLE_MT_MOON_B2F_FOSSIL_2         ; 72
	const TOGGLE_MT_MOON_B2F_ITEM_1           ; 73 X
	const TOGGLE_MT_MOON_B2F_ITEM_2           ; 74 X

	toggle_consts_for SS_ANNE_2F
	const TOGGLE_SS_ANNE_2F_RIVAL             ; 75

	toggle_consts_for SS_ANNE_1F_ROOMS
	const TOGGLE_SS_ANNE_1F_ROOMS_ITEM        ; 76 X

	toggle_consts_for SS_ANNE_2F_ROOMS
	const TOGGLE_SS_ANNE_2F_ROOMS_ITEM_1      ; 77 X
	const TOGGLE_SS_ANNE_2F_ROOMS_ITEM_2      ; 78 X

	toggle_consts_for SS_ANNE_B1F_ROOMS
	const TOGGLE_SS_ANNE_B1F_ROOMS_ITEM_1     ; 79 X
	const TOGGLE_SS_ANNE_B1F_ROOMS_ITEM_2     ; 7A X
	const TOGGLE_SS_ANNE_B1F_ROOMS_ITEM_3     ; 7B X

	toggle_consts_for VICTORY_ROAD_3F
	const TOGGLE_VICTORY_ROAD_3F_ITEM_1       ; 7C X
	const TOGGLE_VICTORY_ROAD_3F_ITEM_2       ; 7D X
	const TOGGLE_VICTORY_ROAD_3F_BOULDER      ; 7E

	toggle_consts_for ROCKET_HIDEOUT_B1F
	const TOGGLE_ROCKET_HIDEOUT_B1F_ITEM_1    ; 7F X
	const TOGGLE_ROCKET_HIDEOUT_B1F_ITEM_2    ; 80 X

	toggle_consts_for ROCKET_HIDEOUT_B2F
	const TOGGLE_ROCKET_HIDEOUT_B2F_ITEM_1    ; 81 X
	const TOGGLE_ROCKET_HIDEOUT_B2F_ITEM_2    ; 82 X
	const TOGGLE_ROCKET_HIDEOUT_B2F_ITEM_3    ; 83 X
	const TOGGLE_ROCKET_HIDEOUT_B2F_ITEM_4    ; 84 X

	toggle_consts_for ROCKET_HIDEOUT_B3F
	const TOGGLE_ROCKET_HIDEOUT_B3F_ITEM_1    ; 85 X
	const TOGGLE_ROCKET_HIDEOUT_B3F_ITEM_2    ; 86 X

	toggle_consts_for ROCKET_HIDEOUT_B4F
	const TOGGLE_ROCKET_HIDEOUT_B4F_GIOVANNI  ; 87
	const TOGGLE_ROCKET_HIDEOUT_B4F_JAMES     ; 88
	const TOGGLE_ROCKET_HIDEOUT_B4F_JESSIE    ; 89
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_1    ; 8A X
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_2    ; 8B X
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_3    ; 8C X
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_4    ; 8D
	const TOGGLE_ROCKET_HIDEOUT_B4F_ITEM_5    ; 8E

	toggle_consts_for SILPH_CO_2F
	const TOGGLE_SILPH_CO_2F_1                 ; 8D XXX never (de)activated?
	const TOGGLE_SILPH_CO_2F_2                ; 8F
	const TOGGLE_SILPH_CO_2F_3                ; 90
	const TOGGLE_SILPH_CO_2F_4                ; 91
	const TOGGLE_SILPH_CO_2F_5                ; 92

	toggle_consts_for SILPH_CO_3F
	const TOGGLE_SILPH_CO_3F_1                ; 93
	const TOGGLE_SILPH_CO_3F_2                ; 94
	const TOGGLE_SILPH_CO_3F_ITEM             ; 95 X

	toggle_consts_for SILPH_CO_4F
	const TOGGLE_SILPH_CO_4F_1                ; 96
	const TOGGLE_SILPH_CO_4F_2                ; 97
	const TOGGLE_SILPH_CO_4F_3                ; 98
	const TOGGLE_SILPH_CO_4F_ITEM_1           ; 99 X
	const TOGGLE_SILPH_CO_4F_ITEM_2           ; 9A X
	const TOGGLE_SILPH_CO_4F_ITEM_3           ; 9B X

	toggle_consts_for SILPH_CO_5F
	const TOGGLE_SILPH_CO_5F_1                ; 9C
	const TOGGLE_SILPH_CO_5F_2                ; 9D
	const TOGGLE_SILPH_CO_5F_3                ; 9E
	const TOGGLE_SILPH_CO_5F_4                ; 9F
	const TOGGLE_SILPH_CO_5F_ITEM_1           ; A0 X
	const TOGGLE_SILPH_CO_5F_ITEM_2           ; A1 X
	const TOGGLE_SILPH_CO_5F_ITEM_3           ; A2 X

	toggle_consts_for SILPH_CO_6F
	const TOGGLE_SILPH_CO_6F_1                ; A3
	const TOGGLE_SILPH_CO_6F_2                ; A4
	const TOGGLE_SILPH_CO_6F_3                ; A5
	const TOGGLE_SILPH_CO_6F_ITEM_1           ; A6 X
	const TOGGLE_SILPH_CO_6F_ITEM_2           ; A7 X

	toggle_consts_for SILPH_CO_7F
	const TOGGLE_SILPH_CO_7F_1                ; A8
	const TOGGLE_SILPH_CO_7F_2                ; A9
	const TOGGLE_SILPH_CO_7F_3                ; AA
	const TOGGLE_SILPH_CO_7F_4                ; AB
	const TOGGLE_SILPH_CO_7F_RIVAL            ; AC
	const TOGGLE_SILPH_CO_7F_ITEM_1           ; AD X
	const TOGGLE_SILPH_CO_7F_ITEM_2           ; AE X
	const TOGGLE_SILPH_CO_7F_8                 ; AE XXX sprite doesn't exist

	toggle_consts_for SILPH_CO_8F
	const TOGGLE_SILPH_CO_8F_1                ; AF
	const TOGGLE_SILPH_CO_8F_2                ; B0
	const TOGGLE_SILPH_CO_8F_3                ; B1

	toggle_consts_for SILPH_CO_9F
	const TOGGLE_SILPH_CO_9F_1                ; B2
	const TOGGLE_SILPH_CO_9F_2                ; B3
	const TOGGLE_SILPH_CO_9F_3                ; B4

	toggle_consts_for SILPH_CO_10F
	const TOGGLE_SILPH_CO_10F_1               ; B5
	const TOGGLE_SILPH_CO_10F_2               ; B6
	const TOGGLE_SILPH_CO_10F_3                ; B7 XXX never (de)activated?
	const TOGGLE_SILPH_CO_10F_ITEM_1          ; B7 X
	const TOGGLE_SILPH_CO_10F_ITEM_2          ; B8 X
	const TOGGLE_SILPH_CO_10F_ITEM_3          ; B9 X

	toggle_consts_for SILPH_CO_11F
	const TOGGLE_SILPH_CO_11F_1               ; BA
	const TOGGLE_SILPH_CO_11F_JAMES           ; BB
	const TOGGLE_SILPH_CO_11F_2               ; BC
	const TOGGLE_SILPH_CO_11F_JESSIE          ; BD

	toggle_consts_for UNUSED_MAP_F4
	const TOGGLE_UNUSED_MAP_F4_1               ; BF XXX sprite doesn't exist

	toggle_consts_for POKEMON_MANSION_2F
	const TOGGLE_POKEMON_MANSION_2F_ITEM      ; BE X

	toggle_consts_for POKEMON_MANSION_3F
	const TOGGLE_POKEMON_MANSION_3F_ITEM_1    ; BF X
	const TOGGLE_POKEMON_MANSION_3F_ITEM_2    ; C0 X

	toggle_consts_for POKEMON_MANSION_B1F
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_1   ; C1 X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_2   ; C2 X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_3   ; C3 X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_4   ; C4 X
	const TOGGLE_POKEMON_MANSION_B1F_ITEM_5   ; C5 X

	toggle_consts_for SAFARI_ZONE_EAST
	const TOGGLE_SAFARI_ZONE_EAST_ITEM_1      ; C6 X
	const TOGGLE_SAFARI_ZONE_EAST_ITEM_2      ; C7 X
	const TOGGLE_SAFARI_ZONE_EAST_ITEM_3      ; C8 X
	const TOGGLE_SAFARI_ZONE_EAST_ITEM_4      ; C9 X

	toggle_consts_for SAFARI_ZONE_NORTH
	const TOGGLE_SAFARI_ZONE_NORTH_ITEM_1     ; CA X
	const TOGGLE_SAFARI_ZONE_NORTH_ITEM_2     ; CB X

	toggle_consts_for SAFARI_ZONE_WEST
	const TOGGLE_SAFARI_ZONE_WEST_ITEM_1      ; CC X
	const TOGGLE_SAFARI_ZONE_WEST_ITEM_2      ; CD X
	const TOGGLE_SAFARI_ZONE_WEST_ITEM_3      ; CE X
	const TOGGLE_SAFARI_ZONE_WEST_ITEM_4      ; CF X

	toggle_consts_for SAFARI_ZONE_CENTER
	const TOGGLE_SAFARI_ZONE_CENTER_ITEM      ; D0 X

	toggle_consts_for CERULEAN_CAVE_2F
	const TOGGLE_CERULEAN_CAVE_2F_ITEM_1      ; D1 X
	const TOGGLE_CERULEAN_CAVE_2F_ITEM_2      ; D2 X
	const TOGGLE_CERULEAN_CAVE_2F_ITEM_3      ; D3 X
	const TOGGLE_CERULEAN_CAVE_2F_ITEM_4      ; D4 X

	toggle_consts_for CERULEAN_CAVE_B1F
	const TOGGLE_MEWTWO                       ; D5 X
	const TOGGLE_CERULEAN_CAVE_B1F_ITEM_1     ; D6 X
	const TOGGLE_CERULEAN_CAVE_B1F_ITEM_2     ; D7 X
	const TOGGLE_CERULEAN_CAVE_B1F_ITEM_3     ; D8 X
	const TOGGLE_CERULEAN_CAVE_B1F_ITEM_4     ; D9 X

	toggle_consts_for VICTORY_ROAD_1F
	const TOGGLE_VICTORY_ROAD_1F_ITEM_1       ; DA X
	const TOGGLE_VICTORY_ROAD_1F_ITEM_2       ; DB X

	toggle_consts_for CHAMPIONS_ROOM
	const TOGGLE_CHAMPIONS_ROOM_OAK           ; DC

	toggle_consts_for SEAFOAM_ISLANDS_1F
	const TOGGLE_SEAFOAM_ISLANDS_1F_BOULDER_1 ; DD
	const TOGGLE_SEAFOAM_ISLANDS_1F_BOULDER_2 ; DE

	toggle_consts_for SEAFOAM_ISLANDS_B1F
	const TOGGLE_SEAFOAM_ISLANDS_B1F_BOULDER_1 ; DF
	const TOGGLE_SEAFOAM_ISLANDS_B1F_BOULDER_2 ; E0

	toggle_consts_for SEAFOAM_ISLANDS_B2F
	const TOGGLE_SEAFOAM_ISLANDS_B2F_BOULDER_1 ; E1
	const TOGGLE_SEAFOAM_ISLANDS_B2F_BOULDER_2 ; E2

	toggle_consts_for SEAFOAM_ISLANDS_B3F
	const TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_1 ; E3
	const TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_2 ; E4
	const TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_3 ; E5
	const TOGGLE_SEAFOAM_ISLANDS_B3F_BOULDER_4 ; E6

	toggle_consts_for SEAFOAM_ISLANDS_B4F
	const TOGGLE_SEAFOAM_ISLANDS_B4F_BOULDER_1 ; E7
	const TOGGLE_SEAFOAM_ISLANDS_B4F_BOULDER_2 ; E8
	const TOGGLE_ARTICUNO                     ; E9 X

	const TOGGLE_DAISY_SITTING_COPY           ; EA
	const TOGGLE_DAISY_WALKING_COPY           ; EB
	const TOGGLE_TOWN_MAP_COPY                ; EC

DEF NUM_TOGGLEABLE_OBJECTS EQU const_value
