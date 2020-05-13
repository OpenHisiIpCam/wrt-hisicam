
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=hi3516av200
BOARDNAME:=HiSilicon hi3516av200 family
FEATURES:=
CPU_TYPE:=cortex-a7
SUBTARGETS:=hi3516av200 hi3519v101

KERNEL_PATCHVER:=3.18.20
KERNELNAME:=uImage

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools

$(eval $(call BuildTarget))
