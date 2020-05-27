
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=hi3516cv200
BOARDNAME:=HiSilicon hi3516cv200 family
FEATURES:=
CPU_TYPE:=arm926ej-s
#SUBTARGETS:=hi3516cv200 hi3518ev200 hi3518ev201

KERNEL_PATCHVER:=4.9.37
KERNELNAME:=uImage

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools

$(eval $(call BuildTarget))
