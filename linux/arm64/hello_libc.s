/*
    Using puts in libc to output something from Linux.
 */
	.global	    main

	.text

main:
        /*
            cf. https://modexp.wordpress.com/2018/10/30/arm64-assembly/#conventions

                "x29 can be used as a frame pointer and x30 is the link register.
                The callee should save x30 if it intends to call a subroutine."
         */
        stp         x29, x30, [sp, -16]!

	adr	    x0, message             // address of message
	mov	    x29, sp
	bl	    puts

	ldp	    x29, x30, [sp], 16

	mov	    w0, 0                   // be kind, let rc = 0
	ret

        .data

message:
        .ascii	"Salve, glibc o glibc..."
