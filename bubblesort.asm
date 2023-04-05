	.model small
	.code
	  org 100h
	  begin: jmp main;salta despues de los datos

	arr db 33h,25h,41h,64h,69h,58h ; declaracion del arraglo
	cycle db 6h; medida del arreglo
	dir_end_loop db 5h; medida del arreglo-1 para obtener la posicion final
	final_element db 58h ;indica el elemento final 
	  
	main:  
		proc near;  
		mov cl, cycle;
		lea si, arr;
	   
	while:
		mov ah, final_element;
		cmp [si], ah; 

		continue:
			push cx
			mov di, si
			mov cl, cycle
		  
		while_in:
			mov ah, final_element
			cmp [di], ah
			je final_loop 
			
			continue_in:
				mov al, [di]
				mov bl, [si]
				cmp al ,bl
				jb to_si
							   
		end_while_in:
			call set_final_element 
			call if_di_increment
			loop while_in
			inc si
			pop cx

	end_while:
		call set_final_element
		loop while
		jmp endss

	to_si:
		mov al, [di]
		mov bl, [si]
		mov [si], al
		mov [di], bl 
		jmp end_while_in
					   
	final_loop:
		mov cx, 1
		jmp continue_in
		
	if_di_increment:
		mov ah, final_element
		cmp [di], ah
		jne true_di_increment
						  
		false_di_increment:
			ret
			
		true_di_increment:
			inc di
			ret    
		
	set_final_element:
		lea bp, final_element
		push si 
		lea si, arr
		add si, 5
		mov bh, [si]
		mov [bp], bh
		pop si
		ret                   
					   
	endss:; finalizacion del programa
		mov ax, 4C00H;
		int 21H;
		end begin      
