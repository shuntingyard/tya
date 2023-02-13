; This is a Windows console program that writes a little triangle of asterisks.
;
        global  my_entry
        extern  GetStdHandle
        extern  WriteFile
        extern  ExitProcess

        section .text

my_entry:
        mov     rdx, output
        mov     r8, 1                   ; start with output length 1 (r8 will be checked below)
        mov     r9, 0                   ; number of asterisks on line so far

line:
        mov     byte [rdx], '*'
        inc     rdx
        inc     r9
        cmp     r8, r9
        jne     line                    ; jump back if not equal

lineDone:
        mov     byte [rdx], 10          ; write newline (ascii 10) to current output address
        inc     rdx                     ; increment after write (as above)
        inc     r8                      ; output line gets 1 longer
        mov     r9, 0
        cmp     r8, maxlines
        jle     line
        
done:
        mov     rcx, -11                ; stdout query
        call    GetStdHandle
        mov     [rel stdout], rax       ; winapi makes us ask for a handle

        mov     rcx, [rel stdout]       ; WriteFile takes more parms than puts or printf
        mov     rdx, output
        mov     r8, dataSize
        mov     r9, 0                   ; bytes_written
        push    qword 0
        call    WriteFile

        xor     rcx, rcx                ; rc 0
        call    ExitProcess

        section .rodata

maxlines    equ 8                       ; EQU defines a symbol to a given constant value. (nasm manual)
dataSize    equ 44                      ; contains sum(1..maxlines) + maxlines, e.g. 36 + 8

        section .bss

stdout  resb    8
output  resb    dataSize                ; resb n: reserve a buffer of n bytes
