# Teach Yourself Assembly

## Motivation
* Strengthen prior knowledge.
* Must-have to generate and view (`objdump -d ...`, `dumpbin /disasm ...`) machine code snippets.
* Cool to notice ISA (CISC vs. RISC) differences.
* Maybe read a bit more about hardware details (`float`, `SIMD`).

## Goals
- [ ] Get fluent in reading (not so much in writing).
- [ ] Memorize the *precise* effect of instructions.
- [ ] Learn about instructions previously unknown.
- [ ] Understand differences in register mnemonics (`rax` vs. `eax` etc.).
- [ ] Get acquainted with assembler differences (`nasm`/`yasm` vs. `gas`).
- [ ] Practice OS concepts (naked `syscall` vs. wrapped access via `kernel32.dll`).

### x86-64
Start using [nasm](https://cs.lmu.edu/~ray/notes/nasmtutorial/) <- contains paragraphs about macOs and Windows, no harm though :)

### Arm on Linux
Continue with `gas` on [AArch64](https://modexp.wordpress.com/2018/10/30/arm64-assembly/) hardware.

### Windows Specifics
Reference/Tutorial to be spotted for completion of all this.

## Repository Structure
Divided into subdirectories `intel`, `arm` and `windows`.
