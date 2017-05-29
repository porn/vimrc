# vimrc

My personal vim configuration being used on my laptop as well as on servers I
have to deal with. Optimized for PHP.

# Installation

* Download or clone the repository to some directory (e.g. `~/github/porn/vimrc/`):
```
cd
mkdir -p github/porn
cd github/porn
git clone --recursive https://github.com/porn/vimrc.git
```

* Symlink cloned files:
```
ln -s ~/github/porn/vimrc/.vimrc ~
ln -s ~/github/porn/vimrc/.vim ~
ln -s ~/github/porn/vimrc/.gvimrc ~
```

* Initialize plugins using Vundle:
```
vim +PluginInstall +qall
```

* Optionally PHP manual pages can be installed using PECL:
```
sudo pear channel-update
sudo pear install doc.php.net/pman
```

# TODO
 - categorize configs
 - features (describe <Fx> shortcuts)
 - move PHP specific settings to php ftplugin

# Hotkeys

The config uses a lot of various key bindings. For full list see the `.vimrc` file directly=)

Note: `<leader>` is set to the comma (`,`) key.

 - `,/` - unhighlight the last search occurrences
 - `,n` - count occurrences of last search
