#!/bin/bash

#Update
sudo pacman -Syu

#Install the packages in the list
paru --needed --ask 4 -Sy - < pkglist.txt || error "Failed to install required packages"

# Add the fish shell /usr/local/bin/fish to /etc/shells with
echo /usr/local/bin/fish | sudo tee -a /etc/shells

#Change your default shell to fish with:
chsh -s /usr/local/bin/fish

#Copy config files
mkdir ~/.config
cd ~/Dots
make

##Setup git

#Genirate kys
ssh-keygen -o

# To make git work
echo "UserKnownHostsFile ~/.ssh/known_hosts" >> ~/.ssh/config
echo "Dont Forget to add the public key to your github account"

xmonad --recompile
