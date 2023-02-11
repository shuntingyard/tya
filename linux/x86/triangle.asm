; This is a Linux console program that writes a little triangle of asterisks to standard.
;
          global    _start

          section   .text

_start    mov       rdx, output         ; output's address goes to r2 here
          mov       r8, 1               ; start with output length 1 (r8 will be checked below)
          mov       r9, 0               ; number of asterisks on line so far

line:
          mov       byte [rdx], '*'
          inc       rdx
          inc       r9
          cmp       r8, r9
          jne       line                ; jump back if not equal

lineDone:
          mov       byte [rdx], 10      ; write newline (ascii 10) to current output address
          inc       rdx                 ; increment after write (as above)
          inc       r8                  ; output line gets 1 longer
          mov       r9, 0
          cmp       r8, maxlines
          jne       line

done:                                   ; write to stdout and exit
          mov       rax, 1
          mov       rdi, 1              ; our old friend stdout again
          mov       rsi, output
          mov       rdx, dataSize
          syscall
          mov       rax, 60             ; exit
          xor       rdi, rdi
          syscall

          section   .bss                ; while .data is for constants .bss can hold mutable (would this be .text here we'd get a segfault)

maxlines  equ       8                   ; EQU defines a symbol to a given constant value. (nasm manual)
dataSize  equ       44                  ; contains sum(1..maxlines) + maxlines, e.g. 36 + 8
output    resb      dataSize            ; resb n: reserve a buffer of n bytes
