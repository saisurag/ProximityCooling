label119	CODE	0EF1h
label124	CODE	0D72h
label151	CODE	1172h
label180	CODE	126Dh
label185	CODE	1270h
label189	CODE	1002h
label197	CODE	16C1h
label198	CODE	1273h
label203	CODE	12E2h

	ORG	0h
	ljmp	label0

	ORG	800h
label80:
	mov	A, R4
	orl	A, R5
	jz	label1
	mov	A, R0
	orl	A, R1
	jnz	label2
	mov	A, R5
	rlc	A
	mov	A, R4
	rlc	A
	inc	A
	jz	label3
	clr	A
	mov	R4, A
	mov	R7, A
	mov	R6, A
	mov	R5, A
label4:	ret
label1:	mov	A, R1
	rlc	A
	mov	A, R0
	rlc	A
	inc	A
	jnz	label4
label3:	ljmp	label5
label2:	lcall	label6
	anl	A, R0
	inc	A
	jz	label7
	clr	A
	xch	A, R4
	add	A, #81h
	jnc	label8
	add	A, R0
	jnc	label9
label7:	ljmp	label10
label8:	add	A, R0
	jc	label9
	ljmp	label11
label9:	push	ACC
	mov	A, R3
	orl	A, R2
	jnz	label12
	cjne	R1, #80h, label13
label17:
	pop	ACC
	mov	R3, A
	ljmp	label14
label13:
	mov	A, R7
	orl	A, R6
	jnz	label15
	cjne	R5, #80h, label16
label21:
	mov	A, R3
	mov	R7, A
	mov	A, R2
	mov	R6, A
	mov	A, R1
	mov	R5, A
	sjmp	label17
label16:
	mov	A, R1
	mov	B, R5
	mul	AB
	mov	R6, A
	mov	A, B
	ljmp	label18
label20:
	mov	A, R1
	xch	A, R5
	mov	R1, A
	mov	A, R2
	mov	R6, A
	mov	A, R3
	mov	R7, A
label15:
	mov	A, R7
	mov	B, R1
	mul	AB
	mov	R4, A
	mov	A, B
	xch	A, R6
	mov	B, R1
	mul	AB
	add	A, R6
	mov	R7, A
	clr	A
	addc	A, B
	xch	A, R5
	mov	B, R1
	mul	AB
	add	A, R5
	mov	R6, A
	clr	A
	addc	A, B
	sjmp	label18
label12:
	mov	A, R7
	orl	A, R6
	jnz	label19
	cjne	R5, #80h, label20
	sjmp	label21
label19:
	mov	A, R7
	mov	B, R3
	mul	AB
	mov	R4, B
	mov	A, R6
	mov	B, R3
	mul	AB
	add	A, R4
	mov	R4, A
	clr	A
	addc	A, B
	mov	R0, A
	mov	A, R7
	mov	B, R2
	mul	AB
	add	A, R4
	mov	A, B
	addc	A, R0
	mov	R4, A
	clr	A
	rlc	A
	xch	A, R3
	mov	B, R5
	mul	AB
	add	A, R4
	mov	R4, A
	mov	A, B
	addc	A, R3
	mov	R0, A
	mov	A, R6
	mov	B, R2
	mul	AB
	add	A, R4
	mov	R4, A
	mov	A, B
	addc	A, R0
	mov	R0, A
	clr	A
	rlc	A
	xch	A, R7
	mov	B, R1
	mul	AB
	add	A, R4
	mov	R4, A
	mov	A, B
	addc	A, R0
	xch	A, R7
	addc	A, #0h
	xch	A, R6
	mov	B, R1
	mul	AB
	add	A, R7
	mov	R7, A
	mov	A, B
	addc	A, R6
	mov	R6, A
	clr	A
	rlc	A
	xch	A, R1
	mov	B, R5
	mul	AB
	add	A, R6
	mov	R6, A
	mov	A, B
	addc	A, R1
	xch	A, R5
	mov	B, R2
	mul	AB
	add	A, R7
	mov	R7, A
	mov	A, B
	addc	A, R6
	mov	R6, A
	clr	A
	addc	A, R5
label18:
	mov	R5, A
	rlc	A
	pop	ACC
	mov	R3, A
	jnc	label22
	inc	R3
	cjne	R3, #0h, label23
	ljmp	label10
label22:
	mov	A, R4
	add	A, R4
	mov	R4, A
	mov	A, R7
	rlc	A
	mov	R7, A
	mov	A, R6
	rlc	A
	mov	R6, A
	mov	A, R5
	rlc	A
	mov	R5, A
label23:
	ljmp	label24
label28:
	ljmp	label10
label112:
	mov	A, R4
	anl	A, R5
	inc	A
	jz	label25
	mov	A, R0
	anl	A, R1
	inc	A
	jnz	label26
label25:
	ljmp	label5
label26:
	lcall	label6
	anl	A, R0
	inc	A
	jz	label25
	mov	A, R4
	orl	A, R0
	jz	label25
	mov	A, R4
	jnz	label27
	mov	R5, A
	mov	R6, A
	mov	R7, A
	ret
label27:
	xch	A, R0
	jz	label28
	add	A, #81h
	xch	A, R0
	jnc	label29
	clr	C
	subb	A, R0
	jz	label30
	jnc	label31
label30:
	ljmp	label11
label29:
	subb	A, R0
	jnc	label28
label31:
	mov	DPL, A
	mov	A, R1
	add	A, R1
	orl	A, R3
	orl	A, R2
	jnz	label32
	mov	R3, DPL
	ljmp	label14
label32:
	mov	B, #0h
	mov	R4, #1Ah
	mov	R0, #80h
label38:
	clr	C
	mov	A, R7
	subb	A, R3
	mov	A, R6
	subb	A, R2
	mov	A, R5
	subb	A, R1
	jc	label33
