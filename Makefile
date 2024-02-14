BOOT := boot
BUILD := build
DRIVERS := drivers 
IMG	:= img
KERNAL	:= kernal 

build_boot:
	nasm -f bin $(BOOT)/boot.asm -o $(BUILD)/boot.bin 

build_img:
	dd if=/dev/zero of=img/boot.img bs=512 count=1440
	cat build/boot.bin build/kernel.bin > img/boot.img
	truncate -s 1440K img/boot.img

start:
	qemu-system-i386 -drive file=$(IMG)/boot.img

clean:
	rm build/*.bin
	rm img/boot.img