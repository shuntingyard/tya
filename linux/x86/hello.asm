; Writes "Hello, World" to stdout using only system calls. Runs on 64-bit Linux only.
;
          global    _start

          section   .text
_start    mov       rax, 1              ; syscall for write
          mov       rdi, 1              ; file handle number for stdout
          mov       rsi, message        ; address of string to output
          mov       rdx, 13             ; output lenght (including newline)
          syscall
          mov       rax, 60             ; syscall for exit
          xor       rdi, rdi            ; faster than *moving* exit code 0 to rdi
          syscall

          section   .data
message:  db        "Hello, World", 10  ; decimal 10 is LF in ascii 
