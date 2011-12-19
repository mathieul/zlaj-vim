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

  # make sure your Ruby version of choice is setup
  $ rbenv shell 1.9.3-p0  # for instance, if using rbenv
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

Unzip it and install the one(s) you want (i.e.: MesloLGS-DZ-xxx, with xxx being Regular, Bold,
Bold Italic and Italic).

## Install Zlaj Vimfiles ##

Backup and remove any of those files if they already exist:

  * **~/.vim**
  * **~/.vimrc**
  * **~/.gvimrc**
  * **~/.ackrc**

And execute the following:

    $ cd
    $ git clone git://github.com/mathieul/zlaj-vim.git .vim
    $ ln -fs ./vim/vimrc .vimrc
    $ ln -fs ./vim/gvimrc .gvimrc

Then install the VIM plugins:

    $ cd ./vim
    $ git submodule init
    $ git submodule update

    # make sure your Ruby version of choice is setup
    $ rbenv shell 1.9.3-p0  # for instance, if using rbenv

    # setup command-t
    $ cd bundle/command-t/ruby/command-t
    $ ruby extconf.rb
    $ make
    # compilation succeeded if ends with message "linking shared-object ext.bundle"

    # setup ack
    # install ack if you don't have it already:
    $ brew install ack
    $ ln -fs ~/.vim/ackrc ~/.ackrc
    $ cd ../../../vim-ack
    $ rake install

    # setup vim-preview
    $ gem install bluecloth github-markup

## Other Plugins To Test In The Future ##

  * github.com/tsaleh/vim-align
  * github.com/vim-scripts/searchfold.vim
  * github.com/scrooloose/syntastic
  * github.com/robgleeson/hammer.vim

## Cheat-Sheet And Command Examples ##

  * [Vim shortcuts](https://github.com/LevelbossMike/vim_shortcut_wallpaper/raw/master/vim-shortcuts_1280x800.png)
  * **<Command>t**: open command-t window
  * **,gv**, **,gc**, etc...: open command-t window for views, controllers, etc...
  * **,gg**: open gemfile window
  * **<Command>/**: toggle comments
  * **<Command>]** and **<Command>]** (in visual mode): indent and unindent
  * **,1**: underline current line with "=" characters
  * **,W**: remove all trailing spaces
  * **,<space>**: cancel current search
  * **'.**: jump back to the last edit location
