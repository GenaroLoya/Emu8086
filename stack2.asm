section .data
  ; arreglo de enteros
  arreglo dd 4, 5, 1, 7, 3, 9, 2, 6

section .text
global _start

_start:
  ; inicializar los registros
  mov eax, dword [arreglo]  ; cargar el primer elemento en el registro que almacena el valor máximo
  mov ebx, eax             ; copiar el valor máximo al registro que almacena el valor actual

  ; recorrer el arreglo
  mov ecx, 1               ; inicializar el contador en 1
  mov edx, 8               ; tamaño del arreglo
  cmp edx, ecx             ; comparar el tamaño del arreglo con el contador
  jle fin                  ; si ya se han recorrido todos los elementos, saltar a fin

  inicio:
    mov eax, dword [arreglo + ecx*4]  ; cargar el valor actual del arreglo en el registro eax
    cmp eax, ebx                      ; comparar el valor actual del arreglo con el valor máximo
    jle siguiente                     ; si el valor actual no es mayor, saltar a siguiente
    mov ebx, eax                      ; actualizar el valor máximo con el valor actual
    siguiente:
      inc ecx                         ; incrementar el contador
      cmp edx, ecx                     ; comparar el tamaño del arreglo con el contador
      jg inicio                        ; si todavía quedan elementos por recorrer, saltar a inicio

  fin:
    ; el valor máximo se encuentra en el registro ebx
    ; hacer algo con el valor máximo, como imprimirlo en pantalla
    ; terminar el programa
    mov eax, 1
    xor ebx, ebx
    int 0x80
