#
# Copyright (C) 2018 Jianhui Zhao <jianhuizhao329@gmail.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk

KERNEL_LOADADDR := 0x80008000

define Device/Default
  PROFILES = Default
  KERNEL_NAME := uImage 
  KERNEL := uImage none
endef

$(eval $(call BuildImage))
