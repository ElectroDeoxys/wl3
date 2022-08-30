LoadClearScreenPals: ; 1e0000 (78:4000)
	ld hl, Pals_1e0378
	call LoadPalsToTempPals1
	ld hl, Pals_1e03b8
	call LoadPalsToTempPals2
	ret
; 0x1e000d

Func_1e000d: ; 1e000d (78:400d)
	ld hl, Pals_1e03f8
	call LoadPalsToTempPals1
	ld hl, Pals_1e0438
	call LoadPalsToTempPals2
	ret
; 0x1e001a

LoadClearScreenGfx: ; 1e001a (78:401a)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, ClearScreen2Gfx
	ld bc, v0Tiles0
	call Decompress

	xor a
	ldh [rVBK], a
	ld hl, ClearScreen1Gfx
	ld bc, v0Tiles1
	call Decompress

	ld hl, WarioClearGfx
	ld de, v0Tiles0
	ld bc, $80 tiles
	ld a, BANK(WarioClearGfx)
	ld [wTempBank], a
	call FarCopyHLToDE_BC
	ret
; 0x1e0045

Func_1e0045: ; 1e0045 (78:4045)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_1e1962
	ld bc, v1BGMap0
	call Decompress

	xor a
	ldh [rVBK], a
	ld hl, BGMap_1e17fa
	ld bc, v0BGMap0
	call Decompress
	ret
; 0x1e005f

Func_1e005f: ; 1e005f (78:405f)
	ld a, BANK("VRAM1")
	ldh [rVBK], a
	ld hl, BGMap_1ec5b
	ld bc, v0BGMap0
	call Decompress

	xor a
	ldh [rVBK], a
	ld hl, BGMap_1eae5
	ld bc, v0BGMap0
	call Decompress

	call .GeResult
	ld a, [wLevel]
	srl a
	srl a
	srl a
	add a
	ld e, a
	ld d, $00
	ld hl, wLevelTimeAttackScores
	add hl, de
	ld a, [hli]
	ld [w3d511 + 0], a
	ld a, [hl]
	ld [w3d511 + 1], a
	hlbgcoord 10, 7
	ld bc, -BG_MAP_WIDTH
	ld de, BG_MAP_WIDTH
	ld a, [w3d511 + 0]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [w3d511 + 0]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	inc l
	ld a, [w3d511 + 1]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [w3d511 + 1]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc ; unnecessary

	ld a, [wTimeAttackResult]
	and a
	ret z
	hlbgcoord 10, 10
	ld bc, -BG_MAP_WIDTH
	ld de, BG_MAP_WIDTH
	ld a, [wLevelTime + 0]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wLevelTime + 0]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	inc l
	ld a, [wLevelTime + 1]
	swap a
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hli], a
	add hl, bc
	ld a, [wLevelTime + 1]
	and $0f
	add a
	add $a0
	ld [hl], a
	add hl, de
	inc a
	ld [hl], a
	ret

.GeResult:
	xor a ; TIME_ATTACK_NOT_COMPLETED
	ld [wTimeAttackResult], a
	ld a, [wKeyAndTreasureFlags]
	and KEYS_MASK
	cp GREY_KEY | RED_KEY | GREEN_KEY | BLUE_KEY
	ret nz
	ld a, TIME_ATTACK_NO_HIGH_SCORE
	ld [wTimeAttackResult], a
	ld a, [wLevel]
	srl a
	srl a
	srl a
	add a ; *2
	ld e, a
	ld d, $00
	ld hl, wLevelTimeAttackScores
	add hl, de
	ld a, [wLevelTime + 0]
	cp [hl]
	jr c, .asm_1e014d
	ret nz
	inc hl
	ld a, [wLevelTime + 1]
	cp [hl]
	ret nc
	dec hl
.asm_1e014d
	ld a, [wLevelTime + 0]
	ld [hli], a
	ld a, [wLevelTime + 1]
	ld [hl], a
	ld a, TIME_ATTACK_GOT_HIGH_SCORE
	ld [wTimeAttackResult], a
	ret
; 0x1e015b

