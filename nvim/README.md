# nvim

## How to install?

Install NeoVIM
```
brew install neovim
```

Install The Silver Searcher for Ag
```
brew install the_silver_searcher
```

Install Exuberant ctags for Tagbar
```
brew install ctags
```

Install pip package for nvim
```
pip3 install neovim
```

Install Vim Plug for plugin management
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Create configuration directory
```
mkdir ~/.config/nvim
```

Copy files to configuration folder
```
cp init.vim ~/.config/nvim
```

Open nvim configuration file
```
nvim ~/.config/nvim/init.vim
```

Install plugins
```
:PlugInstall
```

## Tips

* [Multiple Cursors](https://medium.com/@schtoeffel/you-don-t-need-more-than-one-cursor-in-vim-2c44117d51db)
* [Fold and Unfold](https://gist.github.com/lestoni/8c74da455cce3d36eb68)
* [Move Cursor to Nearest Enclosing](https://stackoverflow.com/a/4339966/3142942)
* [Jump Between HTML Tags](https://unix.stackexchange.com/a/185290)
* [Visual Mode Search for Selection](https://salferrarello.com/vim-visual-mode-search-selection/)
* [Find Next or Previous](https://stackoverflow.com/a/6607664/3142942)

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
