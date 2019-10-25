Installation
============

Prerequisites
-------------

Arch Linux: 

    # Python 2
    pacman -S ctags nodejs python2-pip
    sudo pip2 install flake8
    npm install -g jshint
    # Python 3
    pacman -S ctags nodejs
    sudo pip install flake8
    npm install -g jshint

Debian:

    apt-get install exuberant-ctags nodejs python-setuptools python-dev
    sudo pip install flake8
    npm install -g jshint

Get files
---------

    git clone git@bitbucket.org:ernstla/.vim.git ~/.vim

Create symlinks (Vim <= 7.3)
----------------------------

    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/gvimrc ~/.gvimrc

Language Servers
----------------

    npm install -g yarn
    npm install -g @elm-tooling/elm-language-server elm elf-format elm-test

Install bundles from inside Vim
-------------------------------

    :PlugInstall