label37:
	clr	C
	mov	A, R7
	subb	A, R3
	mov	R7, A
	mov	A, R6
	subb	A, R2
	mov	R6, A
	mov	A, R5
	subb	A, R1
	mov	R5, A
	mov	A, R0
	orl	B, A
label33:
	djnz	R4, label34
	mov	R4, B
	pop	ACC
	mov	R7, A
	pop	ACC
	mov	R6, A
	pop	ACC
label123:
	mov	R5, A
	mov	R3, DPL
	jb	0E7h, label35
	dec	R3
	mov	A, R3
	jz	label30
	mov	A, R4
	add	A, R4
	mov	R4, A
	mov	A, R7
	rlc	A
	mov	R7, A
	mov	A, R6
	rlc	A
	mov	R6, A
	mov	A, R5
	rlc	A
	mov	R5, A
label35:
	ljmp	label24
label34:
	mov	A, R0
	rr	A
	mov	R0, A
	jnb	0E7h, label36
	push	B
	mov	B, #0h
label36:
	mov	A, R7
	add	A, R7
	mov	R7, A
	mov	A, R6
	rlc	A
	mov	R6, A
	mov	A, R5
	rlc	A
	mov	R5, A
	jc	label37
	jnb	0E7h, label33
	sjmp	label38
	mov	B, #20h
	sjmp	label39
label111:
	mov	B, #10h
	sjmp	label40
label158:
	mov	B, #8h
	mov	R5, #0h
label40:
	mov	R6, #0h
	mov	R7, #0h
label39:
	rlc	A
	mov	F0, C
	jnb	F0, label41
	lcall	label42
label41:
	mov	A, R4
	rlc	A
	jc	label43
	mov	A, R7
	rlc	A
	mov	R7, A
	mov	A, R6
	rlc	A
	mov	R6, A
	mov	A, R5
	rlc	A
	mov	R5, A
	mov	A, R4
	rlc	A
	mov	R4, A
	djnz	B, label41
	ret
label43:
	mov	A, B
	add	A, #7Eh
	mov	C, F0
	rrc	A
	xch	A, R4
	mov	0E7h, C
	xch	A, R5
	xch	A, R6
	mov	R7, A
	ret
label113:
	mov	A, R5
	setb	0E7h
	xch	A, R5
	rlc	A
	mov	A, R4
	rlc	A
	mov	F0, C
	add	A, #81h
	jc	label44
	clr	A
label46:
	mov	R7, A
	mov	R6, A
	mov	R5, A
	mov	R4, A
label48:
	ret
label44:
	mov	R4, A
	clr	A
	xch	A, R7
	xch	A, R6
	xch	A, R5
	xch	A, R4
	add	A, #0E0h
	jnc	label45
	mov	A, #0FFh
	sjmp	label46
label47:
	clr	C
	xch	A, R4
	rrc	A
	xch	A, R4
	xch	A, R5
	rrc	A
	xch	A, R5
	xch	A, R6
	rrc	A
	xch	A, R6
	xch	A, R7
	rrc	A
	xch	A, R7
label45:
	inc	A
	jnz	label47
	jnb	F0, label48
	ljmp	label42
label6:	mov	A, R1
	setb	0E7h
	xch	A, R1
	rlc	A
	mov	A, R0
	rlc	A
	mov	R0, A
	mov	F0, C
	mov	A, R5
	setb	0E7h
	xch	A, R5
	rlc	A
	mov	A, R4
	rlc	A
	mov	R4, A
	jnc	label49
	cpl	F0
label49:
	ret
label24:
	mov	A, R4
	jnb	0E7h, label14
	inc	R7
	cjne	R7, #0h, label14
	inc	R6
	cjne	R6, #0h, label14
	inc	R5
	cjne	R5, #0h, label14
	inc	R3
	mov	A, R3
	jz	label10
label14:
	mov	C, F0
	mov	A, R3
	rrc	A
	mov	R4, A
	mov	A, R5
	mov	0E7h, C
	mov	R5, A
	ret
label5:	mov	A, #0FFh
label50:
	mov	R4, A
	mov	R5, A
label51:
	mov	R6, A
	mov	R7, A
	ret
label11:
	clr	A
	sjmp	label50
label10:
	mov	C, F0
	mov	A, #0FFh
	rrc	A
	mov	R4, A
	mov	R5, #80h
	clr	A
	sjmp	label51
label139:
	mov	A, R5
	rlc	A
	mov	A, R4
	rlc	A
	jz	label52
	inc	A
	jnz	label53
	mov	A, R5
	anl	A, #7Fh
	jnz	label54
	mov	A, #2h
	mov	0E0h, C
	ret
label54:
	mov	A, #4h
	ret
label52:
	inc	A
	ret
label53:
	clr	A
	ret
label56:
	ljmp	label5
label133:
	mov	A, R0
	xrl	A, #80h
	mov	R0, A
label83:
	mov	A, R1
	rlc	A
	mov	A, R0
	rlc	A
	jz	label55
	inc	A
	jz	label56
	mov	A, R5
	rlc	A
	mov	A, R4
	rlc	A
	jnz	label57
	mov	A, R0
	mov	R4, A
	mov	A, R1
	mov	R5, A
	mov	A, R2
	mov	R6, A
	mov	A, R3
	mov	R7, A
label55:
	ret
label57:
	inc	A
	jz	label56
	setb	C
	mov	A, R3
	subb	A, R7
	mov	A, R2
	subb	A, R6
	mov	A, R1
	subb	A, R5
	mov	A, R0
	clr	0E7h
	mov	B, R4
	clr	0F7h
	subb	A, B
	jc	label58
	mov	A, R0
	xch	A, R4
	mov	R0, A
	mov	A, R1
	xch	A, R5
	mov	R1, A
	mov	A, R2
	xch	A, R6
	mov	R2, A
	mov	A, R3
	xch	A, R7
	mov	R3, A
