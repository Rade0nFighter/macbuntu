echo "Assuming csrutil is disabled, blessing..."
sudo mkdir /Volumes/ESP
sudo mount -t msdos /dev/disk0s1 /Volumes/ESP
sudo bless --mount /Volumes/ESP --setBoot --file /Volumes/ESP/efi/refind/refind_x64.efi --shortform
echo "Blessed! rememeber to csrutil enable"