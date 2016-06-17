# dotfiles

My nVim and tmux dotfiles.

## Pre-requisites

The distribution is designed to work with latest nVim, tmux and i3wm.

## Dependencies

* Fonts:

Awesome Fonts: https://github.com/FortAwesome/Font-Awesome

* Ubuntu

```
$ sudo apt-get install git tmux exuberant-ctags ncurses-term silversearcher-ag
```

* i3 Window Manager

```
$ sudo apt-get install lxappearance pavucontrol thunar amixer
```

```
playerctl: https://github.com/acrisci/playerctl
```

```
light: https://github.com/haikarainen/light
```

* Fedora

```
$ sudo dnf install git tmux ctags ncurses the_silver_searcher
```

## Installation

**See:** How to install nVim on your Linux computer
- [Ubuntu](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)
- [Fedora](https://github.com/neovim/neovim/wiki/Installing-Neovim#fedora-2122)

**See:** Install [Powerline Fonts](https://github.com/powerline/fonts) on your computer and choose a good Powerline font for your terminal. My favorite is: [Source Code Pro for Powerline](https://github.com/powerline/fonts/tree/master/SourceCodePro).

So first, clone the project ate recursive mode:

```
git clone --recursive git@github.com:di3goleite/dotfiles.git
```

To install nVim config:

```
cp -r init.vim bundle/ ~/.config/nvim
```

Then execute this command inside the nVim editor:

```
:PluginInstall
```

For tmux, just move tmux.conf file to the correct path:

```
cp tmux.conf ~/.tmux.conf
```

For i3, just move conf file to i3 config folder:

```
cp conf ~/.config/i3/conf
```

```
cp i3status.conf ~/.config/i3/i3status.conf
```

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