label58:
	lcall	label6
	mov	B, PSW
	anl	A, R0
	inc	A
	jnz	label59
	jb	F0, label56
label59:
	mov	A, R0
	inc	A
	jnz	label60
	jnc	label61
	cpl	F0
label61:
	ljmp	label10
label60:
	mov	F0, C
	mov	A, R4
	inc	A
	jz	label61
	clr	A
	xch	A, R4
	push	ACC
	clr	C
	subb	A, R0
	mov	R0, A
	jz	label62
	subb	A, #18h
	jz	label63
	jc	label64
	pop	ACC
	mov	R3, A
	ljmp	label24
label63:
	clr	A
	mov	R3, A
	mov	R2, A
	xch	A, R1
	mov	R4, A
	sjmp	label62
label64:
	mov	A, R0
	jnb	0E4h, label65
	clr	A
	xch	A, R1
	mov	R3, A
	clr	A
	xch	A, R2
	mov	R4, A
label65:
	mov	A, R0
	jnb	0E3h, label66
	clr	A
	xch	A, R1
	xch	A, R2
	xch	A, R3
	mov	R4, A
label66:
	mov	A, R0
	anl	A, #7h
	jz	label62
	mov	R0, A
label67:
	clr	C
	mov	A, R1
	rrc	A
	mov	R1, A
	mov	A, R2
	rrc	A
	mov	R2, A
	mov	A, R3
	rrc	A
	mov	R3, A
	mov	A, R4
	rrc	A
	mov	R4, A
	djnz	R0, label67
label62:
	jnb	0F5h, label68
	clr	C
	clr	A
	subb	A, R4
	mov	R4, A
	mov	A, R7
	subb	A, R3
	mov	R7, A
	mov	A, R6
	subb	A, R2
	mov	R6, A
	mov	A, R5
	subb	A, R1
	mov	R5, A
	pop	ACC
	mov	R3, A
	mov	A, R7
	orl	A, R6
	orl	A, R5
	orl	A, R4
	jnz	label69
	ret
label71:
	djnz	R3, label70
	ljmp	label11
label70:
	mov	A, R4
	add	A, R4
	mov	R4, A
	mov	A, R7
	rlc	A
	mov	R7, A
	mov	A, R6
	rlc	A
	mov	R6, A
	mov	A, R5
	rlc	A
	mov	R5, A
label69:
	mov	A, R5
	jnb	0E7h, label71
	ljmp	label24
label68:
	mov	A, R7
	add	A, R3
	mov	R7, A
	mov	A, R6
	addc	A, R2
	mov	R6, A
	mov	A, R5
	addc	A, R1
	mov	R5, A
	pop	ACC
	mov	R3, A
	jnc	label72
	inc	R3
	cjne	R3, #0h, label73
	ljmp	label10
label73:
	mov	A, R5
	rrc	A
	mov	R5, A
	mov	A, R6
	rrc	A
	mov	R6, A
	mov	A, R7
	rrc	A
	mov	R7, A
	mov	A, R4
	rrc	A
	mov	R4, A
label72:
	ljmp	label24
label137:
	mov	A, #0F8h
	xch	A, R4
	xrl	A, #80h
	xch	A, R4
	xch	A, R0
	xrl	A, #80h
	xch	A, R0
	mov	DPL, A
	inc	A
	jz	label74
	clr	C
	mov	A, R3
	subb	A, R7
	mov	B, A
	mov	A, R2
	subb	A, R6
	orl	B, A
	mov	A, R1
	subb	A, R5
	orl	B, A
	mov	A, R0
	subb	A, R4
	orl	A, B
	jz	label74
	jnc	label75
	mov	A, DPL
	anl	A, R7
	mov	R7, A
	mov	A, DPL
	setb	C
	rrc	A
	xch	A, R3
	anl	A, R3
	xch	A, R3
	cpl	A
	add	A, R3
	anl	A, DPL
	mov	R3, A
	jnc	label74
	inc	R2
	cjne	R2, #0h, label74
	inc	R1
	cjne	R1, #0h, label74
	inc	R0
	sjmp	label74
label75:
	mov	A, DPL
	anl	A, R3
	mov	R3, A
	mov	A, DPL
	setb	C
	rrc	A
	xch	A, R7
	anl	A, R7
	xch	A, R7
	cpl	A
	clr	C
	rrc	A
	add	A, R7
	anl	A, DPL
	mov	R7, A
	jnc	label74
	inc	R6
	cjne	R6, #0h, label74
	inc	R5
	cjne	R5, #0h, label74
	inc	R4
label74:
	clr	C
	mov	A, R3
	subb	A, R7
	mov	B, A
	mov	A, R2
	subb	A, R6
	orl	B, A
	mov	A, R1
	subb	A, R5
	orl	B, A
	mov	A, R0
	subb	A, R4
	orl	A, B
	jz	label76
	xch	A, R4
	orl	A, R0
	jb	0E7h, label77
	cpl	C
label77:
	mov	A, R4
label76:
	ret
label145:
	mov	A, R5
	rlc	A
	mov	A, R4
	rlc	A
	jz	label78
	inc	A
	jnz	label79
	cjne	R5, #80h, label78
label79:
	mov	A, R4
	cpl	0E7h
	mov	R4, A
label78:
	ret
label134:
	push	ACC
	mov	A, R7
	mov	R3, A
	mov	A, R6
	mov	R2, A
	mov	A, R5
	mov	R1, A
	mov	A, R4
	mov	R0, A
	lcall	label80
	pop	ACC
label159:
	mov	B, A
	mov	A, R7
	mov	R3, A
	mov	A, R6
	mov	R2, A
	mov	A, R5
	mov	R1, A
	mov	A, R4
	mov	R0, A
	lcall	label81
	inc	DPTR
	inc	DPTR
	inc	DPTR
	inc	DPTR
