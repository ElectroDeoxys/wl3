Func_20000: ; 20000 (8:4000)
	ld a, [wca8a]
	and a
	ret nz
	ld a, [wIsFloorTransition]
	and a
	ret nz
	ld a, [wca9b]
	and a
	ret nz
	xor a
	ld [wcac9], a

	ld hl, wObjects
.loop_objects
	ld a, h
	cp HIGH(wCurObj)
	ret z
	ld [wObjPtr + 0], a
	ld a, l
	ld [wObjPtr + 1], a
	ld a, [hl]
	and %11
	cp %11
	jr z, .asm_20036
.next_obj
	ld a, [wObjPtr + 0]
	ld h, a
	ld a, [wObjPtr + 1]
	ld l, a
	ld de, OBJ_STRUCT_LENGTH
	add hl, de
	jr .loop_objects

.asm_20036
	push hl
	ld e, OBJ_UNK_1D
	ld d, $00
	add hl, de
	ld a, [hld]
	ld [wc1b8], a
	ld a, [hl] ; OBJ_UNK_1c
	pop hl
	and a
	jr nz, .next_obj

	ld e, OBJ_INTERACTION_TYPE
	ld d, $00
	add hl, de
	ld a, [hli] ; OBJ_INTERACTION_TYPE
	ld [wObjInteractionType], a
	ld a, [hli] ; OBJ_UNK_09
	ld [wc1ba], a
	ld a, [hli] ; OBJ_UNK_0A
	ld [wc1bb], a
	ld a, [hli] ; OBJ_UNK_0B
	ld [wc1bc], a
	ld a, [hli] ; OBJ_UNK_0C
	ld [wc1bd], a
	ld a, [hli] ; OBJ_UNK_0D
	ld [wc1be], a
	ld a, [hl] ; OBJ_UNK_0E
	ld [wc1bf], a

	ld e, OBJ_UNK_1A - OBJ_UNK_0E
	ld d, $00
	add hl, de
	ld a, [hl] ; OBJ_UNK_1A
	bit 7, a
	jr nz, .asm_20074
	ld a, DIRECTION_LEFT
	jr .asm_20076
.asm_20074
	ld a, DIRECTION_RIGHT
.asm_20076
	ld [wEnemyDirection], a

	xor a
	ld [wInteractionSide], a
	ld a, $ff
	ld [wc1c2], a
	ld [wc1c1], a
	ld [wc1c3], a
	ld [wc1c4], a

	ld e, $d0
	ld hl, wc1ba
	ld a, [wc1be]
	add [hl]
	sub e
	ld b, a ; wc1ba + wc1be - $d0
	ld hl, wca70
	ld a, [wWarioScreenYPos]
	add [hl]
	sub e
	sub b
	jp c, .next_obj
	ld c, a
	ld hl, wca6f
	ld a, [wWarioScreenYPos]
	add [hl]
	sub e
	ld b, a
	ld hl, wc1bb
	ld a, [wc1be]
	add [hl]
	sub e
	sub b
	jp c, .next_obj
	ld d, a
	ld a, d
	sub c
	jr c, .asm_200c9
	jr z, .asm_200c5

	ld a, c
	ld [wc1c1], a
	jr .asm_200cd
.asm_200c5
	ld a, c
	ld [wc1c1], a
.asm_200c9
	ld a, d
	ld [wc1c2], a
.asm_200cd

	ld hl, wc1bc
	ld a, [wc1bf]
	add [hl]
	sub e
	ld b, a
	ld hl, wca72
	ld a, [wWarioScreenXPos]
	add [hl]
	sub e
	sub b
	jp c, .next_obj
	ld c, a
	ld hl, wca71
	ld a, [wWarioScreenXPos]
	add [hl]
	sub e
	ld b, a
	ld hl, wc1bd
	ld a, [wc1bf]
	add [hl]
	sub e
	sub b
	jp c, .next_obj
	ld d, a
	sub c
	jr c, .asm_20108
	jr z, .asm_20104

	ld a, c
	ld [wc1c3], a
	jr .asm_2010c
.asm_20104
	ld a, c
	ld [wc1c3], a
.asm_20108
	ld a, d
	ld [wc1c4], a
.asm_2010c

	ld hl, wInteractionSide
	ld a, INTERACTION_LEFT | INTERACTION_RIGHT | INTERACTION_UP | INTERACTION_DOWN
	ld [hl], a
	ld a, [wc1c4]
	ld b, a
	ld a, [wc1c3]
	ld c, a
	cp b
	jr z, .asm_20126
	jr c, .asm_20123
	res INTERACTION_RIGHT_F, [hl]
	jr .asm_20126
.asm_20123
	res INTERACTION_LEFT_F, [hl]
	ld b, c
.asm_20126
	ld a, [wc1c2]
	ld d, a
	ld a, [wc1c1]
	ld e, a
	cp d
	jr z, .asm_2013a
	jr c, .asm_20137
	res INTERACTION_UP_F, [hl]
	jr .asm_2013a
.asm_20137
	res INTERACTION_DOWN_F, [hl]
	ld d, e
.asm_2013a
	ld a, b
	cp d
	jr z, .do_interaction
	jr c, .asm_20146
	res INTERACTION_LEFT_F, [hl]
	res INTERACTION_RIGHT_F, [hl]
	jr .do_interaction
.asm_20146
	res INTERACTION_UP_F, [hl]
	res INTERACTION_DOWN_F, [hl]

