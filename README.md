# dotfiles

My vim, tmux and i3wm dotfiles.

## Screenshot

![First Version](https://i.imgur.com/iAGK6gN.png)

## Installation

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

For oh-my-zsh, just need to [install it](https://github.com/robbyrussell/oh-my-zsh#via-curl) and move zshrc file to the correct path:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp zshrc ~/.zshrc
```

## Commands

Commands | Descriptions
--- | ---
`:cd <path>` | Open path */path*
`<Ctrl+w>+<hjkl>` | Navigate via split panels
`<Ctrl>+w+w` | Alternative navigate vim split panels
`,.` | Starts EasyMotion
`,,w` | Set path working directory
`,w or ,x` | Next buffer navigate
`,q or ,z` | previous buffer navigate
`Shift+t` | Create a tab
`Tab` | next tab navigate
`Shift+Tab` | previous tab navigate
`Ctrl+l`  | Open tree navigate in actual opened file
`Ctrl+t`  | Open/Close tree navigate files
`,v` | Split vertical
`,h` | Split horizontal
`,ga` | Execute *git add --all*
`,gw` | Execute *git add* on current file
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