label84:
	mov	A, R0
	push	ACC
	mov	A, R1
	push	ACC
	mov	A, R2
	push	ACC
	mov	A, R3
	push	ACC
	push	B
	lcall	label80
	lcall	label82
	inc	DPTR
	inc	DPTR
	inc	DPTR
	inc	DPTR
	lcall	label83
	pop	B
label125:
	pop	ACC
	mov	R3, A
	pop	ACC
	mov	R2, A
	pop	ACC
	mov	R1, A
	pop	ACC
	mov	R0, A
	djnz	B, label84
	ret
label176:
	cjne	R3, #1h, label85
	mov	A, DPL
	add	A, R1
	mov	DPL, A
	mov	A, DPH
	addc	A, R2
	mov	DPH, A
	movx	A, @DPTR
	ret
label85:
	jnc	label86
	mov	A, R1
	add	A, DPL
	mov	R0, A
	mov	A, @R0
	ret
label86:
	cjne	R3, #0FEh, label87
	mov	A, R1
	add	A, DPL
	mov	R0, A
	movx	A, @R0
	ret
label87:
	mov	A, DPL
	add	A, R1
	mov	DPL, A
	mov	A, DPH
	addc	A, R2
	mov	DPH, A
	clr	A
	movc	A, @A+DPTR
	ret
label115:
	cjne	R4, #0h, label88
	cjne	R6, #0h, label89
	mov	A, R7
	mov	B, R5
	div	AB
	mov	R7, A
	mov	R5, B
	ret
label88:
	clr	A
	xch	A, R4
	mov	R0, A
	mov	B, #8h
label91:
	mov	A, R7
	add	A, R7
	mov	R7, A
	mov	A, R6
	rlc	A
	mov	R6, A
	mov	A, R4
	rlc	A
	mov	R4, A
	mov	A, R6
	subb	A, R5
	mov	A, R4
	subb	A, R0
	jc	label90
	mov	R4, A
	mov	A, R6
	subb	A, R5
	mov	R6, A
	inc	R7
label90:
	djnz	B, label91
	clr	A
	xch	A, R6
	mov	R5, A
	ret
label89:
	mov	A, R5
	mov	R0, A
	mov	B, A
	mov	A, R6
	div	AB
	jb	OV, label92
	mov	R6, A
	mov	R5, B
	mov	B, #8h
label95:
	mov	A, R7
	add	A, R7
	mov	R7, A
	mov	A, R5
	rlc	A
	mov	R5, A
	jc	label93
	subb	A, R0
	jnc	label94
	djnz	B, label95
	ret
label93:
	clr	C
	subb	A, R0
label94:
	mov	R5, A
	inc	R7
	djnz	B, label95
label92:
	ret
label42:
	clr	C
	clr	A
	subb	A, R7
	mov	R7, A
	clr	A
	subb	A, R6
	mov	R6, A
	clr	A
	subb	A, R5
	mov	R5, A
	clr	A
	subb	A, R4
	mov	R4, A
	ret
label105:
	mov	A, R3
	subb	A, R7
	mov	B, A
	mov	A, R2
	subb	A, R6
	orl	B, A
	mov	A, R1
	subb	A, R5
	orl	B, A
	mov	A, R4
	xrl	A, #80h
	xch	A, R0
	xrl	A, #80h
	subb	A, R0
	orl	A, B
	ret
label81:
	clr	A
	movc	A, @A+DPTR
	mov	R4, A
	mov	A, #1h
	movc	A, @A+DPTR
	mov	R5, A
	mov	A, #2h
	movc	A, @A+DPTR
	mov	R6, A
	mov	A, #3h
	movc	A, @A+DPTR
	mov	R7, A
	ret
label82:
	clr	A
	movc	A, @A+DPTR
	mov	R0, A
	mov	A, #1h
	movc	A, @A+DPTR
	mov	R1, A
	mov	A, #2h
	movc	A, @A+DPTR
	mov	R2, A
	mov	A, #3h
	movc	A, @A+DPTR
	mov	R3, A
	ret
label181:
	clr	A
	mov	2Fh, A
	mov	30h, A
	mov	35h, A
	mov	36h, A
	mov	37h, A
	mov	38h, A
	mov	39h, A
	mov	3Ah, A
	mov	3Bh, A
	mov	3Ch, A
	lcall	label96
	clr	90h
	mov	37h, A
	mov	38h, A
label103:
	clr	A
	mov	35h, A
	mov	36h, A
label99:
	mov	R7, 36h
	mov	A, 36h
	add	A, 3Ah
	mov	R5, A
	mov	A, 35h
	addc	A, 39h
	mov	R4, A
	mov	A, #0B2h
	add	A, R5
	mov	DPL, A
	mov	A, #12h
	addc	A, R4
	mov	DPH, A
	clr	A
	movc	A, @A+DPTR
	mov	R5, A
	mov	R4, #0h
	lcall	label97
	inc	36h
	mov	A, 36h
	jnz	label98
	inc	35h
label98:
	clr	C
	subb	A, #8h
	mov	A, 35h
	subb	A, #0h
	jc	label99
	inc	3Ch
	mov	A, 3Ch
	jnz	label100
	inc	3Bh
label100:
	setb	C
	subb	A, #27h
	mov	A, 3Bh
	subb	A, #0h
	jc	label101
	clr	A
	mov	3Bh, A
	mov	3Ch, A
	mov	A, #8h
	add	A, 3Ah
	mov	3Ah, A
	clr	A
	addc	A, 39h
	mov	39h, A
	setb	C
	mov	A, 3Ah
	subb	A, #29h
	mov	A, 39h
	subb	A, #0h
	jc	label101
	clr	A
	mov	39h, A
	mov	3Ah, A
