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

## Commands

Commands | Descriptions
--- | ---
`:cd <path>` | Open path */path*
`<Control+w>+<hjkl>` | Navigate via split panels
`<Control>+w+w` | Alternative navigate vim split panels
`,.` | Set path working directory
`,w or ,x` | Next buffer navigate
`,q or ,z` | previous buffer navigate
`SHIFT+t` | Create a tab
`TAB` | next tab navigate
`SHIFT+TAB` | previous tab navigate
`,e` | Find and open files
`,b` | Find file on buffer (open file)
`,c` | Close active buffer (clone file)
`Ctrl+t`  | Open tree navigate in actual opened file
`Ctrl+l`  | Open/Close tree navigate files
`,v` | Split vertical
`,h` | Split horizontal
`,f` | Search in the project
`,o` | Open github file/line (website), if used git in **github**
`,sh` | Open shell.vim terminal inside Vim or NeoVim built-in terminal
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
`YY` | Copy to clipboard
