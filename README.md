# Teach Yourself Assembly

## Motivation
* Strengthen prior knowledge.
* Must-have to generate and view (`objdump -d ...`, `dumpbin /disasm ...`) machine code snippets.
* Cool to notice ISA (CISC vs. RISC) differences.
* Maybe read a bit more about hardware details (`float`, `SIMD`).

## Goals
- [x] Get fluent in reading (not so much in writing).
- [ ] Memorize (or be able to document) the *precise* effect of instructions.
- [x] Learn about instructions previously unknown and know where to look up new ones.
- [x] Understand differences in register mnemonics (`rax` vs. `eax` etc.).
- [ ] Get acquainted with assembler differences (`nasm`/`yasm` vs. `gas`).
- [ ] Practice OS concepts (naked `syscall` vs. wrapped access via `kernel32.dll`).
- [ ] Get fluent in `gdb` (using `ugdb`) and `WinDbg` on the way 🤓

### x86-64
Start using [nasm](https://cs.lmu.edu/~ray/notes/nasmtutorial/) <- contains paragraphs about macOs and Windows, no harm though :)

Instructions: [the best list found so far](http://home.myfairpoint.net/fbkotler/nasmdocc.html) for nasm

More details on [floating point](https://rayseyfarth.com/asm/pdf/ch11-floating-point.pdf) instructions which lend themselves to some exercises. 

### Arm on Linux
Continue with `gas` on [Arm64](https://modexp.wordpress.com/2018/10/30/arm64-assembly/) hardware.

### Windows Specifics
Reference/Tutorial to be spotted for completion of all this. Or alternatively look some Windows things up in `nasm`'s manual.

See this
[stackoverflow topic](https://stackoverflow.com/questions/64413414/unresolved-external-symbol-printf-in-windows-x64-assembly-programming-with-nasm)
for details on using so-called legacy stdio (`printf` etc.) in Windows 64-bit programs.

## Repository Structure
To be pragmatic, directory names for examples and exercises done follow a hierarchy of:
1. Operating System to build- and (mostly) run on
2. ISA without microarchitecture details (do we have e.g. `avx2`)
3. Optional subdirectories focusing on binary aspects, named `codegen`

No further distinction are made, i.e. are we using `libc` or do we build a `pe32` executable.

So far we have:
- `linux/x86`
- `windows/x86` (both mostly x86-64)
- `linux/arm64`
- `mvs/system_370` (just joking)
