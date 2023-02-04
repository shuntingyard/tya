global _main

extern TerminateProcess

section .text

_main:
  sub rsp,0x28

  mov rcx, -1
  mov rdx, 112
  call TerminateProcess

  hlt ; unreachable