label101:
	inc	38h
	mov	A, 38h
	jnz	label102
	inc	37h
label102:
	clr	C
	subb	A, #0BCh
	mov	A, 37h
	subb	A, #2h
	jc	label103
	lcall	label104
label106:
	clr	A
	mov	37h, A
	mov	38h, A
label118:
	mov	R6, 37h
	mov	R7, 38h
	clr	A
	mov	R4, A
	mov	R5, A
	mov	R3, #0FFh
	mov	R2, #0FFh
	mov	R1, A
	mov	R0, A
	setb	C
	lcall	label105
	jc	label106
	lcall	label107
	jnb	INT1, $
	setb	TR0
label109:
	jnb	INT1, label108
	jnb	TF0, label109
label108:
	clr	TR0
	clr	A
	mov	44h, A
	mov	43h, A
	mov	42h, #0C0h
	mov	41h, #0C0h
	mov	R7, A
	mov	R6, A
	mov	R5, #20h
	mov	R4, #41h
	lcall	label110
	mov	R3, #80h
	mov	R2, #5Fh
	mov	R1, #11h
	mov	R0, #47h
	lcall	label80
	mov	24h, R7
	mov	23h, R6
	mov	22h, R5
	mov	21h, R4
	mov	R7, TH0
	mov	A, R7
	mov	R5, TL0
	mov	2Fh, A
	mov	A, R5
	mov	30h, A
	mov	R4, 2Fh
	clr	A
	lcall	label111
	mov	R3, 24h
	mov	R2, 23h
	mov	R1, 22h
	mov	R0, 21h
	lcall	label80
	clr	A
	mov	R3, A
	mov	R2, A
	mov	R1, A
	mov	R0, #40h
	lcall	label112
	lcall	label113
	mov	2Fh, R6
	mov	30h, R7
	clr	C
	mov	A, 30h
	subb	A, #5h
	mov	A, 2Fh
	subb	A, #0h
	jnc	label114
	setb	90h
label114:
	mov	R6, 2Fh
	mov	R7, 30h
	mov	R4, #3h
	mov	R5, #0E8h
	lcall	label115
	mov	A, #8h
	add	A, R7
	mov	R0, A
	mov	A, @R0
	mov	31h, A
	mov	R6, 2Fh
	mov	R7, 30h
	mov	R4, #3h
	mov	R5, #0E8h
	lcall	label115
	mov	R2, 4h
	mov	R3, 5h
	mov	R5, #64h
	mov	R4, #0h
	mov	R7, 3h
	mov	R6, 2h
	lcall	label115
	mov	A, #8h
	add	A, R7
	mov	R0, A
	mov	A, @R0
	mov	32h, A
	mov	R5, #64h
	mov	R4, #0h
	mov	R7, 3h
	mov	R6, 2h
	lcall	label115
	mov	R2, 4h
	mov	R3, 5h
	mov	R5, #0Ah
	mov	R4, #0h
	mov	R7, 3h
	mov	R6, 2h
	lcall	label115
	mov	A, #8h
	add	A, R7
	mov	R0, A
	mov	A, @R0
	mov	33h, A
	mov	R5, #0Ah
	mov	R4, #0h
	mov	R7, 3h
	mov	R6, 2h
	lcall	label115
	mov	A, #8h
	add	A, R5
	mov	R0, A
	mov	A, @R0
	mov	34h, A
	mov	R3, #0h
	mov	R2, #0h
	mov	R1, #31h
	mov	R5, #5h
	lcall	label116
	inc	38h
	mov	A, 38h
	jnz	label117
	inc	37h
label117:
	ljmp	label118
	addc	A, R6
	mov	48h, C
label127:
	djnz	R2, label119
	xch	A, R4
	xch	A, R4
	xch	A, R5
	addc	A, R7
	add	A, R2
	mov	R2, 0ABh
	jc	label120
label120:
	nop
label122:
	nop
	addc	A, R7
	sjmp	label121
label121:
	nop
	addc	A, R7
	subb	A, R0
	addc	A, @R1
	movx	@DPTR, A
	addc	A, R7
	cjne	A, 4h, label122
	addc	A, R7
	xchd	A, @R1
	orl	A, #0FCh
	addc	A, R6
	acall	label123
	dec	@R1
	addc	A, R6
	acall	label124
	dec	@R1
	addc	A, R7
	inc	15h
	acall	label125
	djnz	R6, label126
	djnz	R1, label127
	nop
	sjmp	label128
label146:
	clr	0h
label128:
	mov	A, R5
	setb	0E7h
	mov	R0, A
	xch	A, R5
	rlc	A
	mov	A, R4
	rlc	A
	inc	A
	jnz	label129
	cjne	R5, #80h, label130
label131:
	mov	F0, C
	ljmp	label10
label130:
	ljmp	label5
label129:
	jc	label130
	setb	C
	dec	A
	jz	label131
	mov	B, A
	mov	R4, #3Fh
	mov	A, R6
	mov	R2, #0h
	clr	C
	subb	A, #96h
	xch	A, R0
	subb	A, #8Bh
	jc	label132
	inc	R2
	xch	A, R0
	subb	A, #69h
	xch	A, R0
	subb	A, #1Ah
	jc	label132
	inc	R2
	xch	A, R0
	subb	A, #68h
	xch	A, R0
	subb	A, #1Fh
	jc	label132
	inc	R2
	xch	A, R0
	subb	A, #5Ah
	xch	A, R0
	subb	A, #25h
	jc	label132
	inc	B
	mov	R2, #0h
	xch	A, R5
	clr	0E7h
	xch	A, R5
label132:
	push	B
	mov	47h, R4
	mov	48h, R5
