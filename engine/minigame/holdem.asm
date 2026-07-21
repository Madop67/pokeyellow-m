; Texas Hold'em poker minigame.
;
; A self-contained, screen-takeover minigame modeled on the slot machine
; (engine/slots/slot_machine.asm) and Surfing Pikachu minigame. Two entry
; points, both reached via `callfar` from NPC text scripts:
;   HoldemDealer - heads-up (you vs. dealer), player picks money or coins.
;   HoldemTable  - 4-max table (you + 3 AI), coins only.
;
; Cards are rendered with the standard font (rank glyph + suit letter), so no
; custom tile graphics are needed. All game state lives in the wHoldem* block
; (ram/wram.asm), which is overlaid on the overworld-map buffer exactly like the
; surfing minigame; the map is rebuilt on exit via ReloadMapAfterPrinter.
;
; Card byte = rank | (suit << 4). rank 0..12 (2=0 .. A=12); suit 0..3.
; Chip amounts are 4-byte BCD internally, currency-agnostic; the player's real
; wPlayerMoney / wPlayerCoins is only touched at buy-in and cash-out.
;
; Design simplifications (documented, acceptable for a casino minigame):
;   - Single main pot only (no side pots). Correct for heads-up; for 4-max an
;     all-in short of the bet is not split off into a side pot.
;   - Ties award the whole pot to the lowest-indexed tied seat (favours the
;     player in heads-up).
;   - Fixed-limit betting: fixed blinds, fixed raise increment each street,
;     capped raises per street.

; seat flag bits
DEF HOLDEM_FOLDED EQU 0
DEF HOLDEM_ALLIN  EQU 1
DEF HOLDEM_AI     EQU 2

DEF HOLDEM_MAX_RAISES EQU 4

; must match the array sizing in ram/wram.asm
DEF HOLDEM_MAX_SEATS EQU 4

; wHoldemScratch layout: [0..5] = packed-score nibbles, [6..15] = eval temps
DEF SC_QUAD  EQU 6
DEF SC_TRIP1 EQU 7
DEF SC_TRIP2 EQU 8
DEF SC_PAIR1 EQU 9
DEF SC_PAIR2 EQU 10
DEF SC_SLOT  EQU 11
DEF SC_SRC_L EQU 12
DEF SC_SRC_H EQU 13
DEF SC_EXCL1 EQU 14
DEF SC_EXCL2 EQU 15


; ============================================================================
; NPC entry points (callfar targets)
; ============================================================================

HoldemDealer::
	ld a, 2
	ld [wHoldemSeatCount], a
	ld hl, HoldemDealerIntroText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret nz ; chose No
	call HoldemChooseCurrency
	jp HoldemRunSession

HoldemTable::
	ld a, 4
	ld [wHoldemSeatCount], a
	xor a
	ld [wHoldemCurrencyMode], a ; coins
	ld hl, HoldemTableIntroText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	ret nz
	jp HoldemRunSession

; Ask MONEY (yes) or COINS (no); sets wHoldemCurrencyMode.
HoldemChooseCurrency:
	ld hl, HoldemChooseCurrencyText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	and a
	jr nz, .coins
	ld a, 1
	ld [wHoldemCurrencyMode], a
	ret
.coins
	xor a
	ld [wHoldemCurrencyMode], a
	ret

; Ask normal or 10x stakes; sets wHoldemStakesMode.
HoldemChooseStakes:
	ld hl, HoldemChooseStakesText
	call PrintText
	call YesNoChoice
	ld a, [wCurrentMenuItem]
	xor 1 ; menu item 0 (YES) -> high stakes (1)
	ld [wHoldemStakesMode], a
	ret

; Stakes-aware amount pointers -> hl. Clobber a only besides hl.
HoldemGetBuyinChips:
	ld hl, HoldemBuyinChips
	ld a, [wHoldemStakesMode]
	and a
	ret z
	ld hl, HoldemBuyinChips10x
	ret

HoldemGetSB:
	ld hl, HoldemSBAmount
	ld a, [wHoldemStakesMode]
	and a
	ret z
	ld hl, HoldemSBAmount10x
	ret

HoldemGetBB:
	ld hl, HoldemBBAmount
	ld a, [wHoldemStakesMode]
	and a
	ret z
	ld hl, HoldemBBAmount10x
	ret

; a = buy-in's leading BCD byte pair: $01 (100/…) or $10 (1000/…).
HoldemBuyinLeadByte:
	ld a, [wHoldemStakesMode]
	and a
	ld a, $01
	ret z
	ld a, $10
	ret


; ============================================================================
; Session lifecycle
; ============================================================================

HoldemRunSession:
	call HoldemChooseStakes
	; currency width for display / cash-out
	ld a, [wHoldemCurrencyMode]
	and a
	jr z, .coins
	ld a, 3
	ld [wHoldemChipWidth], a
	jr .widthDone
.coins
	ld a, 2
	ld [wHoldemChipWidth], a
.widthDone
	call HoldemBuyIn
	ret c ; not enough funds
	; --- screen takeover ---
	call SaveScreenTilesToBuffer2
	ld a, $ff
	ld [wUpdateSpritesEnabled], a
	call GBPalWhiteOutWithDelay3
	call ClearSprites
	call LoadFontTilePatterns
	call ClearScreen
	call RunDefaultPaletteCommand
	call GBPalNormal
	call HoldemInitSeats
	call HoldemSessionLoop
	call HoldemCashOut
	; --- teardown ---
	call GBPalWhiteOutWithDelay3
	ld a, 1
	ld [wUpdateSpritesEnabled], a
	call RunDefaultPaletteCommand
	call ReloadMapAfterPrinter ; rebuild the overworld map buffer we clobbered
	call LoadScreenTilesFromBuffer2
	call Delay3
	call GBPalNormal
	ret

; Give every seat a fresh buy-in stack; mark AI seats. Button starts at the last
; seat so the first AdvanceButton puts it on the player.
HoldemInitSeats:
	ld c, 0
.loop
	ld a, c
	call HoldemSeatStackPtr
	push bc
	ld d, h
	ld e, l
	call HoldemGetBuyinChips
	call HoldemCopyBCD4
	pop bc
	ld a, c
	call HoldemSeatFlagsPtr
	ld a, c
	and a
	jr z, .human
	ld a, 1 << HOLDEM_AI
	ld [hl], a
	jr .next
.human
	xor a
	ld [hl], a
.next
	inc c
	ld a, c
	ld hl, wHoldemSeatCount
	cp [hl]
	jr c, .loop
	ld a, [wHoldemSeatCount]
	dec a
	ld [wHoldemDealerBtn], a
	ret

HoldemSessionLoop:
.hand
	call HoldemPlayOneHand
	; player busted?
	xor a
	call HoldemSeatStackPtr
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	jr z, .end
	call HoldemAskAgain
	jr nc, .hand
.end
	ret


; ============================================================================
; Currency buy-in / cash-out (the only touches of real money/coins)
; ============================================================================

; Returns carry set (and prints a message) if the player can't afford buy-in;
; otherwise subtracts the buy-in from the chosen currency.
HoldemBuyIn:
	; stage the buy-in in WRAM: the SubBCD predef runs in another ROM bank,
	; so it cannot read bank-7 constants through hl
	call HoldemGetBuyinChips
	ld de, wHoldemTmpA
	call HoldemCopyBCD4
	ld a, [wHoldemCurrencyMode]
	and a
	jr z, .coins
	; money (3-byte BCD): need 100 (or 1000 at 10x)
	xor a
	ldh [hMoney], a
	ldh [hMoney + 2], a
	call HoldemBuyinLeadByte
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr c, .notEnough
	ld de, wPlayerMoney + 2
	ld hl, wHoldemTmpA + 3
	ld c, 3
	predef SubBCDPredef
	and a
	ret
.coins
	; coins (2-byte BCD): need 100 (or 1000 at 10x)
	call HoldemBuyinLeadByte
	ldh [hCoins], a
	xor a
	ldh [hCoins + 1], a
	call HasEnoughCoins
	jr c, .notEnough
	ld de, wPlayerCoins + 1
	ld hl, wHoldemTmpA + 3
	ld c, 2
	predef SubBCDPredef
	and a
	ret
