CreditsTextPointers:
; entries correspond to CRED_* constants
	table_width 2
	dw CreditsText_Version
	dw CreditsText_Tajiri
	dw CreditsText_Oota
	dw CreditsText_Morimoto
	dw CreditsText_Watanabe
	dw CreditsText_Masuda
	dw CreditsText_Nishino
	dw CreditsText_Sugimori
	dw CreditsText_Nishida
	dw CreditsText_Miyamoto
	dw CreditsText_Kawaguchi
	dw CreditsText_Ishihara
	dw CreditsText_Yamauchi
	dw CreditsText_Zinnai
	dw CreditsText_Hishida
	dw CreditsText_Sakai
	dw CreditsText_Yamaguchi
	dw CreditsText_Yamamoto
	dw CreditsText_Taniguchi
	dw CreditsText_Nonomura
	dw CreditsText_Fuziwara
	dw CreditsText_Matsusima
	dw CreditsText_Tomisawa
	dw CreditsText_Kawamoto
	dw CreditsText_Kakei
	dw CreditsText_Tsuchiya
	dw CreditsText_Nakamura
	dw CreditsText_Yuda
	dw CreditsText_Pokemon
	dw CreditsText_Director
	dw CreditsText_Programmers
	dw CreditsText_CharacterDesign
	dw CreditsText_Music
	dw CreditsText_SoundEffects
	dw CreditsText_GameDesign
	dw CreditsText_MonsterDesign
	dw CreditsText_GameScenario
	dw CreditsText_ParametricDesign
	dw CreditsText_MapDesign
	dw CreditsText_Testing
	dw CreditsText_SpecialThanks
	dw CreditsText_Producer
	dw CreditsText_ExecutiveProducer
	dw CreditsText_Tamada
	dw CreditsText_Oota2
	dw CreditsText_Yoshikawa
	dw CreditsText_Oota23
	dw CreditsText_Yoshida
	dw CreditsText_Matsumiya
	dw CreditsText_Seya
	dw CreditsText_Sekine
	dw CreditsText_Shimamura
	dw CreditsText_Shimoyamada
	dw CreditsText_SuperMarioClub
	dw CreditsText_Izushi
	dw CreditsText_Nomura
	dw CreditsText_Harada
	dw CreditsText_Yamagami
	dw CreditsText_Nishimura
	dw CreditsText_Saeki
	dw CreditsText_Fuzii
	dw CreditsText_Shogakukan
	dw CreditsText_Ootani
	dw CreditsText_PikachuVoice
	dw CreditsText_USStaff
	dw CreditsText_USCoord
	dw CreditsText_Tilden
	dw CreditsText_Kawakami
	dw CreditsText_Nakamura2
	dw CreditsText_Shoemake
	dw CreditsText_Osborne
	dw CreditsText_Translation
	dw CreditsText_Ogasawara
	dw CreditsText_Iwata
	dw CreditsText_Izushi2
	dw CreditsText_Harada2
	dw CreditsText_Murakawa
	dw CreditsText_Fukui
	dw CreditsText_SuperMarioClub2
	dw CreditsText_Paad
	dw CreditsText_Producers
	dw CreditsText_Hosokawa
	dw CreditsText_Okubo
	dw CreditsText_Nakamichi
	dw CreditsText_Yoshimura
	dw CreditsText_Yamazaki
	assert_table_length NUM_CRED_STRINGS

CreditsText_Version:
	db -6, "Yellow Version"
	next   "    Staff@"
CreditsText_Tajiri:
	db -6, "Satoshi Tajiri@"
CreditsText_Oota:
	db -6, "Takenori Oota@"
CreditsText_Morimoto:
	db -7, "Shigeki Morimoto@"
CreditsText_Watanabe:
	db -7, "Tetsuya Watanabe@"
CreditsText_Masuda:
	db -6, "Junichi Masuda@"
CreditsText_Nishino:
	db -5, "Kohji Nishino@"
CreditsText_Sugimori:
	db -5, "Ken Sugimori@"
CreditsText_Nishida:
	db -6, "Atsuko Nishida@"
CreditsText_Miyamoto:
	db -7, "Shigeru Miyamoto@"
CreditsText_Kawaguchi:
	db -8, "Takashi Kawaguchi@"
CreditsText_Ishihara:
	db -8, "Tsunekazu Ishihara@"
CreditsText_Yamauchi:
	db -7, "Hiroshi Yamauchi@"
CreditsText_Zinnai:
	db -7, "Hiroyuki Zinnai@"
CreditsText_Hishida:
	db -7, "Tatsuya Hishida@"
CreditsText_Sakai:
	db -6, "Yasuhiro Sakai@"
CreditsText_Yamaguchi:
	db -7, "Wataru Yamaguchi@"
CreditsText_Yamamoto:
	db -8, "Kazuyuki Yamamoto@"
CreditsText_Taniguchi:
	db -8, "Ryohsuke Taniguchi@"
CreditsText_Nonomura:
	db -8, "Fumihiro Nonomura@"
CreditsText_Fuziwara:
	db -7, "Motofumi Fuziwara@"
CreditsText_Matsusima:
	db -7, "Kenji Matsusima@"
CreditsText_Tomisawa:
	db -7, "Akihito Tomisawa@"
CreditsText_Kawamoto:
	db -7, "Hiroshi Kawamoto@"
CreditsText_Kakei:
	db -6, "Akiyoshi Kakei@"
CreditsText_Tsuchiya:
	db -7, "Kazuki Tsuchiya@"
CreditsText_Nakamura:
	db -6, "Takeo Nakamura@"
CreditsText_Yuda:
	db -6, "Masamitsu Yuda@"
CreditsText_Pokemon:
	db -3, "#mon@"
CreditsText_Director:
	db -3, "Director@"
CreditsText_Programmers:
	db -5, "Programmers@"
CreditsText_CharacterDesign:
	db -7, "Character Design@"
CreditsText_Music:
	db -2, "Music@"
CreditsText_SoundEffects:
	db -6, "Sound Effects@"
CreditsText_GameDesign:
	db -5, "Game Design@"
CreditsText_MonsterDesign:
	db -6, "Monster Design@"
CreditsText_GameScenario:
	db -6, "Game Scenario@"
CreditsText_ParametricDesign:
	db -7, "Parametric Design@"
CreditsText_MapDesign:
	db -4, "Map Design@"
CreditsText_Testing:
	db -6, "Product Testing@"
CreditsText_SpecialThanks:
	db -6, "Special Thanks@"
CreditsText_Producers:
	db -4, "Producers@"
CreditsText_Producer:
	db -3, "Producer@"
CreditsText_ExecutiveProducer:
	db -8, "Executive Producer@"
CreditsText_Tamada:
	db -6, "Sousuke Tamada@"
CreditsText_Oota2:
	db -5, "Satoshi Oota@"
CreditsText_Yoshikawa:
	db -6, "Rena Yoshikawa@"
CreditsText_Oota23:
	db -6, "Tomomichi Oota@"
CreditsText_Matsumiya:
	db -8, "Toshinobu Matsumiya@"
CreditsText_Seya:
	db -5, "Nobuhiro Seya@"
CreditsText_Yoshida:
	db -7, "Hironobu Yoshida@"
CreditsText_Sekine:
	db -6, "Kazuhito Sekine@"
CreditsText_Shimamura:
	db -7, "Kazushi Shimamura@"
CreditsText_Shimoyamada:
	db -9, "Teruyuki Shimoyamada@"
CreditsText_SuperMarioClub:
	db -9, "NCL Super Mario Club@"
CreditsText_Izushi:
	db -7, "Takehiro Izushi@"
CreditsText_Nomura:
	db -5, "Fuziko Nomura@"
CreditsText_Harada:
	db -6, "Takahiro Harada@"
CreditsText_Yamagami:
	db -7, "Hitoshi Yamagami@"
CreditsText_Nishimura:
	db -8, "Kentarou Nishimura@"
CreditsText_Saeki:
	db -5, "Naoko Saeki@"
CreditsText_Fuzii:
	db -5, "Takaya Fuzii@"
CreditsText_Shogakukan:
	db -4, "Shogakukan"
	next   "Production@"
CreditsText_Ootani:
	db -5, "Ikue Ootani@"
CreditsText_PikachuVoice:
	db -6, "Pikachu Voice@"

	db -3, "××××××××@"
CreditsText_USStaff:
	db -7, "US Version Staff@"
CreditsText_USCoord:
	db -7, "US Coordination@"
CreditsText_Tilden:
	db -5, "Gail Tilden@"
CreditsText_Kawakami:
	db -6, "Naoko Kawakami@"
CreditsText_Nakamura2:
	db -6, "Hiro Nakamura@"
CreditsText_Shoemake:
	db -6, "Randy Shoemake@"
CreditsText_Osborne:
	db -5, "Sara Osborne@"
CreditsText_Translation:
	db -7, "Text Translation@"
CreditsText_Ogasawara:
	db -6, "Nob Ogasawara@"
CreditsText_Iwata:
	db -5, "Satoru Iwata@"
CreditsText_Izushi2:
	db -7, "Takehiro Izushi@"
CreditsText_Harada2:
	db -7, "Takahiro Harada@"
CreditsText_Murakawa:
	db -7, "Teruki Murakawa@"
CreditsText_Fukui:
	db -5, "Kohta Fukui@"
CreditsText_SuperMarioClub2:
	db -9, "NCL Super Mario Club@"
CreditsText_Paad:
	db -5, "PAAD Testing@"
CreditsText_Hosokawa:
	db -8, "Takehiko Hosokawa@"
CreditsText_Okubo:
	db -5, "Kenji Okubo@"
CreditsText_Nakamichi:
	db -7, "Kimiko Nakamichi@"
CreditsText_Yoshimura:
	db -6, "Kamon Yoshimura@"
CreditsText_Yamazaki:
	db -6, "Sakae Yamazaki@"