label126:
	mov	49h, R6
	mov	4Ah, R7
	mov	A, R2
	rl	A
	rl	A
	push	ACC
	add	A, #0BEh
	mov	DPL, A
	clr	A
	addc	A, #0Eh
	mov	DPH, A
	lcall	label82
	lcall	label83
	mov	A, R4
	push	ACC
	mov	A, R5
	push	ACC
	mov	A, R6
	push	ACC
	mov	A, R7
	push	ACC
	lcall	label81
	mov	R0, 47h
	mov	R1, 48h
	mov	R2, 49h
	mov	R3, 4Ah
	lcall	label133
	pop	ACC
	mov	R3, A
	pop	ACC
	mov	R2, A
	pop	ACC
	mov	R1, A
	pop	ACC
	cpl	0E7h
	mov	R0, A
	lcall	label112
	mov	47h, R4
	mov	48h, R5
	mov	49h, R6
	mov	4Ah, R7
	mov	DPTR, #0EAEh
	mov	A, #3h
	lcall	label134
	mov	R0, 47h
	mov	R1, 48h
	mov	R2, 49h
	mov	R3, 4Ah
	lcall	label80
	pop	ACC
	jz	label135
	add	A, #0CAh
	mov	DPL, A
	clr	A
	addc	A, #0Eh
	mov	DPH, A
	lcall	label82
	lcall	label83
label135:
	mov	47h, R4
	mov	48h, R5
	mov	49h, R6
	mov	4Ah, R7
	pop	ACC
	clr	C
	subb	A, #7Fh
	mov	R5, A
	clr	A
	subb	A, #0h
	mov	R4, A
	lcall	label111
	mov	R3, #18h
	mov	R2, #72h
	mov	R1, #31h
	mov	R0, #3Fh
	lcall	label80
	mov	R0, 47h
	mov	R1, 48h
	mov	R2, 49h
	mov	R3, 4Ah
	lcall	label83
	jnb	0h, label136
	mov	R3, #0D9h
	mov	R2, #5Bh
	mov	R1, #0DEh
	mov	R0, #3Eh
	lcall	label80
label136:
	ret
label110:
	mov	40h, R7
	mov	3Fh, R6
	mov	3Eh, R5
	mov	3Dh, R4
	clr	A
	mov	R7, A
	mov	R6, A
	mov	R5, #80h
	mov	R4, #3Fh
	mov	R3, 40h
	mov	R2, 3Fh
	mov	R1, 3Eh
	mov	R0, 3Dh
	lcall	label137
	jnz	label138
	mov	R7, 40h
	mov	R6, 3Fh
	mov	R5, 3Eh
	mov	R4, 3Dh
	ret
label138:
	mov	R7, 40h
	mov	R6, 3Fh
	mov	R5, 3Eh
	mov	R4, 3Dh
	lcall	label139
	mov	R3, A
	mov	R7, 44h
	mov	R6, 43h
	mov	R5, 42h
	mov	R4, 41h
	lcall	label139
	mov	R7, A
	cjne	R7, #1h, label140
	clr	A
	mov	R7, A
	mov	R6, A
	mov	R5, #80h
	mov	R4, #3Fh
	ret
label140:
	mov	A, R7
	xrl	A, #4h
	jz	label141
	mov	A, R3
	xrl	A, #4h
	jz	label141
	cjne	R3, #1h, label142
	clr	A
	mov	R7, A
	mov	R6, A
	mov	R5, A
	mov	R4, A
	mov	R3, 44h
	mov	R2, 43h
	mov	R1, 42h
	mov	R0, 41h
	lcall	label137
	jz	label141
	jc	label141
	clr	A
	mov	R7, A
	mov	R6, A
	mov	R5, A
	mov	R4, A
	ret
label141:
	mov	A, #0FFh
	mov	44h, A
	mov	43h, A
	mov	42h, A
	mov	41h, A
	ljmp	label143
label142:
	clr	A
	mov	45h, A
	mov	46h, A
	mov	R7, A
	mov	R6, A
	mov	R5, A
	mov	R4, A
	mov	R3, 40h
	mov	R2, 3Fh
	mov	R1, 3Eh
	mov	R0, 3Dh
	lcall	label137
	jnc	label144
	mov	R7, 44h
	mov	R6, 43h
	mov	R5, 42h
	mov	R4, 41h
	lcall	label113
	mov	45h, R6
	mov	46h, R7
	mov	R4, 45h
	mov	R5, 46h
	mov	A, R4
	lcall	label111
	xch	A, R0
	mov	A, R4
	xch	A, R0
label148:
	xch	A, R1
	mov	A, R5
	xch	A, R1
	xch	A, R2
label192:
	mov	A, R6
	xch	A, R2
	xch	A, R3
	mov	A, R7
	xch	A, R3
	mov	R7, 44h
	mov	R6, 43h
	mov	R5, 42h
	mov	R4, 41h
	lcall	label133
	clr	A
	mov	R3, A
	mov	R2, A
	mov	R1, A
	mov	R0, A
	lcall	label137
	jnz	label141
	mov	R7, 40h
	mov	R6, 3Fh
	mov	R5, 3Eh
	mov	R4, 3Dh
	lcall	label145
	mov	40h, R7
	mov	3Fh, R6
	mov	3Eh, R5
	mov	3Dh, R4
label144:
	mov	R7, 40h
	mov	R6, 3Fh
	mov	R5, 3Eh
	mov	R4, 3Dh
	lcall	label146
	mov	R3, 44h
	mov	R2, 43h
	mov	R1, 42h
	mov	R0, 41h
	lcall	label80
	lcall	label147
	mov	44h, R7
	mov	43h, R6
	mov	42h, R5
	mov	41h, R4
	mov	A, 46h
	jnb	0E0h, label143
	lcall	label145
	mov	44h, R7
	mov	43h, R6
	mov	42h, R5
	mov	41h, R4
