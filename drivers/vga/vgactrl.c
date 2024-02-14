#include "vga.h"

struct VGA_char_struct *VGA_BUFFER = 0xb8000;
unsigned int VGA_IDX = 0;

void puton_vga_buffer(struct VGA_char_struct *char_struct)
{
    VGA_BUFFER[VGA_IDX] = *char_struct;
    VGA_IDX++;
}

void vgaidx_newline()
{
    VGA_IDX = ((VGA_IDX / VGA_WIDTH) + 1) * VGA_WIDTH;
}

void vgaidx_reset()
{
    VGA_IDX = 0;
}

void vgaclear_buffer(struct VGA_char_struct *clear_char)
{
    vgaidx_reset();

    while(VGA_IDX < VGA_BUFFER_SIZE)
    {
        puton_vga_buffer(clear_char);
    }

    vgaidx_reset();
}