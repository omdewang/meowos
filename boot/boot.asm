org 0x7c00

;
;   CODE
;

mov bx, KEY
call puts

hlt

;
;   FUNCTIONS
;

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
    pusha
    mov ah, 0x0e
    call write_char
    popa
    ret

;
;   DATA/VARIABLES
;

PREV_DL: db 0x0
PREV_DH: db 0x8
KEY: db "Booting Done - Welcome to Meow Operating System", 0xa, 0x0
DISK_READ_ERROR: db "Failed to read the disk", 0xa, 0x0

times 510 - ($-$$) db 0
dw 0xaa55
