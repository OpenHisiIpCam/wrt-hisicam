
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=hi3516ev200
BOARDNAME:=HiSilicon hi3516ev200 family
FEATURES:=usb
CPU_TYPE:=cortex-a7
SUBTARGETS:=hi3516ev200 hi3516ev300

KERNEL_PATCHVER:=4.9.37
KERNELNAME:=uImage

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools

$(eval $(call BuildTarget))
