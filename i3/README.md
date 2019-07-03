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
sudo apt install i3-wm i3status py3status rofi
mkdir -p ~/workspace/misc
mkdir -p ~/.config/i3/
ln -s $(pwd)/.i3status.conf ~/.i3status.conf
ln -s $(pwd)/config ~/.config/i3/config
```
