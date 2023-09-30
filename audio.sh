rm -rf /home/rich/Documents/Drivers/snd_hda_macbookpro
cd /home/rich/Documents/Drivers
apt install -y wget make gcc linux-headers-generic
git clone https://github.com/davidjo/snd_hda_macbookpro.git
cd snd_hda_macbookpro/
./install.cirrus.driver.sh
- `reboot`