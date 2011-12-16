# README #

This repository is just a collection of vim files and basic instructions
to compile MacVim and install those vim files and plugins to fit my
personal preferences.

I started building it by reading [Mislav's "Vim: revisited" article](http://mislav.uniqpath.com/2011/12/vim-revisited/),
and got inspired/stole from [his own vim files](https://github.com/mislav/vimfiles),
[the Janus Vim distribution](https://github.com/carlhuda/janus) and
[Akita On Rails Vimfiles](https://github.com/akitaonrails/vimfiles).

## Compile MacVim ##

First make sure there is no MacVim.app in /Applications. If there is,
just move it to the trash or archive it.

    $ git clone https://github.com/b4winckler/macvim.git
    $ cd macvim/src/MacVim/icons
    $ make getenvy
    $ make all
    $ cd ../..
    $ ./configure --with-features=huge --enable-rubyinterp --enable-cscope
    $ make
    $ mv MacVim/build/Release/MacVim.app /Applications

## Install Font ##

You need to [download the Meslo LG DZ font](https://github.com/andreberg/Meslo-Font/downloads).

Unzip it and install the one(s) you want (i.e.: MesloLGM-DZ-xxx, with xxx being Regular, Bold,
Bold Italic and Italic).

## Install Zlaj Vimfiles ##

Backup and remove any of those files if they already exist:

  * **~/.vim**
  * **~/.vimrc**
  * **~/.gvimrc**

And execute the following:

    $ cd
    $ git clone git://github.com/mathieul/zlaj-vim.git .vim
    $ ln -fs ./vim/vimrc .vimrc
    $ ln -fs ./vim/gvimrc .gvimrc

Then install the VIM plugins:
