# Targets
#

# a) Simple programs
simple_pgms = hello 	# triangle

# b) Programs using GLIBC environment
libc_pos_dependent = hello_libc
libc_PIE = hello_libc_pie fib echocmdl average

# c) Module with C program as driver
# 	should follow convention: <filename>.asm (functions) <filename>.c (driver)
C_driven = maxofthree simdfloating factorial

.PHONY: clean

all: $(simple_pgms)	# $(libc_pos_dependent) $(libc_PIE) $(C_driven)

$(simple_pgms): %: %.s
	as $< -o $@.out 
	ld $@.out -o $@

$(libc_pos_dependent): %: %.asm
	nasm -f elf64 $<
	gcc -no-pie $@.o -o $@

$(libc_PIE): %: %.asm
	nasm -f elf64 $<
	gcc $@.o -o $@

$(C_driven): %: %.asm %.c
	nasm -f elf64 $(word 1,$^)
	gcc $(word 2,$^) $@.o -o $@

clean:
	rm -f $(wildcard *.out) $(simple_pgms) $(libc_pos_dependent) $(libc_PIE) $(C_driven)
