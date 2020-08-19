ifeq (${KERNELRELEASE},)
# Not yet called from the kernel build system

BUILD_DIR ?= /lib/modules/`uname -r`/build

.PHONY: __default
__default:
	$(MAKE) -C $(BUILD_DIR) M=$(CURDIR)

.PHONY: $(MAKECMDGOALS)
$(MAKECMDGOALS):
	$(MAKE) -C $(BUILD_DIR) M=$(CURDIR) $@

else
# Called from the kernel build system
	obj-m := hello-drvr.o
endif
