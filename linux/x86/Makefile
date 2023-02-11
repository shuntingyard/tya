# Targets
#

# a) Simple programs
simple_pgms = hello triangle

# b) Programs using GLIBC environment
libc_pos_dependent = hello_libc
libc_PIE = hello_libc_pie fib echocmdl average

# c) Module with C program as driver
# 	should follow convention: <filename>.asm (functions) <filename>.c (driver)
C_driven = maxofthree simdfloating factorial

.PHONY: clean

all: $(simple_pgms) $(libc_pos_dependent) $(libc_PIE) $(C_driven)

$(simple_pgms): %: %.asm
	# Show source in gdb (broken in NASM version 2.15.05).
	yasm -f elf64 -g dwarf2 $<
	ld $@.o -o $@

$(libc_pos_dependent): %: %.asm
	yasm -f elf64 -g dwarf2 $<
	gcc -no-pie -g $@.o -o $@

$(libc_PIE): %: %.asm
	yasm -f elf64 -g dwarf2 $<
	gcc -g $@.o -o $@

$(C_driven): %: %.asm %.c
	yasm -f elf64 -g dwarf2 $(word 1,$^)
	gcc $(word 2,$^) -g $@.o -o $@

clean:
	rm -f $(wildcard *.o) $(simple_pgms) $(libc_pos_dependent) $(libc_PIE) $(C_driven)
