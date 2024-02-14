#include "../include/print.h"
#include "../../drivers/vga/VGA_colors.h"
#include "../../drivers/vga/vga.h"

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
            vgaidx_newline();
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
    vgaclear_buffer(&clear_char);
    return 0;
}