.MODEL SMALL
.STACK 5000
.DATA

MESSAGE2 DB 'PROGRAM IS RUNNING.OBSERVE THE O/P WAVEFORM(SQAURE) ON CRO.',13,10,'$'

CR EQU ODOA3H
PA EQU ODOA0H
PB EQU ODOA1H
PC EQU ODOA2H

.CODE
MOV AX,@DATA
MOV DS,AX
MOV DX,OFFSET MESSAGE2
MOV AH,9H
INT 21H

AGAIN:
	MOV AL,80H
	MOV DX,CR
	OUT DX,AL
	
	MOV AL,00H
	MOV DX,PA
	OUT DX,AL
	MOV DX,AL
	OUT DX,AL
	CALL DELAY

	MOV AL,0FFH
	MOV DX,PA
	OUT DX,AL
	MOV DX,PB
	OUT DX,AL
	CALL DELAY

	JMP AGAIN
	MOV AH,4CH
	INT 21H
DELAY PROC NEAR
PUSH CX
PUSH AX
MOV CX,1FFFH
D2:MOV AX,05FFH
D1:DEC AX
JNZ D1
LOOP D2
POP AX
POP CX
RET
DELAY ENDP
END