# i3wm

`i3` window manager config files

## Install

```bash
# Teiler setup (screenshots and screen recording)
sudo apt install maim xininfo ffmpeg
git clone https://github.com/carnager/teiler ~/workspace/misc/teiler
mkdir -p ~/bin
ln -s ~/workspace/misc/teiler/teiler ~/bin/
ln -s ~/workspace/misc/teiler/teiler_helper ~/bin/
mkdir -p ~/.config/teiler/profiles
cp ~/workspace/misc/teiler/config.example ~/.config/teiler/config/
cp ~/workspace/misc/teiler/profiles/mp4-pulse ~/.config/teiler/profiles/
mkdir -p ~/Pictures/Screenshots
mkdir -p ~/Videos/Screencasts
mkdir -p ~/Pictures/Paste

# i3 setup
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2019.02.01_all.deb keyring.deb SHA256:176af52de1a976f103f9809920d80d02411ac5e763f695327de9fa6aff23f416
sudo dpkg -i ./keyring.deb
echo "deb https://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install i3 i3-wm i3lock i3status rofi
pip3 install --user py3status
mkdir -p ~/workspace/misc
mkdir -p ~/.config/i3/
ln -s $(pwd)/.i3status.conf ~/.i3status.conf
ln -s $(pwd)/config ~/.config/i3/config
```
