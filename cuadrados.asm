.model small
.code
  org 100h
  begin: jmp main;salta despues de los datos

arr db 1,?,2,?,3,?,4,?,5,?,6
cycle db 6
  
main:  
    proc near
    mov cl, cycle
    lea si, arr
    lea di, arr
    inc di
    ;mov bx, 0
   
while:
    push cx
    inc al
    mov cl, [si] 
    mov bx, 1 
    mov dx, 0
      
    while_in:
        add dl, bl  
        add bl, 2h         
      
    end_while_in:
        loop while_in
        mov [di], dl
        pop cx
        add si, 2
        add di, 2

end_while:
    loop while
    
endss:; finalizacion del propgrama
    mov ax, 4C00H;
    int 21H;
    end begin     