.do_interaction
	ld a, [wObjInteractionType]
	and $ff ^ (HEAVY_OBJ)
	jumptable

	dw Func_20b6b ; OBJ_INTERACTION_00
	dw Func_20d1d ; OBJ_INTERACTION_01
	dw ObjInteraction_FrontSting ; OBJ_INTERACTION_02
	dw ObjInteraction_BackSting ; OBJ_INTERACTION_03
	dw ObjInteraction_TopSting ; OBJ_INTERACTION_04
	dw ObjInteraction_FullSting ; OBJ_INTERACTION_05
	dw Func_20d81 ; OBJ_INTERACTION_06
	dw Func_20d8c ; OBJ_INTERACTION_07
	dw Func_20deb ; OBJ_INTERACTION_08
	dw Func_20e39 ; OBJ_INTERACTION_09
	dw Func_20e60 ; OBJ_INTERACTION_0A
	dw Func_20e6a ; OBJ_INTERACTION_0B
	dw Func_20e77 ; OBJ_INTERACTION_0C
	dw ObjInteraction_MusicalCoin ; OBJ_INTERACTION_0D
	dw Func_20e97 ; OBJ_INTERACTION_0E
	dw Func_20f6a ; OBJ_INTERACTION_0F
	dw ObjInteraction_GreyKey       ; OBJ_INTERACTION_10
	dw ObjInteraction_RedKey        ; OBJ_INTERACTION_11
	dw ObjInteraction_GreenKey      ; OBJ_INTERACTION_12
	dw ObjInteraction_BlueKey       ; OBJ_INTERACTION_13
	dw ObjInteraction_GreyTreasure  ; OBJ_INTERACTION_14
	dw ObjInteraction_RedTreasure   ; OBJ_INTERACTION_15
	dw ObjInteraction_GreenTreasure ; OBJ_INTERACTION_16
	dw ObjInteraction_BlueTreasure  ; OBJ_INTERACTION_17
	dw Func_21156 ; OBJ_INTERACTION_18
	dw Func_21245 ; OBJ_INTERACTION_19
	dw SetState_FatEating ; OBJ_INTERACTION_1A
	dw ObjInteraction_RegularCoin ; OBJ_INTERACTION_1B
	dw SetState_ElectricStart ; OBJ_INTERACTION_1C
	dw Func_21548 ; OBJ_INTERACTION_1D
	dw Func_21569 ; OBJ_INTERACTION_1E
	dw Func_215a2 ; OBJ_INTERACTION_1F
	dw Func_215e7 ; OBJ_INTERACTION_20
	dw Func_2164f ; OBJ_INTERACTION_21
	dw Func_21675 ; OBJ_INTERACTION_22
	dw Func_21774 ; OBJ_INTERACTION_23
	dw $57b9      ; OBJ_INTERACTION_24
	dw $5819      ; OBJ_INTERACTION_25
	dw $5853      ; OBJ_INTERACTION_26
	dw $5887      ; OBJ_INTERACTION_27
	dw $58e7      ; OBJ_INTERACTION_28
	dw $5999      ; OBJ_INTERACTION_29
	dw $4e0f      ; OBJ_INTERACTION_2A
	dw $5a4f      ; OBJ_INTERACTION_2B
	dw $5a47      ; OBJ_INTERACTION_2C
	dw $5a52      ; OBJ_INTERACTION_2D
	dw $5a8c      ; OBJ_INTERACTION_2E
	dw $5a97      ; OBJ_INTERACTION_2F
	dw $5ac3      ; OBJ_INTERACTION_30
	dw $5af1      ; OBJ_INTERACTION_31
	dw $5b08      ; OBJ_INTERACTION_32
	dw $5b0b      ; OBJ_INTERACTION_33
	dw $5b2b      ; OBJ_INTERACTION_34
	dw $5b42      ; OBJ_INTERACTION_35
	dw $5b78      ; OBJ_INTERACTION_36
	dw $5573      ; OBJ_INTERACTION_37
	dw $5b89      ; OBJ_INTERACTION_38
	dw $5c17      ; OBJ_INTERACTION_39
	dw $5c26      ; OBJ_INTERACTION_3A
	dw $5c56      ; OBJ_INTERACTION_3B
	dw $5c61      ; OBJ_INTERACTION_3C
	dw $5c86      ; OBJ_INTERACTION_3D
	dw $5c98      ; OBJ_INTERACTION_3E
	dw $5ca8      ; OBJ_INTERACTION_3F
	dw $5ccf      ; OBJ_INTERACTION_40
	dw $5ce9      ; OBJ_INTERACTION_41
	dw $5cf8      ; OBJ_INTERACTION_42
	dw $47ed      ; OBJ_INTERACTION_43
	dw $5cfd      ; OBJ_INTERACTION_44
	dw $5d17      ; OBJ_INTERACTION_45
	dw $5d3b      ; OBJ_INTERACTION_46
	dw $5d64      ; OBJ_INTERACTION_47
	dw $5d6f      ; OBJ_INTERACTION_48
	dw $5d88      ; OBJ_INTERACTION_49
	dw $5dd3      ; OBJ_INTERACTION_4A
	dw $5df8      ; OBJ_INTERACTION_4B
	dw $5e2e      ; OBJ_INTERACTION_4C
	dw $5e3e      ; OBJ_INTERACTION_4D
	dw $5e9c      ; OBJ_INTERACTION_4E
	dw $5ea6      ; OBJ_INTERACTION_4F
	dw $5ecd      ; OBJ_INTERACTION_50
	dw $5f01      ; OBJ_INTERACTION_51
	dw $5f28      ; OBJ_INTERACTION_52
	dw ObjInteraction_None ; OBJ_INTERACTION_53
	dw ObjInteraction_None ; OBJ_INTERACTION_54
	dw ObjInteraction_None ; OBJ_INTERACTION_55
	dw ObjInteraction_None ; OBJ_INTERACTION_56
	dw ObjInteraction_None ; OBJ_INTERACTION_57
	dw ObjInteraction_None ; OBJ_INTERACTION_58
; 0x20202

ObjInteraction_None: ; 20202 (8:4202)
	ret
; 0x20203

Func_20203: ; 20203 (8:4203)
	ld hl, wObjects
	ld de, OBJ_STRUCT_LENGTH
.loop_objects
	ld a, h
	cp HIGH(wCurObj)
	ret z
	ld a, [hl]
	and $03
	cp $01
	jr z, .asm_2021b
	cp $03
	jr z, .asm_2021b
.next_obj
	add hl, de
	jr .loop_objects
.asm_2021b
	ld a, [wObjPtr + 1]
	cp l
	jr z, .next_obj
	push hl
	ld c, OBJ_UNK_1C
	ld b, $00
	add hl, bc
	ld [hl], $08
	pop hl
	jr .next_obj
; 0x2022c

Func_2022c: ; 2022c (8:422c)
	ld a, [wIsRolling]
	and a
	jp nz, Func_20350
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20447
;	fallthrough

Func_2023b: ; 2023b (8:423b)
	ld a, [wca93]
	and a
	jr z, .asm_20257
	cp $02
	jr z, .asm_20257
	cp $01
	jp z, Func_20939
	cp $03
	jp z, Func_20350
	cp $04
	jp z, Func_205e7
	jp Func_20000.next_obj

.asm_20257
	ld a, [wAttackCounter]
	and a
	jp nz, Func_20350
	ld b, $01
	call SetObjUnk1C
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr z, Func_2028a
	and a
	ret nz
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20283
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .bump
.asm_20283
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
.bump
	jr SetState_EnemyBumping
; 0x2028a

Func_2028a: ; 2028a (8:428a)
	ld a, [wJumpVelTable]
	and a
	ret z
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_202a0
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .asm_202a5
.asm_202a0
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
.asm_202a5
	farcall SetState_FlatFalling
	ret
; 0x202b5

SetState_EnemyBumping: ; 202b5 (8:42b5)
	load_sfx SFX_BUMP
	ld a, $0e
	ld [wJumpVelIndex], a
	ld a, $01
	ld [wJumpVelTable], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wGrabState], a
	ld a, ST_ENEMY_BUMPING
	ld [wWarioState], a
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	load_oam OAM_1426c
	ld a, [wca8b]
	and a
	jr nz, .asm_20332
	ld a, [wDirection]
	and a
	jr nz, .asm_20326
	load_frameset Frameset_14a71
.asm_20316
	update_anim_1
	ret
.asm_20326
	load_frameset Frameset_14a6c
	jr .asm_20316
.asm_20332
	ld a, [wDirection]
	and a
	jr nz, .asm_20344
	load_frameset Frameset_14a3b
	jr .asm_20316
.asm_20344
	load_frameset Frameset_14a38
	jr .asm_20316
; 0x20350

Func_20350: ; 20350 (8:4350)
	load_sfx SFX_017
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20382

	ld a, INTERACTION_RIGHT
	ld [wInteractionSide], a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	add $08
	ld [de], a
	dec de
	ld a, [hld]
	adc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a
	jr .asm_203a0

.asm_20382
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hld]
	sbc $00
	ld [de], a
	dec de
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a

.asm_203a0
	ld b, $02
	farcall Func_c9f3
	ld b, $02
	call SetObjUnk1C
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr z, .fat
	cp (1 << 6) | TRANSFORMATION_SNOWMAN_WARIO
	jr z, .snowman
	and a
	ret nz

	ld a, [wIsRolling]
	and a
	jr z, .not_rolling
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	ret z
	ld a, [wPowerUpLevel]
	cp POWER_UP_GARLIC
	ret nc
	farcall Func_1ca41
	ret

.not_rolling
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr z, .asm_203fc
	farcall Func_1ca41
	ret

.asm_203fc
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_20412
	farcall SetState_Idling
	ret
.asm_20412
	farcall StartFall
	ret

.fat
	farcall SetState_FatBumping
	ret

.snowman
	ld a, [wca8f]
	and a
	ret nz
	farcall SetState_UnknownCA
	ret
; 0x20447

Func_20447: ; 20447 (8:4447)
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wIsSmashAttacking]
	dec a
	jr nz, .asm_2045e
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jp z, Func_205e7
	jp Func_20602