Func_1e015b: ; 1e015b (78:415b)
	ld a, [wPowerUpLevel]
	and ACTION_HELP_LEVEL_CLEAR
	jr z, .no_power_up
	ld hl, wMenuObj8
	ld a, $53
	ld [hli], a
	ld a, $24
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d506b)
	ld [hli], a
	ld a, LOW(Frameset_d506b)
	ld [hl], a

.no_power_up
	ld hl, wClearScreenWario
	ld a, $76
	ld [hli], a
	ld a, $34
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [wClearScreenWarioVar], a
	ld a, [wTransitionParam]
	cp TRANSITION_RETURN_TO_MAP
	jr z, .asm_1e0196
	ld a, HIGH(Frameset_d4d18)
	ld [hli], a
	ld a, LOW(Frameset_d4d18)
	ld [hl], a
	jr .asm_1e019c
.asm_1e0196
	ld a, HIGH(Frameset_d4d58)
	ld [hli], a
	ld a, LOW(Frameset_d4d58)
	ld [hl], a

.asm_1e019c
	ld hl, wMenuObj1
	ld a, [wLevelEndScreen]
	cp LVLEND_GREY_TREASURE
	jr z, .grey
	cp LVLEND_RED_TREASURE
	jr z, .red
	cp LVLEND_GREEN_TREASURE
	jr z, .green
	cp LVLEND_BLUE_TREASURE
	jr z, .blue
; no treasure
	play_music MUSIC_LEVEL_CLEAR_NO_TREASURE
	jr .no_treasure
.grey
	ld de, .GreyTreasureParams
	jr .got_treasure_params
.red
	ld de, .RedTreasureParams
	jr .got_treasure_params
.green
	ld de, .GreenTreasureParams
	jr .got_treasure_params
.blue
	ld de, .BlueTreasureParams
.got_treasure_params
	ld a, [de]
	ld [hli], a ; y
	inc de
	ld a, [de]
	ld [hli], a ; x
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a

	play_music MUSIC_LEVEL_CLEAR_GOT_TREASURE

.no_treasure
	stop_sfx

	ld hl, wMenuObj2
	ld a, $28
	ld [hli], a
	ld a, $30
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d5059)
	ld [hli], a
	ld a, LOW(Frameset_d5059)
	ld [hl], a
	ld a, [wNumMusicBoxes]
	and a
	jp z, .asm_1e0279
	dec a
	jr z, .asm_1e0265
	dec a
	jr z, .asm_1e0251
	dec a
	jr z, .asm_1e023d
	dec a
	jr z, .asm_1e0229

	ld hl, wMenuObj3
	ld a, $79
	ld [hli], a
	ld a, $84
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d5068)
	ld [hli], a
	ld a, LOW(Frameset_d5068)
	ld [hl], a

.asm_1e0229
	ld hl, wMenuObj4
	ld a, $8d
	ld [hli], a
	ld a, $7f
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d5065)
	ld [hli], a
	ld a, LOW(Frameset_d5065)
	ld [hl], a

.asm_1e023d
	ld hl, wMenuObj5
	ld a, $8c
	ld [hli], a
	ld a, $69
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d5062)
	ld [hli], a
	ld a, LOW(Frameset_d5062)
	ld [hl], a

.asm_1e0251
	ld hl, wMenuObj6
	ld a, $79
	ld [hli], a
	ld a, $62
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d505f)
	ld [hli], a
	ld a, LOW(Frameset_d505f)
	ld [hl], a

.asm_1e0265
	ld hl, wMenuObj7
	ld a, $67
	ld [hli], a
	ld a, $74
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d505c)
	ld [hli], a
	ld a, LOW(Frameset_d505c)
	ld [hl], a
.asm_1e0279
	ret

.GreyTreasureParams
	db $38 ; y
	db $20 ; x
	dw $4550 ; frameset

.RedTreasureParams
	db $38 ; y
	db $40 ; x
	dw $4a50 ; frameset

.GreenTreasureParams
	db $38 ; y
	db $60 ; x
	dw $4f50 ; frameset

