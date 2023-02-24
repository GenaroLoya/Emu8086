    PAGE    60,132
    TITLE   "SUMA" 
;---------------------------------------------------------------------------------
    .model  small
    .code
    org 100h;direccionamiento de inicio
BEGIN: JMP MAIN;salta despues de los datos
;---------------------------------------------------------------------------------
STRING DB 'hello world';Definir cadena

MAIN:
    PROC NEAR
    LEA BP,STRING;apunta al primer caracter
    MOV CX, 18;inicia ciclo con 18
    