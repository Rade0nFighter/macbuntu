# macbuntu

Documentation from my trials and tribulations installing ubuntu 20.10 on a 2017 Macbook Pro.

## Bootloader
Install refind through Ubuntu. If it ceases to be the default at boot time, try `refind-mkdefault` [see here for more info](https://askubuntu.com/questions/936398/refind-doal-boot-option-disappeared-after-ubuntu-14-to-16-upgrade)

refind-mkdefault should restore it. If EFI variables not enabled, see guidance for "blessing" refind - https://answers.launchpad.net/ubuntu/+question/708251 - requires disabling SIP again.

- Disable SIP: (https://developer.apple.com/documentation/security/disabling_and_enabling_system_integrity_protection)
-- Boot into recovery mode by holding Cmd+R
-- Open a terminal, run `csrutil disable`
- Log back in to macOS and "bless" refind (Bullt #3 from https://askubuntu.com/questions/936398/refind-doal-boot-option-disappeared-after-ubuntu-14-to-16-upgrade)
-- `sudo mkdir /Volumes/ESP`
-- `sudo mount -t msdos /dev/disk0s1 /Volumes/ESP`
-- `sudo bless --mount /Volumes/ESP --setBoot --file /Volumes/ESP/efi/refind/refind_x64.efi --shortform`
-- Reboot into recovery mode by holding Cmd+R
-- Open a terminal, run `csrutil enable`

## Wifi
See [here](https://gist.github.com/rob-hills/9134b7352ee7471c4d4f4fbd6454c4b9) and [here](https://bugzilla.kernel.org/show_bug.cgi?id=193121#c74)

- `cp brcmfmac43602-pcie.txt /usr/lib/firmware/brcm/`

## Audio (Output + Input)
See [here](https://askubuntu.com/questions/1254124/ubuntu-20-04-lts-no-sound-on-macbookpro)

- `apt install wget make gcc linux-headers-generic`
- `git clone https://github.com/davidjo/snd_hda_macbookpro.git`
- `cd snd_hda_macbookpro/`
- `./install.cirrus.driver.sh`
- `reboot`

The primary audio should be set to Analogue Stereo Output in the Settings Audio dialog.

## Keyboard backlight
sudo nano /sys/class/leds/spi\:\:kbd_backlight/brightness
set to `5`

## Facetime camera
https://askubuntu.com/questions/990218/camera-not-working-on-macbook-pro

## Integrated (Intel) Graphics
https://github.com/Dunedan/mbp-2016-linux#intel

Set spoof_osx_version option in your refind.conf to e.g. 10.12
`sudo mkdir /efi`
`sudo mount /dev/nvme0n1p1 /efi`
`sudo nano /efi/EFI/Refind/refind.conf` - then search for spoof_osx_version

Create xorg profile at `etc/X11/xorg.conf.d/20-intel.conf` with this content:
```
Section "Device"
	Identifier "Intel Graphics"
	Driver "intel"
	BusID "PCI:0:2:0"
	Option "TearFree" "true"
	Option "AccelMethod" "glamor"
EndSection```

```git clone https://github.com/0xbb/gpu-switch
cd gpu-switch
./gpu-switch -i # needs root. switches system to iGPU. needs reboot.
reboot
```

Settings > About should now show your Intel GPU as active.
