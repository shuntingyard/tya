; Functions for (SIMD) adding floats

        global  add_four_floats
        global  add_four_double

        section .text

; void add_four_floats(float x[4], float y[4])
add_four_floats:

        ; based on SSE, 128-bit
        movaps  xmm0, [rdi]             ; add 4 x values to register
        movaps  xmm1, [rsi]             ; same for 4 y
        addps   xmm0, xmm1              ; 4 single precision addtions in one shot
        movaps  [rdi], xmm0             ; get address of results

        ret

; void add_four_double(double x[4], double y[4]);
add_four_double:

        ; based on AVX2, 256-bit
        vmovapd ymm0, [rdi]
        vmovapd ymm1, [rsi]
        vaddpd  ymm0, ymm0, ymm1        ; add instruction here takes 3 operands
        vmovapd [rdi], ymm0

        ret                             ; FIXME: coredumpctl debug 41668 --debugger=ugdb
