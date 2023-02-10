hello_win.exe: hello_win.asm
	nasm -f win64 hello_win.asm
	link hello_win.obj /machine:x64 /subsystem:console /entry:point_alpha /defaultlib:kernel32.lib /out:$@

clean:
	del *.obj
	del *.exe