.asm_2045e
	ld a, [wTransformation]
	and a
	jp nz, Func_20585
	xor a
	ld [wAttackCounter], a
	ld a, [wIsRolling]
	and a
	jp nz, Func_20350
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20484
	ld a, [wInteractionSide]
	or INTERACTION_RIGHT
	ld [wInteractionSide], a
	jr .asm_2048c
.asm_20484
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
.asm_2048c
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_20506
	ld a, [wWarioScreenYPos]
	ld b, a
	ld a, [wc1be]
	cp b
	jr c, .asm_20506
	ld a, [wGrabState]
	and $ff ^ (GRAB_FLAGS_MASK)
	cp GRAB_IDLE
	jr z, .asm_204d9
	xor a
	ld [wGrabState], a
	ld a, [wca8b]
	and a
	jr nz, .asm_204c8
	ld a, [wJoypadDown]
	and a
	jp z, .asm_20575
	farcall StartJump_FromInput
	jr .asm_204e8

.asm_204c8
	farcall Func_1ed3f
	jr .asm_204e8

.asm_204d9
	farcall Func_1ede9
.asm_204e8
	ld a, $01
	ld [wca76], a
	ld a, $0a
	ld [wJumpVelIndex], a
	ld a, [wJoypadDown]
	bit 0, a
	jr z, .asm_20578
	ld a, [wPowerUpLevel]
	cp POWER_UP_HIGH_JUMP_BOOTS
	jr c, .asm_20578
	xor a
	ld [wJumpVelIndex], a
	jr .asm_20578

.asm_20506
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wca8b]
	and a
	jr nz, .asm_2055e
	ld a, [wGrabState]
	and $ff ^ (GRAB_FLAGS_MASK)
	cp GRAB_IDLE
	jr z, .asm_20547
	xor a
	ld [wGrabState], a
	ld a, [wJumpVelTable]
	and a
	jr nz, .asm_20536
	farcall SetState_Idling
	jr .asm_20578

.asm_20536
	farcall StartFall
	jr .asm_20578

.asm_20547
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_20578
	farcall Func_1edd3
	jr .asm_20578

.asm_2055e
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_20578
	farcall Func_1ed34
	jr .asm_20578

.asm_20575
	call Func_20939
.asm_20578
	load_sfx SFX_014
	ld b, $04
	jp SetObjUnk1C
; 0x20585

Func_20585: ; 20585 (8:4585)
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_HOT_WARIO
	jr nz, .asm_20593
	ld a, [wca8f]
	cp $02
	jr nc, Func_205e7
.asm_20593
	ld a, [wTransformation]
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jp z, Func_20350
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_205af
	ld a, [wInteractionSide]
	or INTERACTION_RIGHT
	ld [wInteractionSide], a
	jr .asm_205b7
.asm_205af
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
.asm_205b7
	load_sfx SFX_014
	ld b, $04
	call SetObjUnk1C
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jp z, Func_2028a
	cp TRANSFORMATION_BOUNCY_WARIO
	jr z, .asm_205d1
	ret
.asm_205d1
	ld a, [wca93]
	cp $05
	ret z
	farcall Func_2a0b2
	ret
; 0x205e7

Func_205e7: ; 205e7 (8:45e7)
	ld b, $05
	call SetObjUnk1C
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_ZOMBIE_WARIO
	ret nz
	farcall SetState_ZombieKnockBack
	ret
; 0x20602

Func_20602: ; 20602 (8:4602)
	ld a, [wTransformation]
	cp TRANSFORMATION_INVISIBLE_WARIO
	jr z, .asm_2060c
	and a
	jr nz, Func_205e7
.asm_2060c
	ld a, [wGrabState]
	and $ff ^ (GRAB_FLAGS_MASK)
	cp GRAB_IDLE
	jr z, .asm_2062a
	xor a
	ld [wGrabState], a
	farcall StartJump_FromInput
	jr .asm_20639
.asm_2062a
	farcall Func_1ede9
.asm_20639
	ld a, $01
	ld [wca76], a
	ld a, $0a
	ld [wJumpVelIndex], a
	ld a, [wJoypadDown]
	bit 0, a
	jr z, .asm_20655
	ld a, [wPowerUpLevel]
	cp POWER_UP_HIGH_JUMP_BOOTS
	jr c, .asm_20655
	xor a
	ld [wJumpVelIndex], a
.asm_20655
	ld b, $05
;	fallthrough

SetObjUnk1C: ; 20657 (8:4657)
	ld a, [wObjPtr + 0]
	ld h, a
	ld a, [wObjPtr + 1]
	ld l, a
	ld e, OBJ_UNK_1C
	ld d, $00
	add hl, de
	ld [hl], b
	inc l
	ld a, [wInteractionSide]
	ld b, a
	ld a, [hl] ; OBJ_UNK_1D
	and $0f
	or b
	ld [hl], a
	ret
; 0x20670

Func_20670: ; 20670 (8:4670)
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_20939
	ld a, [wPowerUpLevel]
	cp POWER_UP_GARLIC
	jr nc, .asm_20685
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr nz, .asm_2068c
.asm_20685
	ld a, [wIsRolling]
	and a
	jp nz, Func_20350
.asm_2068c
	ld a, [wca92]
	and a
	jr z, .asm_206a8
	cp $01
	jr z, .asm_206a8
	cp $02
	jp z, Func_2023b
	cp $03
	jp z, Func_20350
	cp $04
	jp z, Func_205e7
	jp Func_20000.next_obj

.asm_206a8
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_206bc
	ld a, [wInteractionSide]
	or INTERACTION_RIGHT
	ld [wInteractionSide], a
	jr .asm_206c4
.asm_206bc
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
.asm_206c4
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_206d2
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .asm_206d7
.asm_206d2
	ld a, DIRECTION_LEFT
	ld [wDirection], a
.asm_206d7
	ld b, $06
	call SetObjUnk1C
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wca92]
	cp $01
	jr z, Func_206eb
	jr SetState_Stung
; 0x206eb

Func_206eb: ; 206eb (8:46eb)
	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	call z, Func_16d9
	call Func_1079
	call UpdateLevelMusic
;	fallthrough

SetState_Stung: ; 206f9 (8:46f9)
	ld a, $01
	ld [wInvincibleCounter], a

	load_sfx SFX_STING

	ld a, ST_STUNG
	ld [wWarioState], a

	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld a, $6
	ld [wJumpVelIndex], a
	ld a, -1
	ld [wca70], a
	ld a, -9
	ld [wca71], a
	ld a, 9
	ld [wca72], a
	ld a, [wca8b]
	and a
	jr z, .asm_20774
	ld a, -27
	ld [wca6f], a

	ldh a, [hYPosHi]
	ldh [hffad], a
	ldh a, [hYPosLo]
	ldh [hffae], a
	ldh a, [hXPosHi]
	ldh [hffaf], a
	ldh a, [hXPosLo]
	ldh [hffb0], a

	farcall Func_1996e
	ld a, b
	and a
	jr nz, .asm_20780

	xor a
	ld [wca8b], a
	ldh a, [hffad]
	ldh [hYPosHi], a
	ldh a, [hffae]
	ldh [hYPosLo], a
	ldh a, [hffaf]
	ldh [hXPosHi], a
	ldh a, [hffb0]
	ldh [hXPosLo], a

.asm_20774
	ld a, -27
	ld [wca6f], a
	ld a, JUMP_VEL_KNOCK_BACK
	ld [wJumpVelTable], a
	jr .asm_20799

.asm_20780
	ld a, -15
	ld [wca6f], a
	xor a ; JUMP_VEL_NONE
	ld [wJumpVelTable], a

	ldh a, [hffad]
	ldh [hYPosHi], a
	ldh a, [hffae]
	ldh [hYPosLo], a
	ldh a, [hffaf]
	ldh [hXPosHi], a
	ldh a, [hffb0]
	ldh [hXPosLo], a

