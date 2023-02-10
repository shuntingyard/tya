; cf. https://stackoverflow.com/a/52131094
;
        ; set RIP-relative as default (RIP: relative instruction pointer in the x86-64 arch)
        default rel

        extern  printf                          ; nasm needs external symbol declarations

        section .rodata

format  db      "64-bit max signed: %ld", 10, 0 ; ascii LF + \0-terminated

        section .text

        global  main
main:
        sub     rsp, 8                          ; align stack by 16

        mov     rsi, 0x7fffffff_ffffffff        ; max signed we can, i.e. 0111 1111 ....
        lea     rdi, [rel format]
        ;call    printf wrt ..plt               ; either call throug the PLT
        call    [rel printf wrt ..got]          ; or indirect call through GOT (like gcc's -fno-plt)

        add     rsp, 8                          ; restore stack

        ret
