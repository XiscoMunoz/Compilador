	org $1000
START:
	JSR SCREENSIZE
* -->[ASIG, true, null, vTrue_0]
	MOVE.W #-1,vTrue_0
* -->[ASIG, false, null, vFalse_0]
	MOVE.W #0,vFalse_0
* -->[ASIG, 100, null, nMayor_0]
	MOVE.W #100,nMayor_0
* -->[ASIG, -1, null, nMenor_0]
	MOVE.W #-1,nMenor_0
* -->[MENORIGU, nMayor_0, nMenor_0, e2]
	MOVE.W nMayor_0,D1
	MOVE.W nMenor_0,D0
	CMP.W D0,D1
	BLE e2
* -->[SKIP, null, null, e1]
e1:
* -->[ASIG, -1, null, t5]
	MOVE.W #-1,t5
* -->[GOTO, null, null, e3]
	JMP e3
* -->[SKIP, null, null, e2]
e2:
* -->[ASIG, 0, null, t5]
	MOVE.W #0,t5
* -->[SKIP, null, null, e3]
e3:
* -->[NIGUALES, t5, -1, e5]
	MOVE.W t5,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BNE e5
* -->[SKIP, null, null, e4]
e4:
* -->[OUT, 1, null, null]
	MOVE.W #1,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e5]
e5:
* -->[MAYORIGU, nMayor_0, nMenor_0, e7]
	MOVE.W nMayor_0,D1
	MOVE.W nMenor_0,D0
	CMP.W D0,D1
	BGE e7
* -->[SKIP, null, null, e6]
e6:
* -->[ASIG, -1, null, t7]
	MOVE.W #-1,t7
* -->[GOTO, null, null, e8]
	JMP e8
* -->[SKIP, null, null, e7]
e7:
* -->[ASIG, 0, null, t7]
	MOVE.W #0,t7
* -->[SKIP, null, null, e8]
e8:
* -->[NIGUALES, t7, -1, e10]
	MOVE.W t7,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BNE e10
* -->[SKIP, null, null, e9]
e9:
* -->[OUT, 2, null, null]
	MOVE.W #2,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e10]
e10:
* -->[IGUALES, nMayor_0, nMenor_0, e12]
	MOVE.W nMayor_0,D1
	MOVE.W nMenor_0,D0
	CMP.W D0,D1
	BEQ e12
* -->[SKIP, null, null, e11]
e11:
* -->[ASIG, -1, null, t9]
	MOVE.W #-1,t9
* -->[GOTO, null, null, e13]
	JMP e13
* -->[SKIP, null, null, e12]
e12:
* -->[ASIG, 0, null, t9]
	MOVE.W #0,t9
* -->[SKIP, null, null, e13]
e13:
* -->[NIGUALES, t9, -1, e15]
	MOVE.W t9,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BNE e15
* -->[SKIP, null, null, e14]
e14:
* -->[OUT, 3, null, null]
	MOVE.W #3,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e15]
e15:
* -->[SKIP, null, null, e16]
e16:
* -->[ASIG, -1, null, t13]
	MOVE.W #-1,t13
* -->[GOTO, null, null, e18]
	JMP e18
* -->[SKIP, null, null, e18]
e18:
* -->[NIGUALES, t13, -1, e20]
	MOVE.W t13,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BNE e20
* -->[SKIP, null, null, e19]
e19:
* -->[OUT, 4, null, null]
	MOVE.W #4,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e20]
e20:
* -->[MENORQUE, nMayor_0, 100, e22]
	MOVE.W nMayor_0,D1
	MOVE.W #100,D0
	CMP.W D0,D1
	BLT e22
* -->[SKIP, null, null, e21]
e21:
* -->[ASIG, -1, null, t16]
	MOVE.W #-1,t16
* -->[GOTO, null, null, e23]
	JMP e23
* -->[SKIP, null, null, e22]
e22:
* -->[ASIG, 0, null, t16]
	MOVE.W #0,t16
* -->[SKIP, null, null, e23]
e23:
* -->[NIGUALES, t16, -1, e25]
	MOVE.W t16,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BNE e25
* -->[SKIP, null, null, e24]
e24:
* -->[OUT, 5, null, null]
	MOVE.W #5,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e25]
e25:
* -->[MAYORQUE, nMenor_0, -1, e27]
	MOVE.W nMenor_0,D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BGT e27
* -->[SKIP, null, null, e26]
e26:
* -->[ASIG, -1, null, t19]
	MOVE.W #-1,t19
* -->[GOTO, null, null, e28]
	JMP e28
