.MODEL SMALL
.STACK 5000
.DATA

CR EQU ODOA3H
PA EQU ODOA0H
PB EQU ODOA1H
PC EQU ODOA2H
MSG1 DB 10,13,"ENTER X:$"
MSG2 DB 10,13,"ENTER Y:$"

.CODE
MOV AX,@DATA
MOV DS,AX
MOV DX,PC
MOV AL,82H
OUT DX AL
MOV DX,OFFSET MSG1
MOV AH,09H
INT 21H

MOV DX,PB
IN AL,DX
MOV BL,AL
CALL DELAY
MOV DX,OFFSET MSG2
MOV AH,09H
INT 21H

MOV DX,PB
IN AL,DX

MUL BL
MOV DX,PA
OUT DX,AL
CALL DELAY
CALL DELAY
MOV AL,AH
OUT DX,AL
MOV AH,04CH
INT 21H

DELAY:MOV SI,0FFFFH
RET2:MOV DI,0FFFFH
RET1:DEC DI
     JNZ RET1
     DEC SI
     JNZ RET2
     RET
END