BOOT := boot
BUILD := build
DRIVERS := drivers 
IMG	:= img
KERNAL	:= kernal 

build_boot:
	nasm -f bin $(BOOT)/boot.asm -o $(BUILD)/boot.bin 

build_img:
	cat build/boot.bin build/kernel.bin > img/boot.img

start:
	qemu-system-i386 -drive file=$(IMG)/boot.img