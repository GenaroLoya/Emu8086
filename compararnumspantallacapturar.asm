.model small
.stack
.data
    buffer dw DB 2 DUP(' '),'$' 
    ;buffer db '14', '$'
    number dw 00h
    compare dw 15  
    aboveVar db 'Mayor', '$'
    belowVar db 'Menor', '$'
.code

;MAIN-process

main:
    mov ax, @data 
    mov ds, ax
    call read
    call convertToDec
    push number
    push compare
    call above 

endss:    
    mov ax,4c00h            
    int 21h                 

;SUB-process
    
above proc ;Procedimiento para comparar dos numeros 
    push bp 
    mov bp, sp ; en sp esta la direccion del ultimo elemento apilado
    mov ax, ss:[bp+6] ;acceso a n1
    mov bx, ss:[bp+4] ;acceso a n2
    
    pop bp
    
    cmp ax, bx
    ja mr_aboveBX
    mov AH,09H
    lea DX, belowVar
    int 21H
  
    ret

mr_aboveBX:
    mov AH,09H
    lea DX,aboveVar
    int 21H
    ret       

above endp

read proc ;Procedimeinto para leer una entrada en consola
    push cx
    push bx
    mov cx,2h
    xor bx,bx
    
newChar:  
    mov ah,01h
    int 21h
    cmp al,0dh
    je endRead
    mov buffer [bx],al
    inc bx 
    loop newChar

endRead:
    pop bx
    pop cx  
    ret
    
read endp 

convertTodec proc ;Proceso para convertir a hexadecimal
    push cx 
    push bx
    mov cx,2h
    lea di, buffer 
    lea si, number
    add di, 1
       
checkChars:
    cmp [di], 30h
    jb endss
    cmp [di] ,39h
    ja endss
       
sumBase:
    mov dx, 1 ; inicializa el registro ax a cero
    mov ax, 10
    while_char:
        mov bl, [di] ; mueve el byte actual de la cadena al registro bl
        dec di
        push ax
        mov ax, dx
        sub bl, '0' ; convierte el carácter ASCII en un número decimal 
        mul bl
        mov bx, ax
        pop ax
        push ax
        mul dx
        mov dx, ax
        pop ax
        add [si], bx
        loop while_char ; repite el ciclo para el siguiente byte
    
;Aqui falta checar los numeros y correrlos hacia el final del buffer si son 3 cifras o menos
        
endConvert: 
    pop bx
    pop cx 
    ret          
    
convertToDec endp
    
    
    

