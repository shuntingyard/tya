; Snippet 1 from Amos' `iminur` (https://youtu.be/xN5WjaeeklA)
global _main

section .text
  ; NtTerminateProcess (Windows direct syscall)
  ; cf. https://hfiref0x.github.io/
  mov eax, 0x2c
  mov r10, -1
  mov rdx, 77     ; with `nasm -g -f win64 iminur1.asm` this becomes mov edx,0x4d !?
  syscall

  ; Should not return, so.
  hlt
