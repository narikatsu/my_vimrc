#/bin/bash

# install nessesary packages
sudo apt install git gettext libtinfo-dev libacl1-dev libgpm-dev build-essential cproto

sudo apt install libperl-dev liblua5.2-0 lua5.2 liblua5.2-dev luajit python3-dev ruby-dev

mkdir ~/src
cd ~/src
git clone https://github.com/vim/vim.git
cd vim
./configure  --prefix=/usr/local/ --with-features=huge --enable-multibyte --enable-gpm --enable-cscope --enable-perlinterp --enable-python3interp --enable-rubyinterp --enable-luainterp --enable-acl --enable-fontset --enable-xim --enable-terminal --enable-fail-if-missing --with-luajit --with-x

make
sudo make install
