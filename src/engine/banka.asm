Func_28000: ; 28000 (a:4000)
	ld a, [wWarioState]
	sub $60
	jumptable

	dw $40a6
	dw $41c1
	dw $427a
	dw $439f
	dw $441e
	dw $4511
	dw $4599
	dw $4601
	dw $4672
	dw $471f
	dw $47a2
	dw $48e5
	dw $494e
	dw $4a39
	dw $4a5a
	dw $4a8a
	dw $4aad
	dw $4b36
	dw $4c25
	dw $4ceb
	dw $4d92
	dw $4e1a
	dw $4e70
	dw $4e87
	dw $4f39
	dw $4fc0
	dw $506d
	dw $5123
	dw $5243
	dw $52e5
	dw $53b9
	dw $53d0
	dw $54bf
	dw $5672
	dw $572e
	dw $5816
	dw $5871
	dw $58f3
	dw $5975
	dw $5a74
	dw $5b06
	dw $5ba2
	dw $5c29
	dw $5d6f
	dw $5dd3
	dw $5e7e
	dw $5ef3
	dw $5f42
	dw $5ffa
	dw $6087
	dw $60f9
	dw $61f5
	dw $6267
	dw $62d3
	dw $6362
	dw $6489
	dw $6544
	dw $65d8
	dw $6657
	dw $66c0
	dw $677b
	dw $6804
	dw $6890
	dw $68d2
	dw $69b2
	dw $6a08
	dw $6b18
	dw $6b42
	dw $6c04
	dw $6d06
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
	dw Func_156d
; 0x280a6

	INCROM $280a6, $2b1a6

Func_2b1a6: ; 2b1a6 (a:71a6)
	ld a, [wDirection]
	and a
	jr nz, .asm_2b1bc
	farcall Func_1f104
	ret

.asm_2b1bc
	farcall Func_1f0ed
	ret
; 0x2b1cc

	INCROM $2b1cc, $2c000