.asm_20799
	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955

	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_207d3
	load_frameset Frameset_15f7f
	jr .asm_207dd
.asm_207d3
	load_frameset Frameset_15f70
.asm_207dd
	update_anim_1
	ret
; 0x207ed

Func_207ed: ; 207ed (8:47ed)
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wWaterInteraction]
	and a
	ret z
	ld a, [wca92]
	and a
	jr z, .asm_20808
	cp $02
	jp z, Func_208f2.start
	cp $04
	jp z, Func_2092d
	ret

.asm_20808
	ld b, $06
	call SetObjUnk1C
	load_sfx SFX_STING
	ld a, $01
	ld [wInvincibleCounter], a
	ld a, ST_WATER_STUNG
	ld [wWarioState], a
	xor a
	ld [wca6d], a
	ld [wJumpVelTable], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, $01
	ld [wca8a], a
	ld a, -1
	ld [wca70], a
	ld a, -15
	ld [wca6f], a
	ld a, -9
	ld [wca71], a
	ld a, 9
	ld [wca72], a
	load_gfx WarioAirborneGfx
	call LoadWarioGfx
	load_oam OAM_15955
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld a, [wDirection]
	and a
	jr nz, .asm_2087f
	load_frameset Frameset_15f70
	jr .asm_20889
.asm_2087f
	load_frameset Frameset_15f7f
.asm_20889
	update_anim_1
	ret
; 0x20899

Func_20899: ; 20899 (8:4899)
	ld a, [wca92]
	and a
	jr z, .asm_208a9
	cp $02
	jr z, .asm_208a9
	cp $04
	jp z, Func_2092d
	ret

.asm_208a9
	ld a, [wWaterInteraction]
	and a
	ret z
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_208c2
	ld a, [wInteractionSide]
	or INTERACTION_RIGHT
	ld [wInteractionSide], a
	jr .asm_208ca
.asm_208c2
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
.asm_208ca
	load_sfx SFX_014
	ld b, $04
	call SetObjUnk1C
	ld a, [wTransformation]
	and a
	ret nz
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	ret nz
	farcall Func_1cdc4
	ret
; 0x208f2

Func_208f2: ; 208f2 (8:48f2)
	jr .start

.Func_208f4
	ld b, $01
	call SetObjUnk1C
	ret

.start
	ld a, [wca92]
	and a
	jr z, .asm_2090a
	cp $02
	jr z, .asm_2090a
	cp $04
	jp z, Func_2092d
	ret

.asm_2090a
	ld a, [wWaterInteraction]
	and a
	ret z
	call .Func_208f4
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wTransformation]
	and a
	ret nz
	farcall Func_1cdc4
	ret
; 0x2092d

Func_2092d: ; 2092d (8:492d)
	ld b, $05
	jp SetObjUnk1C
; 0x20932

Func_20932: ; 20932 (8:4932)
	ld a, [wAttackCounter]
	and a
	jp nz, Func_20350
;	fallthrough

Func_20939: ; 20939 (8:4939)
	ld a, [wca93]
	and a
	jp nz, Func_2023b
	ld b, $06
	call SetObjUnk1C
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	farcall Func_1ca39
	load_gfx WarioWalkGfx
	call LoadWarioGfx
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	load_oam OAM_1426c
	xor a
	ld [wGrabState], a
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_209b4
	ld a, INTERACTION_RIGHT
	ld [wInteractionSide], a
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	load_frameset Frameset_14a79
.asm_209a4
	update_anim_1
	ret
.asm_209b4
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	load_frameset Frameset_14a76
	jr .asm_209a4
; 0x209ca

Func_209ca: ; 209ca (8:49ca)
	ld a, [wWarioState]
	cp ST_ATTACKING_AIRBORNE
	jr nz, .asm_209d5
	; airborne
	xor a
	ld [wAttackCounter], a
.asm_209d5
	ld a, [wWaterInteraction]
	and a
	ret nz
	ld a, [wWarioState]
	cp ST_DIVING
	ret z
	ld a, $01
	ld [wcac9], a
	ld a, [wc1c1]
	and a
	jr z, .asm_209f5
	cp $03
	jr c, .asm_209f1
	ld a, $02
.asm_209f1
	ld b, a
	call SubYOffset
.asm_209f5
	ld b, $09
	call SetObjUnk1C
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_20a60
	ld a, [wAttackCounter]
	and a
	jr nz, .asm_20a60
	ld a, [wIsRolling]
	and a
	jr nz, .asm_20a60
	call Func_1501
	ld a, [wInvincibleCounter]
	cp $01
	jr z, .asm_20a60
	ld a, [wTransformation]
	and a
	ret nz
	ld a, [wGrabState]
	and a
	jr nz, .asm_20a51
	ld a, [wca8b]
	and a
	jr nz, .asm_20a3c
	xor a
	ld [wWaterInteraction], a
	farcall SetState_Idling
	jr .asm_20a60
.asm_20a3c
	xor a
	ld [wWaterInteraction], a
	farcall Func_1e855
	jr .asm_20a60
.asm_20a51
	farcall SetState_GrabIdling
.asm_20a60
	jp Func_20000.next_obj
; 0x20a63

Func_20a63: ; 20a63 (8:4a63)
	ld b, $07
	call SetObjUnk1C
	ret
; 0x20a69

Func_20a69: ; 20a69 (8:4a69)
	ld b, $0d
	call SetObjUnk1C
	ret
; 0x20a6f

Func_20a6f: ; 20a6f (8:4a6f)
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20aa5
.asm_20a79
	ld a, [wDirection]
	and a
	jp z, Func_20000.next_obj
	ld a, INTERACTION_RIGHT
	ld [wInteractionSide], a
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_20acf
	ld a, [wc1c3]
	cp $ff
	jr z, .asm_20aa5
	ld b, a
	call SubXOffset
	jr .asm_20acf

.asm_20aa5
	ld a, [wDirection]
	and a
	jp nz, Func_20000.next_obj
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	farcall Func_19741
	ld a, b
	and a
	jr nz, .asm_20acf
	ld a, [wc1c4]
	cp $ff
	jr z, .asm_20a79
	ld b, a
	call AddXOffset
.asm_20acf
	ld a, [wTransformation]
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	jr z, .asm_20aff
	cp (1 << 6) | (1 << 7) | TRANSFORMATION_HOT_WARIO
	jr z, .asm_20b15
	cp (1 << 6) | TRANSFORMATION_UNK_0D
	jr z, .asm_20b2b
	xor a
	ld [wca86], a
	ld a, [wIsRolling]
	and a
	jr nz, .asm_20aef
	ld a, [wAttackCounter]
	and a
	jp z, Func_20000.next_obj

.asm_20aef
	farcall Func_1ca39
	ret

.asm_20aff
	ld a, [wca8f]
	cp $01
	ret nz
	farcall Func_28bd5
	ret

.asm_20b15
	ld a, [wca8f]
	cp $01
	ret nz
	farcall Func_2afc5
	ret

.asm_20b2b
	ld a, [wWarioState]
	cp ST_ICE_SKATIN_CRASH
	ret z
	farcall Func_1ec215
	ret
; 0x20b41

	INCROM $20b41, $20b6b

Func_20b6b: ; 20b6b (8:4b6b)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_20447
	ld a, [wca93]
	and a
	jr z, .check_water
	cp $03
	jp z, Func_20350
	cp $04
	jp z, Func_205e7
	cp $05
	jp z, Func_20000.next_obj
	jp .asm_20c41

.check_water
	ld a, [wWarioState]
	cp ST_DIVING
	jr c, .not_in_water
	cp ST_TRYING_SUBMERGE + 1
	jp c, Func_20899