.BlueTreasureParams
	db $38 ; y
	db $80 ; x
	dw $5450 ; frameset
; 0x1e028a

Func_1e028a: ; 1e028a (78:428a)
	ld a, [wTimeAttackResult]
	cp TIME_ATTACK_GOT_HIGH_SCORE
	jr nz, .asm_1e02a5
	ld hl, wMenuObj8
	ld a, $60
	ld [hli], a
	ld a, $1c
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d5080)
	ld [hli], a
	ld a, LOW(Frameset_d5080)
	ld [hl], a

.asm_1e02a5
	ld hl, wClearScreenWario
	ld a, $90
	ld [hli], a
	ld a, $2c
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [wActionHelpWarioVar], a
	ld a, [wTimeAttackResult]
	cp TIME_ATTACK_GOT_HIGH_SCORE
	jr nz, .asm_1e02cd
	play_music MUSIC_LEVEL_CLEAR_GOT_TREASURE
	ld a, HIGH(Frameset_d4d18)
	ld [hli], a
	ld a, LOW(Frameset_d4d18)
	ld [hl], a
	jr .asm_1e02db
.asm_1e02cd
	play_music MUSIC_LEVEL_CLEAR_NO_TREASURE
	ld a, HIGH(Frameset_d4d58)
	ld [hli], a
	ld a, LOW(Frameset_d4d58)
	ld [hl], a
.asm_1e02db
	stop_sfx

	ld hl, wMenuObj2
	ld a, $28
	ld [hli], a
	ld a, $30
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d5059)
	ld [hli], a
	ld a, LOW(Frameset_d5059)
	ld [hl], a

	ld hl, wMenuObj3
	ld a, $44
	ld [hli], a
	ld a, $28
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d50a1)
	ld [hli], a
	ld a, LOW(Frameset_d50a1)
	ld [hl], a

	ld a, [wKeyAndTreasureFlags]
	bit GREY_KEY_F, a
	jr z, .red_key
	ld hl, wMenuObj4
	ld a, $7c
	ld [hli], a
	ld a, $5c
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d5095)
	ld [hli], a
	ld a, LOW(Frameset_d5095)
	ld [hl], a

.red_key
	ld a, [wKeyAndTreasureFlags]
	bit RED_KEY_F, a
	jr z, .green_key
	ld hl, wMenuObj5
	ld a, $7c
	ld [hli], a
	ld a, $74
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d5098)
	ld [hli], a
	ld a, LOW(Frameset_d5098)
	ld [hl], a

.green_key
	ld a, [wKeyAndTreasureFlags]
	bit GREEN_KEY_F, a
	jr z, .blue_key
	ld hl, wMenuObj6
	ld a, $8e
	ld [hli], a
	ld a, $5c
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d509b)
	ld [hli], a
	ld a, LOW(Frameset_d509b)
	ld [hl], a

.blue_key
	ld a, [wKeyAndTreasureFlags]
	bit BLUE_KEY_F, a
	jr z, .done
	ld hl, wMenuObj7
	ld a, $8e
	ld [hli], a
	ld a, $74
	ld [hli], a
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld a, HIGH(Frameset_d509e)
	ld [hli], a
	ld a, LOW(Frameset_d509e)
	ld [hl], a
.done
	ret
; 0x1e0378

Pals_1e0378: ; 1e0378 (78:4378)
	rgb 24, 30, 31
	rgb 11, 24, 31
	rgb  0,  9, 25
	rgb  0,  0,  0

	rgb 31, 31,  7
	rgb 11, 24, 31
	rgb  0,  9, 25
	rgb  0,  0,  0

	rgb 31, 23, 28
	rgb  8,  0, 16
	rgb 27,  3, 31
	rgb  0,  0,  0

	rgb 24, 30, 31
	rgb 11, 24, 31
	rgb 31, 31,  7
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 10,  1
	rgb 14,  3,  1
	rgb  5,  0,  0

	rgb 31, 31, 31
	rgb 30, 15,  2
	rgb 26,  0,  0
	rgb  7,  0,  0

	rgb 31, 31, 31
	rgb 16, 16, 16
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb  0, 20,  0
	rgb  0, 19, 31
	rgb  0,  0,  0
