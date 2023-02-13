/*
    This is a Linux console program that writes a little triangle of asterisks to standard.
 */
            .global _start

            .text

_start:
            adr     x3, output
            mov     w8, 1               // start with output length 1 (r8 will be checked below)
            mov     w9, 0               // number of asterisks on line so far

line:
            mov     w10, '*'            // asterisk into ausiliary register
            str     w10, [x3]           // store at output with index
            add     x3, x3, 1
            add     w9, w9, 1
            cmp     w8, w9
            bne     line                // jump back if not equal

lineDone:
            mov     w10, '\n'           // newline into auxiliary register
            str     w10, [x3]           // store newline at x3 address
            add     x3, x3, 1           // increment after write (as above)
            add     w8, w8, 1           // output line gets 1 longer
            mov     w9, 0
            cmp     w8, maxlines
            ble     line

done:
            mov     x8, 64              // syscall for write
            mov     x2, dataSize
            adr     x1, output
            mov     x0, 1               // for stdout
            svc     0
            mov     x8, 93              // syscall for exit
            svc     0

            .data

            .equ    maxlines, 8         // EQU defines a symbol to a given constant value. (nasm manual)
            .equ    dataSize, 44        // contains sum(1..maxlines) + maxlines, e.g. 36 + 8
output:     .space  dataSize, ' '       // .space n[, fill]: reserve n bytes