.notEnough
	ld hl, HoldemNotEnoughText
	call PrintText
	scf
	ret

; Add the player's remaining stack (seat 0) back to the chosen currency.
; If the stack exceeds the currency's width, saturate to the currency max
; (AddBCD already saturates on overflow of the added bytes).
HoldemCashOut:
	ld a, [wHoldemCurrencyMode]
	and a
	jr z, .coins
	; money: add low 3 bytes of stack
	ld a, [wHoldemStack]
	and a
	jr nz, .maxMoney
	ld de, wPlayerMoney + 2
	ld hl, wHoldemStack + 3
	ld c, 3
	predef AddBCDPredef
	ret
.maxMoney
	ld a, $99
	ld [wPlayerMoney], a
	ld [wPlayerMoney + 1], a
	ld [wPlayerMoney + 2], a
	ret
.coins
	; coins: add low 2 bytes of stack
	ld a, [wHoldemStack]
	ld hl, wHoldemStack + 1
	or [hl]
	jr nz, .maxCoins
	ld de, wPlayerCoins + 1
	ld hl, wHoldemStack + 3
	ld c, 2
	predef AddBCDPredef
	ret
.maxCoins
	ld a, $99
	ld [wPlayerCoins], a
	ld [wPlayerCoins + 1], a
	ret


; ============================================================================
; One hand of poker
; ============================================================================

HoldemPlayOneHand:
	call HoldemRebuyAISeats
	call HoldemResetHandState
	call HoldemAdvanceButton
	call HoldemInitDeck
	call HoldemShuffleDeck
	call HoldemDealHoleCards
	; preflop
	call HoldemSetupPreflop
	call HoldemDrawTable
	call HoldemPreflopFirstActor
	call HoldemBettingRound
	jr c, .foldWin
	; flop
	ld a, 3
	call HoldemDealBoard
	call HoldemSetupPostflop
	call HoldemUpdateTable
	call HoldemPostflopFirstActor
	call HoldemBettingRound
	jr c, .foldWin
	; turn
	ld a, 1
	call HoldemDealBoard
	call HoldemSetupPostflop
	call HoldemUpdateTable
	call HoldemPostflopFirstActor
	call HoldemBettingRound
	jr c, .foldWin
	; river
	ld a, 1
	call HoldemDealBoard
	call HoldemSetupPostflop
	call HoldemUpdateTable
	call HoldemPostflopFirstActor
	call HoldemBettingRound
	jr c, .foldWin
	; showdown
	call HoldemDrawTableReveal
	call HoldemShowdown
	ret
.foldWin
	call HoldemUpdateTable
	call HoldemAwardPotToLastStanding
	ret

HoldemResetHandState:
	ld hl, wHoldemBoard
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	xor a
	ld [wHoldemBoardCount], a
	ld hl, wHoldemPot
	call HoldemZeroBCD4
	ld c, 0
.loop
	; keep only the AI flag
	ld a, c
	call HoldemSeatFlagsPtr
	ld a, [hl]
	and 1 << HOLDEM_AI
	ld [hl], a
	; hole = undealt
	ld a, c
	call HoldemSeatHolePtr
	ld a, $ff
	ld [hli], a
	ld [hl], a
	; street bet = 0
	ld a, c
	call HoldemSeatStreetBetPtr
	call HoldemZeroBCD4
	inc c
	ld a, c
	ld hl, wHoldemSeatCount
	cp [hl]
	jr c, .loop
	ret

; Refill any busted AI seat back to the buy-in (the house has an infinite roll).
HoldemRebuyAISeats:
	ld c, 0
.loop
	ld a, c
	call HoldemSeatFlagsPtr
	bit HOLDEM_AI, [hl]
	jr z, .next
	ld a, c
	call HoldemSeatStackPtr
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	jr nz, .next
	ld a, c
	call HoldemSeatStackPtr
	push bc
	ld d, h
	ld e, l
	call HoldemGetBuyinChips
	call HoldemCopyBCD4
	pop bc
.next
	inc c
	ld a, c
	ld hl, wHoldemSeatCount
	cp [hl]
	jr c, .loop
	ret

HoldemAdvanceButton:
	ld a, [wHoldemDealerBtn]
	call HoldemNextSeatIndex
	ld [wHoldemDealerBtn], a
	ret


; ============================================================================
; Deck: build, shuffle, deal
; ============================================================================

HoldemInitDeck:
	ld hl, wHoldemDeck
	ld d, 0 ; suit
.suitLoop
	ld e, 0 ; rank
.rankLoop
	ld a, d
	swap a
	or e
	ld [hli], a
	inc e
	ld a, e
	cp 13
	jr nz, .rankLoop
	inc d
	ld a, d
	cp 4
	jr nz, .suitLoop
	; reset deal pointer
	ld a, LOW(wHoldemDeck)
	ld [wHoldemDeckPtr], a
	ld a, HIGH(wHoldemDeck)
	ld [wHoldemDeckPtr + 1], a
	ret

; Fisher-Yates using Random + modulo-by-subtraction.
HoldemShuffleDeck:
	ld b, 51 ; i
.loop
	push bc
	call Random
	pop bc
	push bc
	ld c, b
	inc c ; modulus i+1
	call HoldemReduceMod ; a = a mod c
	pop bc ; b = i
	; swap deck[i] (b) and deck[j] (a)
	ld hl, wHoldemDeck
	ld e, a
	ld d, 0
	add hl, de ; &deck[j]
	push hl
	ld hl, wHoldemDeck
	ld e, b
	add hl, de ; &deck[i]
	pop de ; de = &deck[j]
	ld a, [hl]
	ld c, a
	ld a, [de]
	ld [hl], a
	ld a, c
	ld [de], a
	dec b
	ld a, b
	and a
	jr nz, .loop
	ret

; a = a mod c (c >= 1)
HoldemReduceMod:
.loop
	cp c
	ret c
	sub c
	jr .loop
	ret

; Returns the next card in a; advances the deal pointer. Preserves bc, de.
HoldemDealCard:
	ld a, [wHoldemDeckPtr]
	ld l, a
	ld a, [wHoldemDeckPtr + 1]
	ld h, a
	ld a, [hl]
	push af
	inc hl
	ld a, l
	ld [wHoldemDeckPtr], a
	ld a, h
	ld [wHoldemDeckPtr + 1], a
	pop af
	ret

HoldemDealHoleCards:
	ld c, 0
.loop
	ld a, c
	call HoldemSeatHolePtr
	push hl
	call HoldemDealCard
	pop hl
	ld [hli], a
	push hl
	call HoldemDealCard
	pop hl
	ld [hl], a
	inc c
	ld a, c
	ld hl, wHoldemSeatCount
	cp [hl]
	jr c, .loop
	ret

; a = number of board cards to deal (appended to wHoldemBoard).
HoldemDealBoard:
	ld b, a
	ld a, [wHoldemBoardCount]
	ld l, a
	ld h, 0
	ld de, wHoldemBoard
	add hl, de ; &board[boardCount]
.loop
	push hl
	push bc
	call HoldemDealCard
	pop bc
	pop hl
	ld [hli], a
	dec b
	jr nz, .loop
	ld a, l
	sub LOW(wHoldemBoard)
	ld [wHoldemBoardCount], a
	ret


; ============================================================================
; Blinds and street setup
; ============================================================================

HoldemSetupPreflop:
	xor a
	ld [wHoldemStreet], a
	ld [wHoldemRaiseCount], a
	ld [wHoldemActedMask], a
	call HoldemClearStreetBets
	call HoldemLoadRaiseIncr
	call HoldemPostBlinds
	ret

HoldemSetupPostflop:
	ld hl, wHoldemStreet
	inc [hl]
	xor a
	ld [wHoldemRaiseCount], a
	ld [wHoldemActedMask], a
	call HoldemClearStreetBets
	call HoldemLoadRaiseIncr
	ret

HoldemClearStreetBets:
	ld c, 0
