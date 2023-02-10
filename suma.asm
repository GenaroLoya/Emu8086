    PAGE    60,132
    TITLE   "SUMA" 
;---------------------------------------------------------------------------------
    .model  small
    .code
    org 100h    ;direccionamiento de inicio
BEGIN: JMP MAIN ;salta despues de los datos
;---------------------------------------------------------------------------------
DATO1 DW 0250   ;Definir el dato 1
DATO2 DW 0125   ;Definir el dato 2
DATO3 DB ?      ;Reservar espacio para el resultado de la suma entre dato1 y dato2    
;---------------------------------------------------------------------------------
MAIN: proc near
      mov ax,DATO1 ;cargar el dato1 en AX
      add ax,DATO2 ;Sumar en ax lo que tiene DATO2
      mov DATO3,ax ;cargar en dato3 el resultado de la suma
      mov ax,4c00h ;peticion del dos
      int 21h      ;terminar el programa
      ;MAIN ENDP
      end BEGIN




