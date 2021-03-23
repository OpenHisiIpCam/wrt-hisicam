prepare: download openwrt-patch openwrt-prepare genimage-build

download: openwrt submodules

submodules:
	git submodule update --init --recursive

openwrt:
	git clone https://github.com/openwrt/openwrt.git --depth 1 -b v19.07.3 openwrt

openwrt-patch:
	rm -rf ./openwrt/target/linux
	cp -r ./openwrt-overlay/* ./openwrt

openwrt-prepare:
	cd openwrt; \
		./scripts/feeds update -a; \
		./scripts/feeds install -a;

genimage-build:
	cd genimage; ./autogen.sh; ./configure; make

ubuntu-deps:
	sudo apt-get install \
		build-essential libconfuse-dev libncurses-dev gawk unzip wget python automake \
		pkg-config git