.loop
	ld a, c
	call HoldemSeatStreetBetPtr
	call HoldemZeroBCD4
	inc c
	ld a, c
	ld hl, wHoldemSeatCount
	cp [hl]
	jr c, .loop
	ld hl, wHoldemBetToCall
	call HoldemZeroBCD4
	ret

HoldemLoadRaiseIncr:
	call HoldemGetBB
	ld de, wHoldemRaiseIncr
	call HoldemCopyBCD4
	ret

HoldemPostBlinds:
	ld a, [wHoldemSeatCount]
	cp 2
	jr nz, .multi
	; heads-up: small blind = button, big blind = the other seat
	ld a, [wHoldemDealerBtn]
	ld [wHoldemCurrentSeat], a
	call HoldemNextSeatIndex
	ld [wHoldemLastAggressor], a
	jr .have
.multi
	ld a, [wHoldemDealerBtn]
	call HoldemNextSeatIndex
	ld [wHoldemCurrentSeat], a ; small blind
	call HoldemNextSeatIndex
	ld [wHoldemLastAggressor], a ; big blind
.have
	; post small blind (current = SB seat)
	call HoldemGetSB
	ld de, wHoldemTmpA
	call HoldemCopyBCD4
	call HoldemMoveChips
	; post big blind
	ld a, [wHoldemLastAggressor]
	ld [wHoldemCurrentSeat], a
	call HoldemGetBB
	ld de, wHoldemTmpA
	call HoldemCopyBCD4
	call HoldemMoveChips
	; amount to call = big blind
	call HoldemGetBB
	ld de, wHoldemBetToCall
	call HoldemCopyBCD4
	ret

; Returns first preflop actor in a.
HoldemPreflopFirstActor:
	ld a, [wHoldemSeatCount]
	cp 2
	jr nz, .multi
	ld a, [wHoldemDealerBtn] ; heads-up: button acts first preflop
	ret
.multi
	ld a, [wHoldemLastAggressor] ; big blind
	call HoldemNextSeatIndex
	ret

; Returns first postflop actor in a (first non-folded seat after the button).
HoldemPostflopFirstActor:
	ld a, [wHoldemDealerBtn]
	call HoldemNextInHandSeat
	ret


; ============================================================================
; Betting round state machine
; ============================================================================

; a = first seat to act. Returns carry set if the hand ended by folds.
HoldemBettingRound:
	ld [wHoldemCurrentSeat], a
.turnLoop
	call HoldemCountNotFolded
	cp 2
	jr c, .foldWin
	ld a, [wHoldemCurrentSeat]
	call HoldemSeatActionable
	jr c, .act
	call HoldemFindNextActor
	jr nc, .done
.act
	call HoldemUpdateTable
	ld a, [wHoldemCurrentSeat]
	call HoldemDoSeatAction
	call HoldemAdvanceCurrentSeat
	jr .turnLoop
.done
	and a
	ret
.foldWin
	scf
	ret

; a = seat -> carry set if the seat still needs to act this round.
HoldemSeatActionable:
	ld [wHoldemScanSeat], a
	call HoldemSeatFlagsPtr
	ld a, [hl]
	and (1 << HOLDEM_FOLDED) | (1 << HOLDEM_ALLIN)
	jr nz, .no
	ld a, [wHoldemScanSeat]
	ld b, a
	call HoldemSeatBitMask
	ld b, a
	ld a, [wHoldemActedMask]
	and b
	jr z, .yes ; not yet acted
	; already acted: still actionable only if not matched to the current bet
	ld a, [wHoldemScanSeat]
	call HoldemSeatStreetBetPtr
	ld de, wHoldemBetToCall
	ld c, 4
	call StringCmp
	jr z, .no ; matched and acted
.yes
	scf
	ret
.no
	and a
	ret

; Advance wHoldemCurrentSeat to the next actionable seat; carry set if found.
HoldemFindNextActor:
	ld b, HOLDEM_MAX_SEATS + 1
.loop
	push bc ; NextSeatIndex/SeatActionable clobber bc
	ld a, [wHoldemCurrentSeat]
	call HoldemNextSeatIndex
	ld [wHoldemCurrentSeat], a
	call HoldemSeatActionable
	pop bc
	jr c, .found
	dec b
	jr nz, .loop
	and a
	ret
.found
	scf
	ret

HoldemAdvanceCurrentSeat:
	ld a, [wHoldemCurrentSeat]
	call HoldemNextSeatIndex
	ld [wHoldemCurrentSeat], a
	ret

; a = number of seats not folded.
HoldemCountNotFolded:
	ld c, 0
	ld b, 0
.loop
	ld a, c
	call HoldemSeatFlagsPtr
	bit HOLDEM_FOLDED, [hl]
	jr nz, .next
	inc b
.next
	inc c
	ld a, c
	ld hl, wHoldemSeatCount
	cp [hl]
	jr c, .loop
	ld a, b
	ret

; a = seat (also stored as current). Dispatches to player or AI.
HoldemDoSeatAction:
	ld [wHoldemCurrentSeat], a
	call HoldemSeatFlagsPtr
	bit HOLDEM_AI, [hl]
	jr nz, .ai
	jp HoldemPromptPlayerAction
.ai
	jp HoldemAIDecide


; ============================================================================
; Actions (used by both player and AI); all operate on wHoldemCurrentSeat
; ============================================================================

HoldemActFold:
	ld a, [wHoldemCurrentSeat]
	call HoldemSeatFlagsPtr
	ld a, [hl]
	set HOLDEM_FOLDED, a
	ld [hl], a
	jp HoldemSetActedCurrent

HoldemActCheckCall:
	call HoldemComputeToCall ; wHoldemTmpA = betToCall - streetBet
	call HoldemTmpAIsZero
	jr z, .noMove
	call HoldemMoveChips
.noMove
	jp HoldemSetActedCurrent

HoldemActRaise:
	call HoldemComputeToCall
	ld de, wHoldemTmpA
	ld hl, wHoldemRaiseIncr
	call HoldemAddBCD4 ; call amount + one raise increment
	call HoldemMoveChips
	ld de, wHoldemBetToCall
	ld hl, wHoldemRaiseIncr
	call HoldemAddBCD4
	ld hl, wHoldemRaiseCount
	inc [hl]
	ld a, [wHoldemCurrentSeat]
	ld [wHoldemLastAggressor], a
	ld b, a
	call HoldemSeatBitMask
	ld [wHoldemActedMask], a ; reset acted mask to only the raiser
	ret

; wHoldemTmpA = betToCall - streetBet[current]  (never negative by invariant)
HoldemComputeToCall:
	ld hl, wHoldemBetToCall
	ld de, wHoldemTmpA
	call HoldemCopyBCD4
	ld a, [wHoldemCurrentSeat]
	call HoldemSeatStreetBetPtr
	ld de, wHoldemTmpA
	call HoldemSubBCD4
	ret

HoldemSetActedCurrent:
	ld a, [wHoldemCurrentSeat]
	ld b, a
	call HoldemSeatBitMask
	ld b, a
	ld a, [wHoldemActedMask]
	or b
	ld [wHoldemActedMask], a
	ret

; Move wHoldemTmpA chips from the current seat's stack into the pot, clamping to
; the stack (all-in on shortfall). Updates stack, street bet and pot.
HoldemMoveChips:
	ld a, [wHoldemCurrentSeat]
	call HoldemSeatStackPtr
	push hl
	ld de, wHoldemTmpA
	ld c, 4
	call StringCmp ; amount(de) vs stack(hl)
	pop hl
	jr c, .move ; amount < stack: no clamp
	; amount >= stack: all-in
	push hl
	ld de, wHoldemTmpA
	call HoldemCopyBCD4 ; tmpA = stack (clamp)
	call HoldemSetAllInCurrent
	pop hl
.move
	ld d, h
	ld e, l
	ld hl, wHoldemTmpA
	call HoldemSubBCD4 ; stack -= amount
	ld a, [wHoldemCurrentSeat]
	call HoldemSeatStreetBetPtr
	ld d, h
	ld e, l
	ld hl, wHoldemTmpA
	call HoldemAddBCD4 ; streetBet += amount
	ld de, wHoldemPot
	ld hl, wHoldemTmpA
	call HoldemAddBCD4 ; pot += amount
	ret

