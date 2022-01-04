Data_60000: ; 60000 (18:4000)
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	db  0,  0,  0,  0,  1,  1,  1,  2,  2,  2,  3,  3,  4,  4,  4, $80
; 0x60020

Data_60020: ; 60020 (18:4020)
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	db  0,  0,  0,  0,  1,  2,  2,  3,  3,  4,  4,  5,  5,  5,  5, $80
; 0x60040

Data_60040: ; 60040 (18:4040)
	db -3, -2, -1,  0,  1,  1,  1,  1,  1,  1,  2,  2,  2,  3,  3,  3
	db  3,  3,  3,  3,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4,  4, $80
; 0x60060

Data_60060: ; 60060 (18:4060)
	db -2, -1,  1,  2,  3,  3,  3,  3,  3,  3,  3,  3,  3,  3,  4,  4
	db  4,  4,  4,  4,  4,  5,  5,  5,  5,  5,  5,  5,  5,  5,  5, $80
; 0x60080

Data_60080: ; 60080 (18:4080)
	db  0,  0,  1,  1,  1,  2,  2,  2,  2,  3,  3,  3,  3,  4,  3,  4
	db  4,  4,  4,  4,  4,  4,  5,  5,  5,  5,  5,  5,  5,  5,  5, $80
; 0x600a0

Data_600a0: ; 600a0 (18:40a0)
	db  0,  0,  0,  0,  0,  0,  1,  1,  1,  2,  2,  2,  2,  3,  3,  3
	db  3,  3,  3,  4,  4,  4,  4,  4,  4,  4,  5,  5,  5,  5,  5, $80
; 0x600c0

Data_600c0: ; 600c0 (18:40c0)
	db  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0
	db  0,  0,  0,  1,  0,  1,  1,  1,  1,  2,  2,  2,  3,  3,  4, $80
; 0x600e0

Data_600e0: ; 600e0 (18:40e0)
	db  0,  0,  0,  0,  0,  0,  1,  0,  1,  1,  1,  1,  2,  2,  2,  2
	db  3,  3,  3,  3,  3,  3,  4,  4,  4,  4,  4,  4,  4,  4,  4, $80
; 0x60100

Data_60100: ; 60100 (18:4100)
	db -4, -4, -4, -4, -4, -4, -3, -3, -3, -3, -3, -3, -2, -2, -1, -1
	db  0,  0,  0,  1,  1,  1,  2,  2,  2,  3,  3,  3,  4,  4,  5, $80
; 0x60120

Data_60120: ; 60120 (18:4120)
	db -4, -4, -4, -3, -3, -3, -2, -2, -1, -1,  0,  0,  0,  1,  1,  1
	db  2,  2,  3,  3,  3,  4,  4,  4,  5,  5,  5,  5,  5,  5,  5, $80
; 0x60140

Data_60140: ; 60140 (18:4140)
	db -7, -7, -7, -7, -6, -6, -6, -6, -5, -5, -5, -5, -4, -4, -4, -3
	db -3, -3, -2, -2, -1,  0,  0,  0,  0,  1,  1,  2,  3,  4,  5, $80
; 0x60160

Data_60160: ; 60160 (18:4160)
	db -7, -6, -5, -5, -5, -4, -4, -4, -3, -3, -3, -3, -2, -2, -1, -1
	db  0,  0,  0,  1,  1,  2,  2,  3,  3,  4,  4,  5,  5,  6,  6, $80
; 0x60180

Data_60180: ; 60180 (18:4180)
	db -7, -6, -5, -4, -3, -3, -2, -2, -1, -1,  0,  0,  0,  0,  0,  0
	db  0,  1,  0,  1,  2,  2,  3,  2,  3,  3,  4,  4,  5,  6,  7, $80
; 0x601a0

Data_601a0: ; 601a0 (18:41a0)
	db -4, -3, -3, -3, -2, -2, -1, -1, -1,  0,  0,  1,  0,  1,  0,  1
	db  1,  2,  1,  2,  2,  3,  3,  3,  4,  5,  6,  7,  8,  9, 10, $80
; 0x601c0

	INCROM $601c0, $60280

; y-offset values for falling light objects
Data_60280: ; 60280 (18:4280)
	db 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, $80
; 0x60290

; y-offset values for falling heavy objects
Data_60290: ; 60290 (18:4290)
	db 1, 1, 1, 2, 2, 2, 3, 3, 3, 3, 3, 4, 4, 4, 4, $80
; 0x602a0

Data_602a0: ; 602a0 (18:42a0)
	db -4, -3, -2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, $80
; 0x602b0

Data_602b0: ; 602b0 (18:42b0)
	db -3, -2, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, $80
; 0x602c0

Data_602c0: ; 602c0 (18:42c0)
	db -2, -1, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
; 0x602d0

Data_602d0: ; 602d0 (18:42d0)
	db -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
; 0x602e0

Data_602e0: ; 602e0 (18:42e0)
	db -3, -2, -2, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
; 0x602f0

Data_602f0: ; 602f0 (18:42f0)
	db -2, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
; 0x60300

Data_60300: ; 60300 (18:4300)
	db -4, -3, -3, -2, -1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
; 0x60310

