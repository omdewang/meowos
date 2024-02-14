#include "include/print.h"
#include "../drivers/vga/VGA_colors.h"
#include "include/meowos.h"

void main()
{
    print("Meow Operating system. \n", BG_BLACK_FG_WHITE);

    print("Made by -> ", BG_BLACK_FG_WHITE);
    print(meowos_creator, BG_BLACK_FG_BRIGHTGREEN);
    print("\n", BG_BLACK_FG_BLACK);

    print("Version -> ", BG_BLACK_FG_WHITE);
    print(meowos_version, BG_BLACK_FG_BRIGHTYELLOW);
    print("\n", BG_BLACK_FG_BLACK);
}