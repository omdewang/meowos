;   this asm code should be compiled and always be present before the kernel code. this peice of code will make sure 
;   to always start executing from the kernel's main method and not any other.


[bits 32]
[extern main]
call main
jmp $