Data_60310: ; 60310 (18:4310)
	db -3, -2,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, $80
; 0x60320

	INCROM $60320, $611cb

Func_611cb: ; 611cb (18:51cb)
	push hl
	inc l
	rla
	ld [wCurObjFlags], a
for n, 1, OBJ_STRUCT_LENGTH - 1
	ld a, [hli]
	ld [wCurObj + n], a
endr
	ld a, [hl]
	ld [wCurObj + OBJ_STRUCT_LENGTH - 1], a

	call Func_61760
	farcall $13, wCurObjUpdateFunction

	call UpdateObjectAnimation
	call Func_6307b
	ld hl, wCurObjScreenYPos
	ld a, [wSCY]
	ld b, a
	ld a, [wCurObjYPos]
	add $10
	sub b
	ld [hli], a
	ld a, [wSCX]
	ld b, a
	ld a, [wCurObjXPos]
	add $08
	sub b
	ld [hli], a

	ld hl, wc0bc
	ld a, [wc089]
	add [hl]
	ld [wSCY], a
	ld a, [wc08b]
	ld [wSCX], a
	pop hl

	ld a, [wCurObjFlags]
	and $ff ^ (OBJFLAG_UNK5)
	ld [hli], a
	inc l
	inc l
	ld a, [wCurObjYPos]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	ld a, [wCurObjXPos]
	ld [hli], a
	ld a, [wCurObjXPos + 1]
	ld [hli], a
	ld a, [wCurObjUnk07]
	ld [hli], a
	ld a, [wCurObjInteractionType]
	ld [hli], a
	ld a, [wCurObjUnk09]
	ld [hli], a
	ld a, [wCurObjUnk0a]
	ld [hli], a
	ld a, [wCurObjUnk0b]
	ld [hli], a
	ld a, [wCurObjUnk0c]
	ld [hli], a
	ld a, [wCurObjScreenYPos]
	ld [hli], a
	ld a, [wCurObjScreenXPos]
	ld [hli], a
	ld a, [wCurObjFrame]
	ld [hli], a
	ld a, [wCurObjUnk10 + 0]
	ld [hli], a
	ld a, [wCurObjUnk10 + 1]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 0]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 1]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 0]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 1]
	ld [hli], a
	ld a, [wCurObjUnk16]
	ld [hli], a
	ld a, [wCurObjUnk17]
	ld [hli], a
	ld a, [wCurObjUnk18]
	ld [hli], a
	ld a, [wCurObjUnk19]
	ld [hli], a
	ld a, [wCurObjUnk1a]
	ld [hli], a
	ld a, [wCurObjAction]
	ld [hli], a
	ld a, [wCurObjUnk1c]
	ld [hli], a
	inc l
	ld a, [wCurObjUpdateFunction]
	ld [hli], a
	ld a, [wCurObjUpdateFunction + 1]
	ld [hl], a
	ret
; 0x6130b

Func_6130b: ; 6130b (18:530b)
	call Func_618e2
	ld hl, wObj1Flags
	ld a, [hl]
	rra
	call c, Func_611cb
for n, 2, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	rra
	call c, Func_611cb
endr
	ret
; 0x61348

Func_61348: ; 61348 (18:5348)
	ld a, [wPowerUpLevel]
	ld e, a
	ld a, [wTransformation]
	rla
	jr nc, .asm_61354
	ld e, POWER_UP_SUPER_JUMP_SLAM_OVERALLS
.asm_61354
	ld a, e
	ld [w1d14a], a

	ld a, [wLevel]
	cp THE_TEMPLE
	jr z, Func_6130b

	ld a, [wIsFloorTransition]
	and a
	jr nz, .floor_transition
	call Func_618e2
	ld hl, wObj1Flags
	ld a, [hl]
	rra
	call c, Func_613dc
for n, 2, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	rra
	call c, Func_613dc
endr
	ret

.floor_transition
	ld hl, wObj1Flags
	ld a, [hl]
	rra
	call c, Func_61513
for n, 2, NUM_OBJECTS + 1
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	rra
	call c, Func_61513
endr
	ret
; 0x613dc

Func_613dc: ; 613dc (18:53dc)
	push hl
	inc l
	rla
	ld [wCurObjFlags], a
for n, 1, OBJ_STRUCT_LENGTH - 1
	ld a, [hli]
	ld [wCurObj + n], a