HoldemSetAllInCurrent:
	ld a, [wHoldemCurrentSeat]
	call HoldemSeatFlagsPtr
	ld a, [hl]
	set HOLDEM_ALLIN, a
	ld [hl], a
	ret

; Z if wHoldemTmpA is zero.
HoldemTmpAIsZero:
	ld hl, wHoldemTmpA
	ld a, [hli]
	or [hl]
	inc hl
	or [hl]
	inc hl
	or [hl]
	ret


; ============================================================================
; Player action menu
; ============================================================================

HoldemPromptPlayerAction:
.menu
	call HoldemDrawActionMenu
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld a, 2
	ld [wMaxMenuItem], a
	ld a, 11
	ld [wTopMenuItemY], a
	ld a, 12
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuWatchMovingOutOfBounds], a
	ld hl, hUILayoutFlags
	set BIT_DOUBLE_SPACED_MENU, [hl] ; single-spaced rows
	call HandleMenuInput
	ld hl, hUILayoutFlags
	res BIT_DOUBLE_SPACED_MENU, [hl]
	and PAD_B
	jr nz, .menu ; B ignored, re-prompt
	ld a, [wCurrentMenuItem]
	and a
	jr z, .checkCall
	dec a
	jr z, .raise
	jp HoldemActFold
.checkCall
	jp HoldemActCheckCall
.raise
	ld a, [wHoldemRaiseCount]
	cp HOLDEM_MAX_RAISES
	jr c, .doRaise
	ld hl, HoldemRaiseCappedText
	call PrintText
	jr .menu
.doRaise
	jp HoldemActRaise

HoldemDrawActionMenu:
	hlcoord 11, 10
	lb bc, 4, 7
	call TextBoxBorder
	call HoldemComputeToCall
	call HoldemTmpAIsZero
	ld de, HoldemCallStr
	jr nz, .haveLabel
	ld de, HoldemCheckStr
.haveLabel
	hlcoord 13, 11
	call PlaceString
	hlcoord 13, 12
	ld de, HoldemRaiseStr
	call PlaceString
	hlcoord 13, 13
	ld de, HoldemFoldStr
	call PlaceString
	ret


; ============================================================================
; AI
; ============================================================================

HoldemAIDecide:
	ld a, [wHoldemBoardCount]
	and a
	jr z, .preflop
	ld a, [wHoldemCurrentSeat]
	call HoldemEvalSeat
	ld a, [wHoldemCurrentSeat]
	call HoldemSeatScorePtr
	ld a, [hl]
	swap a
	and $0f ; hand category 0..8
	jr .decide
.preflop
	call HoldemPreflopScore ; a = strength band 0..8
.decide
	ld [wHoldemScanSeat], a ; stash strength
	call Random
	ld b, a ; random roll
	call HoldemComputeToCall
	call HoldemTmpAIsZero
	jr nz, .facing
	; not facing a bet (can check for free)
	ld a, [wHoldemScanSeat]
	cp 4
	jr nc, .strongNoBet
	ld a, b
	cp 24 ; ~9% bluff bet
	jr c, .raiseAct
	jp .callAct
.strongNoBet
	ld a, b
	cp 128 ; ~50% value bet
	jr c, .raiseAct
	jp .callAct
.facing
	ld a, [wHoldemScanSeat]
	cp 2
	jr nc, .notTrash
	; weak: mostly fold, occasional bluff/loose call
	ld a, b
	cp 20
	jr c, .raiseAct
	ld a, b
	cp 60
	jr c, .callAct
	jp .foldAct
.notTrash
	ld a, [wHoldemScanSeat]
	cp 4
	jr nc, .strong
	; medium: usually call, sometimes raise, rarely fold
	ld a, b
	cp 40
	jr c, .raiseAct
	ld a, b
	cp 230
	jr c, .callAct
	jp .foldAct
.strong
	ld a, b
	cp 150
	jr c, .raiseAct
	jr .callAct
.raiseAct
	ld a, [wHoldemRaiseCount]
	cp HOLDEM_MAX_RAISES
	jr c, .doRaise
.callAct
	; label the action check vs call before chips move
	call HoldemComputeToCall
	call HoldemTmpAIsZero
	ld b, 0 ; check
	jr z, .act
	ld b, 1 ; call
	jr .act
.foldAct
	ld b, 2 ; fold
	jr .act
.doRaise
	ld b, 3 ; raise
.act
	push bc
	ld a, b
	cp 2
	jr z, .actFold
	cp 3
	jr z, .actRaise
	call HoldemActCheckCall
	jr .announce
.actFold
	call HoldemActFold
	jr .announce
.actRaise
	call HoldemActRaise
.announce
	; refresh so pot/stacks/FOLD marker reflect the action, then say it
	call HoldemUpdateTable
	pop bc
	ld a, [wHoldemSeatCount]
	cp 2
	ld hl, HoldemDealerActionStrs
	jr z, .haveStrTable
	ld hl, HoldemCpuActionStrs
.haveStrTable
	ld a, b
	add a
	ld e, a
	ld d, 0
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp HoldemMessage

; Chen-style preflop strength for the current seat -> a = band 0..8.
HoldemPreflopScore:
	ld a, [wHoldemCurrentSeat]
	call HoldemSeatHolePtr
	ld a, [hli]
	ld b, a ; card1
	ld c, [hl] ; card2
	ld a, b
	and $0f
	ld d, a ; rank1
	ld a, c
	and $0f
	ld e, a ; rank2
	; score = high card rank
	ld a, d
	cp e
	jr nc, .haveHigh
	ld a, e
.haveHigh
	ld l, a ; accumulator
	; pair bonus
	ld a, d
	cp e
	jr nz, .notPair
	ld a, l
	add 6
	ld l, a
.notPair
	; suited bonus
	ld a, b
	xor c
	and $f0
	jr nz, .notSuited
	ld a, l
	add 2
	ld l, a
.notSuited
	; connector bonus (|r1 - r2| == 1)
	ld a, d
	sub e
	jr nc, .absOk
	ld a, e
	sub d
.absOk
	cp 1
	jr nz, .notConn
	inc l
.notConn
	ld a, l
	srl a
	cp 9
	jr c, .ok
	ld a, 8
.ok
	ret


; ============================================================================
; Showdown and pot award
; ============================================================================

HoldemShowdown:
	; evaluate every non-folded seat
	ld c, 0
.evalLoop
	ld a, c
	call HoldemSeatFlagsPtr
	bit HOLDEM_FOLDED, [hl]
	jr nz, .skip
	push bc
	ld a, c
	call HoldemEvalSeat
	pop bc
.skip
	inc c
	ld a, c
	ld hl, wHoldemSeatCount
	cp [hl]
	jr c, .evalLoop
	call HoldemFindBestSeat
	ld [wHoldemCurrentSeat], a
	call HoldemAwardPotToCurrent
	jp HoldemAnnounceWinner

; a = winning seat (best 3-byte score among non-folded; ties -> lowest index).
HoldemFindBestSeat:
	ld a, $ff
	ld [wHoldemScanSeat], a ; best seat = none
	ld c, 0
.loop
	ld a, c
	call HoldemSeatFlagsPtr
	bit HOLDEM_FOLDED, [hl]
	jr nz, .next
	ld a, [wHoldemScanSeat]
	cp $ff
	jr z, .setBest
	push bc
	ld a, c
	call HoldemSeatScorePtr
	push hl ; SeatScorePtr clobbers de, so keep score[c] on the stack
	ld a, [wHoldemScanSeat]
	call HoldemSeatScorePtr ; hl = score[best]
	pop de ; de = score[c]
	ld c, 3
	call StringCmp ; score[c](de) vs score[best](hl)
	pop bc
	jr c, .next ; c worse
	jr z, .next ; equal, keep lower index
.setBest
	ld a, c
	ld [wHoldemScanSeat], a
.next
	inc c
	ld a, c
	ld hl, wHoldemSeatCount
	cp [hl]
	jr c, .loop
	ld a, [wHoldemScanSeat]
	ret

HoldemAwardPotToLastStanding:
	ld c, 0
.loop
	ld a, c
	call HoldemSeatFlagsPtr
	bit HOLDEM_FOLDED, [hl]
	jr nz, .next
	ld a, c
	ld [wHoldemCurrentSeat], a
	call HoldemAwardPotToCurrent
	jp HoldemAnnounceWinner
.next
	inc c
	ld a, c
	ld hl, wHoldemSeatCount
	cp [hl]
	jr c, .loop
	ret

HoldemAwardPotToCurrent:
	ld a, [wHoldemCurrentSeat]
	call HoldemSeatStackPtr
	ld d, h
	ld e, l
	ld hl, wHoldemPot
	call HoldemAddBCD4 ; stack += pot
	ld hl, wHoldemPot
	jp HoldemZeroBCD4

HoldemAnnounceWinner:
	ld a, [wHoldemCurrentSeat]
	and a
	jr nz, .npc
	ld hl, HoldemYouWinStr
	jp HoldemMessage
.npc
	ld hl, HoldemDealerWinsStr
	jp HoldemMessage


; ============================================================================
; Hand evaluator: 5..7 cards -> packed 3-byte comparable score
; ============================================================================

; a = seat. Gathers hole+board, evaluates, writes the 3-byte score to the seat.
HoldemEvalSeat:
	ld [wHoldemScanSeat], a
	call HoldemGatherSeatCards
	call HoldemBuildHistogram
	call HoldemClassifyHand
	call HoldemPackScore
	ld a, [wHoldemScanSeat]
	call HoldemSeatScorePtr
	ld d, h
	ld e, l
	ld hl, wHoldemScratch
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

; Fills wHoldemEvalCards with hole (2) + board (boardCount); wHoldemEvalN = count.
HoldemGatherSeatCards:
	; SeatHolePtr clobbers de, so fetch the source before the dest pointer
	ld a, [wHoldemScanSeat]
	call HoldemSeatHolePtr
	ld de, wHoldemEvalCards
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	inc de
	ld a, [wHoldemBoardCount]
	and a
	jr z, .noBoard
	ld b, a
	ld hl, wHoldemBoard
.boardLoop
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .boardLoop
.noBoard
	ld a, [wHoldemBoardCount]
	add 2
	ld [wHoldemEvalN], a
	ret

; Build rankCount[13], suitCount[4] (contiguous, cleared together with
; flushPresent[13]).
HoldemBuildHistogram:
	ld hl, wHoldemRankCount
	ld b, 13 + 4 + 13
	xor a
.clear
	ld [hli], a
	dec b
	jr nz, .clear
	ld a, [wHoldemEvalN]
	ld b, a
	ld hl, wHoldemEvalCards
.loop
	ld a, [hli]
	push hl
	ld c, a
	and $0f
	ld hl, wHoldemRankCount
	ld e, a
	ld d, 0
	add hl, de
	inc [hl]
	ld a, c
	swap a
	and $03
	ld hl, wHoldemSuitCount
	ld e, a
	add hl, de
	inc [hl]
	pop hl
	dec b
	jr nz, .loop
	ret

HoldemClassifyHand:
	call HoldemScanMultiples
	call HoldemFindFlushSuit
	; straight high from all ranks
	ld hl, wHoldemRankCount
	call HoldemStraightScan
	jr c, .noStraight
	ld [wHoldemTmpA + 2], a
	jr .straightDone
.noStraight
	ld a, $ff
	ld [wHoldemTmpA + 2], a
.straightDone
	; straight flush?
	ld a, [wHoldemTmpA + 1] ; flush exists?
	and a
	jr z, .noStraightFlush
	ld hl, wHoldemFlushPresent
	call HoldemStraightScan
	jr c, .noStraightFlush
	ld [wHoldemTmpA + 3], a
	jr .sfDone
.noStraightFlush
	ld a, $ff
	ld [wHoldemTmpA + 3], a
.sfDone
	; category, strongest first
	ld a, [wHoldemTmpA + 3]
	cp $ff
	jr z, .not8
	; straight flush
	ld a, 8
	ld [wHoldemScratch + 0], a
	ld a, [wHoldemTmpA + 3]
	ld [wHoldemScratch + 1], a
	ld a, 2
	jp HoldemZeroKickersFrom
.not8
	ld a, [wHoldemScratch + SC_QUAD]
	cp $ff
	jr z, .not7
	; four of a kind
	ld a, 7
	ld [wHoldemScratch + 0], a
	ld a, [wHoldemScratch + SC_QUAD]
	ld [wHoldemScratch + 1], a
	call HoldemSetSrcRankCount
	ld a, [wHoldemScratch + SC_QUAD]
	call HoldemSetExcl1
	ld a, 2
	ld [wHoldemScratch + SC_SLOT], a
	ld b, 1
	call HoldemFillKickers
	jp HoldemZeroFromSlot
.not7
	ld a, [wHoldemScratch + SC_TRIP1]
	cp $ff
	jr z, .not6
	ld a, [wHoldemScratch + SC_PAIR1]
	cp $ff
	jr nz, .fullHouse
	ld a, [wHoldemScratch + SC_TRIP2]
	cp $ff
	jr z, .not6
.fullHouse
	ld a, 6
	ld [wHoldemScratch + 0], a
	ld a, [wHoldemScratch + SC_TRIP1]
	ld [wHoldemScratch + 1], a
	call HoldemFullHousePairRank
	ld [wHoldemScratch + 2], a
	ld a, 3
	jp HoldemZeroKickersFrom
.not6
	ld a, [wHoldemTmpA + 1]
	and a
	jr z, .not5
	; flush
	ld a, 5
	ld [wHoldemScratch + 0], a
	call HoldemSetSrcFlush
	call HoldemSetExclNone
	ld a, 1
	ld [wHoldemScratch + SC_SLOT], a
	ld b, 5
	call HoldemFillKickers
	jp HoldemZeroFromSlot
.not5
	ld a, [wHoldemTmpA + 2]
	cp $ff
	jr z, .not4
	; straight
	ld a, 4
	ld [wHoldemScratch + 0], a
	ld a, [wHoldemTmpA + 2]
	ld [wHoldemScratch + 1], a
	ld a, 2
	jp HoldemZeroKickersFrom
.not4
	ld a, [wHoldemScratch + SC_TRIP1]
	cp $ff
	jr z, .not3
	; three of a kind
	ld a, 3
	ld [wHoldemScratch + 0], a
	ld a, [wHoldemScratch + SC_TRIP1]
	ld [wHoldemScratch + 1], a
	call HoldemSetSrcRankCount
	ld a, [wHoldemScratch + SC_TRIP1]
	call HoldemSetExcl1
	ld a, 2
	ld [wHoldemScratch + SC_SLOT], a
	ld b, 2
	call HoldemFillKickers
	jp HoldemZeroFromSlot
.not3
	ld a, [wHoldemScratch + SC_PAIR2]
	cp $ff
	jr z, .not2
	; two pair
	ld a, 2
	ld [wHoldemScratch + 0], a
	ld a, [wHoldemScratch + SC_PAIR1]
	ld [wHoldemScratch + 1], a
	ld a, [wHoldemScratch + SC_PAIR2]
	ld [wHoldemScratch + 2], a
	call HoldemSetSrcRankCount
	ld a, [wHoldemScratch + SC_PAIR1]
	ld [wHoldemScratch + SC_EXCL1], a
	ld a, [wHoldemScratch + SC_PAIR2]
	ld [wHoldemScratch + SC_EXCL2], a
	ld a, 3
	ld [wHoldemScratch + SC_SLOT], a
	ld b, 1
	call HoldemFillKickers
	jp HoldemZeroFromSlot
