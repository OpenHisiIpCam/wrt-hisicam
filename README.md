<p align="center">
 <img src="images/wrt-hisicam.jpg" alt="wrt-hisicam">
</p>

<h3 align="center">WRT-HisiCam</h3>

---

<p align="center">OpenWrt based firmware for HiSilicon`s System-On-a-Chip ip cameras</p>
<p align="center"><em>Part of OpenHisiIpCam project</em></p>

## :pencil: Table of Contents
- [About](#about)
- [Hardware support](#hardware-support)
- [Usage](#usage)
- [Build from scratch](#build-from-scratch)
- [Roadmap](#roadmap)
- [Implementation details](#implementation-details)
- [Feature requests and contribution](#feature-requests-and-contribution)

## :eyeglasses: About
This is attempt to make full functional firmware for HiSilicon based ip cameras.
*Full functional* in our sense is firmware that has minimum general management functions (network control),
easy update/upgrade and some kind of web user interface. OpenWrt is only one known project, that targets embedded devices and has above features out of the box.

**At the moment project is targetted to homebrew usage or simple in house production.** 

### What WRT-HisiCam IS and what it IS NOT

WRT-HisiCam is firmware build based on [OpenWrt](https://openwrt.org/) with mostly same functionality across all supported platforms.
Project is not targetted to be pushed to OpenWrt upstream, it is also developed not as fork, but as source tree modification, to simplify subsequent updates.

It IS NOT OpenWrt port to HiSilicon platfroms. Changing configuration may cause build fails 
(especially packages that depends on some kernel modules, ordinary packages most probably should work, but have to be tested). 
This means that adding new and improving existing functionality requires some technical skills and expirience.

For feature requests and contribution read corresponding [section](#feature-requests-and-contribution). 

If your case is rather different than this project take a look on [BR-HisiCam](https://github.com/OpenHisiIpCam/br-hisicam)
this is our test linux enviroiment for HiSilicon SoCs, suitible for developing any projects from scratch.

## Hardware support



### SoCs

| chips                                                 | family        | kernel |support|
|-------------------------------------------------------|---------------|--------|-------|
| hi3516av100, hi3516dv100                              | hi3516av100   |4.9.37  |Yes    |
| hi3519v101,  hi3516av200                              | hi3516av200   |3.18.20 |Yes    |
| hi3516cv100, hi3518cv100, hi3518ev100                 | hi3516cv100   |3.0.8   |NO     |
| hi3516cv200, hi3518ev200, hi3518ev201                 | hi3516cv200   |4.9.37  |Yes    |
| hi3516cv300, hi3516ev100                              | hi3516cv300   |3.18.20 |Yes    |
| hi3516cv500, hi3516dv300, hi3516av300                 | hi3516cv500   |4.9.37  |Yes    |
| hi3516ev300, hi3516ev200, hi3516dv200, hi3518ev300    | hi3516ev200   |4.9.37  |Yes    |
| hi3519av100                                           | hi3519av100   |4.9.37  |TODO   |
| hi3559av100                                           | hi3559av100   |4.9.37  |TODO   |


### Camera modules

Support for a specific module is determined by combination of chip and cmos (electrical connection is important).
Full support determined by detecting all used gpios and other periphery, that can be done via reverse engineering 
(usually it is not difficult as most modules are very similar in terms of schematics).

| module model                          |support|
|---------------------------------------|-------|
|ruision_rs-h802j-b0_hi3518ev200_f22    |+      |
|xm_ivg-hp203Y-se_hi3516cv300_imx291    |+      |
|xm_ivg-hp201Y-se_hi3516cv300_imx323    |+      |
|jvt_s323h16xf_hi3516cv300_imx323       |+      |
|ruision_rs-h622qm-b0_hi3516cv300_imx323|+      |
|xm_ipg-83he20py-s_hi3516ev100_imx323   |+      |
|xm_ipg-83h50p-b_hi3516av100_imx178     |+      |
|xm_83h40pl-b_hi3516av100_ov4689        |+      |
|ssqvision_on290h16d_hi3516dv100_imx290 |+      |
|xm_ivg-83h80nv-be_hi3516av200_os08a10  |+      |
|jvt_s274h19v-l29_hi3519v101_imx274     |+      |
|jvt_s226h19v-l29_hi3519v101_imx226     |+      |
|xm_ivg-85hf20pya-s_hi3516ev200_imx307  |+      |
|topsee_th38j29_hi3516ev200_imx307      |+      |
|xm_ivg-85hg50pya-s_hi3516ev300_imx335  |+      |
|unknown_facility28_hi3516cv500_imx327  |+      |
|ssqvision_on335h16d_hi3516dv300_imx335 |+      |
|hisilicon_demb_hi3516dv300_imx327      |+      |

For detailed modules description check [BR-HisiCam boards catalog](https://github.com/OpenHisiIpCam/br-hisicam/tree/master/br-ext-hisicam/board#boards-catalog).

## Usage

TODO

## Build from scratch

```console
foo@bar:~$ git clone --recursive https://github.com/OpenHisiIpCam/wrt-hisicam --depth 1
foo@bar:~$ cd wrt-hisicam
foo@bar:~$ make ...
```

## Roadmap

[] SPI Nor flash images for 8MB, 16MB, 32MB.
[] .
[] .

## Implementation details

TODO

## Feature requests and contribution

TODO

---

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
