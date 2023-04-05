.model small
.stack
.data
    n1 dw 5000h
    n2 dw 4890h
.code

;MAIN-process

main:
    mov ax, @data 
    mov ds, ax
    push n1
    push n2
    call above

endss:    
    mov ax,4c00h            
    int 21h                 

;SUB-process
    
above proc 
    push bp 
    mov bp, sp ; en sp esta la direccion del ultimo elemento apilado
    mov ax, ss:[bp+6] ;acceso a n1
    mov bx, ss:[bp+4] ;acceso a n2
    
    pop bp
    
    cmp ax, bx
    jg mr_aboveBX
  
    ret

mr_aboveBX:
    mov ax, bx
    ret
    
above endp