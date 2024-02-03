BOOT := boot
BUILD := build
DRIVERS := drivers 
IMG	:= img
KERNAL	:= kernal 

default:
	nasm -f bin $(BOOT)/boot.asm -o $(BUILD)/boot.bin 
	gcc -ffreestanding -c kernel/kernel.c -o kernel/kernel.o
	ld -o build/kernel.bin -Ttext 0x1000 	kernel/kernel.o --oformat binary
	cat build/boot.bin build/kernel.bin > img/boot.img
	truncate -s 1440k $(IMG)/boot.img
	qemu-system-i386 -drive file=$(IMG)/boot.img

just_boot:
	nasm -f bin $(BOOT)/boot.asm -o $(BUILD)/boot.bin 
	cat build/boot.bin > img/boot.img
	truncate -s 1440k $(IMG)/boot.img
	qemu-system-i386 -drive file=$(IMG)/boot.img