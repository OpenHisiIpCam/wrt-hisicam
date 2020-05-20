
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=hi3516av100
BOARDNAME:=HiSilicon hi3516av100 family
FEATURES:=
CPU_TYPE:=cortex-a7
SUBTARGETS:=hi3516av100 hi3516dv100

KERNEL_PATCHVER:=4.9.37
KERNELNAME:=uImage

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools

$(eval $(call BuildTarget))
