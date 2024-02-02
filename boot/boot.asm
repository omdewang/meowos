org 0x7c00

;
;   CODE
;

mov bx, KEY
call puts

CODE_SEG equ gdt_code - gdt_start
DATA_SEG equ gdt_data - gdt_start

cli
lgdt [gdt_descriptor]
mov eax, cr0
mov eax, 0x1
mov cr0, eax
jmp CODE_SEG:proc_mode


PREV_DL: db 0x0
PREV_DH: db 0x8
KEY: db "Booting Done - Welcome to Meow Operating System", 0xa, 0x0
DISK_READ_ERROR: db "Failed to read the disk", 0xa, 0x0
PROC_MODE_REACHED : db "Your in 32-bit proctected mode", 0xa, 0x0



newline:
    mov ah, 0x2
    mov bh, 0x0
    mov dh, [PREV_DH]
    mov dl, [PREV_DL]
    inc dh
    int 0x10
    mov [PREV_DH], dh
    mov [PREV_DL], dl
    ret

write_char:
    mov al, [bx]
    int 0x10
    add bx, 0x1
    cmp al, 0xa
    je newline
    cmp al, 0x0
    jne write_char
    ret

puts:
    mov ah, 0x0e
    call write_char
    ret

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
    mov al, 'A'
    mov ah, 0x0f
    mov [0xb8000], ax
    jmp $


times 510 - ($-$$) db 0
dw 0xaa55
