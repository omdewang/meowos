#include "../include/print.h"
#include "../include/VGA_colors.h"

struct VGA_char_struct *VGA_BUFFER = 0xb8000;
unsigned int VGA_IDX = 0;

unsigned int puton_vga_buffer(struct VGA_char_struct *char_struct)
{
    VGA_BUFFER[VGA_IDX] = *char_struct;
    VGA_IDX++;
}

unsigned int strlen(char *str)
{
    unsigned int lenght = 0;

    while(*str != '\0')
    {
        lenght++;
        str++;
    }

    return lenght;
}

unsigned int print(char *msg, char color)
{
    struct VGA_char_struct _char;

    unsigned int idx = 0;
    unsigned int lenght = strlen(msg);

    while(lenght)
    {
        if((msg[idx]) == '\n')
        {
            VGA_IDX = ((VGA_IDX / VGA_WIDTH) + 1) * VGA_WIDTH;
        }
        else
        {
            _char.CHARACTER = msg[idx];
            _char.COLOR = color;
            puton_vga_buffer(&_char);
        }
        
        idx++;
        lenght--;
    }

    return 0;
}

unsigned int clear()
{
    struct VGA_char_struct clear_char = {.CHARACTER = ' ', .COLOR = BG_BLACK_FG_BLACK};
    VGA_IDX = 0;

    for(int i = 0; i < VGA_BUFFER_SIZE; i++)
    {
        VGA_BUFFER[i] = clear_char;
    }

    return 0;
}