.not_in_water
	ld a, [wIsRolling]
	ld b, a
	ld a, [wAttackCounter]
	or b
	jp nz, Func_20350

	ld a, [wca8b]
	ld b, a
	ld a, [wGrabState]
	or b
	jp nz, .asm_20c41

	ld a, [wPowerUpLevel]
	cp POWER_UP_GRAB_GLOVE
	jp c, .asm_20c41
	ld a, [wWarioState]
	cp ST_LADDER_SCRATCHING
	jp z, .asm_20c41
	cp ST_LADDER_CLIMBING
	jr c, .asm_20bc6
	cp ST_LADDER_SLIDING + 1
	jp c, .asm_20c41
.asm_20bc6
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20bdd
	ld a, INTERACTION_RIGHT
	ld [wInteractionSide], a
	ld a, [wDirection]
	and a
	jr nz, .check_invincible_counter
	jr .asm_20c41
.asm_20bdd
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	ld a, [wDirection]
	and a
	jr nz, .asm_20c41
.check_invincible_counter
	ld a, [wInvincibleCounter]
	cp 1
	ret z
	ld hl, wXPosLo
	ld de, hXPosLo
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	ld [de], a
	dec de
	ld a, [hld]
	sub $08
	ld [de], a
	dec de
	ld a, [hl]
	sbc $00
	ld [de], a

	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr nz, .heavy_obj
	ld a, GRAB_PICK_UP
	ld [wGrabState], a
	jr .asm_20c1d
.heavy_obj
	ld a, [wPowerUpLevel]
	cp POWER_UP_SUPER_GRAB_GLOVES
	jr c, .asm_20c41
	ld a, GRAB_PICK_UP | (1 << GRAB_HEAVY_F)
	ld [wGrabState], a

.asm_20c1d
	ld b, $03
	call SetObjUnk1C

	ld a, [wJumpVelTable]
	and a
	jr z, .pick_up
	ld a, [wObjInteractionType]
	bit HEAVY_OBJ_F, a
	jr z, .asm_20c31
	jr .asm_20c41
.asm_20c31
	farcall Func_1edd3
	ret

.asm_20c41
	jp Func_20447
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20c56
	ld a, INTERACTION_RIGHT
	ld [wInteractionSide], a
	jp Func_2023b

.asm_20c56
	ld a, INTERACTION_LEFT
	ld [wInteractionSide], a
	jp Func_2023b

.pick_up
	load_sfx SFX_GRAB
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld a, ST_PICKING_UP
	ld [wWarioState], a
	ld a, -1
	ld [wca70], a
	ld a, -27
	ld [wca6f], a
	ld a, -9
	ld [wca71], a
	ld a, 9
	ld [wca72], a

	load_gfx WarioThrowGfx
	call LoadWarioGfx
	load_oam OAM_1606a

	ld a, [wDirection]
	and a
	jr nz, .asm_20cdb
	ld a, [wIsStandingOnSlope]
	bit 1, a
	jr nz, .asm_20cf5
	ld a, [wGrabState]
	and (1 << GRAB_HEAVY_F)
	jr nz, .asm_20d05
	load_frameset Frameset_163ec
.asm_20ccb
	update_anim_1
	ret
.asm_20cdb
	ld a, [wIsStandingOnSlope]
	bit 0, a
	jr nz, .asm_20cf5
	ld a, [wGrabState]
	and (1 << GRAB_HEAVY_F)
	jr nz, .asm_20d11
	load_frameset Frameset_1640c
	jr .asm_20ccb
.asm_20cf5
	farcall SetState_GrabIdling
	ret
.asm_20d05
	load_frameset Frameset_163f5
	jr .asm_20ccb
.asm_20d11
	load_frameset Frameset_16415
	jr .asm_20ccb
; 0x20d1d

Func_20d1d: ; 20d1d (8:4d1d)
	jp Func_2022c
; 0x20d20

ObjInteraction_FrontSting: ; 20d20 (8:4d20)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_20d44
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_20d39
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_20670
	jp Func_2022c
.asm_20d39
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_20670
	jp Func_2022c
.asm_20d44
	jp Func_20447
; 0x20d47

ObjInteraction_BackSting: ; 20d47 (8:4d47)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_20d6b
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_20d60
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_20670
	jp Func_2022c
.asm_20d60
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_20670
	jp Func_2022c
.asm_20d6b
	jp Func_20447
; 0x20d6e

ObjInteraction_TopSting: ; 20d6e (8:4d6e)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_20670
	bit INTERACTION_DOWN_F, a
	jp nz, Func_20447
	jp Func_2022c
; 0x20d7e

ObjInteraction_FullSting: ; 20d7e (8:4d7e)
	jp Func_20670
; 0x20d81

Func_20d81: ; 20d81 (8:4d81)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20899
	jp Func_208f2
; 0x20d8c

Func_20d8c: ; 20d8c (8:4d8c)
	ld a, [wWaterInteraction]
	and a
	ret z
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_207ed

	ld a, [wTransformation]
	and a
	ret nz
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_20ddb
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_20dbe
	ld a, [wInteractionSide]
	or INTERACTION_RIGHT
	ld [wInteractionSide], a
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .asm_20dcb
.asm_20dbe
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
	ld a, DIRECTION_RIGHT
	ld [wDirection], a

.asm_20dcb
	farcall SetState_SwimKnockBack
	ret

.asm_20ddb
	farcall Func_1cdc4
	ret
; 0x20deb

Func_20deb: ; 20deb (8:4deb)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20899
	ld a, [wEnemyDirection]
	and a
	jr nz, .asm_20e04
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_207ed
	jp Func_208f2
.asm_20e04
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_207ed
	jp Func_208f2
; 0x20e0f

	INCROM $20e0f, $20e39

Func_20e39: ; 20e39 (8:4e39)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_20e5d
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_20e52
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jp nz, Func_20939
	jp Func_2022c
.asm_20e52
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jp nz, Func_20939
	jp Func_2022c
.asm_20e5d
	jp Func_20447
; 0x20e60

Func_20e60: ; 20e60 (8:4e60)
	jp Func_20939
; 0x20e63

	INCROM $20e63, $20e6a

Func_20e6a: ; 20e6a (8:4e6a)
	call Func_20939
	ld a, [wca93]
	and a
	ret nz
	ld b, $0a
	jp SetObjUnk1C
; 0x20e77

Func_20e77: ; 20e77 (8:4e77)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_21aac
	jp Func_20932
; 0x20e82

ObjInteraction_MusicalCoin: ; 20e82 (8:4e82)
	ld hl, wNumMusicalCoins
	ld a, [hl]
	cp NUM_LEVEL_MUSICAL_COINS
	jp nc, Func_20000.next_obj
	inc [hl]
	load_sfx SFX_MUSICAL_COIN
	jp CollectMusicalCoin
; 0x20e97

Func_20e97: ; 20e97 (8:4e97)
	ld b, $06
	call SetObjUnk1C

	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	ld a, (1 << 6) | (1 << 7) | TRANSFORMATION_HOT_WARIO
	ld [wTransformation], a
	ld a, $01
	ld [wca8f], a
	ld a, $02
	ld [wca93], a
	ld a, $02
	ld [wca92], a
	ld a, $02
	ld [wca94], a
	ld a, $02
	ld [wca90], a
	ld a, $58
	ld [wca91], a
	call UpdateLevelMusic
	xor a
	ld [wWarioStateCounter], a
;	fallthrough

SetState_OnFire: ; 20ed3 (8:4ed3)
	ld a, ST_ON_FIRE
	ld [wWarioState], a

	xor a
	ld [wInvisibleFrame], a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca8b], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld a, -1
	ld [wca70], a
	ld a, -27
	ld [wca6f], a
	ld a, -9
	ld [wca71], a
	ld a, 9
	ld [wca72], a
	ld a, [wWarioStateCounter]
	and a
	ret nz

	ld hl, Pals_c820
	call SetWarioPal

	load_gfx WarioHotGfx
	call LoadWarioGfx
	load_oam OAM_1673c

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld a, [wDirection]
	and a
	jr nz, .asm_20f50
	load_frameset Frameset_16b38
	jr .asm_20f5a
