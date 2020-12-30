.set MAGIC, 0x1badb002 # my predecessors have good norminclature I'll give 'em that. 
.set FLAGS, (1<<0| 1<<1)
.set CHECKSUM, -(MAGIC+FLAGS)

.section .multiboot
    .long MAGIC
    .long FLAGS
    .long CHECKSUM

.section .text
.extern bossKernel
.global loader

loader:
    move %kernel_stack, %esp,
    push %eax,
    push %ebx,
    call kernelMain

_stop:
    cli
    hlt
    jmp _stop

.section .bss
.space 2*1024*1024; # lemme save you the napkin math tis' but 2mb.