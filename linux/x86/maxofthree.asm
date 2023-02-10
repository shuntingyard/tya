; A 64-bit function that returns the maximum value of its three 64-bit integer.
;
; signature:
;         int64_t maxofthree(int64_t x, int64_t y, int64_t z)
;
; parameters:
;         rdi,rsi,rdx
;
          global      max_of_three

          section     .text

max_of_three:
          mov         rax, rdi                ; result is to hold x initially

          cmp         rax, rsi                ; compare x, y
          cmovl       rax, rsi                ; move y if x is smaller (l)
          cmp         rax, rdx                ; compare result, z
          cmovl       rax, rdx                ; move z if previous result is smaller 

          ret                                 ; return rax