.asm_20f50
	load_frameset Frameset_16b49
.asm_20f5a
	update_anim_1
	ret
; 0x20f6a

Func_20f6a: ; 20f6a (8:4f6a)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jr nz, .asm_20f78
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_20f82
	jp Func_20932

.asm_20f78
	ld a, [wIsSmashAttacking]
	dec a
	jp z, Func_20602
	jp Func_20447
.asm_20f82
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	ld a, -11
	ld [wca71], a
	ld a, 11
	ld [wca72], a
	ld a, [wLadderInteraction]
	cp $02
	jr z, .asm_20fdb
	farcall Func_197b1
	ld a, b
	and a
	jr nz, .asm_20fdb
	farcall Func_19741
	ld a, b
	and a
	jr nz, .asm_20fdb
	ld b, $0b
	call SetObjUnk1C
	farcall SetState_FlatAirborne
	ret

.asm_20fdb
	ld a, -9
	ld [wca71], a
	ld a, 9
	ld [wca72], a
	jp Func_20447
; 0x20fe8

	INCROM $20fe8, $20fed

ObjInteraction_GreyKey: ; 20fed (8:4fed)
	ld hl, wKeys
	set GREY_KEY_F, [hl]
	jr CollectKey
; 0x20ff4

ObjInteraction_RedKey: ; 20ff4 (8:4ff4)
	ld hl, wKeys
	set RED_KEY_F, [hl]
	jr CollectKey
; 0x20ffb

ObjInteraction_GreenKey: ; 20ffb (8:4ffb)
	ld hl, wKeys
	set GREEN_KEY_F, [hl]
	jr CollectKey
; 0x21002

ObjInteraction_BlueKey: ; 21002 (8:5002)
	ld hl, wKeys
	set BLUE_KEY_F, [hl]
;	fallthrough

CollectKey: ; 21007 (8:5007)
	load_sfx SFX_KEY
	call Func_20a63
	ld a, MAIN_SEQTABLE_COLLECT_KEY
	ld [wSequence], a
	xor a
	ld [wIntroSeqTimer], a
	ret
; 0x2101c

ObjInteraction_GreyTreasure: ; 2101c (8:501c)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeys
	bit GREY_KEY_F, [hl]
	jp z, Func_20a6f
	set 4, [hl]
	ld a, LEVEL_END_GREY_TREASURE
	ld [wLevelEndScreen], a
	jr GetTreasure
; 0x2103c

ObjInteraction_RedTreasure: ; 2103c (8:503c)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeys
	bit RED_KEY_F, [hl]
	jp z, Func_20a6f
	set 5, [hl]
	ld a, LEVEL_END_RED_TREASURE
	ld [wLevelEndScreen], a
	jr GetTreasure
; 0x2105c

ObjInteraction_GreenTreasure: ; 2105c (8:505c)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeys
	bit GREEN_KEY_F, [hl]
	jp z, Func_20a6f
	set 6, [hl]
	ld a, LEVEL_END_GREEN_TREASURE
	ld [wLevelEndScreen], a
	jr GetTreasure
; 0x2107c

ObjInteraction_BlueTreasure: ; 2107c (8:507c)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	ld a, [wTransformation]
	and a
	jp nz, Func_20a6f
	ld hl, wKeys
	bit BLUE_KEY_F, [hl]
	jp z, Func_20a6f
	set 7, [hl]
	ld a, LEVEL_END_BLUE_TREASURE
	ld [wLevelEndScreen], a
;	fallthrough

GetTreasure: ; 2109a (8:509a)
	stop_music
	call Func_20a63
	call Func_20203

	ld hl, wLevelEndScreen
	ld a, [hl]
	cp LEVEL_END_NO_TREASURE
	ret z
	set 7, [hl]
	ld a, TRUE
	ld [wResetDisabled], a
	xor a
	ld [wca86], a
	ld a, ST_UNKNOWN_40
	ld [wWarioState], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld [wJumpVelIndex], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wIsSmashAttacking], a
	ld [wca8b], a
	ld [wAttackCounter], a
	inc a
	ld [wca8a], a
	ld [wca9b], a
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_210ea
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
.asm_210ea
	ld hl, Pals_c800
	call SetWarioPal
	load_gfx WarioIdleGfx
	call LoadWarioGfx

	load_oam OAM_14000

	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_21130
	ld a, [wc1c3]
	ld b, a
	call SubXOffset
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	load_frameset Frameset_1425f
	jr .asm_21146
.asm_21130
	ld a, [wc1c4]
	ld b, a
	call AddXOffset
	ld a, DIRECTION_LEFT
	ld [wDirection], a
	load_frameset Frameset_14252
.asm_21146
	update_anim_1
	ret
; 0x21156

Func_21156: ; 21156 (8:5156)
	ld a, [wJumpVelTable]
	and a
	jp nz, Func_2022c
	ld b, $0c
	call SetObjUnk1C
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jp z, SetState_FlatStretching
	and a
	jp nz, Func_2022c

	ld a, $01
	ld [wca9b], a
	ld a, ST_PICKED_UP
	ld [wWarioState], a
	ld a, -1
	ld [wca70], a
	ld a, -27
	ld [wca6f], a
	ld a, -9
	ld [wca71], a
	ld a, 9
	ld [wca72], a
	xor a
	ld [wIsSmashAttacking], a
	ld [wAttackCounter], a
	ld [wca8b], a
	ld [wGrabState], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wca68], a
	inc a
	ld [wJumpVelTable], a
	ld a, NUM_WIGGLES_TO_ESCAPE
	ld [wPickedUpWiggleCounter], a

	load_gfx WarioAirborneGfx
	call LoadWarioGfx

	load_oam OAM_15955

	ld a, [wDirection]
	and a
	jr nz, .asm_211e1
	load_frameset Frameset_15f70
	jr .asm_211eb
.asm_211e1
	load_frameset Frameset_15f7f
.asm_211eb
	update_anim_1
	ret
; 0x211fb

SetState_FlatStretching: ; 211fb (8:51fb)
	ld a, $01
	ld [wca9b], a
	ld a, ST_FLAT_STRETCHING
	ld [wWarioState], a
	ld a, -1
	ld [wca70], a
	ld a, -8
	ld [wca6f], a
	ld a, -11
	ld [wca71], a
	ld a, 11
	ld [wca72], a
	ld a, NUM_WIGGLES_TO_ESCAPE
	ld [wPickedUpWiggleCounter], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wFrameDuration], a
	ld [wca68], a

	load_frameset Frameset_17193
	update_anim_1
	ret
; 0x21245

Func_21245: ; 21245 (8:5245)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_21267
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_2125d
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_2126a
	jp Func_2022c

.asm_2125d
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_2126a
	jp Func_2022c

.asm_21267
	jp Func_20447

.asm_2126a
	ld a, [wca8b]
	and a
	jr z, .asm_21290
	ld a, -27
	ld [wca6f], a
	farcall Func_1996e
	ld a, b
	and a
	jr z, .asm_21290
	ld a, -15
	ld [wca6f], a
	jp Func_2022c

.asm_21290
	ld b, $06
	call SetObjUnk1C

	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2023b
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_212b3

	ld a, DIRECTION_LEFT
	ld [wDirection], a
	jr .asm_212b8
