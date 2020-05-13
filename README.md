<p align="center">
 <img src="https://via.placeholder.com/150" alt="wrt-hisicam">
</p>

<h3 align="center">WRT-HisiCam</h3>

---

<p align="center">OpenWRT based firmware for HiSilicon`s System-On-a-Chip ip cameras</p>
<p align="center"><em>Part of OpenHisiIpCam project</em></p>

## :pencil: Table of Contents
- [About](#about)

## :eyeglasses: About
This is attempt to make full functional firmware for HiSilicon based ip cameras.
*Full functional* in our sense is firmware that has minimum general management functions (network control),
easy update/upgrade and some kind of web user interface. OpenWrt is only one known by us project, that targetted to embedded devices and has above features out of the box.

If you are looking for development environment take a look on [BR-HisiCam](https://github.com/OpenHisiIpCam/br-hisicam).
It is more suitable for fast start and quick experiments.

## Thinkgs you have to know

...

## Patching

target linux generic files -> _files

## Helpers

* `ifconfig eth0 192.168.10.X netmask 255.255.255.0 up`
* `route add default gw 192.168.10.1`

## Notes

`WARNING: .../openwrt-19.07.2/bin/targets/hi3516ev200/generic-glibc/packages/Packages to workaround usign SHA-512 bug!`

See:
* https://forum.openwrt.org/t/warning-message-usign-after-build-18-06-5/48419
* https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=e1f588e446c7ceb696b644b37aeab9b3476e2a57
* https://forum.openwrt.org/t/signature-check-failed-after-clean-installation/41945

### Building all packages

```
./scripts/feeds uninstall -a
./scripts/feeds install -a -d m
```

* https://forum.archive.openwrt.org/viewtopic.php?id=29619
* https://openwrt.org/docs/guide-user/additional-software/imagebuilder