.not2
	ld a, [wHoldemScratch + SC_PAIR1]
	cp $ff
	jr z, .highCard
	; one pair
	ld a, 1
	ld [wHoldemScratch + 0], a
	ld a, [wHoldemScratch + SC_PAIR1]
	ld [wHoldemScratch + 1], a
	call HoldemSetSrcRankCount
	ld a, [wHoldemScratch + SC_PAIR1]
	call HoldemSetExcl1
	ld a, 2
	ld [wHoldemScratch + SC_SLOT], a
	ld b, 3
	call HoldemFillKickers
	jp HoldemZeroFromSlot
.highCard
	xor a
	ld [wHoldemScratch + 0], a
	call HoldemSetSrcRankCount
	call HoldemSetExclNone
	ld a, 1
	ld [wHoldemScratch + SC_SLOT], a
	ld b, 5
	call HoldemFillKickers
	jp HoldemZeroFromSlot

; Scan rankCount high->low; record quad / two highest trips / two highest pairs.
HoldemScanMultiples:
	ld a, $ff
	ld [wHoldemScratch + SC_QUAD], a
	ld [wHoldemScratch + SC_TRIP1], a
	ld [wHoldemScratch + SC_TRIP2], a
	ld [wHoldemScratch + SC_PAIR1], a
	ld [wHoldemScratch + SC_PAIR2], a
	ld c, 12
.loop
	ld hl, wHoldemRankCount
	ld e, c
	ld d, 0
	add hl, de
	ld a, [hl]
	cp 4
	jr z, .quad
	cp 3
	jr z, .trip
	cp 2
	jr z, .pair
	jr .next
.quad
	ld a, c
	ld [wHoldemScratch + SC_QUAD], a
	jr .next
.trip
	ld a, [wHoldemScratch + SC_TRIP1]
	cp $ff
	jr nz, .trip2
	ld a, c
	ld [wHoldemScratch + SC_TRIP1], a
	jr .next
.trip2
	ld a, [wHoldemScratch + SC_TRIP2]
	cp $ff
	jr nz, .next
	ld a, c
	ld [wHoldemScratch + SC_TRIP2], a
	jr .next
.pair
	ld a, [wHoldemScratch + SC_PAIR1]
	cp $ff
	jr nz, .pair2
	ld a, c
	ld [wHoldemScratch + SC_PAIR1], a
	jr .next
.pair2
	ld a, [wHoldemScratch + SC_PAIR2]
	cp $ff
	jr nz, .next
	ld a, c
	ld [wHoldemScratch + SC_PAIR2], a
.next
	ld a, c
	and a
	ret z
	dec c
	jr .loop

; If any suit has >= 5 cards, set wHoldemTmpA+0 = suit, wHoldemTmpA+1 = 1, and
; build flushPresent[13]; else wHoldemTmpA+1 = 0.
HoldemFindFlushSuit:
	ld hl, wHoldemSuitCount
	ld b, 4
	ld c, 0
.loop
	ld a, [hli]
	cp 5
	jr nc, .found
	inc c
	dec b
	jr nz, .loop
	xor a
	ld [wHoldemTmpA + 1], a
	ret
.found
	ld a, c
	ld [wHoldemTmpA + 0], a
	ld a, 1
	ld [wHoldemTmpA + 1], a
	ld hl, wHoldemFlushPresent
	ld b, 13
	xor a
.clear
	ld [hli], a
	dec b
	jr nz, .clear
	ld a, [wHoldemEvalN]
	ld b, a
	ld hl, wHoldemEvalCards
.mark
	ld a, [hli]
	push hl
	ld c, a
	swap a
	and $03
	ld hl, wHoldemTmpA + 0
	cp [hl]
	jr nz, .skip
	ld a, c
	and $0f
	ld hl, wHoldemFlushPresent
	ld e, a
	ld d, 0
	add hl, de
	ld [hl], 1
.skip
	pop hl
	dec b
	jr nz, .mark
	ret

; hl -> present[0..12] (nonzero = present). Returns a = straight high rank with
; carry clear, or carry set if there is no straight.
HoldemStraightScan:
	push hl
	ld d, h
	ld e, l
	ld a, e
	add 12
	ld e, a
	ld a, d
	adc 0
	ld d, a ; de -> present[12]
	ld b, 0 ; run length
	ld c, 12 ; current rank
.scan
	ld a, [de]
	and a
	jr z, .reset
	inc b
	ld a, b
	cp 5
	jr z, .found
	jr .dec
.reset
	ld b, 0
.dec
	ld a, c
	and a
	jr z, .wheel
	dec c
	dec de
	jr .scan
.found
	pop hl
	ld a, c
	add 4
	and a ; clear carry
	ret
.wheel
	pop hl
	push hl
	ld d, h
	ld e, l
	ld a, e
	add 12
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld a, [de] ; ace
	and a
	jr z, .none
	ld a, [hli] ; rank 0
	and a
	jr z, .none
	ld a, [hli] ; rank 1
	and a
	jr z, .none
	ld a, [hli] ; rank 2
	and a
	jr z, .none
	ld a, [hl] ; rank 3
	and a
	jr z, .none
	pop hl
	ld a, 3 ; wheel: high card is the 5
	and a
	ret
.none
	pop hl
	scf
	ret

; Full-house pair rank = higher of pair1 and second trip (either may be $ff).
HoldemFullHousePairRank:
	ld a, [wHoldemScratch + SC_PAIR1]
	ld b, a
	ld a, [wHoldemScratch + SC_TRIP2]
	cp $ff
	jr z, .usePair1
	ld c, a
	ld a, b
	cp $ff
	jr z, .useTrip2
	ld a, b
	cp c
	jr nc, .usePair1
.useTrip2
	ld a, c
	ret
.usePair1
	ld a, b
	ret

; Append up to b ranks (high->low) from the current kicker source into the
; nibble slots, skipping excluded ranks.
HoldemFillKickers:
	ld c, 12
.loop
	ld a, b
	and a
	ret z
	ld a, [wHoldemScratch + SC_SRC_L]
	ld l, a
	ld a, [wHoldemScratch + SC_SRC_H]
	ld h, a
	ld e, c
	ld d, 0
	add hl, de
	ld a, [hl]
	and a
	jr z, .adv
	ld a, c
	ld hl, wHoldemScratch + SC_EXCL1
	cp [hl]
	jr z, .adv
	ld a, c
	ld hl, wHoldemScratch + SC_EXCL2
	cp [hl]
	jr z, .adv
	; store rank c into slot
	ld a, [wHoldemScratch + SC_SLOT]
	ld l, a
	ld h, 0
	ld de, wHoldemScratch
	add hl, de
	ld a, c
	ld [hl], a
	ld a, [wHoldemScratch + SC_SLOT]
	inc a
	ld [wHoldemScratch + SC_SLOT], a
	dec b
.adv
	ld a, c
	and a
	ret z
	dec c
	jr .loop

; Zero nibble slots [SC_SLOT..5].
HoldemZeroFromSlot:
	ld a, [wHoldemScratch + SC_SLOT]
.loop
	cp 6
	ret nc
	ld l, a
	ld h, 0
	ld de, wHoldemScratch
	add hl, de
	ld [hl], 0
	ld a, [wHoldemScratch + SC_SLOT]
	inc a
	ld [wHoldemScratch + SC_SLOT], a
	jr .loop

; a = starting slot -> zero nibble slots [a..5].
HoldemZeroKickersFrom:
	ld [wHoldemScratch + SC_SLOT], a
	jr HoldemZeroFromSlot

HoldemSetSrcRankCount:
	ld a, LOW(wHoldemRankCount)
	ld [wHoldemScratch + SC_SRC_L], a
	ld a, HIGH(wHoldemRankCount)
	ld [wHoldemScratch + SC_SRC_H], a
	ret

HoldemSetSrcFlush:
	ld a, LOW(wHoldemFlushPresent)
	ld [wHoldemScratch + SC_SRC_L], a
	ld a, HIGH(wHoldemFlushPresent)
	ld [wHoldemScratch + SC_SRC_H], a
	ret

HoldemSetExclNone:
	ld a, $ff
	ld [wHoldemScratch + SC_EXCL1], a
	ld [wHoldemScratch + SC_EXCL2], a
	ret