; 0x1e03b8

Pals_1e03b8: ; 1e03b8 (78:43b8)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 11, 24, 31
	rgb 14, 11, 26
	rgb 16,  0, 24

	rgb 31, 31, 31
	rgb  2, 31, 31
	rgb  6,  6, 31
	rgb  0,  0,  7

	rgb  0, 22, 16
	rgb 31, 23,  4
	rgb 31, 13,  4
	rgb 31,  0,  2

	rgb 31, 31, 31
	rgb 31, 31,  0
	rgb 19, 16,  0
	rgb  5,  4,  0

	rgb 31, 31, 31
	rgb 31, 19, 23
	rgb 27,  0,  6
	rgb  7,  0,  0

	rgb 31, 31, 31
	rgb 22, 31, 20
	rgb  0, 21,  0
	rgb  0,  2,  0

	rgb 31, 31, 27
	rgb 21, 21, 19
	rgb 10, 10,  8
	rgb  0,  0,  0
; 0x1e03f8

Pals_1e03f8: ; 1e03f8 (78:43f8)
	rgb 31, 27, 16
	rgb 31, 15,  2
	rgb 25,  3,  0
	rgb  0,  0,  0

	rgb 31, 31,  7
	rgb 31, 15,  2
	rgb 25,  3,  0
	rgb  0,  0,  0

	rgb 17, 31, 24
	rgb  0,  8,  6
	rgb  1, 23, 20
	rgb  0,  0,  0

	rgb 31, 27, 16
	rgb 31, 15,  2
	rgb 31, 31,  7
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb 21, 10,  1
	rgb 14,  3,  1
	rgb  5,  0,  0

	rgb  0,  0, 12
	rgb 30, 31, 31
	rgb  8, 20, 31
	rgb  7,  0,  0

	rgb 31, 31, 31
	rgb 16, 16, 16
	rgb 31,  0,  0
	rgb  0,  0,  0

	rgb 31, 31, 31
	rgb  0, 20,  0
	rgb  0, 19, 31
	rgb  0,  0,  0
; 0x1e0438

Pals_1e0438: ; 1e0438 (78:4438)
	rgb  0, 22, 16
	rgb 31, 31, 31
	rgb 31, 15, 10
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 11, 24, 31
	rgb 14, 11, 26
	rgb 16,  0, 24

	rgb  0, 22, 16
	rgb 19, 31, 31
	rgb  0, 12, 31
	rgb  0,  0,  7

	rgb  0, 22, 16
	rgb 31, 23,  4
	rgb 31, 13,  4
	rgb 31,  0,  2

	rgb  0, 22, 16
	rgb 28, 28, 28
	rgb 15, 15, 15
	rgb  0,  0,  0

	rgb  0, 22, 16
	rgb 31, 24, 24
	rgb 23,  0,  0
	rgb  7,  0,  0

	rgb  0, 22, 16
	rgb 24, 31, 21
	rgb  0, 16,  0
	rgb  0,  2,  0

	rgb  0, 22, 16
	rgb 31, 31,  0
	rgb 31, 17,  0
	rgb 31,  0,  0
; 0x1e0478

ClearScreen1Gfx: ; 1e0478 (78:4478)
INCBIN "gfx/pause/clear_screen1.2bpp.lz"

ClearScreen2Gfx: ; 1e11e8 (78:51e8)
INCBIN "gfx/pause/clear_screen2.2bpp.lz"

BGMap_1e17fa: ; 1e17fa (1:57fa)
INCBIN "gfx/bgmaps/map_1e17fa.bin"
	
BGMap_1e1962: ; 1e1962 (1:5962)
INCBIN "gfx/bgmaps/map_1e1962.bin"

BGMap_1eae5: ; 1e1ae5 (1:5ae5)
INCBIN "gfx/bgmaps/map_1e1ae5.bin"
	
BGMap_1ec5b: ; 1e1c5b (1:5c5b)
INCBIN "gfx/bgmaps/map_1e1c5b.bin"