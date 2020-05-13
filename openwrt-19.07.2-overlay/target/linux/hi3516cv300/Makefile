
include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=hi3516cv300
BOARDNAME:=HiSilicon hi3516cv300 family
FEATURES:=
CPU_TYPE:=arm926ej-s
SUBTARGETS:=hi3516cv300 hi3516ev100

KERNEL_PATCHVER:=3.18.20
KERNELNAME:=uImage

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += uboot-envtools

$(eval $(call BuildTarget))
