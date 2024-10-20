section .data
    msg db 'Juliano Canuto - Dev Full Cycle', 0xA  ; Define the message with a newline

section .text
    global _start       ; Entry point

_start:
    ; Syscall: write (file descriptor: stdout, message: msg)
    mov rax, 1          ; Syscall number 1: sys_write
    mov rdi, 1          ; File descriptor 1: stdout
    mov rsi, msg        ; Address of the message
    mov rdx, 35         ; Length of the message (35 bytes)
    syscall             ; Invoke the system call

    ; Syscall: exit (status: 0)
    mov rax, 60         ; Syscall number 60: sys_exit
    xor rdi, rdi        ; Exit code 0
    syscall             ; Invoke the system call
