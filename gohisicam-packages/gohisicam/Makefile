include $(TOPDIR)/rules.mk

# Name, version and release number
# The name and version of your package are used to define the variable to point to the build directory of your package: $(PKG_BUILD_DIR)
PKG_NAME:=gohisicam
PKG_VERSION:=1.0
PKG_RELEASE:=1

#will skip stripping for only this package, needed for append ko packing mode
STRIP=/bin/true

# Source settings (i.e. where to find the source codes)
# This is a custom variable, used below
SOURCE_DIR:=/home/buildbot/helloworld

include $(INCLUDE_DIR)/package.mk

# Package definition; instructs on how and where our package will appear in the overall configuration menu ('make menuconfig')
define Package/gohisicam
  SECTION:=openhisiipcam
  CATEGORY:=OpenHisiIpCam
  TITLE:=GoHisiCam
  DEPENDS:=@(TARGET_hi3516av100||TARGET_hi3516av200||TARGET_hi3516cv100||TARGET_hi3516cv200||TARGET_hi3516cv300||TARGET_hi3516cv500||TARGET_hi3516ev200)
  #MENU:=1
endef

define Package/gohisicam/config
	source "$(SOURCE)/Config.in"
endef

# Package description; a more verbose description on what our package does
define Package/gohisicam/description
  GoHisiCam audio/video pipeline managment application.
endef

# Package preparation instructions; create the build directory and copy the source code. 
# The last command is necessary to ensure our preparation instructions remain compatible with the patching system.
#define Build/Prepare
#
#endef

# Package build instructions; invoke the target-specific compiler to first compile the source file, and then to link the file into the final executable
define Build/Compile

endef

# Package install instructions; create a directory inside the package to hold our executable, and then copy the executable we built previously into the folder
define Package/gohisicam/install
	$(CP) ./files/* $(1)/
	$(CP) ./distrib/gohisicam-$(CONFIG_GOHISICAM_FAMILY) $(1)/opt/gohisicam
endef

# This command is always the last, it uses the definitions and variables we give above in order to get the job done
$(eval $(call BuildPackage,gohisicam))
