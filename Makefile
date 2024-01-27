BOOT := boot
BUILD := build
DRIVERS := drivers 
IMG	:= img
KERNAL	:= kernal 

default:
	nasm -f bin $(BOOT)/boot.asm -o $(BUILD)/boot.bin 
	cp $(BUILD)/boot.bin $(IMG)/boot.img
	truncate -s 1440k $(IMG)/boot.img
	qemu-system-i386 -drive file=$(IMG)/boot.img