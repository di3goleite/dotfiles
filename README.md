# dotfiles

My nVim and tmux dotfiles.

## Pre-requisites

The distribution is designed to work with latest nVim and tmux.

## Dependencies

* Ubuntu

```
$ sudo apt-get install git exuberant-ctags ncurses-term ack-grep
```

## Installation

To install nVim config:

```
mv init.vim bundle/ ~/.config/nvim
```

Then execute this command inside the nVim editor:

```
:PluginInstall
```

For tmux, just move tmux.conf file to the correct path:

```
mv tmux.conf ~/.tmux.conf
```
