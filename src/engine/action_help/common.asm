ActionHelpStateTable:
	ldh a, [rSVBK]
	push af
	ld a, BANK("GFX RAM")
	ldh [rSVBK], a
	farcall _ActionHelpStateTable
	pop af
	ldh [rSVBK], a
	ret