endr
	ld a, [hl]
	ld [wCurObj + OBJ_STRUCT_LENGTH - 1], a

	call Func_61760
	ld a, [wCurObjUnk07]
	swap a
	and $0f
	or $10
	ldh [hCallFuncBank], a
	ld a, [wCurObjUpdateFunction + 0]
	ldh [hCallFuncPointer], a
	ld a, [wCurObjUpdateFunction + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

	call UpdateObjectAnimation
	call Func_6307b
	ld hl, wCurObjScreenYPos
	ld a, [wSCY]
	ld b, a
	ld a, [wCurObjYPos]
	add $10
	sub b
	ld [hli], a
	ld a, [wSCX]
	ld b, a
	ld a, [wCurObjXPos]
	add $08
	sub b
	ld [hli], a
	pop hl
	ld a, [wCurObjFlags]
	and $ff ^ (OBJFLAG_UNK5)
	ld [hli], a
	inc l
	inc l
	ld a, [wCurObjYPos]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	ld a, [wCurObjXPos]
	ld [hli], a
	ld a, [wCurObjXPos + 1]
	ld [hli], a
	ld a, [wCurObjUnk07]
	ld [hli], a
	ld a, [wCurObjInteractionType]
	ld [hli], a
	ld a, [wCurObjUnk09]
	ld [hli], a
	ld a, [wCurObjUnk0a]
	ld [hli], a
	ld a, [wCurObjUnk0b]
	ld [hli], a
	ld a, [wCurObjUnk0c]
	ld [hli], a
	ld a, [wCurObjScreenYPos]
	ld [hli], a
	ld a, [wCurObjScreenXPos]
	ld [hli], a
	ld a, [wCurObjFrame]
	ld [hli], a
	ld a, [wCurObjUnk10 + 0]
	ld [hli], a
	ld a, [wCurObjUnk10 + 1]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 0]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 1]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 0]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 1]
	ld [hli], a
	ld a, [wCurObjUnk16]
	ld [hli], a
	ld a, [wCurObjUnk17]
	ld [hli], a
	ld a, [wCurObjUnk18]
	ld [hli], a
	ld a, [wCurObjUnk19]
	ld [hli], a
	ld a, [wCurObjUnk1a]
	ld [hli], a
	ld a, [wCurObjAction]
	ld [hli], a
	ld a, [wCurObjUnk1c]
	ld [hli], a
	inc l
	ld a, [wCurObjUpdateFunction]
	ld [hli], a
	ld a, [wCurObjUpdateFunction + 1]
	ld [hl], a
	ret
; 0x61513

Func_61513: ; 61513 (18:5513)
	push hl
	inc l
	rla
	ld [wCurObjFlags], a
for n, 1, OBJ_STRUCT_LENGTH - 1
	ld a, [hli]
	ld [wCurObj + n], a
endr
	ld a, [hl]
	ld [wCurObj + OBJ_STRUCT_LENGTH - 1], a

	ld hl, wCurObjUnk1a
	bit 5, [hl]
	jr z, .skip_update_function

	ld a, [wCurObjUnk07]
	swap a
	and $0f
	or $10
	ldh [hCallFuncBank], a
	ld a, [wCurObjUpdateFunction + 0]
	ldh [hCallFuncPointer], a
	ld a, [wCurObjUpdateFunction + 1]
	ldh [hCallFuncPointer + 1], a
	call hCallFunc

.skip_update_function
	call Func_3104
	call Func_6307b
	ld hl, wCurObjScreenYPos
	ld a, [wSCY]
	ld b, a
	ld a, [wCurObjYPos]
	add $10
	sub b
	ld [hli], a
	ld a, [wSCX]
	ld b, a
	ld a, [wCurObjXPos]
	add $08
	sub b
	ld [hli], a
	pop hl
	ld a, [wCurObjFlags]
	and $ff ^ (OBJFLAG_UNK5)
	ld [hli], a
	inc l
	inc l
	ld a, [wCurObjYPos]
	ld [hli], a
	ld a, [wCurObjYPos + 1]
	ld [hli], a
	ld a, [wCurObjXPos]
	ld [hli], a
	ld a, [wCurObjXPos + 1]
	ld [hli], a
	ld a, [wCurObjUnk07]
	ld [hli], a
	ld a, [wCurObjInteractionType]
	ld [hli], a
	ld a, [wCurObjUnk09]
	ld [hli], a
	ld a, [wCurObjUnk0a]
	ld [hli], a
	ld a, [wCurObjUnk0b]
	ld [hli], a
	ld a, [wCurObjUnk0c]
	ld [hli], a
	ld a, [wCurObjScreenYPos]
	ld [hli], a
	ld a, [wCurObjScreenXPos]
	ld [hli], a
	ld a, [wCurObjFrame]
	ld [hli], a
	ld a, [wCurObjUnk10 + 0]
	ld [hli], a
	ld a, [wCurObjUnk10 + 1]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 0]
	ld [hli], a
	ld a, [wCurObjFramesetPtr + 1]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 0]
	ld [hli], a
	ld a, [wCurObjFrameDuration + 1]
	ld [hli], a
	ld a, [wCurObjUnk16]
	ld [hli], a
	ld a, [wCurObjUnk17]
	ld [hli], a
	ld a, [wCurObjUnk18]
	ld [hli], a
	ld a, [wCurObjUnk19]
	ld [hli], a
	ld a, [wCurObjUnk1a]
	ld [hli], a
	ld a, [wCurObjAction]
	ld [hli], a
	ld a, [wCurObjUnk1c]
	ld [hli], a
	inc l
	ld a, [wCurObjUpdateFunction]
	ld [hli], a
	ld a, [wCurObjUpdateFunction + 1]
	ld [hl], a
	ret
; 0x6164e

Func_6164e: ; 6164e (18:564e)
for n, 1, NUM_OBJECTS + 1
	ld hl, wObj{u:n}Flags
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK7
	jr nz, .next_{u:n}
	ld e, LOW(wObj{u:n}ScreenYPos)
	ld l, LOW(wObj{u:n}Unk07)
	call UpdateObjSprite
