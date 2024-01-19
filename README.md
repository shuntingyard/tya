# Teach Yourself Assembly

## Motivation

* Strengthen prior knowledge.
* Must-have to generate and view (`objdump -d ...`, `dumpbin /disasm ...`)
    machine code snippets.
* Cool to notice ISA (CISC vs. RISC) differences.
* Maybe read a bit more about hardware details (`float`, `SIMD`).

## Goals

* [x] Get fluent in reading (not so much in writing).
* [x] Memorize (or be able to document) the *precise* effect of instructions.
* [x] Learn about instructions previously unknown and know where to look up new ones.
* [x] Understand register mnemonics (`rax` vs. `eax`, `Xn` vs. `Wn`, `SP` etc.).
* [ ] Get acquainted with assembler differences (`nasm`/`yasm` vs. `gas`).
* [x] Practice OS concepts (naked `syscall` vs. wrapped access via `kernel32.dll`).
* [x] Get fluent in `GDB` (using `ugdb`) and `WinDbg` on the way 🤓

### x86-64

Start using [nasm](https://cs.lmu.edu/~ray/notes/nasmtutorial/).

x86 and amd64 [instruction reference](https://www.felixcloutier.com/x86/)

Instructions in a more `nasm`-centric way: [from nasm's  old manual](http://home.myfairpoint.net/fbkotler/nasmdocc.html)

More details on [floating point](https://rayseyfarth.com/asm/pdf/ch11-floating-point.pdf)
instructions which lend themselves to more exercises.

### Arm On Linux

Continue with `gas` on [Arm64](https://modexp.wordpress.com/2018/10/30/arm64-assembly/)
hardware.

A64 (one of the three ISAs in AArch64, aka Arm64) doc at [arm Developer](https://developer.arm.com/documentation/102374/0101)

### Windows Specifics

Reference/Tutorial to be spotted for completion of all this.

See this
[stackoverflow topic](https://stackoverflow.com/questions/64413414/unresolved-external-symbol-printf-in-windows-x64-assembly-programming-with-nasm)
for details on using so-called legacy stdio (`printf` etc.) in Windows 64-bit programs.

## Repository Structure

To be pragmatic, directory names for examples and exercises follow a hierarchy of:

1. Operating System to build- and (mostly) run on
2. ISA without microarchitecture details (e.g. is `avx2` available?)
3. Optional subdirectories focusing on binary aspects, named `codegen`

No further distinction are made, i.e. are we using `libc` or do we build a
`pe32` executable.

So far we have:

* `linux/x86`
* `windows/x86` (both mostly x86-64)
* `linux/arm64`
* `mvs/system_370` (Just joking, but remember: `GDB` exists for System/370 😱)

## Appendix A - Notes

### View Source Code In GDB

While all works fine with `gas` (e.g. in version 2.35.2) there seems to be a
[bug](https://stackoverflow.com/questions/72694342/gdb-does-not-load-source-lines-from-nasm) 
in `NASM version 2.15.05`. Currently it's easy to work around this using `yasm`.

### Using WinDbg

* Rosetta pebble: [WinDbg for GDB users](https://github.com/wangray/WinDBG-for-GDB-users)
* And inverse [here](https://blog.mattjustice.com/2018/08/24/gdb-for-windbg-users/)
* [Get started with WinDbg (user mode)](https://learn.microsoft.com/en-us/windows-hardware/drivers/debugger/getting-started-with-windbg) by Microsoft
* A somewhat longer [cheat sheet](https://sites.google.com/site/taesaza0/etc/windbgcheatsheet) at Google Sites

### Generate Assembly

Sometimes it can be interesting to inspect assembly generated from `C` code.
To do so just run

```bash
gcc -Os -S file.c
```

and have a look at the generated `file.s` thus optimized for size.

The MSVC equivalent of this is

```ps
cl /O1 /FAs /c .\file.c
```

to generate `file.asm` and

```ps
cl /O1 /FAc /c .\file.c
```

to directly obtain machine code (`file.cod`) respectively.

### Passing Arguments Upon Program Start

While calling conventions specify how to pass arguments to
`main (int, address)`, achieving the same when completely on your own
turns out to be surprisingly difficult.
