section .bss
    buffer resb 32

section .text

extern numToString
global _start

_start:
    mov eax, 0

    call add

add:
    pop ecx
    add eax, 4

    push eax
    push buffer
    call numToString

    mov esi, ecx

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, esi
    int 80h

    jmp add

ret



    


