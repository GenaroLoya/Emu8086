.model small
.code
  org 100h
  begin: jmp main;salta despues de los datos

arr db 1,?,2,?,3,?,4,?,5,?,6
  
main:  
    proc near
    lea si, arr
    lea di, arr
    inc di
    ;mov bx, 0
   
while:
    push cx
    inc al
      
    while_in:
                
      
    end_while_in:
        loop while_in
        pop cx

end_while:
    loop while
    
endss:; finalizacion del propgrama
    mov ax, 4C00H;
    int 21H;
    end begin     