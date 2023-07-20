# macbuntu

## Bootloader
Install refind through Ubuntu. If it ceases to be the default at boot time, try `refind-mkdefault` [see here for more info](https://askubuntu.com/questions/936398/refind-doal-boot-option-disappeared-after-ubuntu-14-to-16-upgrade)

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

## TouchID
Aww [here](https://askubuntu.com/questions/1053821/apple-touchid-on-ubuntu)