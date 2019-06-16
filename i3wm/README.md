# i3wm

## Requirements

* Fonts:

Awesome Fonts: https://github.com/FortAwesome/Font-Awesome

* Ubuntu

```
$ sudo apt-get install git vim zsh curl exuberant-ctags ncurses-term silversearcher-ag xclip httpie
```

* i3 Window Manager

```
$ sudo apt-get install i3 rofi feh arandr lxappearance pavucontrol thunar thunar-archive-plugin nm-applet amixer
```

```
playerctl: https://github.com/acrisci/playerctl
```

```
light: https://github.com/haikarainen/light
```


## Instructions
Move the config file to i3 config folder:
```
cp config ~/.config/i3/config
```

```
cp i3status.conf ~/.config/i3/i3status.conf
```

## How to remove i3

`sudo apt-get remove dunst i3 i3-wm i3lock i3status suckless-tools thunar`

* Set thunar as default file manager

`gvfs-mime --set inode/directory Thunar.desktop`

Rollback to Nautilus:

`gvfs-mime --set inode/directory org.gnome.Nautilus.desktop`

**See:** [How to set thunar as default file manager](http://askubuntu.com/a/664308)

To set a wallpaper, go to the bottom of config file and add: `exec_always feh --bg-scale /home/diego/Pictures/Wallpapers/aurora-borealis.jpg`

## Useful commands to work with **i3wm**

### List monitors and hdmi devices:
`sudo xrandr --prop`

### List Wifi network available:
`sudo iwlist wlp8s0 scan | grep SSID`

### Connect to a Wifi network
`nmcli d wifi connect hue password 123tapioca`

### Change brightness (0-900):
`echo 0 | sudo tee /sys/class/backlight/acpi_video0/brightness`

### Set proxy:
`export http_proxy="10.65.16.2:3128"`

### Unset proxy
`unset http_proxy`

### Attach ssh key to current session
`ssh-add`

