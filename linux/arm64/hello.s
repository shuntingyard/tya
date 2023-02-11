/*
    Writes "Hello, World" to stdout using only system calls. Written for Arch64 Linux.

    syscalls cf.
        https://arm64.syscall.sh/
 */
	.global _start

        .text

_start:
        mov    x8, 64           // syscall for write
        mov    x2, hello_len
        adr    x1, hello_txt
        mov    x0, 1            // for stdout
        svc    0

        mov    x8, 93           // syscall for exit
        svc    0

        .data

hello_txt: .ascii "Hello, World!\n"
hello_len = . - hello_txt
