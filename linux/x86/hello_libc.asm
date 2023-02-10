; Using puts in libc to output something from Linux.
;
          global    main            ; this *has* to be called main to work from glibc's env
          extern    puts

          section   .text

main:
          mov       rdi, message    ; address of message
          call      puts
          ret

message:
          db        "Salve, glibc o glibc...", 0 ; \0-terminated for C
