; This is a Windows console program that ..................
;
        global  my_entry
        extern  GetStdHandle
        extern  WriteFile
        extern  ExitProcess

        section .text

my_entry:
        mov     r13, 1                  ; start with output length 1 (r13 will be checked below)
        mov     r14, 0                  ; number of asterisks on line so far

fh:
        mov     rcx, -11                ; stdout query
        call    GetStdHandle
        mov     [rel stdout], rax       ; winapi makes us ask for a handle
        mov     r9, 0                   ; bytes written

line:
        mov     r15, buf
        mov     byte [r15], '*'
        inc     r15
        inc     r14
        cmp     r13, r14
        jne     line                    ; jump back while lines to do

lineDone:
        mov     byte [r15], 10          ; write newline (ascii 10) to current output address
        inc     r14

        mov     rcx, [rel stdout]       ; WriteFile takes more parms than puts or printf
        mov     rdx, buf
        mov     r8, r14                 ; output length
        push    qword 0
        call    WriteFile

        inc     r13                     ; output line gets 1 longer
        mov     r14, 0
        cmp     r13, maxlines
        jle     line
        
done:
        xor     rcx, rcx                ; rc 0
        call    ExitProcess

        section .rodata

maxlines    equ 8                       ; EQU defines a symbol to a given constant value. (nasm manual)

        section .bss

stdout  resb    8
buf     resb    9
