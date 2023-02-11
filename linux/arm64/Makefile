# Targets
#

# a) Simple programs
simple_pgms = hello triangle

# b) Programs using GLIBC environment
libc_PIE = hello_libc

# c) Module with C program as driver
# 	should follow convention: <filename>.asm (functions) <filename>.c (driver)
C_driven = factorial # simd128

.PHONY: clean

all: $(simple_pgms) $(C_driven)	$(libc_PIE)

$(simple_pgms): %: %.s
	as $< -g -o $@.out 
	ld $@.out -o $@

$(libc_PIE): %: %.s
	as $< -g -o $@.out 
	gcc -g $@.out -o $@

$(C_driven): %: %.s %.c
	as $(word 1,$^) -g -o $@.out
	gcc $(word 2,$^) -g $@.out -o $@

clean:
	rm -f $(wildcard *.out) $(simple_pgms) $(libc_PIE) $(C_driven)
