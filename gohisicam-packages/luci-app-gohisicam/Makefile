include $(TOPDIR)/rules.mk

# Name, version and release number
# The name and version of your package are used to define the variable to point to the build directory of your package: $(PKG_BUILD_DIR)
PKG_NAME:=luci-app-gohisicam
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

# Package definition; instructs on how and where our package will appear in the overall configuration menu ('make menuconfig')
define Package/luci-app-gohisicam
	SECTION:=openhisiipcam
	CATEGORY:=OpenHisiIpCam
	TITLE:=luci-app-gohisicam
	DEPENDS:=@PACKAGE_gohisicam +luci-compat
	#MENU:=1
endef

# Package description; a more verbose description on what our package does
define Package/luci-app-gohisicam/description
	Pure C CGI to Unix Domain Sockets proxy tool.
endef

define Package/luci-app-gohisicam/config
    source "$(SOURCE)/Config.in"
endef

#ifeq ($(CONFIG_LUCI_APP_GOHISICAM_PROXY),y)
#	define Build/Prepare/proxy
#		mkdir -p $(PKG_BUILD_DIR)
#		cp ./src/*.c $(PKG_BUILD_DIR)
#	endef
#endif

#define Build/Compile/proxy
#   	$(TARGET_CC) $(TARGET_CFLAGS) -o $(PKG_BUILD_DIR)/cgi_uds_proxy.o -c $(PKG_BUILD_DIR)/cgi_uds_proxy.c
#   	$(TARGET_CC) $(TARGET_LDFLAGS) -o $(PKG_BUILD_DIR)/gohisicam $(PKG_BUILD_DIR)/cgi_uds_proxy.o
#endef
#
#define Build/InstallProxy
#    $(INSTALL_DIR) $(1)/www/cgi-bin
#   	$(INSTALL_BIN) $(PKG_BUILD_DIR)/gohisicam $(1)/www/cgi-bin
#endef
#
#endif


# Package preparation instructions; create the build directory and copy the source code. 
# The last command is necessary to ensure our preparation instructions remain compatible with the patching system.
define Build/Prepare
	#$(call Build/Prepare/proxy)
endef

# Package build instructions; invoke the target-specific compiler to first compile the source file, and then to link the file into the final executable
define Build/Compile
	#$(call Build/Compile/proxy)
endef

# Package install instructions; create a directory inside the package to hold our executable, and then copy the executable we built previously into the folder
define Package/luci-app-gohisicam/install
	#$(call Build/InstallProxy)

	$(INSTALL_DIR) $(1)/usr/lib/lua/luci
	$(INSTALL_DIR) $(1)/www
	$(CP) ./luasrc/* $(1)/usr/lib/lua/luci
	$(CP) ./htdocs/* $(1)/www
endef

# This command is always the last, it uses the definitions and variables we give above in order to get the job done
$(eval $(call BuildPackage,luci-app-gohisicam))

