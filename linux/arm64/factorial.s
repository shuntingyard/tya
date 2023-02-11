/*
    A looping implementation for n! - shamelessly copied from what gcc generates :p

        function signature:

        uint64_t factorial(uint64_t n);
 */
        .global     factorial

        .text

factorial:

        mov     x1, x0                  // prepare register values for the loop
        mov     x0, 1
.LOOP:
        cbz     x1, .RET                // n < 1?
        mul     x0, x0, x1              // n * (n -1) * (n - 2) ...
        sub x1, x1, 1                   // decrement n
        b       .LOOP
.RET:
        ret
