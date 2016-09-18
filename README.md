# dotfiles

My vim, tmux and i3wm dotfiles.

## Pre-requisites

The distribution is designed to work with latest vim, tmux and i3wm.

## Dependencies

* Fonts:

Awesome Fonts: https://github.com/FortAwesome/Font-Awesome

* Ubuntu

```
$ sudo apt-get install git vim tmux exuberant-ctags ncurses-term silversearcher-ag xclip
```

* i3 Window Manager

```
$ sudo apt-get install i3 rofi feh arandr lxappearance pavucontrol thunar amixer
```

```
playerctl: https://github.com/acrisci/playerctl
```

```
light: https://github.com/haikarainen/light
```

* Set thunar as default file manager

`gvfs-mime --set inode/directory Thunar.desktop`

Rollback to Nautilus:

`gvfs-mime --set inode/directory org.gnome.Nautilus.desktop`

**See:** [How to set thunar as default file manager](http://askubuntu.com/a/664308)

To set a wallpaper, go to the bottom of config file and add: `exec_always feh --bg-scale /home/diego/Pictures/Wallpapers/aurora-borealis.jpg`

* Fedora

```
$ sudo dnf install git vim tmux ctags ncurses the_silver_searcher xclip
```

## Installation

**See:** Install [Powerline Fonts](https://github.com/powerline/fonts) on your computer and choose a good Powerline font for your terminal. My favorite is: [Source Code Pro for Powerline](https://github.com/powerline/fonts/tree/master/SourceCodePro).

So first, clone the project at the recursive mode:

```
git clone --recursive git@github.com:di3goleite/dotfiles.git
```

To install vim config:

```
cp vimrc ~/.vimrc
```

and

```
cp -r bundle/ ~/.vim/bundle
```

Then execute this command inside the vim editor:

```
:PluginInstall
```

Copy jshintrc to the right path:

```
cp jshintrc ~/.jshintrc
```


For tmux, just move tmux.conf file to the correct path:

```
cp tmux.conf ~/.tmux.conf
```

For i3, just move conf file to i3 config folder:

```
cp config ~/.config/i3/config
```

```
cp i3status.conf ~/.config/i3/i3status.conf
```

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

## Commands

Commands | Descriptions
--- | ---
`:cd <path>` | Open path */path*
`<Ctrl+w>+<hjkl>` | Navigate via split panels
`<Ctrl>+w+w` | Alternative navigate vim split panels
`,.` | Set path working directory
`,w or ,x` | Next buffer navigate
`,q or ,z` | previous buffer navigate
`Shift+t` | Create a tab
`Tab` | next tab navigate
`Shift+Tab` | previous tab navigate
`Ctrl+l`  | Open tree navigate in actual opened file
`Ctrl+t`  | Open/Close tree navigate files
`,v` | Split vertical
`,h` | Split horizontal
`,ga` | Execute *git add* on current file
`,gc` | git commit (splits window to write commit message)
`,gsh` | git push
`,gll` | git pull
`,gs` | git status
`,gb` | git blame
`,gd` | git diff
`,gr` | git remove
`>` | indent to right
`<` | indent to left
`gc` | Comment or uncomment lines that {motion} moves over
