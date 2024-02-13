CC_PATH := ../compiler/i686-elf-tools-linux/bin/i686-elf-gcc
LD_PATH := ../compiler/i686-elf-tools-linux/bin/i686-elf-ld

kernel: kernel.c
	nasm kernel_main.asm -f elf -o kernel_entry.o
	$(CC_PATH) -Iinclude/ -ffreestanding -c src/print.c -o print.o
	$(CC_PATH) -Iinclude/ -ffreestanding -c kernel.c -o kernel.o

kernel_join: kernel.o kernel_entry.o
	$(LD_PATH) -o ../build/kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o print.o --oformat binary
	echo "Build kernel.bin"

clean:
	rm *.o