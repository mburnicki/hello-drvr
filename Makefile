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

# This is a hack that prevents the kernel build system from
# being called to 'install' the kernel.
.PHONY: install
install:
	@echo "Calling 'make modules_install' to install"
	$(MAKE) -C $(BUILD_DIR) M=$(CURDIR) EXTRA_CFLAGS="$(EXTRA_CFLAGS)" modules_install