.next_{u:n}
endr

	ret
; 0x616d7

Func_616d7: ; 616d7 (18:56d7)
for n, 1, NUM_OBJECTS + 1
	ld hl, wObj{u:n}Flags
	ld a, [hl]
	and OBJFLAG_UNK0 | OBJFLAG_UNK1 | OBJFLAG_UNK4 | OBJFLAG_UNK7
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .next_{u:n}
	ld e, LOW(wObj{u:n}ScreenYPos)
	ld l, LOW(wObj{u:n}Unk07)
	call UpdateObjSprite
.next_{u:n}
endr

	ret
; 0x61760

Func_61760: ; 61760 (18:5760)
	ld a, [wCurObjUnk1c]
	and a
	ret z
	bit 7, a
	jr z, .jump
	dec a
	cp $80
	jr nz, .asm_6176f
	xor a
.asm_6176f
	ld [wCurObjUnk1c], a
	ret

.jump
	jumptable

	dw Func_617a6
	dw Func_617a7
	dw $57c1
	dw $57da
	dw $57f2
	dw $5809
	dw $581d
	dw $583e
	dw $58a5
	dw $5847
	dw $5851
	dw $5857
	dw $5861
	dw $586b
	dw $5875
	dw $587f
	dw $5889
	dw $5893
	dw $5819
	dw Func_6179c
; 0x6179c

Func_6179c: ; 6179c (18:579c)
	ld hl, wCurObjUnk1c
	ld a, $8f
	ld [hld], a
	ld a, OBJ_ACTION_2F
	ld [hl], a ; OBJ_ACTION
	ret
; 0x617a6

Func_617a6: ; 617a6 (18:57a6)
	ret
; 0x617a7

Func_617a7: ; 617a7 (18:57a7)
	ld a, [wCurObjInteractionType]
	and $ff ^ (HEAVY_OBJ)
	jr z, .asm_617f2
	ld hl, wCurObjUnk1d
	ld a, [hld]
	and $20
	ld a, $8f
	ld [hld], a ; OBJ_UNK_1C
	jr z, .asm_617bd
	ld a, OBJ_ACTION_02
	ld [hl], a ; OBJ_ACTION
	ret
.asm_617bd
	ld a, OBJ_ACTION_03
	ld [hl], a ; OBJ_ACTION
	ret

	ld hl, wCurObjFlags
	res OBJFLAG_UNK2_F, [hl]
	set OBJFLAG_UNK3_F, [hl]
	ld l, OBJ_UNK_1D
	ld a, [hld]
	and $20
	ld a, $8f
	ld [hld], a ; OBJ_UNK_1C
	jr z, .asm_617d6
	ld a, OBJ_ACTION_04
	ld [hl], a ; OBJ_ACTION
	ret
.asm_617d6
	ld a, OBJ_ACTION_05
	ld [hl], a ; OBJ_ACTION
	ret

	ld hl, wCurObjFlags
	res OBJFLAG_UNK2_F, [hl]
	ld a, [wDirection]
	and a
	ld l, OBJ_UNK_1C
	ld a, $8f
	ld [hld], a ; OBJ_UNK_1C
	jr z, .asm_617ee
	ld a, OBJ_ACTION_06
	ld [hl], a ; OBJ_ACTION
	ret
.asm_617ee
	ld a, OBJ_ACTION_07
	ld [hl], a ; OBJ_ACTION
	ret

.asm_617f2
	ld hl, wCurObjFlags
	res OBJFLAG_UNK2_F, [hl]
	ld l, OBJ_UNK_1D
	ld a, [hld]
	and $20
	ld a, $8f
	ld [hld], a
	jr z, .asm_61805
	ld a, $08
	ld [hl], a
	ret
.asm_61805
	ld a, $09
	ld [hl], a
	ret
; 0x61809

	INCROM $61809, $6189d

Func_6189d:: ; 6189d (18:589d)
	play_sfx SFX_018

	ld hl, wCurObjUpdateFunction + 1
	ld a, $48
	ld [hld], a
	ld a, $a2
	ld [hld], a
	ld l, OBJ_UNK_1A
	ld a, [hl]
	and $f0
	ld [hld], a
	ld a, $30
	ld [wCurObjUnk07], a

	ld hl, wCurObjUnk10
	ld a, $00
	ld [hli], a ; OBJ_UNK_10
	ld a, $40
	ld [hli], a
	ld a, $c5
	ld [hli], a ; OBJ_FRAMESET_PTR
	ld a, $40
	ld [hli], a
	xor a
	ld [hli], a ; OBJ_FRAME_DURATION
	ld [hli], a ; OBJ_FRAMESET_OFFSET
	ld a, $21
	ld [hli], a ; OBJ_UNK_16

	ld l, OBJ_FLAGS
	res OBJFLAG_UNK2_F, [hl]
	set OBJFLAG_UNK3_F, [hl]
	ld a, $81
	ld [wCurObjUnk1c], a

	ld l, OBJ_Y_POS
	ld a, [hl]
	sub $08
	ld [hli], a
	ret nc
	dec [hl]
	ret
