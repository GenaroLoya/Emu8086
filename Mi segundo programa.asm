        PAGE        60.132 
        TITLE       "Comparando"
;-----------------------------------------------     
        .model      small
        .code
        org 100h    ;Direccionamiento de inicio
Begin: JMP MAIN     ;SALTA PASANDO el segmento de DATOS
;----------------------------------------------

i    DW  0000;CONTADOR
lim    DW  0009;LIMITE
num    DW  0005;
res    DW  0000;
;----------------------------------------------
MAIN:   PROC NEAR
        MOV AX,i
        MOV BX,lim
        MOV CX,num
        MOV DX, res
        CMP AX,BX   ;Compara ax con bx
        JMP WHILE;                  
;----------------------------------------------        
WHILE:  
    INC AX
    ADD DX,CX
    CMP AX,BX   ;Compara ax con bx
    JLE WHILE 
         
;----------------------------------------------        
TERMINA: MOV AX,4C00H
         INT 21H 
         END BEGIN       