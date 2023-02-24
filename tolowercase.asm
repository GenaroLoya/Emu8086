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
    
WHILE:
    MOV AH, [BP]
    CMP AH, 61H;COMPARAR QUE SEA MAYOR IGUAL QUE 'a'
    JB MIDDLEWHILE; 
    CMP AH, 7AH;COMPARAR QUE SEA MAYOR IGUAL QUE 'z'
    ;JA LOWERCASE;   
    AND AH, 11011111B;PARA CONVERTIR A MINUSCULAS
    MOV [BP],AH; 
     
MIDDLEWHILE:
    INC BP
    LOOP WHILE;
    MOV AX, 4C00H;
    INT 21H;
    END BEGIN    
    
;LOWERCASE:
    
    