; a = rank to exclude (second exclusion cleared).
HoldemSetExcl1:
	ld [wHoldemScratch + SC_EXCL1], a
	ld a, $ff
	ld [wHoldemScratch + SC_EXCL2], a
	ret

; Pack nibble slots [0..5] into 3 bytes at wHoldemScratch[0..2].
HoldemPackScore:
	ld a, [wHoldemScratch + 0]
	swap a
	and $f0
	ld b, a
	ld a, [wHoldemScratch + 1]
	and $0f
	or b
	ld c, a
	ld a, [wHoldemScratch + 2]
	swap a
	and $f0
	ld b, a
	ld a, [wHoldemScratch + 3]
	and $0f
	or b
	ld d, a
	ld a, [wHoldemScratch + 4]
	swap a
	and $f0
	ld b, a
	ld a, [wHoldemScratch + 5]
	and $0f
	or b
	ld e, a
	ld a, c
	ld [wHoldemScratch + 0], a
	ld a, d
	ld [wHoldemScratch + 1], a
	ld a, e
	ld [wHoldemScratch + 2], a
	ret


; ============================================================================
; Rendering (font-based)
; ============================================================================

; Full repaint (hand start): clears leftovers from the previous hand's menus
; and messages, then draws everything.
HoldemDrawTable:
	call ClearScreen
	xor a ; reveal = 0
	jr HoldemDrawCommon

; Mid-hand refresh: no ClearScreen, so the table never blanks. Static labels
; and unchanged cards overwrite themselves invisibly; the fixed-width chip
; numbers overwrite in place; only the action-menu box needs erasing (the
; message rows are repainted by the next TextBoxBorder).
HoldemUpdateTable:
	call HoldemEraseActionMenu
	xor a
	jr HoldemDrawCommon

; Showdown refresh: like HoldemUpdateTable, but opponent hole cards are drawn
; over their "??" markers.
HoldemDrawTableReveal:
	call HoldemEraseActionMenu
	ld a, 1
HoldemDrawCommon:
	ld [wHoldemTmpB], a
	hlcoord 6, 0
	ld de, HoldemTitleStr
	call PlaceString
	hlcoord 1, 4
	ld de, HoldemBoardStr
	call PlaceString
	call HoldemDrawBoardCards
	hlcoord 1, 8
	ld de, HoldemPotStr
	call PlaceString
	ld b, 6
	ld c, 8
	ld hl, wHoldemPot
	call HoldemPrintChipAt
	call HoldemDrawSeats
	call Delay3
	ret

; Blank the action-menu box's top rows (10-13, cols 11-19). Its bottom border
; (rows 14-15) sits in the message area, which every message box repaints
; full-width, so only this rectangle can go stale.
HoldemEraseActionMenu:
	hlcoord 11, 10
	ld e, 4 ; rows
	ld a, CHARVAL(" ")
.row
	ld c, 9 ; cols
.col
	ld [hli], a
	dec c
	jr nz, .col
	ld bc, SCREEN_WIDTH - 9
	add hl, bc
	dec e
	jr nz, .row
	ret

HoldemDrawBoardCards:
	ld c, 0
.loop
	ld a, c
	ld b, a
	add a
	add b
	add 2
	ld d, a ; x = 2 + 3*index
	ld e, 5 ; y
	push bc
	call HoldemCoord
	pop bc
	push bc
	push hl
	ld hl, wHoldemBoard
	ld e, c
	ld d, 0
	add hl, de
	ld a, [hl]
	pop hl
	call HoldemDrawCardAt
	pop bc
	inc c
	ld a, c
	cp 5
	jr c, .loop
	ret

HoldemDrawSeats:
	; --- player (seat 0) ---
	hlcoord 1, 12
	ld de, HoldemYouStr
	call PlaceString
	xor a
	call HoldemSeatHolePtr
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	push bc
	hlcoord 5, 12
	ld a, b
	call HoldemDrawCardAt
	pop bc
	hlcoord 8, 12
	ld a, c
	call HoldemDrawCardAt
	ld b, 1
	ld c, 13
	ld hl, wHoldemStack
	call HoldemPrintChipAt
	; --- opponents (seat index kept in wHoldemScanSeat) ---
	ld c, 1
.oppLoop
	ld a, c
	ld hl, wHoldemSeatCount
	cp [hl]
	ret nc
	ld a, c
	ld [wHoldemScanSeat], a
	; label "CPU" at (1, row)
	add 1
	ld e, a
	ld d, 1
	ld hl, HoldemCpuStr
	call HoldemPlaceStrAt
	; stack at (5, row)
	ld a, [wHoldemScanSeat]
	call HoldemSeatStackPtr
	ld b, 5
	ld a, [wHoldemScanSeat]
	add 1
	ld c, a
	call HoldemPrintChipAt
	; cards / status at (11, row)
	call HoldemDrawOppCards
	ld a, [wHoldemScanSeat]
	inc a
	ld c, a
	jr .oppLoop

; Draw the opponent in wHoldemScanSeat: FOLD, two revealed cards, or facedown,
; at column 11 of row (seat + 1).
HoldemDrawOppCards:
	ld a, [wHoldemScanSeat]
	call HoldemSeatFlagsPtr
	bit HOLDEM_FOLDED, [hl]
	jr z, .live
	ld a, [wHoldemScanSeat]
	add 1
	ld e, a
	ld d, 11
	ld hl, HoldemFoldStr
	jp HoldemPlaceStrAt
.live
	ld a, [wHoldemTmpB]
	and a
	jr nz, .reveal
	ld a, [wHoldemScanSeat]
	add 1
	ld e, a
	ld d, 11
	ld hl, HoldemHiddenStr
	jp HoldemPlaceStrAt
.reveal
	ld a, [wHoldemScanSeat]
	call HoldemSeatHolePtr
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	; card 1 at (11, row)
	push bc
	ld a, [wHoldemScanSeat]
	add 1
	ld e, a
	ld d, 11
	call HoldemCoord
	pop bc
	push bc
	ld a, b
	call HoldemDrawCardAt
	pop bc
	; card 2 at (14, row)
	push bc
	ld a, [wHoldemScanSeat]
	add 1
	ld e, a
	ld d, 14
	call HoldemCoord
	pop bc
	ld a, c
	call HoldemDrawCardAt
	ret

; d = x, e = y, hl = string -> PlaceString at that coord.
HoldemPlaceStrAt:
	push hl
	call HoldemCoord ; hl = coord
	ld d, h
	ld e, l
	pop hl ; hl = string
	push hl
	ld h, d
	ld l, e ; hl = coord
	pop de ; de = string
	call PlaceString
	ret

; a = card, hl = coord. Draws rank glyph + suit letter (nothing if undealt).
; RankToChar/SuitToChar clobber hl, so save the coord around them.
HoldemDrawCardAt:
	cp $ff
	ret z
	ld b, a
	push hl
	call HoldemRankToChar
	pop hl
	ld [hli], a
	push hl
	ld a, b
	call HoldemSuitToChar
	pop hl
	ld [hl], a
	ret

; b = card -> a = rank character.
HoldemRankToChar:
	ld a, b
	and $0f
	ld e, a
	ld d, 0
	ld hl, HoldemRankChars
	add hl, de
	ld a, [hl]
	ret

; b = card -> a = suit character.
HoldemSuitToChar:
	ld a, b
	swap a
	and $03
	ld e, a
	ld d, 0
	ld hl, HoldemSuitChars
	add hl, de
	ld a, [hl]
	ret

; d = x, e = y -> hl = tilemap coordinate.
HoldemCoord:
	ld hl, wTileMap
	ld a, e
	and a
	jr z, .cols
	ld bc, SCREEN_WIDTH
.rows
	add hl, bc
	dec a
	jr nz, .rows
.cols
	ld c, d
	ld b, 0
	add hl, bc
	ret