; 0x618e2

Func_618e2: ; 618e2 (18:58e2)
	ld hl, wObj1Flags
	ld e, OBJFLAG_UNK0 | OBJFLAG_UNK2
	ld a, [hl]
	and e
	cp e
for n, 2, NUM_OBJECTS + 1
	jr z, .asm_6191c
	ld l, LOW(wObj{u:n}Flags)
	ld a, [hl]
	and e
	cp e
endr
	ret nz

.asm_6191c
	push hl
	ld a, l
	add OBJ_INTERACTION_TYPE - OBJ_FLAGS
	ld l, a
	ld a, [hli] ; OBJ_INTERACTION_TYPE
	ldh [hffa0], a
	ld a, [hli] ; OBJ_UNK_09
	ld b, a
	ld a, [hli] ; OBJ_UNK_0A
	ld c, a
	ld a, [hli] ; OBJ_UNK_0B
	ld d, a
	ld a, [hli] ; OBJ_UNK_0C
	ld e, a
	ld a, [hl] ; OBJ_SCREEN_Y_POS
	add $2a
	add b
	ld b, a
	ld a, [hli] ; OBJ_SCREEN_Y_POS
	add $2a
	add c
	ld c, a
	ld a, [hl] ; OBJ_SCREEN_X_POS
	add $2a
	add d
	ld d, a
	ld a, [hli] ; OBJ_SCREEN_X_POS
	add $2a
	add e
	ld e, a
	ld a, l
	add OBJ_ACTION - (OBJ_SCREEN_X_POS + 1)
	ld l, a
	ld a, [hl] ; OBJ_ACTION
	cp OBJ_ACTION_4C
	jr nc, .asm_6194d
	cp OBJ_ACTION_48
	jr nc, .asm_61992

.asm_6194d
	rra
	ld hl, hffa0
	ld a, [hli]
	jr c, .asm_61973
	rla
	jr c, .asm_61965
	ld a, $28
	ld [hli], a ; hffa1
	ld a, OBJ_ACTION_29
	ld [hli], a ; hffa2
	ld a, $09
	ld [hli], a ; hffa3
	ld a, $29
	ld [hli], a ; hffa4
	jr .check_objs

.asm_61965
	ld a, $28
	ld [hli], a ; hffa1
	ld a, OBJ_ACTION_08
	ld [hli], a ; hffa2
	ld a, $28
	ld [hli], a ; hffa3
	ld a, $29
	ld [hli], a ; hffa4
	jr .check_objs

.asm_61973
	rla
	jr c, .asm_61984
	ld a, $29
	ld [hli], a ; ; hffa1
	ld a, OBJ_ACTION_28
	ld [hli], a ; ; hffa2
	ld a, $08
	ld [hli], a ; ; hffa3
	ld a, $28
	ld [hli], a ; ; hffa4
	jr .check_objs

.asm_61984
	ld a, $29
	ld [hli], a ; hffa1
	ld a, OBJ_ACTION_09
	ld [hli], a ; hffa2
	ld a, $29
	ld [hli], a ; hffa3
	ld a, $28
	ld [hli], a ; hffa4
	jr .check_objs

.asm_61992
	rra
	ld hl, hffa1
	jr c, .asm_619a0
	ld a, $09
	ld [hli], a ; hffa1
	ld a, OBJ_ACTION_08
	ld [hli], a ; hffa2
	jr .check_objs

.asm_619a0
	ld a, $08
	ld [hli], a ; hffa1
	ld a, OBJ_ACTION_09
	ld [hli], a ; hffa2

.check_objs

