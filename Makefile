obj-m := softuart.o
PWD := $(shell pwd)

ARCH			?= arm
KSRC 			?= /root/raspberry/linux
CROSS_COMPILE	?= arm-bcm2708-linux-gnueabi-

all:
	$(MAKE) -C $(KSRC) M=$(PWD) modules ARCH=$(ARCH) CROSS_COMPILE=$(CROSS_COMPILE)

load:
	insmod softuart.ko

unload:
	rmmod softuart

clean:
	rm *.o *.ko *.mod.c
