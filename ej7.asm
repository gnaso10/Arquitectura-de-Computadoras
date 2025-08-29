section .bss
    buffer resb 32

section .data
    arr dd 5, 0, 3, 1, 9, 3, 2 
    dim equ ($-arr)/4  ;equ siempre constante

section .text 

extern numToString
global _start

_start:

    push ebp
    mov ebp, esp

    call search

    push eax
    push buffer

    call numToString

    mov esi, ecx

    mov esp, ebp
    pop ebp

    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    mov edx, esi
    int 80h

    mov eax, 1
    mov ebx, 0
    int 80h

    

search:
    push ebp
    mov ebp, esp

    mov esi, dim
    dec esi
    mov ecx, arr
    mov eax, [ecx] ; me guardo el 1er elemento


ciclo:
    add ecx, 4
    cmp eax, [ecx]
    jl skip
    mov eax, [ecx]
    jmp skip


skip:
    dec esi
    cmp esi, 0
    jnz ciclo

    mov esp, ebp
    pop ebp

ret

