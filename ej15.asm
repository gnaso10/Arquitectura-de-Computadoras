section .data
    msg db 'termine',10
    len equ $-msg
struct:
    dd 6
    dd 0
section .text

global _start

_start:

    mov eax, 0xa2   ;para la sycall del sleep  se reciben 2 parametros, el primero es una secuencia de dwords que representan los segundos y nano segs en este caso 
    mov ebx, struct ; lo hice con el puntero a struct y el segundo parametro es donde duerme el tiempo que no pudo dormir en el primero
    mov ecx, 0
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg
    mov edx, len
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h
