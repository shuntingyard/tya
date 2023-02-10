; -----------------------------------------------------------------------------
; A 64-bit program that displays its command line arguments, one per line.
;
; On entry, rdi will contain argc and rsi will contain argv.
; -----------------------------------------------------------------------------

        default rel             ; PIE
        global  main
        extern  puts
        section .text
main:
        push    rdi             ; save registers used by puts
        push    rsi

        sub     rsp, 8          ; align before call

        mov     rdi, [rsi]      ; adress argv for puts
        call    [rel puts wrt ..got]

        add     rsp, 8          ; back to pre-aligned
        pop     rsi
        pop     rdi             ; registers restored

        add     rsi, 8          ; point to next in argv
        dec     rdi             ; decrement argc
        jnz     main            ; repeat if more

        ret