; b = x, c = y, hl = 4-byte BCD source -> print chip amount at (x,y).
; Only the low wHoldemChipWidth bytes (2 for coins, 3 for money) are shown, so
; the number stays narrow enough not to run into the CPU cards on the same row.
HoldemPrintChipAt:
	push hl
	ld d, b
	ld e, c
	call HoldemCoord ; hl = coord
	pop de ; de = BCD source (big-endian: byte 0 is most significant)
	ld a, [wHoldemChipWidth]
	ld b, a ; b = width
	ld a, 4
	sub b ; a = 4 - width = leading bytes to skip
	add e
	ld e, a
	ld a, d
	adc 0
	ld d, a ; de -> low `width` bytes
	ld a, LEADING_ZEROES
	or b
	ld c, a ; LEADING_ZEROES | width
	call PrintBCDNumber
	ret


; ============================================================================
; Yes/No prompt and message box during the takeover
; ============================================================================

; Draw a message at the bottom and wait for A/B. hl = raw string ("...@").
HoldemMessage:
	push hl
	hlcoord 0, 14
	lb bc, 2, 18
	call TextBoxBorder
	pop de
	hlcoord 1, 15
	call PlaceString
	call Delay3
	jp HoldemWaitButton

HoldemWaitButton:
.loop
	call DelayFrame
	call Joypad
	ldh a, [hJoyPressed]
	and PAD_A | PAD_B
	jr z, .loop
	ret

; "Play again?" yes/no. Returns carry set if the player wants to stop.
HoldemAskAgain:
	hlcoord 0, 14
	lb bc, 2, 18
	call TextBoxBorder
	hlcoord 1, 15
	ld de, HoldemPlayAgainStr
	call PlaceString
	hlcoord 14, 9
	lb bc, 4, 4
	call TextBoxBorder
	hlcoord 16, 10
	ld de, HoldemYesStr
	call PlaceString
	hlcoord 16, 11
	ld de, HoldemNoStr
	call PlaceString
	ld a, PAD_A | PAD_B
	ld [wMenuWatchedKeys], a
	ld a, 1
	ld [wMaxMenuItem], a
	ld a, 10
	ld [wTopMenuItemY], a
	ld a, 15
	ld [wTopMenuItemX], a
	xor a
	ld [wCurrentMenuItem], a
	ld [wLastMenuItem], a
	ld [wMenuWatchMovingOutOfBounds], a
	ld hl, hUILayoutFlags
	set BIT_DOUBLE_SPACED_MENU, [hl] ; single-spaced rows
	call HandleMenuInput
	ld hl, hUILayoutFlags
	res BIT_DOUBLE_SPACED_MENU, [hl]
	and PAD_B
	jr nz, .stop
	ld a, [wCurrentMenuItem]
	and a
	ret z ; Yes -> carry clear
.stop
	scf
	ret


; ============================================================================
; Seat-array pointer helpers (seat in a -> hl; preserve bc)
; ============================================================================

HoldemSeatFlagsPtr:
	ld hl, wHoldemSeatFlags
	ld d, 0
	ld e, a
	add hl, de
	ret

HoldemSeatHolePtr:
	ld hl, wHoldemHole
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	ret

HoldemSeatScorePtr:
	ld hl, wHoldemHandScore
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	add hl, de
	ret

HoldemSeatStackPtr:
	ld hl, wHoldemStack
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ret

HoldemSeatStreetBetPtr:
	ld hl, wHoldemStreetBet
	ld d, 0
	ld e, a
	add hl, de
	add hl, de
	add hl, de
	add hl, de
	ret

; a = seat -> a = next seat index (mod seat count). Clobbers b.
HoldemNextSeatIndex:
	inc a
	ld b, a
	ld a, [wHoldemSeatCount]
	cp b
	jr nz, .ok
	ld b, 0
.ok
	ld a, b
	ret

; a = start -> a = next non-folded seat after start.
HoldemNextInHandSeat:
	ld d, a
	ld e, 0
.loop
	ld a, d
	call HoldemNextSeatIndex
	ld d, a
	push de ; SeatFlagsPtr clobbers de
	call HoldemSeatFlagsPtr
	pop de
	bit HOLDEM_FOLDED, [hl]
	jr z, .found
	inc e
	ld a, e
	cp HOLDEM_MAX_SEATS
	jr c, .loop
.found
	ld a, d
	ret

; b = bit index -> a = 1 << b. Clobbers b.
HoldemSeatBitMask:
	ld a, 1
	inc b
.loop
	dec b
	ret z
	add a
	jr .loop


; ============================================================================
; 4-byte BCD helpers
; ============================================================================

; hl = src, de = dst.
HoldemCopyBCD4:
	ld c, 4
.loop
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .loop
	ret

; hl = ptr.
HoldemZeroBCD4:
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

; de = dst base, hl = src base. dst += src.
HoldemAddBCD4:
	push bc
	push de
	push hl
	ld bc, 3
	add hl, bc
	ld a, e
	add 3
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld c, 4
	predef AddBCDPredef
	pop hl
	pop de
	pop bc
	ret

; de = dst base, hl = src base. dst -= src.
HoldemSubBCD4:
	push bc
	push de
	push hl
	ld bc, 3
	add hl, bc
	ld a, e
	add 3
	ld e, a
	ld a, d
	adc 0
	ld d, a
	ld c, 4
	predef SubBCDPredef
	pop hl
	pop de
	pop bc
	ret


; ============================================================================
; Data
; ============================================================================

; 4-byte / 3-byte / 2-byte BCD constants (100 chips buy-in, 5/10 blinds)
HoldemBuyinChips:  db $00, $00, $01, $00
HoldemSBAmount:    db $00, $00, $00, $05
HoldemBBAmount:    db $00, $00, $00, $10
; 10x stakes
HoldemBuyinChips10x: db $00, $00, $10, $00
HoldemSBAmount10x:   db $00, $00, $00, $50
HoldemBBAmount10x:   db $00, $00, $01, $00

HoldemRankChars: db "23456789TJQKA"
HoldemSuitChars: db "SHDC"

; PlaceString labels (raw, "@"-terminated)
HoldemTitleStr:      db "HOLD EM@"
HoldemBoardStr:      db "BOARD@"
HoldemPotStr:        db "POT@"
HoldemYouStr:        db "YOU@"
HoldemCpuStr:        db "CPU@"
HoldemFoldStr:       db "FOLD@"
HoldemCheckStr:      db "CHECK@"
HoldemCallStr:       db "CALL@"
HoldemRaiseStr:      db "RAISE@"
HoldemHiddenStr:     db "??@"
HoldemPlayAgainStr:  db "Play again?@"
HoldemYesStr:        db "YES@"
HoldemNoStr:         db "NO@"
HoldemYouWinStr:     db "You win the pot!@"
HoldemDealerWinsStr: db "You lose the pot.@"

; AI action announcements, indexed 0=check 1=call 2=fold 3=raise
HoldemDealerActionStrs:
	dw HoldemDealerChecksStr
	dw HoldemDealerCallsStr
	dw HoldemDealerFoldsStr
	dw HoldemDealerRaisesStr
HoldemCpuActionStrs:
	dw HoldemCpuChecksStr
	dw HoldemCpuCallsStr
	dw HoldemCpuFoldsStr
	dw HoldemCpuRaisesStr
HoldemDealerChecksStr: db "Dealer checks.@"
HoldemDealerCallsStr:  db "Dealer calls.@"
HoldemDealerFoldsStr:  db "Dealer folds.@"
HoldemDealerRaisesStr: db "Dealer raises.@"
HoldemCpuChecksStr:    db "CPU checks.@"
HoldemCpuCallsStr:     db "CPU calls.@"
HoldemCpuFoldsStr:     db "CPU folds.@"
HoldemCpuRaisesStr:    db "CPU raises.@"

; PrintText messages
HoldemDealerIntroText:
	text "Care for a hand"
	line "of TEXAS HOLD EM?"
	done

HoldemTableIntroText:
	text "Grab a seat at"
	line "the poker table?"
	done

HoldemChooseCurrencyText:
	text "Wager with money?"
	line "(NO uses COINS)"
	done

HoldemChooseStakesText:
	text "Raise the stakes"
	line "ten-fold?"
	done

HoldemNotEnoughText:
	text "You can't cover"
	line "the buy-in!"
	done

HoldemRaiseCappedText:
	text "No more raises"
	line "this round!"
	done
