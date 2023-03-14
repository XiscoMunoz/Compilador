	org $1000
START:
	JSR SCREENSIZE
* -->[GOTO, null, null, run]
	JMP run
* -->[SKIP, null, null, factorial]
factorial:
* -->[PMB, null, null, factorial]
	MOVE.W 6(A7),n_1
* -->[ASIG, 1, null, t3]
	MOVE.W #1,t3
* -->[ASIG, t3, null, fact_1]
	MOVE.W t3,fact_1
* -->[ASIG, n_1, null, i_1]
	MOVE.W n_1,i_1
* -->[SKIP, null, null, e1]
e1:
* -->[ASIG, 1, null, t4]
	MOVE.W #1,t4
* -->[MAYORIGU, i_1, t4, e2]
	MOVE.W i_1,D1
	MOVE.W t4,D0
	CMP.W D0,D1
	BGE e2
* -->[GOTO, null, null, e3]
	JMP e3
* -->[SKIP, null, null, e2]
e2:
* -->[ASIG, -1, null, t5]
	MOVE.W #-1,t5
* -->[GOTO, null, null, e4]
	JMP e4
* -->[SKIP, null, null, e3]
e3:
* -->[ASIG, 0, null, t5]
	MOVE.W #0,t5
* -->[SKIP, null, null, e4]
e4:
* -->[IGUALES, t5, -1, e5]
	MOVE.W t5,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e5
* -->[GOTO, null, null, e6]
	JMP e6
* -->[SKIP, null, null, e5]
e5:
* -->[MULT, fact_1, i_1, t6]
	MOVE.W fact_1,D0
	EXT.L D0
	MOVE.W i_1,D1
	EXT.L D1
	MULS.W D0,D1
	MOVE.W D1,t6
* -->[ASIG, t6, null, fact_1]
	MOVE.W t6,fact_1
* -->[ASIG, 1, null, t7]
	MOVE.W #1,t7
* -->[RESTA, i_1, t7, t8]
	MOVE.W i_1,D1
	MOVE.W t7,D0
	JSR IRESTA
	MOVE.W D1,t8
* -->[ASIG, t8, null, i_1]
	MOVE.W t8,i_1
* -->[GOTO, null, null, e1]
	JMP e1
* -->[SKIP, null, null, e6]
e6:
* -->[RTN, null, null, fact_1]
	MOVE.W fact_1,4(A7)
	RTS
* -->[RTN, null, null, null]
	RTS
* -->[SKIP, null, null, run]
run:
* -->[ASIG, 1006, null, t1]
	MOVE.W #1006,t1
* -->[ASIG, t1, null, T$Tglobal_0$0_0]
	MOVE.W t1,T$Tglobal_0$0_0
* -->[ASIG, 1, null, t2]
	MOVE.W #1,t2
* -->[ASIG, t2, null, N_0]
	MOVE.W t2,N_0
* -->[ASIG, N_0, null, f_0]
	MOVE.W N_0,f_0
* -->[PARAM, null, null, f_0]
	MOVE.W f_0,-(A7)
* -->[CALL, t9, null, factorial]
	SUBA.L #2,A7
	JSR factorial
	MOVE.W (A7)+,t9
	ADDA.L #2,A7
* -->[ASIG, t9, null, fact_0]
	MOVE.W t9,fact_0
* -->[SKIP, null, null, e7]
e7:
* -->[MENORQUE, fact_0, T$Tglobal_0$0_0, e8]
	MOVE.W fact_0,D1
	MOVE.W T$Tglobal_0$0_0,D0
	CMP.W D0,D1
	BLT e8
* -->[GOTO, null, null, e9]
	JMP e9
* -->[SKIP, null, null, e8]
e8:
* -->[ASIG, -1, null, t10]
	MOVE.W #-1,t10
* -->[GOTO, null, null, e10]
	JMP e10
* -->[SKIP, null, null, e9]
e9:
* -->[ASIG, 0, null, t10]
	MOVE.W #0,t10
* -->[SKIP, null, null, e10]
e10:
* -->[IGUALES, t10, -1, e11]
	MOVE.W t10,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e11
* -->[GOTO, null, null, e12]
	JMP e12
* -->[SKIP, null, null, e11]
e11:
* -->[SUMA, f_0, N_0, t11]
	MOVE.W f_0,D0
	MOVE.W N_0,D1
	JSR ISUMA
	MOVE.W D1,t11
* -->[ASIG, t11, null, f_0]
	MOVE.W t11,f_0
* -->[PARAM, null, null, f_0]
	MOVE.W f_0,-(A7)
* -->[CALL, t12, null, factorial]
	SUBA.L #2,A7
	JSR factorial
	MOVE.W (A7)+,t12
	ADDA.L #2,A7
* -->[ASIG, t12, null, fact_0]
	MOVE.W t12,fact_0
* -->[GOTO, null, null, e7]
	JMP e7
* -->[SKIP, null, null, e12]
e12:
* -->[ASIG, f_0, null, T$Tglobal_0$1_0]
	MOVE.W f_0,T$Tglobal_0$1_0
