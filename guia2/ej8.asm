; opcion usar el ej 7 podria servir?
; notacion importante no puedo hacer: push [registro]

section .bss
    buffer resb 32

section .data
    arr dd 3, 1, 4, 6, 7, 12, 9
    dim equ ($-arr)/4

section .text

extern numToString
global _start

_start:

    push ebp
    mov ebp, esp

    call sort

    call print

    mov esp, ebp
    pop ebp

    mov eax, 1
    mov ebx, 0
    int 80h

sort:
    push ebp
    mov ebp, esp
    mov ecx, 0

startsort:
    inc ecx
    mov esi, 0
    mov edi, arr 

loop:
    mov eax, [edi]
    mov ebx, [edi+4]
    cmp eax, ebx
    jg swap
    jmp continue

swap:
    mov [edi], ebx
    mov [edi+4], eax
    jmp continue

continue:
    add edi, 4
    inc esi
    cmp esi, dim-1
    jnz loop

    cmp ecx, dim
    jnz startsort

    mov esp, ebp
    pop ebp

ret

;no printea pero sortea bien

print:
    push ebp
    mov ebp, esp

    mov edi, arr
    mov esi, 0

loop_print:
    mov eax, [edi]

    push eax
    push buffer
    call numToString
    add esp, 8
    mov edx, ecx
    mov eax, 4
    mov ebx, 1
    mov ecx, buffer
    int 80h

    add edi, 4
    inc esi
    cmp esi, dim
    jnz loop_print

    mov esp, ebp
    pop ebp

ret

    





