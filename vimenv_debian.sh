#/bin/bash

# install nessesary packages
sudo apt install git gettext libtinfo-dev libacl1-dev libgpm-dev build-essential cproto
sudo apt install libperl-dev liblua5.2-0 lua5.2 liblua5.2-dev luajit python3-dev ruby-dev
sudo apt install libx11-dev libxtst-dev libxt-dev libsm-dev libxpm-dev

mkdir ~/vimbackup
mkdir ~/src
cd ~/src
git clone https://github.com/vim/vim.git
cd ./vim/src
make distclean

./configure --with-features=huge --enable-perlinterp --enable-python3interp --enable-rubyinterp --enable-luainterp --enable-fail-if-missing --with-luaji --with-x


make
sudo make install
