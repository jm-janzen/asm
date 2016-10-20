; export start for linker (nasm specific)
global _start  ; indicates where program execution begins

;
;   General 32 bit  registers:
;       EAX, EBX, ECX, EDX
;   Commands:
;       mov - assign second part to first part.
;       int - software interrupt (0x80 = system call),
;             determined by value in EAX register.
;

; declare source code in section.text
section .text
_start:
    mov eax, 4 ; 4 = write, 3 = read
    mov ebx, 1 ; stdout
    mov ecx, msg
    mov edx, msg.len
    int 0x80   ; write(stdout, msg, strlen(msg))

    mov eax, 1 ; exit
    mov ebx, 0
    int 0x80   ; exit(0)

; declare constants here in section.data
section .data
; breakdown of below:
;   label -> msg
;   db -> psuedo-instruction which accepts strs, chars, and nums
;   10 -> newline
;   msg.len -> declares len = (curr_location - msg_location)
msg: db "Hello World!", 10
msg.len: equ $ - msg

; declare variables in section.bss
section .bss