.asm_212b3
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
.asm_212b8
	load_sfx SFX_039

	ld a, (1 << 6) | (1 << 7) | TRANSFORMATION_BALL_O_STRING_WARIO
	ld [wTransformation], a
	xor a
	ld [wca8f], a
	ld a, $03
	ld [wca93], a
	ld a, $03
	ld [wca92], a
	ld a, $01
	ld [wca94], a
	call UpdateLevelMusic

	ld a, ST_GETTING_WRAPPED_IN_STRING
	ld [wWarioState], a
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca8b], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld a, -1
	ld [wca70], a
	ld a, -27
	ld [wca6f], a
	ld a, -9
	ld [wca71], a
	ld a, 9
	ld [wca72], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a
	ld hl, Pals_c860
	call SetWarioPal

	load_gfx WarioStringGfx
	call LoadWarioGfx

	load_oam OAM_171c0

	load_frameset Frameset_17414
	update_anim_1
	ret
; 0x21358

SetState_FatEating: ; 21358 (8:5358)
	ld a, [wca8b]
	and a
	jp nz, Func_20a69
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_20a69
	cp (1 << 7) | TRANSFORMATION_FAT_WARIO
	jr nz, .asm_21373
	jp Func_20a69

.asm_21373
	call Func_20a63
	ld a, (1 << 7) | TRANSFORMATION_FAT_WARIO
	ld [wTransformation], a
	ld a, $02
	ld [wca93], a
	ld a, $02
	ld [wca92], a
	ld a, $02
	ld [wca94], a
	ld a, $01
	ld [wca90], a
	ld a, $a4
	ld [wca91], a
	xor a
	ld [wInvisibleFrame], a
	ld [wSFXLoopCounter], a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wca8b], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld a, [wJumpVelTable]
	and a
	jr z, .asm_213bb
	ld a, FALLING_JUMP_VEL_INDEX
	ld [wJumpVelIndex], a
.asm_213bb
	load_sfx SFX_03A
	call UpdateLevelMusic

	ld a, ST_FAT_EATING
	ld [wWarioState], a
	ld a, -1
	ld [wca70], a
	ld a, -27
	ld [wca6f], a
	ld a, -9
	ld [wca71], a
	ld a, 9
	ld [wca72], a
	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	load_gfx WarioFatGfx
	call LoadWarioGfx

	load_oam OAM_1742d

	ld a, [wDirection]
	and a
	jr nz, .asm_21419
	load_frameset Frameset_1789c
	jr .asm_21423
.asm_21419
	load_frameset Frameset_178c3
.asm_21423
	update_anim_1
	ret
; 0x21433

ObjInteraction_RegularCoin: ; 21433 (8:5433)
	ld hl, wNumCoins + 1
	ld a, [hl]
	add $1
	daa
	ld [hld], a
	ld a, [hl]
	adc $00
	daa
	ld [hl], a
	and $f0
	jr z, .no_cap
	ld a, HIGH(MAX_NUM_COINS)
	ld [hli], a
	ld a, LOW(MAX_NUM_COINS)
	ld [hl], a
.no_cap
	load_sfx SFX_REGULAR_COIN
	jp Func_20a63
; 0x21455

SetState_ElectricStart: ; 21455 (8:5455)
	ld a, [wWarioScreenXPos]
	ld b, a
	ld a, [wc1bf]
	cp b
	jr c, .asm_21469
	ld a, [wInteractionSide]
	or INTERACTION_RIGHT
	ld [wInteractionSide], a
	jr .asm_21471

.asm_21469
	ld a, [wInteractionSide]
	or INTERACTION_LEFT
	ld [wInteractionSide], a
.asm_21471
	ld b, $06
	call SetObjUnk1C

	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	ret nz
	cp (1 << 7) | TRANSFORMATION_ELECTRIC
	ret z
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_21492
	ld a, DIRECTION_RIGHT
	ld [wDirection], a
	jr .asm_21497
.asm_21492
	ld a, DIRECTION_LEFT
	ld [wDirection], a

.asm_21497
	load_sfx SFX_040
	xor a
	ld [wWarioStateCounter], a
	ld [wWarioStateCycles], a
	ld [wGrabState], a
	ld [wAttackCounter], a
	ld [wJumpVelIndex], a
	ld [wJumpVelTable], a
	ld [wca8b], a
	ld [wIsRolling], a
	ld [wIsSmashAttacking], a
	ld [wInvisibleFrame], a

	ld a, ST_ELECTRIC_START
	ld [wWarioState], a
	ld a, -1
	ld [wca70], a
	ld a, -27
	ld [wca6f], a
	ld a, -9
	ld [wca71], a
	ld a, 9
	ld [wca72], a

	ld a, (1 << 7) | TRANSFORMATION_ELECTRIC
	ld [wTransformation], a
	ld a, $04
	ld [wca93], a
	ld a, $04
	ld [wca92], a
	ld a, $01
	ld [wca94], a
	call UpdateLevelMusic

	xor a
	ld [wFrameDuration], a
	ld [wca68], a

	ld hl, Pals_c870
	call SetWarioPal

	load_gfx WarioElectricGfx
	call LoadWarioGfx

	load_oam OAM_1790e

	ld a, [wDirection]
	and a
	jr nz, .asm_2152e
	load_frameset Frameset_17b79
	jr .asm_21538
.asm_2152e
	load_frameset Frameset_17b76
.asm_21538
	update_anim_1
	ret
; 0x21548

Func_21548: ; 21548 (8:5548)
	call Func_20a63
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	ret nz
	cp TRANSFORMATION_INVISIBLE_WARIO
	ret z
	farcall SetState_TurningInvisible
	ret
; 0x21569

Func_21569: ; 21569 (8:5569)
	ld a, [wInteractionSide]
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_21573
	jp Func_2022c
.asm_21573
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	cp TRANSFORMATION_PUFFY_WARIO
	jp z, Func_2022c
	ld a, [wTransformation]
	cp TRANSFORMATION_OWL_WARIO
	call z, Func_16d9
	ld b, $06
	call SetObjUnk1C
	farcall SetState_PuffyInflating
	ret
; 0x215a2

Func_215a2: ; 215a2 (8:55a2)
	ld a, [wInvincibleCounter]
	and a
	jp nz, Func_20a69
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_ZOMBIE_WARIO
	jp z, Func_205e7
	bit 6, a
	jp nz, Func_20a69

	ld b, $06
	call SetObjUnk1C

	load_sfx SFX_028

	ld a, (1 << 6) | TRANSFORMATION_ZOMBIE_WARIO
	ld [wTransformation], a
	ld a, $04
	ld [wca93], a
	ld a, $04
	ld [wca92], a
	ld a, $02
	ld [wca94], a
	farcall SetState_ZombieIdling
	ret
; 0x215e7

Func_215e7: ; 215e7 (8:55e7)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20447
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_21600
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_2160a
	jp Func_2022c
.asm_21600
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_2160a
	jp Func_2022c
.asm_2160a
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld b, $06
	call SetObjUnk1C
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	cp TRANSFORMATION_BOUNCY_WARIO
	jp z, Func_2022c
	ld a, TRANSFORMATION_BOUNCY_WARIO
	ld [wTransformation], a
	ld a, $02
	ld [wca93], a
	ld a, $02
	ld [wca92], a
	ld a, $01
	ld [wca94], a
	ld a, $03
	ld [wca90], a
	ld a, $84
	ld [wca91], a
	farcall SetState_BouncyStart
	ret
; 0x2164f

Func_2164f: ; 2164f (8:564f)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jp nz, Func_20447
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_21668
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_21672
	jp Func_2022c
.asm_21668
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_21672
	jp Func_2022c
.asm_21672
	jp Func_20e97
; 0x21675

Func_21675: ; 21675 (8:5675)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_2168b
	ld a, [wAttackCounter]
	and a
	jp nz, Func_217a9
	jp Func_20a6f

.asm_2168b
	ld a, [wWarioState]
	cp ST_FLAT_SQUISHED
	jr nz, .asm_216a2
	farcall SetState_FlatSquishedLifting
	ret

.asm_216a2
	ld a, [wc1c2]
	cp $10
	jr c, .asm_216ab
	ld a, $0c
