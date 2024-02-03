org 0x7c00
[bits 16]

mov [BOOT_DRIVE], dl

; high level steps
; 1 - print some info (optional)
; 2 - load as much sector is possible
; 3 - load kernel
; 4 - clear screen (optional)
; 5 - switch to protected mode
; 6 - jmp to kernel code


CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start
KERNEL_OFFSET equ 0x1000

; load sector and kernel
mov bx, KERNEL_OFFSET
mov ah, 2
mov al, 15              ; loading 15 sectors
mov ch, 0
mov dh, 0
mov cl, 2
mov dl, [BOOT_DRIVE]
int 0x13

; clear screen
mov ah, 0x0
mov al, 0x3
int 0x10

; switch to PM
cli
lgdt [gdt_descriptor]
mov eax, cr0
mov eax, 0x1
mov cr0, eax

; jmp to kernel code
jmp CODE_SEG:proc_mode


BOOT_DRIVE : db 0x0

;
;
;   GDT
;


gdt_start:

    gdt_null:
        dd 0x0
        dd 0x0
    
    gdt_code:
        dw 0xfffff  ; use the full 4gb
        dw 0x0      ;
        db 0x0
        db 10011010b
        db 11001111b
        db 0x0
    
    gdt_data:
        dw 0xfffff  ; use the full 4gb
        dw 0x0      ;
        db 0x0
        db 10010010b
        db 11001111b
        db 0x0

gdt_end:

gdt_descriptor:
    dw gdt_end - gdt_start - 1
    dd gdt_start

[bits 32]
proc_mode:
    mov ax, DATA_SEG
    mov dx, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax
    mov ebp, 0x90000
    mov esp, ebp
    call KERNEL_OFFSET
    jmp $

times 510 - ($-$$) db 0
dw 0xaa55