label143:
	mov	R7, 44h
	mov	R6, 43h
	mov	R5, 42h
	mov	R4, 41h
	ret
	rlc	A
	djnz	R2, label148
	subb	A, R6
	addc	A, 0B1h
	jz	label149
	addc	A, @R1
	mov	R7, #0E5h
	mov	R6, A
	addc	A, R1
	ajmp	label150
	mov	3Ah, R1
	mov	R6, SPCON
	mov	R7, A
	addc	A, R4
	dec	R5
	subb	A, 5Bh
	addc	A, R5
label149:
	xrl	58h, #47h
	addc	A, R6
	mov	CCAP3H, #0F0h
	addc	A, R7
	acall	label151
	dec	R0
	addc	A, R7
	sjmp	label152
label152:
	nop
label154:
	clr	F0
	ljmp	label10
label153:
	ljmp	label5
label155:
	cjne	R5, #80h, label153
label157:
	jnc	label154
	ljmp	label11
label147:
	mov	A, R5
	rlc	A
	mov	A, R4
	rlc	A
	inc	A
	jz	label155
	mov	R3, #3Bh
	mov	R2, #0AAh
	mov	R1, #0B8h
	mov	R0, #3Fh
	lcall	label80
	mov	A, R5
	rlc	A
	mov	A, R4
	rlc	A
	mov	F0, C
	add	A, #7Bh
	jnc	label156
	mov	C, F0
	jnz	label157
	jnc	label156
	mov	A, R5
	orl	A, #80h
	add	A, #4h
	jnc	label156
	mov	C, F0
	sjmp	label157
label156:
	mov	A, R7
	mov	R3, A
	mov	A, R6
	mov	R2, A
	mov	A, R5
	mov	R1, A
	mov	A, R4
	mov	R0, A
	lcall	label113
	mov	A, R7
	mov	DPL, A
	cpl	A
	inc	A
	mov	R4, A
	lcall	label158
	lcall	label83
	push	DPL
	mov	DPTR, #10FAh
	mov	A, #9h
	lcall	label159
	mov	A, R5
	rlc	A
	xch	A, R4
	rlc	A
label150:
	pop	B
	mov	F0, C
	add	A, B
	mov	C, F0
	jnz	label160
	clr	C
label160:
	rrc	A
	xch	A, R4
	rrc	A
	mov	R5, A
	ret
label116:
	mov	3Dh, R3
	mov	3Eh, R2
	mov	3Fh, R1
	clr	A
	mov	40h, A
	mov	A, R5
	dec	A
	mov	41h, A
	mov	40h, A
label178:
	mov	A, 40h
	clr	C
	subb	A, #8h
	jnc	label161
	mov	A, 40h
	cjne	A, #8h, label162
label162:
	jnc	label163
	mov	DPTR, #11B8h
	mov	R0, A
	add	A, R0
	add	A, R0
	jmp	@A+DPTR
	ljmp	label164
	ljmp	label165
	ljmp	label166
	ljmp	label167
	ljmp	label168
	ljmp	label169
	ljmp	label170
	ljmp	label171
label164:
	setb	0A4h
	sjmp	label172
label165:
	setb	0A4h
	sjmp	label173
label166:
	setb	0A4h
	sjmp	label174
label167:
	setb	0A4h
	sjmp	label175
label168:
	clr	0A4h
label172:
	setb	0A3h
	setb	0A2h
	sjmp	label163
label169:
	clr	0A4h
label173:
	setb	0A3h
	clr	0A2h
	sjmp	label163
label170:
	clr	0A4h
label174:
	clr	0A3h
	setb	0A2h
	sjmp	label163
label171:
	clr	0A4h
label175:
	clr	0A3h
	clr	0A2h
label163:
	clr	C
	mov	A, 40h
	subb	A, 41h
	mov	R7, A
	clr	A
	subb	A, #0h
	mov	R3, 3Dh
	mov	R2, 3Eh
	mov	R1, 3Fh
	mov	DPL, R7
	mov	DPH, A
	lcall	label176
	mov	P0, A
	mov	R7, #64h
	mov	R6, #0h
	lcall	label177
	clr	A
	mov	P0, A
	inc	40h
	ljmp	label178
label161:
	ret
label0:	mov	R0, #7Fh
	clr	A
label179:
	mov	@R0, A
	djnz	R0, label179
	mov	SP, #4Ah
	ljmp	label180
label193:
	ljmp	label181
label195:
	clr	A
	movc	A, @A+DPTR
	inc	DPTR
	mov	R0, A
label184:
	clr	A
	movc	A, @A+DPTR
	inc	DPTR
	jc	label182
	mov	@R0, A
	sjmp	label183
label182:
	movx	@R0, A
label183:
	inc	R0
	djnz	R7, label184
	sjmp	label185
label188:
	clr	A
	movc	A, @A+DPTR
	inc	DPTR
	mov	R0, A
	anl	A, #7h
	add	A, #0Ch
	xch	A, R0
	clr	C
	rlc	A
	swap	A
	anl	A, #0Fh
	orl	A, #20h
	xch	A, R0
	movc	A, @A+PC
	jc	label186
	cpl	A
	anl	A, @R0
	sjmp	label187
label186:
	orl	A, @R0
label187:
	mov	@R0, A
	djnz	R7, label188
	sjmp	label185
	ajmp	label189
	inc	A
	inc	R0
	jbc	20h, label190
	sjmp	label163
	rrc	A
	cjne	R4, #0E4h, label191
	ajmp	label192
	jz	label193
	inc	DPTR
	mov	R7, A
	anl	A, #3Fh
	jnb	0E5h, label194
	anl	A, #1Fh
	mov	R6, A
	clr	A
	movc	A, @A+DPTR
	inc	DPTR
	jz	label194
	inc	R6
