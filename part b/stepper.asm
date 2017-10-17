.MODEL SMALL
.STACK 5000
.DATA

CR EQU ODOA3H
PA EQU ODOA0H
PB EQU ODOA1H
PC EQU ODOA2H
MESSAGE1 DB 'DEMOSTRATION PROGRAM FOR STEPPER MOTOR',13,10,'$'
MESSAGE2 DB 10,13,'THE PROGRAM IS RUNNING...',13,10,'$'

.CODE
MOV AX,@DATA
MOV DS,AX
MOV AH,9H
MOV DX,OFFSET MESSAGE2
INT 21H
MOV BX,200H

AGAIN:MOV DX,CR
      MOV AL,80H
      OUT DX,AL
NEXT:MOV DX,CR
     CALL OUT_A
     CALL DELAY

MOV AL,22H
CALL OUT_A
CALL DELAY

MOV AL,44H
CALL OUT_A
CALL DELAY

MOV AL,88H
CALL OUT_A
CALL DELAY

DEC BX
JNZ NEXT

JMP AGAIN

MOV AH,04CH
INT 21H

OUT_A PROC NEAR
MOV DX,PA
OUT DX,AL
RET
OUT_A ENDP

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
DELAY ENDPS

END