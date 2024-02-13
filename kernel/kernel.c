#include "include/print.h"
#include "include/VGA_colors.h"
#include "include/meowos.h"

#ifdef __linux__
#error "Not compiling for Meow OS"
#endif

#ifndef __i386__
#error "Not compiling for x86"
#endif

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