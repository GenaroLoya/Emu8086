name "instrucciones suma"  ; nombre del programa

org  100h	; indicando el direccionamiento de inicio es a partir de la 100h

;segmento de codigo
mov ax,10  ;cargar el registro ax con un 10 
mov dx,00f9h
inc dx       ;incrementar 00f9h
add bx,dx   ;sumar lo que hay en bx con f9+1 
add bx,ax   ;sumar lo que hay con un 10
add ax,0004h ;sumar al 10 un 4
mov cx,0045    ;cargar cx con un 45 
sub cx,cx    ;dejar cx con 0




mov ax,4c00h 
int 20h      ;terminar y restaurar el programa



