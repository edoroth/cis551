.section .text

.globl _start

_start:

movq $59, %rax
movq $0x601080, %rdi
movq $0, %rsi
movq $0, %rdx
syscall
