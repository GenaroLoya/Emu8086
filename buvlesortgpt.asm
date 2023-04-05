.model small
.stack 100h

.data
    array dw 5, 2, 1, 3, 4     ; Array a ordenar
    n     dw 5                ; Longitud del array

.code
    mov ax, @data
    mov ds, ax

    ; Inicio del algoritmo Bubble Sort
    mov bx, 0                ; bx apunta al primer elemento del array
outer_loop:
    cmp bx, n                ; Compara bx con la longitud del array
    jge end_sort             ; Si bx >= n, termina el algoritmo
    mov si, bx               ; si apunta al primer elemento del array
inner_loop:
    cmp si, n                ; Compara si con la longitud del array
    jge next_iteration       ; Si si >= n, pasa a la siguiente iteración
    mov ax, [array + si]     ; Carga el elemento actual en ax
    cmp ax, [array + si + 2] ; Compara con el siguiente elemento
    jle no_swap              ; Si ax <= [array+si+2], no hace nada
    xchg ax, [array + si + 2]; Intercambia los elementos
    mov [array + si], ax     ; Guarda el valor actual en el elemento anterior
no_swap:
    add si, 2                ; Avanza al siguiente elemento
    jmp inner_loop           ; Vuelve al inicio del bucle interno
next_iteration:
    add bx, 2                ; Avanza al siguiente elemento
    jmp outer_loop           ; Vuelve al inicio del bucle externo
end_sort:

    ; Imprime el array ordenado
    mov ah, 9                ; Función para imprimir una cadena de caracteres
    lea dx, [array]          ; Carga la dirección del primer elemento en dx
print_loop:
    cmp bx, n                ; Compara bx con la longitud del array
    jge exit_program         ; Si bx >= n, termina el programa
    mov ax, [dx + bx]        ; Carga el elemento actual en ax
    add ax, 30h              ; Convierte el valor en un carácter ASCII
    mov dl, al               ; Carga el carácter en dl
    int 21h                  ; Imprime el carácter en pantalla
    add bx, 2                ; Avanza al siguiente elemento
    jmp print_loop           ; Vuelve al inicio del bucle de impresión
exit_program:
    mov ah, 4ch              ; Función para terminar el programa
    int 21h
end
