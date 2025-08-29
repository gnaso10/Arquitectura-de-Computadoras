section .data
    msg1 db 'termino proceso padre', 10
    len1 equ $-msg1

    msg2 db 'termino proceso hijo!', 10
    len2 equ $-msg2

    msg3 db 'sigo en padre', 10
    len3 equ $-msg3

    msg4 db 'todavia sigo en padre', 10
    len4 equ $-msg4

section .text

global _start

_start:

    mov eax, 2
    int 80h

    cmp eax, 0
    jz print

    mov eax, 4
    mov ebx, 1
    mov ecx, msg1
    mov edx, len1
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg3
    mov edx, len3
    int 80h

    mov eax, 4
    mov ebx, 1
    mov ecx, msg4
    mov edx, len4
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h

print:
    mov eax, 4
    mov ebx, 1
    mov ecx, msg2
    mov edx, len2
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h


; el fork es interesante, para saber si estoy en un proceso hijo lo que debo hacer es comparar eax con 0 si me da 0 estoy en el hijo
; es interesante porque podes tener mas de un proceso corriendo en simultaneo, en este caso se puede ver como se sigue corriendo el proceso padre
; mientra que esta tambien corriendo el hijo




