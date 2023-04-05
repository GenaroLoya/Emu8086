.model small
.stack 100h

.data
no dw 20
comp dw 10
cycle_add dw 10
cycle_sub dw 5

.code
org 100h

begin:
jmp main

main:
mov ax, no
cmp ax, comp
mov cx, cycle_sub

jae adds ; salta si es mayor o igual a 10

subs:
sub ax, 3
mov [bp], ax
add bp, 2
loop subs
jmp end

adds:
add ax, 2
mov [bp], ax
add bp, 2
loop adds

end:
mov ax, 4c00h
int 21h

end begin
