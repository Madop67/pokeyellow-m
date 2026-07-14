; Stats that move effects can raise or lower
; Indexed by stat mod index (see MOD_* constants)

StatModTextStrings:
	list_start STAT_NAME_LENGTH - 1
	li "ATTACK"
	li "DEFENSE"
	li "SPEED"
	li "SPCL.ATK"
	li "SPCL.DEF"
	li "ACCURACY"
	li "EVADE"
	assert_list_length NUM_STAT_MODS - 1 ; one byte is unused
