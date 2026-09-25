%include "io64.inc"

section .rodata

section .text
global main
main:
    push rbp
    mov rbp, rsp

    sub rsp, 4; N

    PRINT_STRING "Enter N: "
    GET_DEC 4, [rbp - 4]    ; Считываем 4-байтовое число прямо в стек по адресу N
    NEWLINE
    
 
    sub rsp, 4; size
    mov dword [rsp], 1;size=1
    mov cl,[rsp+4]; c = N = 3
    shl dword [rsp], cl
    mov ebx, [rsp]; size_arr
    shl ebx, cl
    sub rsp, 4
    mov dword [rsp], ebx
    sub rsp, rbx
    
    sub rsp, 4; i
    mov dword [rsp], 0; i =0
    sub rsp, 4; j
    mov dword [rsp], 0; j = 0
    jmp loop_start
    
    mov rsp, rbp
    pop rbp
    xor rax, rax
    ret
    
loop_start:
    mov r8d, dword [rsp+4]
    cmp r8d, [rbp-8]
    
    mov dword [rsp], 0; j = 0
    jge loops_done
    jmp loop2_start
    
loop2_start:
    mov r9d, dword [rsp]
    cmp r9d, [rbp-8]
    jge loop2_end
    
    mov eax, [rsp+4]; num
    and eax, [rsp]
    
    mov ebx, 0; count
    
    jmp cycle_start
    
cycle_start:
    cmp eax, 0
    jbe cycle_end
    
    mov ecx, eax; a
    add ebx, ecx; count+=a
    shr eax, 1
    jmp cycle_start
    
cycle_end:
    test ebx, 1         ; Проверяем самый младший бит регистра ebx (count)
    jnz if_false        ; Jump if Not Zero (Прыгай, если результат не ноль, т.е. бит равен 1)
                        ; Если число нечётное — улетаем на if_false
    mov r10d, r8d
    imul r10d, dword [rbp-8]
    add r10d, r9d
    
    lea r11, [rbp-16]
    sub r11d, r10d
    mov byte [r11d], '+'
    
    jmp if_end
    
if_false:
    mov r10d, r8d
    imul r10d, dword [rbp-8]
    add r10d, r9d
    
    lea r11, [rbp-12]
    sub r11d, r10d
    
    mov byte [r11d], '-'
    
    jmp if_end
    
if_end:

    inc dword [rsp]; j++
    
    jmp loop2_start
    
loop2_end:
    inc dword [rsp+4]; i++
    
    jmp loop_start
    
loops_done:
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor r8d, r8d
    xor r9d, r9d
    xor r11d, r11d
    
    mov dword[rsp + 4], 0;m
    mov dword[rsp], 0;k
    PRINT_STRING 'Hadamard matrix:'
    NEWLINE
    jmp print_start
    
print_start:
    
    mov r8d, dword [rsp+4]
    cmp r8d, [rbp-8]
    jge loop_end
    
    mov dword [rsp], 0; k = 0
    jmp loop_print_start
    
loop_print_start:
    mov r9d, dword [rsp]
    cmp r9d, [rbp-8]
    jge loop_print_end
    
    
    mov r10d, r8d
    imul r10d, dword [rbp-8]
    add r10d, r9d
    
    lea r11d, [rbp-12]
    sub r11d, r10d
    
    cmp byte [r11d], '+'
    je print_plus
    
    PRINT_DEC 4, -1
    PRINT_STRING ' '
    
    inc dword[rsp]
    jmp loop_print_start  
    
print_plus:
    PRINT_DEC 4, 1
    PRINT_STRING ' '
    
    inc dword[rsp]
    jmp loop_print_start 
    
loop_print_end:
    NEWLINE
    inc dword[rsp+4]
    jmp print_start

 loop_end:
    PRINT_STRING "Programm end"
    NEWLINE 
    PRINT_DEC 4, [rbp - 4]  ; Выведет N (3)
    NEWLINE
    PRINT_DEC 4, [rbp - 8]  ; Выведет size (8)
    NEWLINE
    PRINT_DEC 4, [rbp - 12] ; Выведет size_arr (64)
    NEWLINE
    
    xor eax, eax
    xor ebx, ebx
    xor ecx, ecx
    xor r8d, r8d
    xor r9d, r9d
    xor r11d, r11d
    
    mov rsp, rbp
    pop rbp
    xor rax, rax
    ret
    



     
    