.asm_216ab
	ld b, a
	call AddYOffset
	farcall Func_19b25
	ld a, [wWaterInteraction]
	and a
	jr z, .asm_216d4
	farcall Func_1cd7c
	ret

.asm_216d4
	farcall Func_198e0
	ld a, b
	and a
	jr nz, .asm_21710
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr z, .asm_2173e
	and a
	ret nz
	ld a, [wca8b]
	and a
	jr nz, .asm_2174e
	xor a
	ld [wGrabState], a
	farcall StartFall
	ret

.asm_21710
	ld hl, hYPosHi
	ld de, wPos
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wInvincibleCounter]
	cp $01
	ret z
	ld a, [wTransformation]
	cp (1 << 6) | TRANSFORMATION_FLAT_WARIO
	jr z, .asm_2175e
	and a
	ret nz
	xor a
	ld [wGrabState], a
	farcall SetState_Idling
	ret

.asm_2173e
	farcall SetState_FlatFalling
	ret

.asm_2174e
	farcall Func_1ed34
	ret

.asm_2175e
	ld a, [wWarioState]
	cp ST_FLAT_SQUISHED
	ret z
	farcall SetState_FlatIdling
	ret
; 0x21774

Func_21774: ; 21774 (8:5774)
	ld a, [wInteractionSide]
	bit INTERACTION_UP_F, a
	jp nz, Func_209ca
	bit INTERACTION_DOWN_F, a
	jr nz, .asm_21789
	ld a, [wAttackCounter]
	and a
	jr nz, Func_217a9
	jp Func_20a6f
.asm_21789
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	ret nz
	ld b, $0b
	call SetObjUnk1C
	farcall SetState_FlatAirborne
	ret
; 0x217a9

Func_217a9: ; 217a9 (8:57a9)
	farcall Func_1ca39
	ret
; 0x217b9

Func_217b9: ; 217b9 (8:57b9)
	ld a, [wInteractionSide]
	and INTERACTION_UP | INTERACTION_DOWN
	jr nz, .asm_217db
	ld a, [wEnemyDirection]
	cp DIRECTION_RIGHT
	jr z, .asm_217d1
	ld a, [wInteractionSide]
	bit INTERACTION_RIGHT_F, a
	jr nz, .asm_217de
	jp Func_2022c
.asm_217d1
	ld a, [wInteractionSide]
	bit INTERACTION_LEFT_F, a
	jr nz, .asm_217de
	jp Func_2022c
.asm_217db
	jp Func_20447
.asm_217de
	ld a, [wInvincibleCounter]
	and a
	ret nz
	ld a, [wTransformation]
	bit 6, a
	jp nz, Func_2022c
	cp TRANSFORMATION_CRAZY_WARIO
	jp z, Func_2022c
	ld b, $06
	call SetObjUnk1C
	ld a, TRANSFORMATION_CRAZY_WARIO
	ld [wTransformation], a
	ld a, $03
	ld [wca93], a
	ld a, $03
	ld [wca92], a
	ld a, $01
	ld [wca94], a
	farcall SetState_CrazySpinning
	ret
; 0x21819

	INCROM $21819, $21aac

Func_21aac: ; 21aac (8:5aac)
	ld a, [wIsSmashAttacking]
	dec a
	jp nz, Func_209ca
	call Func_20602
	ld b, $0f
	jp SetObjUnk1C
; 0x21abb

	INCROM $21abb, $21ddb

; adds 10 to coin count
CollectMusicalCoin: ; 21ddb (8:5ddb)
	ld hl, wNumCoins + 1
	ld a, [hl]
	add $10
	daa
	ld [hld], a
	ld a, [hl]
	adc $00
	daa
	ld [hl], a
	and $f0
	jr z, .no_cap
	ld a, HIGH(MAX_NUM_COINS)
	ld [hli], a
	ld a, LOW(MAX_NUM_COINS)
	ld [hl], a
.no_cap
	call Func_20a63
	jp Func_20000.next_obj
; 0x21df8

	INCROM $21df8, $21f51

Func_21f51: ; 21f51 (8:5f51)
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wcce7], a
	ld a, $01
	add b
	ld [wcce8], a
	ld a, [wc0a4]
	and $08
	jr nz, .asm_21fa3
	ld b, $10
.asm_21f69
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_21f9f
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_21f9f
	dec b
	jr nz, .asm_21f69
	ret

.asm_21fa3
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	inc a
	ld [wcce8], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_21fd6
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_21fd6
	ld b, $10
.asm_21fd8
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_2200e
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_2200e
	dec b
	jr nz, .asm_21fd8
	ret
; 0x22012

Func_22012: ; 22012 (8:6012)
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wc0b3], a
	ld a, $35
	add b
	ld [wc0b4], a
	ld a, [wc0a4]
	and $08
	jp nz, Func_2208a
	ld b, $10
.asm_22032
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22068
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22068
	dec b
	jr nz, .asm_22032
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	ld a, [hl]
	ld [de], a
	pop hl
	pop af
	ldh [rSVBK], a
	ret
; 0x2208a

Func_2208a: ; 2208a (8:608a)
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wce35
	add hl, de
	inc l
	inc l
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	inc a
	ld [wc0b4], a
	ld a, [hl]
	ld [de], a
	pop hl

	inc h
	ld a, h
	cp $c0
	jr nz, .asm_220bd
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_220bd
	ld b, $10
.asm_220bf
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_220f5
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_220f5
	dec b
	jr nz, .asm_220bf
	pop af
	ldh [rSVBK], a
	ret
; 0x220fc

Func_220fc: ; 220fc (8:60fc)
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wcce7], a
	ld a, $01
	add b
	ld [wcce8], a
	ld a, [wc0a4]
	and $08
	jp nz, Func_2214e
	ld b, $10
.asm_22115
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_2214a
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_2214a
	dec b
	jr nz, .asm_22115
	ret
; 0x2214e

Func_2214e: ; 2214e (8:614e)
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	inc l
	inc l
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	inc a
	ld [wcce8], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22180
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22180
	ld b, $10
.asm_22182
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, wc600
	add hl, de
	ld a, [wcce7]
	ld d, a
	ld a, [wcce8]
	ld e, a
	add $02
	ld [wcce8], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_221b7
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_221b7
	dec b
	jr nz, .asm_22182
	ret
; 0x221bb

Func_221bb: ; 221bb (8:61bb)
	ldh a, [rSVBK]
	push af
	ld a, $03
	ldh [rSVBK], a
	ld a, [wce00]
	ld b, a
	ld a, $ce
	ld [wc0b3], a
	ld a, $35
	add b
	ld [wc0b4], a
	ld a, [wc0a4]
	and $08
	jp nz, Func_22217
	ld b, $10
.asm_221db
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22210
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22210
	dec b
	jr nz, .asm_221db
	pop af
	ldh [rSVBK], a
	ret
; 0x22217

Func_22217: ; 22217 (8:6217)
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	inc l
	inc l
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	inc a
	ld [wc0b4], a
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22249
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22249
	ld b, $10
.asm_2224b
	ld a, [hl]
	ld d, $00
	ld e, a
	sla e
	sla e
	rl d
	push hl
	ld hl, w3d300
	add hl, de
	ld a, [wc0b3]
	ld d, a
	ld a, [wc0b4]
	ld e, a
	add $02
	ld [wc0b4], a
	ld a, [hli]
	ld [de], a
	inc l
	inc e
	ld a, [hl]
	ld [de], a
	pop hl
	inc h
	ld a, h
	cp $c0
	jr nz, .asm_22280
	ld h, $a0
	ld a, [wSRAMBank]
	inc a
	sramswitch
.asm_22280
	dec b
	jr nz, .asm_2224b
	pop af
	ldh [rSVBK], a
	ret
; 0x22287
