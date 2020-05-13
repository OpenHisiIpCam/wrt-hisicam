prepare:
	#wget https://github.com/openwrt/openwrt/archive/v19.07.2.zip
	git clone https://github.com/openwrt/openwrt.git --depth 1 -b v19.07.2 openwrt-19.07.2

prepare2:
	git clone https://github.com/openwrt/openwrt.git --depth 1 -b v18.06.8 openwrt-18.06.8

#./scripts/feeds update -a
#./scripts/feeds install -a
