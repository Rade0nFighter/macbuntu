# macbuntu

## Bootloader
Install refind through Ubuntu. If it ceases to be the default at boot time, try `refind-mkdefault` [see here for more info](https://askubuntu.com/questions/936398/refind-doal-boot-option-disappeared-after-ubuntu-14-to-16-upgrade)

refind-mkdefault should restore it. If EFI variables not enabled, see guidance for "blessing" refind - https://answers.launchpad.net/ubuntu/+question/708251 - requires disabling SIP again.

- Disable SIP: (https://developer.apple.com/documentation/security/disabling_and_enabling_system_integrity_protection)
-- Boot into recovery mode by holding Cmd+R
-- Open a terminal, run `csrutil disable`
- Log back in to macOS and "bless" refind (Bullt #3 from https://askubuntu.com/questions/936398/refind-doal-boot-option-disappeared-after-ubuntu-14-to-16-upgrade)
-- `mkdir /Volumes/ESP`
-- `sudo mount -t msdos /dev/disk0s1 /Volumes/ESP`
-- `sudo bless --mount /Volumes/ESP --setBoot --file /Volumes/ESP/efi/refind/refind_x64.efi --shortform`


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