#! /usr/bin/env sh

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

rm -rf ~/wallpaper
ln -s $PWD/wallpaper/ ~/wallpaper

# Remove the hook which keep update the  package list
rm -f /usr/share/libalpm/hooks/pkglist.hook

# Install all the packages in the list and not present in the system.
sudo pacman -Syu
for x in $(cat pkglist.txt);
do
    sudo pacman -S --needed --noconfirm $x;
done

# Create a hook to keep update the package list when installing/removing
# a package.
echo "[Trigger]
Operation = Install
Operation = Remove
Type = Package
Target = *

[Action]
When = PostTransaction
Exec = /bin/sh -c '/usr/bin/pacman -Qqe > $PWD/pkglist.txt'" > $PWD/pkglist.hook

sudo cp $PWD/pkglist.hook /usr/share/libalpm/hooks/ && rm $PWD/pkglist.hook
