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
cp init.vim bundle/ ~/.config/nvim
```

Then execute this command inside the nVim editor:

```
:PluginInstall
```

For tmux, just move tmux.conf file to the correct path:

```
cp tmux.conf ~/.tmux.conf
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
`Ctrl+t`  | Open tree navigate in actual opened file
`Ctrl+l`  | Open/Close tree navigate files
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
