#! /bin/sh

rm ~/.bashrc
ln -s $PWD/.bashrc ~/.bashrc

rm ~/.vimrc
ln -s $PWD/.vimrc ~/.vimrc

rm ~/.gdbinit
ln -s $PWD/.gdbinit ~/.gdbinit

rm -rf ~/.gdbinit.d
ln -s $PWD/.gdbinit.d/ ~/.gdbinit.d

rm -rf ~/.gitconfig
ln -s $PWD/.gitconfig ~/.gitconfig

rm -rf ~/.Xresources
ln -s $PWD/.Xresources ~/.Xresources

rm -rf ~/.Xdefaults
ln -s $PWD/.Xdefaults ~/.Xdefaults

rm -rf ~/.config/i3
ln -s $PWD/i3/ ~/.config/i3

sudo pacman -Syu --needed - < pkglist.txt