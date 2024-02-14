BUILD_DIR := obj_files
CC_PATH := ../compiler/i686-elf-tools-linux/bin/i686-elf-gcc
LD_PATH := ../compiler/i686-elf-tools-linux/bin/i686-elf-ld

all:
	$(CC_PATH) -ffreestanding -c vga/vgactrl.c -o $(BUILD_DIR)/vga_driver.o

clean:
	rm $(BUILD_DIR)/*.o