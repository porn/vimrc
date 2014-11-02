# vimrc

My personal vim configuration being used on my laptop as well as on servers I
have to deal with. Optimized for PHP.

## Installation instructions
Clone repository to your home:

    cd
    git clone --recursive https://github.com/porn/vimrc.git

Symlink cloned files:

    ln -s vimrc/.vimrc .
    ln -s vimrc/.vim .
    ln -s vimrc/.gvimrc .

Initialize plugins using Vundle:

    vim +PluginInstall +qall

Optionally PHP manual pages can be installed using PECL:

    sudo pear channel-update
    sudo pear install doc.php.net/pman


## TODO
 - rename files, complete installation part
 - categorize configs
 - features (describe <Fx> shortcuts)
 - install spellchecker
 - move PHP specific settings to php ftplugin

## Hotkeys

The config uses a lot of various key bindings. For full list see the `.vimrc` file directly=)
Note: `<leader>` is set to the comma (`,`) key.

 - `<leader>/` - unhighlight the last search occurrences
