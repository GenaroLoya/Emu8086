name "mi primer programa"   ; nombre del programa

org  100h	; indicando el direccionamiento de inicio es a partir de la 100h

;segmento de codigo

mov ax,1234h ;cargar en el registro ax un 1234
mov bx,9999h ;cargar en el registro bx un 9999
mov bl,ah    ;Mover la parte alta de ax a la parte baja de bx
mov al,bh    ;mover la parte alta de bx a la parte baja de ax
mov ax,4c00h 
int 20h      ;terminar y restaurar el programa