* -->[IN, null, null, t13]
	SUBA.L #2,A7
	JSR GETINT
	MOVE.W (A7)+,t13
* -->[ASIG, t13, null, nUsuario_0]
	MOVE.W t13,nUsuario_0
* -->[SKIP, null, null, e13]
e13:
* -->[NIGUALES, nUsuario_0, T$Tglobal_0$1_0, e14]
	MOVE.W nUsuario_0,D1
	MOVE.W T$Tglobal_0$1_0,D0
	CMP.W D0,D1
	BNE e14
* -->[GOTO, null, null, e15]
	JMP e15
* -->[SKIP, null, null, e14]
e14:
* -->[ASIG, -1, null, t14]
	MOVE.W #-1,t14
* -->[GOTO, null, null, e16]
	JMP e16
* -->[SKIP, null, null, e15]
e15:
* -->[ASIG, 0, null, t14]
	MOVE.W #0,t14
* -->[SKIP, null, null, e16]
e16:
* -->[IGUALES, t14, -1, e17]
	MOVE.W t14,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e17
* -->[GOTO, null, null, e18]
	JMP e18
* -->[SKIP, null, null, e17]
e17:
* -->[MENORQUE, nUsuario_0, T$Tglobal_0$1_0, e19]
	MOVE.W nUsuario_0,D1
	MOVE.W T$Tglobal_0$1_0,D0
	CMP.W D0,D1
	BLT e19
* -->[GOTO, null, null, e20]
	JMP e20
* -->[SKIP, null, null, e19]
e19:
* -->[ASIG, -1, null, t15]
	MOVE.W #-1,t15
* -->[GOTO, null, null, e21]
	JMP e21
* -->[SKIP, null, null, e20]
e20:
* -->[ASIG, 0, null, t15]
	MOVE.W #0,t15
* -->[SKIP, null, null, e21]
e21:
* -->[IGUALES, t15, -1, e22]
	MOVE.W t15,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e22
* -->[GOTO, null, null, e23]
	JMP e23
* -->[SKIP, null, null, e22]
e22:
* -->[ASIG, -1, null, t16]
	MOVE.W #-1,t16
* -->[OUT, t16, null, null]
	MOVE.W t16,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e23]
e23:
* -->[MAYORQUE, nUsuario_0, T$Tglobal_0$1_0, e24]
	MOVE.W nUsuario_0,D1
	MOVE.W T$Tglobal_0$1_0,D0
	CMP.W D0,D1
	BGT e24
* -->[GOTO, null, null, e25]
	JMP e25
* -->[SKIP, null, null, e24]
e24:
* -->[ASIG, -1, null, t17]
	MOVE.W #-1,t17
* -->[GOTO, null, null, e26]
	JMP e26
* -->[SKIP, null, null, e25]
e25:
* -->[ASIG, 0, null, t17]
	MOVE.W #0,t17
* -->[SKIP, null, null, e26]
e26:
* -->[IGUALES, t17, -1, e27]
	MOVE.W t17,D1
	EXT.W D1
	MOVE.W #-1,D0
	CMP.W D0,D1
	BEQ e27
* -->[GOTO, null, null, e28]
	JMP e28
* -->[SKIP, null, null, e27]
e27:
* -->[ASIG, 0, null, t18]
	MOVE.W #0,t18
* -->[OUT, t18, null, null]
	MOVE.W t18,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
* -->[SKIP, null, null, e28]
e28:
* -->[IN, null, null, t19]
	SUBA.L #2,A7
	JSR GETINT
	MOVE.W (A7)+,t19
* -->[ASIG, t19, null, nUsuario_0]
	MOVE.W t19,nUsuario_0
* -->[GOTO, null, null, e13]
	JMP e13
* -->[SKIP, null, null, e18]
e18:
* -->[ASIG, 1, null, t20]
	MOVE.W #1,t20
* -->[OUT, t20, null, null]
	MOVE.W t20,-(A7)
	JSR PRINTINT
	ADDA.L #2,A7
	SIMHALT
 
Tglobal_0: DS.W 1
	DC.W 0
T$Tglobal_0$1_0: DS.W 1
T$Tglobal_0$0_0: DS.W 1
t1: DS.W 1
N_0: DS.W 1
t2: DS.W 1
n_1: DS.W 1
fact_1: DS.W 1
t3: DS.W 1
i_1: DS.W 1
t4: DS.W 1
t5: DS.W 1
	DC.W 0
t6: DS.W 1
t7: DS.W 1
t8: DS.W 1
f_0: DS.W 1
fact_0: DS.W 1
t9: DS.W 1
t10: DS.W 1
	DC.W 0
t11: DS.W 1
t12: DS.W 1
nUsuario_0: DS.W 1
t13: DS.W 1
t14: DS.W 1
t15: DS.W 1
	DC.W 0
t16: DS.W 1
t17: DS.W 1
	DC.W 0
t18: DS.W 1
t19: DS.W 1
t20: DS.W 1
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
