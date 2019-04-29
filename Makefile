#
# Makefile for PPS generators.
#

obj-$(CONFIG_PPS_GENERATOR_PARPORT) += pps_gen_parport.o
obj-$(CONFIG_PPS_GENERATOR_GPIO) += pps_gen_gpio.o

ifeq ($(CONFIG_PPS_DEBUG),y)
EXTRA_CFLAGS += -DDEBUG
endif

PWD = $(shell pwd)
ifeq ($(KERNEL_SRC),)
	KERNEL_SRC = /lib/modules/$(shell uname -r)/build
endif

KBUILD_FLAGS = -C $(KERNEL_SRC) M=$(PWD)

modules:
	$(MAKE) $(KBUILD_FLAGS) modules

modules_install:
	$(MAKE) $(KBUILD_FLAGS) modules_install

clean:
	rm -rf *.o *.ko *.mod.c
