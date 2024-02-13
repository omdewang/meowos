#ifndef PRINT_H
#define PRINT_H

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

unsigned int print(char *msg, char color);

unsigned int clear();

#endif /*print*/