label194:
	xch	A, R7
	anl	A, #0C0h
	add	A, ACC
	jz	label195
	jc	label188
	clr	A
label199:
	movc	A, @A+DPTR
	inc	DPTR
	mov	R2, A
	clr	A
	movc	A, @A+DPTR
	inc	DPTR
	mov	R0, A
label196:
	clr	A
	movc	A, @A+DPTR
	inc	DPTR
	xch	A, R0
	xch	A, DPL
	xch	A, R0
	xch	A, R2
	xch	A, DPH
	xch	A, R2
	movx	@DPTR, A
	inc	DPTR
	xch	A, R0
	xch	A, DPL
	xch	A, R0
	xch	A, R2
	xch	A, DPH
	xch	A, R2
label190:
	djnz	R7, label196
	djnz	R6, label196
	sjmp	label185
	mov	A, @R1
	mov	A, @R1
	mov	A, @R1
	mov	R7, A
	mov	R7, A
	mov	A, @R1
	mov	A, @R1
	mov	A, @R1
	mov	R6, A
	ajmp	label197
	mov	R6, A
	mov	R6, A
	ajmp	label197
	mov	R6, A
	clr	C
	xch	A, @R0
	xch	A, R4
	mov	R0, A
	mov	R0, A
	xch	A, R4
	xch	A, @R0
	clr	C
	mov	R7, A
	mov	R7, A
	mov	R7, A
	mov	A, @R1
	mov	A, @R1
	mov	A, @R1
	mov	A, @R1
	mov	A, @R1
	mov	R7, A
	mov	R7, A
	dec	R0
	mov	R7, A
	mov	R7, A
	dec	R0
	mov	R7, A
	mov	R7, A
	div	AB
	cjne	R7, #9Fh, label198
	subb	A, R7
	swap	A
	cjne	R7, #84h, label199
	inc	@R1
	clr	A
	mov	R3, A
label202:
	mov	R6, #0h
	mov	A, #80h
	mov	R0, 3h
	inc	R0
	sjmp	label200
label201:
	xch	A, R6
label191:
	mov	C, 0E7h
	rrc	A
	xch	A, R6
	rrc	A
label200:
	djnz	R0, label201
	mov	R7, A
	mov	A, R5
	mov	DPL, A
	mov	A, R7
	anl	A, DPL
	add	A, #0FFh
	mov	T0, C
	setb	WR
	clr	WR
	inc	R3
	cjne	R3, #8h, label202
	setb	T1
	clr	T1
	ret
label97:
	mov	R2, 7h
	mov	R7, 5h
	lcall	label203
	mov	R7, 2h
	mov	R0, 7h
	mov	A, #80h
	inc	R0
	sjmp	label204
label205:
	clr	C
	rrc	A
label204:
	djnz	R0, label205
	cpl	A
	mov	P0, A
	mov	R7, #1h
	mov	R6, #0h
	lcall	label206
	mov	P0, #0FFh
	ret
label213:
	clr	WR
	nop
	clr	A
	mov	R6, A
label207:
	mov	A, R7
	swap	A
	rrc	A
	rrc	A
	rrc	A
	anl	A, #1h
	add	A, #0FFh
	mov	T0, C
	mov	A, R7
	add	A, ACC
	mov	R7, A
	clr	WR
	nop
	setb	WR
	nop
	inc	R6
	cjne	R6, #8h, label207
	ret
label214:
	clr	A
	mov	R7, A
	mov	R6, A
	clr	WR
	nop
	mov	R5, A
label208:
	mov	A, R7
	add	A, ACC
	mov	R7, A
	mov	A, R6
	rlc	A
	mov	R6, A
	setb	WR
	nop
	clr	WR
	nop
	mov	C, RD
	clr	A
	rlc	A
	orl	7h, A
	inc	R5
	cjne	R5, #0Ch, label208
	ret
label212:
	setb	C
	mov	A, R7
	subb	A, #0h
	mov	A, R6
	subb	A, #0h
	jc	label209
	mov	R5, #6Eh
	mov	R4, #0h
label211:
	mov	A, R5
	dec	R5
	jnz	label210
	dec	R4
label210:
	mov	A, R5
	orl	A, R4
	jnz	label211
	mov	A, R7
	dec	R7
	jnz	label212
	dec	R6
	sjmp	label212
label209:
	ret
	clr	A
	mov	R5, A
	mov	R4, A
	clr	WR
	clr	T1
	lcall	label213
	mov	R7, #6h
	djnz	R7, $
	setb	WR
	nop
	clr	WR
	nop
	lcall	label214
	setb	T1
	ret
label206:
	mov	A, R7
	dec	R7
	mov	R4, 6h
	jnz	label215
	dec	R6
label215:
	orl	A, R4
	jz	label216
	mov	R5, #2h
	mov	R4, #0EFh
label217:
	djnz	R4, $
	djnz	R5, label217
	sjmp	label206
label216:
	ret
	acall	label138
	addc	A, R7
	inc	@R0
	anl	A, R3
	orl	A, R7
	xrl	A, @R0
	xrl	A, R5
	mov	R5, #7h
	mov	R7, #6Fh
	mov	@R1, #7Ch
	addc	A, R1
	anl	A, R6
	mov	R1, #71h
	nop
	nop
label219:
	mov	TL0, #0F5h
	mov	TH0, #0FFh
	setb	TR0
	jnb	TF0, $
	clr	TR0
	clr	TF0
	ret
label177:
	mov	A, R7
	dec	R7
	mov	R4, 6h
	jnz	label218
	dec	R6
label218:
	orl	A, R4
	jnz	label177
	ret
label104:
	mov	TMOD, #1h
	clr	TF0
	clr	TR0
	ret
label107:
	setb	T1
	lcall	label219
	clr	T1
	ret
label96:
	clr	WR
	clr	T1
	ret

	END