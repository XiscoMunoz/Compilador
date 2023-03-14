	org $1000
START:
	JSR SCREENSIZE
* -->[ASIG, true, null, t1]
	MOVE.W #-1,t1
* -->[ASIG, t1, null, vTrue_0]
	MOVE.W t1,vTrue_0
* -->[ASIG, false, null, t2]
	MOVE.W #0,t2
* -->[ASIG, t2, null, vFalse_0]
	MOVE.W t2,vFalse_0
* -->[ASIG, 100, null, t3]
	MOVE.W #100,t3
* -->[ASIG, t3, null, nMayor_0]
	MOVE.W t3,nMayor_0
* -->[ASIG, -1, null, t4]
	MOVE.W #-1,t4
* -->[ASIG, t4, null, nMenor_0]
	MOVE.W t4,nMenor_0
* -->[MAYORQUE, nMayor_0, nMenor_0, e1]
	MOVE.W nMayor_0,D1
	MOVE.W nMenor_0,D0
	CMP.W D0,D1
	BGT e1
* -->[GOTO, null, null, e2]
	JMP e2
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
* -->[IGUALES, t5, -1, e4]
	MOVE.W t5,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e4
* -->[GOTO, null, null, e5]
	JMP e5
* -->[SKIP, null, null, e4]
e4:
* -->[ASIG, 1, null, t6]
	MOVE.W #1,t6
* -->[OUT, t6, null, null]
	MOVE.W t6,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e5]
e5:
* -->[MENORQUE, nMayor_0, nMenor_0, e6]
	MOVE.W nMayor_0,D1
	MOVE.W nMenor_0,D0
	CMP.W D0,D1
	BLT e6
* -->[GOTO, null, null, e7]
	JMP e7
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
* -->[IGUALES, t7, -1, e9]
	MOVE.W t7,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e9
* -->[GOTO, null, null, e10]
	JMP e10
* -->[SKIP, null, null, e9]
e9:
* -->[ASIG, 2, null, t8]
	MOVE.W #2,t8
* -->[OUT, t8, null, null]
	MOVE.W t8,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e10]
e10:
* -->[NIGUALES, nMayor_0, nMenor_0, e11]
	MOVE.W nMayor_0,D1
	MOVE.W nMenor_0,D0
	CMP.W D0,D1
	BNE e11
* -->[GOTO, null, null, e12]
	JMP e12
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
* -->[IGUALES, t9, -1, e14]
	MOVE.W t9,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e14
* -->[GOTO, null, null, e15]
	JMP e15
* -->[SKIP, null, null, e14]
e14:
* -->[ASIG, 3, null, t10]
	MOVE.W #3,t10
* -->[OUT, t10, null, null]
	MOVE.W t10,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e15]
e15:
* -->[ASIG, 0, null, t11]
	MOVE.W #0,t11
* -->[ASIG, 0, null, t12]
	MOVE.W #0,t12
* -->[IGUALES, t11, t12, e16]
	MOVE.W t11,D1
	MOVE.W t12,D0
	CMP.W D0,D1
	BEQ e16
* -->[GOTO, null, null, e17]
	JMP e17
* -->[SKIP, null, null, e16]
e16:
* -->[ASIG, -1, null, t13]
	MOVE.W #-1,t13
* -->[GOTO, null, null, e18]
	JMP e18
* -->[SKIP, null, null, e17]
e17:
* -->[ASIG, 0, null, t13]
	MOVE.W #0,t13
* -->[SKIP, null, null, e18]
e18:
* -->[IGUALES, t13, -1, e19]
	MOVE.W t13,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e19
* -->[GOTO, null, null, e20]
	JMP e20
* -->[SKIP, null, null, e19]
e19:
* -->[ASIG, 4, null, t14]
	MOVE.W #4,t14
* -->[OUT, t14, null, null]
	MOVE.W t14,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e20]
e20:
* -->[ASIG, 100, null, t15]
	MOVE.W #100,t15
* -->[MAYORIGU, nMayor_0, t15, e21]
	MOVE.W nMayor_0,D1
	MOVE.W t15,D0
	CMP.W D0,D1
	BGE e21
* -->[GOTO, null, null, e22]
	JMP e22
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
* -->[IGUALES, t16, -1, e24]
	MOVE.W t16,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e24
* -->[GOTO, null, null, e25]
	JMP e25
* -->[SKIP, null, null, e24]
e24:
* -->[ASIG, 5, null, t17]
	MOVE.W #5,t17
* -->[OUT, t17, null, null]
	MOVE.W t17,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e25]
e25:
* -->[ASIG, -1, null, t18]
	MOVE.W #-1,t18
* -->[MENORIGU, nMenor_0, t18, e26]
	MOVE.W nMenor_0,D1
	MOVE.W t18,D0
	CMP.W D0,D1
	BLE e26
* -->[GOTO, null, null, e27]
	JMP e27
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
* -->[IGUALES, t19, -1, e29]
	MOVE.W t19,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e29
* -->[GOTO, null, null, e30]
	JMP e30
* -->[SKIP, null, null, e29]
e29:
* -->[ASIG, 6, null, t20]
	MOVE.W #6,t20
* -->[OUT, t20, null, null]
	MOVE.W t20,-(A7)
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
* -->[IGUALES, t21, -1, e34]
	MOVE.W t21,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e34
* -->[GOTO, null, null, e35]
	JMP e35
* -->[SKIP, null, null, e34]
e34:
* -->[ASIG, 7, null, t22]
	MOVE.W #7,t22
* -->[OUT, t22, null, null]
	MOVE.W t22,-(A7)
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
* -->[IGUALES, t23, -1, e39]
	MOVE.W t23,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e39
* -->[GOTO, null, null, e40]
	JMP e40
* -->[SKIP, null, null, e39]
e39:
* -->[ASIG, 8, null, t24]
	MOVE.W #8,t24
* -->[OUT, t24, null, null]
	MOVE.W t24,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e40]
e40:
	SIMHALT
 
vTrue_0: DS.W 1
t1: DS.W 1
vFalse_0: DS.W 1
t2: DS.W 1
	DC.W 0
nMayor_0: DS.W 1
t3: DS.W 1
nMenor_0: DS.W 1
t4: DS.W 1
t5: DS.W 1
	DC.W 0
t6: DS.W 1
t7: DS.W 1
	DC.W 0
t8: DS.W 1
t9: DS.W 1
	DC.W 0
t10: DS.W 1
t11: DS.W 1
t12: DS.W 1
t13: DS.W 1
	DC.W 0
t14: DS.W 1
t15: DS.W 1
t16: DS.W 1
	DC.W 0
t17: DS.W 1
t18: DS.W 1
t19: DS.W 1
	DC.W 0
t20: DS.W 1
t21: DS.W 1
	DC.W 0
t22: DS.W 1
t23: DS.W 1
	DC.W 0
t24: DS.W 1
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
