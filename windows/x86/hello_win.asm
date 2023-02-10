; Using WriteFile to output something on Windows.
;

        ; default rel   ; TODO: works without on wondows, check if really needed on linux

        global  point_alpha
        extern  GetStdHandle
        extern  WriteFile
        extern  ExitProcess

        section .text

point_alpha:                                ; unlike libc where we do init and call main

        mov     rcx, -11                    ; stdout query
        call    GetStdHandle
        mov     [rel stdout], rax           ; winapi makes us ask for a handle

        mov     rcx, [rel stdout]           ; WriteFile takes more parms than puts or printf
        mov     rdx, message
        mov     r8, msg_len
        mov     r9, 0                       ; bytes_written
        push    qword 0
        call    WriteFile

        xor     rcx, rcx                    ; rc 0
        call    ExitProcess

        section .data

stdout  dw      0

        section .rodata

message db      "Hello world!", 0xd, 0xa, 0
msg_len equ     $-message
