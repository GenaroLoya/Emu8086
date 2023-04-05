.MODEL SMALL
            .CODE
            ORG 100H
;-----------------------------------------
BEGIN:      JMP MAIN                     
;-----------------------------------------
            PR DW ?            

MAIN:       PROC NEAR
            MOV AH,01H
            INT 21H
            CMP AL,"S"
            JE FUE_S
            CMP AL,"N"
            JE FUE_N
            JMP TERMINA

FUE_S:      MOV PR,5555H
            JMP TERMINA
            
FUE_N:      MOV PR,6666H
            JMP
            
TERMINA:    INT 20H
            ENDP
            END BEGIN   