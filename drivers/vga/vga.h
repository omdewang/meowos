#ifndef VGA_H
#define VGA_H

// constants
#define VGA_BUFFER_SIZE 4000
#define VGA_HEIGHT 25
#define VGA_WIDTH 80

// VGA_CHAR_STRUCT
struct VGA_char_struct
{
    char CHARACTER;
    char COLOR;
};

void vgaidx_newline();
void puton_vga_buffer(struct VGA_char_struct *char_struct);
void vgaclear_buffer(struct VGA_char_struct *clear_char);
void vgaidx_reset();

#endif /* vga_h */