; A 64-bit Linux application that writes the first 90 Fibonacci numbers.
;
default rel

          global    main
          extern    printf

          section   .text
main:
          push      rbx                     ; save, as we use this to keep track

          mov       ecx, 90                 ; will count down to 0
          xor       rax, rax                ; init,   will hold current number
          xor       rbx, rbx                ;         will hold next number
          inc       rbx                     ;         and start at 1

print:
          ; printf may destroy (says the tutorial) rax and rcx, so save
          push      rax
          push      rcx
          ; prepare call
          lea       rdi, [rel format]       ; unlike tutorial for pie
          mov       rsi, rax                ; 2nd parm, our number
          xor       rax, rax                ; printf is varargs
          call      [rel printf wrt ..got]  ; again unlike totorial, pie-able
          ; restore registers
          pop       rcx
          pop       rax

          mov       rdx, rax
          mov       rax, rbx
          add       rbx, rdx

          dec       ecx                     ; count down
          jnz       print                   ; not done yet

          pop       rbx                     ; restore before return
          ret

          section   .rodata

format    db        "%20ld", 10 ,0
