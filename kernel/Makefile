CC_PATH := ../compiler/i686-elf-tools-linux/bin/i686-elf-gcc
LD_PATH := ../compiler/i686-elf-tools-linux/bin/i686-elf-ld
BUILD_DIR := obj_files
DRIVERS := ../drivers/obj_files

kernel:
	nasm kernel_main.asm -f elf -o $(BUILD_DIR)/kernel_entry.o
	$(CC_PATH) -Iinclude/ -ffreestanding -c src/print.c -o $(BUILD_DIR)/print.o
	$(CC_PATH) -Iinclude/ -ffreestanding -c kernel.c -o $(BUILD_DIR)/kernel.o

kernel_join:
	$(LD_PATH) -o ../build/kernel.bin -Ttext 0x1000 $(BUILD_DIR)/kernel_entry.o $(BUILD_DIR)/kernel.o $(BUILD_DIR)/print.o $(DRIVERS)/vga_driver.o --oformat binary
	echo "Build kernel.bin done"

clean:
	rm $(BUILD_DIR)/*.o