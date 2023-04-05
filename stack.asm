.model small
.code
  org 100h
  begin: jmp main;salta despues de los datos

arr db 13h,12h,10h,47h,55h,66h,77h,88h,98h,11h; declaracion del arreglo de numeros
cycle dw 10 ; declaracion de los cilos que seguira el loop
max dw ?; reserva de memoria para el maximo
min dw ?; reserva de memoria para el minimo  
  
  main:  
    proc near
    mov cx, cycle; asignacion al contador del ciclo 
    lea si, arr; leer la direccion en memoria del del inicio del arreglo 
    mov bl, [si]; asingnacion de bx para el minimo 
    mov dl, [si]; asingnacion de bx para el maximo
    jmp while
     
  while:
    mov al, [si]; asignacion de la posicion del arreglo
    add si, 1;Suma de si para apuntar a la siguiente posicion 
    cmp al, bl; comparacion para entender si es minimo
    jb min_set; salto al procedimiento de establecer el minimo
    cmp al, dl; comparacion para entender si es maximo 
    ja max_set; salto al procedimiento de establecer el minimo
    jmp end_while; salto para cuando el valor comparado y el actual son iguales
      
  min_set:
    mov bl, al; asingnacion de bx para actualizar el minimo
    lea bp, min; direccion en memoria para el minimo
    mov [bp], bl; asignacion del valor del minimo
    jmp end_while; salto para la comprobacion del final del ciclo 
      
  max_set:
    mov dl, al; asingnacion de bx para actualizar el maximo
    lea bp, max; direccion en memoria para el maximo
    mov [bp], dl; asignacion del valor del maximo
    jmp end_while; salto para la comprobacion del final del ciclo
    
  end_while:
    loop while; comprobacion del final del ciclo
    
  endss:; finalizacion del propgrama
    mov ax, 4C00H;
    int 21H;
    end begin 
    
    
   





