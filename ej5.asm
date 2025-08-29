section .bss
    buffer resb 32

section .text

extern numToString
global _start

_start: 
    
    push 12 ; numero 
    push 8 ;  divisores hasta 8

    call getdiv

    pop ecx
    pop edx

    mov eax, 1
    mov ebx, 0
    int 80h

getdiv:

    push ebp
    mov ebp, esp
 
    mov edi, buffer
    mov eax, [ebp+12]   ; -> 12
    mov ebx, [ebp+8]   ; -> 8
    mov esi, eax
    mov ecx, 1

Loop:
    mov eax, esi
    mov edx, 0
    div ecx
    cmp edx, 0
    jz add
    jmp continue

add:
    inc edi
    push ecx
    push edi
    call numToString


    add esp, 8
    jmp continue

continue:
    inc ecx
    cmp ecx, ebx
    jle Loop

    mov esp, ebp
    pop ebp

ret


    