* -->[SKIP, null, null, e27]
e27:
* -->[ASIG, 0, null, t19]
	MOVE.W #0,t19
* -->[SKIP, null, null, e28]
e28:
* -->[NIGUALES, t19, -1, e30]
	MOVE.W t19,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BNE e30
* -->[SKIP, null, null, e29]
e29:
* -->[OUT, 6, null, null]
	MOVE.W #6,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e30]
e30:
* -->[OR, vTrue_0, vFalse_0, e31]
	MOVE.W vTrue_0,D0
	MOVE.W vFalse_0,D1
	OR.W D0,D1
	BMI e31
* -->[GOTO, null, null, e32]
	JMP e32
* -->[SKIP, null, null, e31]
e31:
* -->[ASIG, -1, null, t21]
	MOVE.W #-1,t21
* -->[GOTO, null, null, e33]
	JMP e33
* -->[SKIP, null, null, e32]
e32:
* -->[ASIG, 0, null, t21]
	MOVE.W #0,t21
* -->[SKIP, null, null, e33]
e33:
* -->[NIGUALES, t21, -1, e35]
	MOVE.W t21,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BNE e35
* -->[SKIP, null, null, e34]
e34:
* -->[OUT, 7, null, null]
	MOVE.W #7,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e35]
e35:
* -->[AND, vTrue_0, vFalse_0, e36]
	MOVE.W vTrue_0,D0
	MOVE.W vFalse_0,D1
	AND.W D0,D1
	BMI e36
* -->[GOTO, null, null, e37]
	JMP e37
* -->[SKIP, null, null, e36]
e36:
* -->[ASIG, -1, null, t23]
	MOVE.W #-1,t23
* -->[GOTO, null, null, e38]
	JMP e38
* -->[SKIP, null, null, e37]
e37:
* -->[ASIG, 0, null, t23]
	MOVE.W #0,t23
* -->[SKIP, null, null, e38]
e38:
* -->[NIGUALES, t23, -1, e40]
	MOVE.W t23,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BNE e40
* -->[SKIP, null, null, e39]
e39:
* -->[OUT, 8, null, null]
	MOVE.W #8,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e40]
e40:
	SIMHALT
 
vTrue_0: DS.W 1
vFalse_0: DS.W 1
	DC.W 0
nMayor_0: DS.W 1
nMenor_0: DS.W 1
t5: DS.W 1
t7: DS.W 1
t9: DS.W 1
t13: DS.W 1
t16: DS.W 1
t19: DS.W 1
t21: DS.W 1
t23: DS.W 1
	DC.W 0
 
SCREENSIZE:
	MOVE.L #1024*$10000+768,D1
	MOVE.W  #33,D0
	TRAP    #15
	RTS
ISUMA:
	BTST.L #15,D0
	BEQ ADD2
	NOT.W D0
	ADDQ.W #1,D0
	BTST.L #15,D1
	BEQ ADD1
	NOT.W D1
	ADDQ.W #1,D1
	ADD.W D0,D1
	NOT.W D1
	ADDQ.W #1,D1
	RTS
ADD1:
	SUB.W D0,D1
	RTS
ADD2:
	BTST.L #15,D1
	BEQ ADD3
	NOT.W D1
	ADDQ.W #1,D1
	SUB.W D1,D0
	MOVE.W  D0,D1
	RTS
ADD3:
	ADD.W D0,D1
	RTS
IRESTA:
	BTST.L #15,D1
	BEQ SUB2
	NOT.W D1
	ADDQ.W #1,D1
	BTST.L #15,D0
	BEQ SUB1
	NOT.W D0
	ADDQ.W #1,D0
	SUB.W D0,D1
	NOT.W D1
	ADDQ.W #1,D1
	RTS
SUB1:
	ADD.W D0,D1
	NOT.W D1
	ADDQ.W #1,D1
	RTS
SUB2:
	BTST.L #15,D0
	BEQ SUB3
	NOT.W D0
	ADDQ.W #1,D0
	ADD.W D0,D1
	RTS
SUB3:
	SUB.W D0,D1
	RTS
PRINTINT:
	MOVE.W 4(A7),D1
	EXT.L D1
	MOVE.L #3,D0
	TRAP #15
	MOVE.L #11,D0
	MOVE.W #$00FF,D1
	TRAP #15
	ADD.W #1,D1
	AND.W #$00FF,D1
	TRAP #15
	RTS
GETINT:
	MOVE.L #4,D0
	TRAP #15
	MOVE.W D1,4(A7)
	RTS
	END START