for n, 1, NUM_OBJECTS + 1
	ld a, [wObj{u:n}Flags]
	and $1f
	cp OBJFLAG_UNK0 | OBJFLAG_UNK1
	jr nz, .next_obj_{u:n}
	ld a, [wObj{u:n}ScreenYPos]
	add $2a
	ld h, a
	ld a, [wObj{u:n}ScreenXPos]
	add $2a
	ld l, a
	ld a, [wObj{u:n}Unk0a]
	add h
	sub b
	jr c, .next_obj_{u:n}
	ld a, [wObj{u:n}Unk09]
	add h
	sub c
	jr nc, .next_obj_{u:n}
	ld a, [wObj{u:n}Unk0c]
	add l
	sub d
	jr c, .next_obj_{u:n}
	ld a, [wObj{u:n}Unk0b]
	add l
	sub e
	jr nc, .next_obj_{u:n}
	pop hl
	res OBJFLAG_UNK2_F, [hl]
	ld a, l
	add OBJ_ACTION - OBJ_FLAGS
	ld l, a
	ld a, [hl] ; OBJ_ACTION
	and $fe
	cp OBJ_ACTION_4A
	jp z, .Func_61d28_{u:n}
	cp OBJ_ACTION_48
	jp z, .Func_61d28_{u:n}
	ld a, [wObj{u:n}InteractionType]
	rla
	jp c, .Func_61df0_{u:n} ; heavy
	ldh a, [hffa2]
	ld [hl], a ; OBJ_ACTION
	ld l, LOW(wObj{u:n}Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .reset_grab_{u:n}_1
	cp OBJ_ACTION_48
	jr nz, .skip_reset_grab_{u:n}_1
.reset_grab_{u:n}_1
	xor a
	ld [wGrabState], a
.skip_reset_grab_{u:n}_1
	ldh a, [hffa1]
	ld [hl], a ; OBJ_ACTION
	ld l, LOW(wObj{u:n}Flags)
	set OBJFLAG_UNK3_F, [hl]
	play_sfx SFX_016
	ret
.next_obj_{u:n}
endr

	pop hl
	ret

for n, 1, NUM_OBJECTS + 1
.Func_61d28_{u:n}
	xor a
	ld [wGrabState], a
	ldh a, [hffa2]
	ld [hl], a ; OBJ_ACTION
	ld l, LOW(wObj{u:n}Action)
	ldh a, [hffa1]
	ld [hl], a
	ld l, LOW(wObj{u:n}Flags)
	set OBJFLAG_UNK3_F, [hl]
	play_sfx SFX_016
	ret
endr

for n, 1, NUM_OBJECTS + 1
.Func_61df0_{u:n}
	ldh a, [hffa4]
	ld [hl], a
	ld l, LOW(wObj{u:n}Action)
	ld a, [hl]
	and $fe
	cp OBJ_ACTION_36
	jr z, .reset_grab_{u:n}_2
	cp OBJ_ACTION_48
	jr nz, .skip_reset_grab_{u:n}_2
.reset_grab_{u:n}_2
	xor a
	ld [wGrabState], a
.skip_reset_grab_{u:n}_2
	ldh a, [hffa3]
	ld [hl], a
	ld l, LOW(wObj{u:n}Flags)
	set OBJFLAG_UNK3_F, [hl]
	play_sfx SFX_016
	ret
endr
; 0x61f10

Func_61f10: ; 61f10 (18:5f10)
	xor a
	call Func_61f41 ; clears whole wObjects
	call Func_61f4a ; clears whole w1d120
	ld [w1d140], a
	ld [w1d141], a
	ld [w1d142], a
	ld [w1d143], a
	ld [wNumShootGoals], a
	ld [w1d145], a
	ret
; 0x61f2a

Func_61f2a: ; 61f2a (18:5f2a)
	xor a
	call Func_61f41 ; clears whole wObjects
	call Func_61f4a ; clears whole w1d120
	ld [w1d141], a
	ld [w1d142], a
	ld [w1d143], a
	ld [wNumShootGoals], a
	ld [w1d145], a
	ret
; 0x61f41

Func_61f41: ; 61f41 (18:5f41)
	ld hl, wObjects
	ld c, a
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 0x61f4a

Func_61f4a: ; 61f4a (18:5f4a)
	ld hl, w1d120
	ld c, $20
.loop
	ld [hli], a
	dec c
	jr nz, .loop
	ret
; 0x61f54

	INCROM $61f54, $629a6

Func_629a6:: ; 629a6 (18:69a6)
	ld hl, wCurObjUnk19
	ld a, [hl]
	ld b, HIGH(Data_602a0)
	add LOW(Data_602a0)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add $10
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_629c2
	dec c
	ld a, [bc]
	jr .asm_629c3
.asm_629c2
	inc [hl] ; OBJ_UNK_19
.asm_629c3
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr c, .asm_629cd
	dec [hl]
.asm_629cd
	jp Func_316b
; 0x629d0

Func_629d0:: ; 629d0 (18:69d0)
	ld hl, wCurObjFrameDuration
	ld a, [hl]
	cp $03
	jr c, .asm_629db
	sub $03
	ld [hl], a
.asm_629db
	ld hl, wCurObjUnk19
	ld a, [hl]
	ld b, HIGH(Data_60000)
	add LOW(Data_60000)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add $20
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_629f7
	dec c
	ld a, [bc]
	jr .asm_629f8
.asm_629f7
	inc [hl] ; OBJ_UNK_19
.asm_629f8
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_62a08
	add c
	ld [hli], a
	jr nc, .asm_62a0d
	inc [hl]
	jr .asm_62a0d
.asm_62a08
	add c
	ld [hli], a
	jr c, .asm_62a0d
	dec [hl]

.asm_62a0d
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a

	xor a
	ld [wc18c], a
	call Func_352b
	and a
	jr nz, .asm_62a35
	ld a, [wc0dd]
	and a
	jp z, Func_316b
	ld a, OBJ_ACTION_0A
	ld [wCurObjAction], a
	jp Func_316b

.asm_62a35
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_ACTION
	ld a, [wc18c]
	and a
	jr nz, .asm_62a4c
	ld a, OBJ_ACTION_13
	ld [hl], a
	jp Func_316b
.asm_62a4c
	and $0f
	cp $01
	ld a, $02
	ld [wCurObjUnk18], a
	jp z, Func_62d57
	jp Func_62e31
; 0x62a5b

; handle gravity for falling objects
_ApplyObjectGravity:: ; 62a5b (18:6a5b)
	ld hl, wCurObjUnk19
	ld a, [hl]
	ld b, HIGH(Data_60280)
	add LOW(Data_60280)
	ld c, a
	ld a, [wCurObjInteractionType]
	rla
	jr nc, .not_heavy
	ld a, c
	add Data_60290 - Data_60280
	ld c, a
.not_heavy
	ld a, [bc]
	cp $80
	jr nz, .asm_62a77
	dec c ; use last entry
	ld a, [bc]
	jr .asm_62a78
.asm_62a77
	inc [hl]
.asm_62a78
	ldh [hffa0], a
	ld l, OBJ_Y_POS
	ld c, [hl]
	add c
	ld [hli], a
	jr nc, .asm_62a82
	inc [hl]
.asm_62a82
	ld hl, wCurObjYPos
	ld a, [hli]
	ldh [hYPosLo], a
	ld a, [hli]
	ldh [hYPosHi], a
	ld a, [hli]
	ldh [hXPosLo], a
	ld a, [hl]
	ldh [hXPosHi], a
	xor a
	ld [wc18c], a
	call Func_352b
	and a
	jr nz, .asm_62aaa
	ld a, [wc0dd]
	and a
	jp z, Func_316b
	ld a, OBJ_ACTION_0A
	ld [wCurObjAction], a
	jp Func_316b
.asm_62aaa
	ld hl, wCurObjYPos
	ldh a, [hYPosLo]
	ld [hli], a
	ldh a, [hYPosHi]
	ld [hl], a
	ld l, OBJ_ACTION
	ld a, [wc18c]
	and a
	jr nz, .asm_62ac1
	ld a, OBJ_ACTION_01
	ld [hl], a
	jp Func_316b
.asm_62ac1
	and $0f
	cp $01
	ld a, $02
	ld [wCurObjUnk18], a
	jp z, Func_62d57
	jp Func_62e31
; 0x62ad0

	INCROM $62ad0, $62d57

; hl = OBJ_ACTION
Func_62d57: ; 62d57 (18:6d57)
	ldh a, [hffa0]
	cp $02
	jr c, .asm_62d6b
	cp $03
	jr c, .asm_62d71
	cp $04
	jr c, .asm_62d77
	ld a, OBJ_ACTION_24
	ld [hl], a
	jp Func_316b
.asm_62d6b
	ld a, OBJ_ACTION_16
	ld [hl], a
	jp Func_316b
.asm_62d71
	ld a, OBJ_ACTION_20
	ld [hl], a
	jp Func_316b
.asm_62d77
	ld a, OBJ_ACTION_22
	ld [hl], a
	jp Func_316b
; 0x62d7d

	INCROM $62d7d, $62e31

; hl = OBJ_ACTION
Func_62e31: ; 62e31 (18:6e31)
	ldh a, [hffa0]
	cp $02
	jr c, .asm_62e45
	cp $03
	jr c, .asm_62e4b
	cp $04
	jr c, .asm_62e51
	ld a, OBJ_ACTION_25
	ld [hl], a
	jp Func_316b
.asm_62e45
	ld a, OBJ_ACTION_17
	ld [hl], a
	jp Func_316b
.asm_62e4b
	ld a, OBJ_ACTION_21
	ld [hl], a
	jp Func_316b
.asm_62e51
	ld a, OBJ_ACTION_23
	ld [hl], a
	jp Func_316b
; 0x62e57

	INCROM $62e57, $6307b

Func_6307b: ; 6307b (18:707b)
	ld hl, wCurObjYPos
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	ld hl, wcac4
	ld a, [hli]
	ld l, [hl]
	ld h, a
	push bc
	push de
	push hl
	ld a, c
	add $18
	ld c, a
	jr nc, .asm_63097
	inc b
	jr z, .asm_630a3
.asm_63097
	ld a, b
	cp h
	jr c, .asm_630fd
	jr nz, .asm_630a3
	ld a, c
	cp l
	jr c, .asm_630fd
	jr z, .asm_630bf
.asm_630a3
	ld a, l
	add $90
	ld l, a
	jr nc, .asm_630aa
	inc h
.asm_630aa
	ld a, c
	sub $38
	ld c, a
	jr nc, .asm_630b5
	dec b
	ld a, b
	inc a
	jr z, .asm_630bf
.asm_630b5
	ld a, b
	cp h
	jr c, .asm_630bf
	jr nz, .asm_630fd
	ld a, c
	cp l
	jr nc, .asm_630fd
.asm_630bf
	ld hl, wcac6
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, e
	add $18
	ld e, a
	jr nc, .asm_630ce
	inc d
	jr z, .asm_630f6
.asm_630ce
	ld a, d
	cp h
	jr c, .asm_63106
	jr nz, .asm_630da
	ld a, e
	cp l
	jr c, .asm_63106
	jr z, .asm_630f6
.asm_630da
	ld a, l
	add $a0
	ld l, a
	jr nc, .asm_630e1
	inc h
.asm_630e1
	ld a, e
	sub $30
	ld e, a
	jr nc, .asm_630ec
	dec d
	ld a, d
	inc a
	jr z, .asm_630f6
.asm_630ec
	ld a, d
	cp h
	jr c, .asm_630f6
	jr nz, .asm_63106
	ld a, e
	cp l
	jr nc, .asm_63106
.asm_630f6
	ld hl, wCurObjFlags
	set OBJFLAG_UNK1_F, [hl]
	jr .asm_6310b
.asm_630fd
	ld a, [wCurObjAction]
	and $fe
	cp OBJ_ACTION_48
	jr z, .asm_6310b
.asm_63106
	ld hl, wCurObjFlags
	res OBJFLAG_UNK1_F, [hl]
.asm_6310b
	pop hl
	pop de
	pop bc
	ld a, d
	rla
	jr c, .asm_6317e
	ld a, b
	rla
	jr c, .asm_6317e
	ld a, c
	add $5c
	ld c, a
	jr nc, .asm_6311f
	inc b
	jr z, .asm_63147
.asm_6311f
	ld a, b
	cp h
	jr c, .asm_6317e
	jr nz, .asm_6312b
	ld a, c
	cp l
	jr c, .asm_6317e
	jr z, .asm_63147
.asm_6312b
	ld a, l
	add $90
	ld l, a
	jr nc, .asm_63132
	inc h
.asm_63132
	ld a, c
	sub $cb
	ld c, a
	jr nc, .asm_6313d
	dec b
	ld a, b
	inc a
	jr z, .asm_63147
.asm_6313d
	ld a, b
	cp h
	jr c, .asm_63147
	jr nz, .asm_6317e
	ld a, c
	cp l
	jr nc, .asm_6317e
.asm_63147
	ld hl, wcac6
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ld a, e
	add $6f
	ld e, a
	jr nc, .asm_63156
	inc d
	jr z, .asm_631a0
.asm_63156
	ld a, d
	cp h
	jr c, .asm_6317e
	jr nz, .asm_63162
	ld a, e
	cp l
	jr c, .asm_6317e
	jr z, .asm_631a0
.asm_63162
	ld a, l
	add $a0
	ld l, a
	jr nc, .asm_63169
	inc h
.asm_63169
	ld a, e
	sub $de
	ld e, a
	jr nc, .asm_63174
	dec d
	ld a, d
	inc a
	jr z, .asm_631a0
.asm_63174
	ld a, d
	cp h
	jr c, .asm_631a0
	jr nz, .asm_6317e
	ld a, e
	cp l
	jr c, .asm_631a0
.asm_6317e
	ld a, [wCurObjUnk1a]
	and $1f
	cp $10
	ret nc
	ld hl, wCurObjUnk02
	and a
	jr z, .asm_6319c
	farcall Func_baee
	ret
.asm_6319c
	xor a
	ld [wCurObjFlags], a
.asm_631a0
	ret
; 0x631a1

	INCROM $631a1, $631e8

Func_631e8:: ; 631e8 (18:71e8)
	ld hl, wCurObjUnk19
	ld a, [hl]
	add c
	ld c, a
	ld a, [bc]
	cp $80
	jr nz, .asm_631f7
	dec c
	ld a, [bc]
	jr .asm_631f8
.asm_631f7
	inc [hl]
.asm_631f8
	ld l, OBJ_Y_POS
	cp $80
	ld c, [hl]
	jr nc, .asm_63204
	add c
	ld [hli], a
	ret nc
	inc [hl]
	ret
.asm_63204
	add c
	ld [hli], a
	ret c
	dec [hl]
	ret
; 0x63209

	INCROM $63209, $632ac

Func_632ac:: ; 632ac (18:72ac)
	ld hl, wCurObjUnk01
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ld e, $00
	ld d, $41
	ld h, $d0
	ld l, $00
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_632c8
	ld a, [hli]
	cp c
	jr nz, .asm_632c8
	ld a, [hl]
	cp b
	jr nz, .asm_632c8
	inc e
.asm_632c8
	ld l, $20
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_632d8
	ld a, [hli]
	cp c
	jr nz, .asm_632d8
	ld a, [hl]
	cp b
	jr nz, .asm_632d8
	inc e
.asm_632d8
	ld l, $40
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_632e8
	ld a, [hli]
	cp c
	jr nz, .asm_632e8
	ld a, [hl]
	cp b
	jr nz, .asm_632e8
	inc e
.asm_632e8
	ld l, $60
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_632f8
	ld a, [hli]
	cp c
	jr nz, .asm_632f8
	ld a, [hl]
	cp b
	jr nz, .asm_632f8
	inc e
.asm_632f8
	ld l, $80
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_63308
	ld a, [hli]
	cp c
	jr nz, .asm_63308
	ld a, [hl]
	cp b
	jr nz, .asm_63308
	inc e
.asm_63308
	ld l, $a0
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_63318
	ld a, [hli]
	cp c
	jr nz, .asm_63318
	ld a, [hl]
	cp b
	jr nz, .asm_63318
	inc e
.asm_63318
	ld l, $c0
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_63328
	ld a, [hli]
	cp c
	jr nz, .asm_63328
	ld a, [hl]
	cp b
	jr nz, .asm_63328
	inc e
.asm_63328
	ld l, $e0
	ld a, [hli]
	and d
	cp d
	jr nz, .asm_63338
	ld a, [hli]
	cp c
	jr nz, .asm_63338
	ld a, [hl]
	cp b
	jr nz, .asm_63338
	inc e
.asm_63338
	ret
; 0x63339

	INCROM $63339, $63936