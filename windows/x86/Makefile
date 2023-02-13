# The best I achieved with  MSVC's `nmake` without investing time ¯\_(ツ)_/¯

kern_linked = hello_win triangle echocmdl

C_driven = factorial

all: $(kern_linked) $(C_driven)

$(kern_linked):
	nasm -f win64 -gcv8 $*.asm
	link $*.obj /debug /machine:x64 /subsystem:console /entry:my_entry /defaultlib:kernel32.lib /out:$*.exe

$(C_driven):
	nasm -f win64 -g -F cv8 $*.asm
# 	/Zi for generating debug info
	cl $*_driver.c /Zi /link $*.obj

clean:
	del *.exe
	del *.ilk
	del *.obj
	del *.pdb
