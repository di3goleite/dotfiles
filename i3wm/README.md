# i3wm

## How to install?

Install i3wm packages
```
sudo apt-get install i3 rofi feh arandr lxappearance pavucontrol thunar thunar-archive-plugin nm-applet amixer
```

Install Awesome Fonts:
```
https://github.com/FortAwesome/Font-Awesome
```

Install dependency to control audio output
```
playerctl: https://github.com/acrisci/playerctl
```

Install dependency to control video brightness
```
light: https://github.com/haikarainen/light
```

Create i3wm configuration directory
```
mkdir ~/.config/i3
```

Copy the config files to i3wm configuration folder
```
cp config i3status.conf ~/.config/i3
```

Set Thunar as default file manager
```
gvfs-mime --set inode/directory Thunar.desktop
```

## How to set a wallpaper?

Go to the bottom of config file and add this line
```
exec_always feh --bg-scale /ABSOLUTE_PATH_FOR_THE_WALLPAPER/FILENAME.jpg
```

## How to remove i3wm?

Uninstall everything
```
sudo apt-get remove dunst i3 i3-wm i3lock i3status suckless-tools thunar
```

Set Nautilus as default file manager
```
gvfs-mime --set inode/directory org.gnome.Nautilus.desktop
```

## Commands

List monitors and hdmi devices:
```
sudo xrandr --prop
```

List Wifi network available:
```
sudo iwlist wlp8s0 scan | grep SSID
```

Connect to a Wifi network
```
nmcli d wifi connect WIFI_NAME password WIFI_PASSWORD
```

Change brightness (0-900):
```
echo 0 | sudo tee /sys/class/backlight/acpi_video0/brightness
```

Set proxy:
```
export http_proxy="10.65.16.2:3128"
```

Unset proxy
```
unset http_proxy
```

Attach ssh key to current session
```
ssh-add
```
