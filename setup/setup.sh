#!/bin/bash

#--------------------------------------------------------------------#
#                           System Update                            #

sudo pacman -Syu
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                          Make Directories                          #

mkdir ~/Downloads

mkdir -p ~/video/anime

mkdir ~/.config

mkdir ~/screenshots
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                            Install Paru                            #

cd ~/Downloads
sudo pacman -S git rust
git clone https://aur.archlinux.org/paru.git
cd ~/Downloads/paru
makepkg -i
cd ~/Dots
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                          Install Packages                          #

# Install the packages in the list
paru --needed --ask 4 -Sy - < ~/Dots/setup/pkglist.txt || error "Failed to install required packages"
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                          Python Packages                           #

# For Ranger
pip install python-bidi

# Anime
pip install animdl
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                             Setup Fish                             #

# Add the fish shell /usr/bin/fish to /etc/shells with
echo /usr/bin/fish | sudo tee -a /etc/shells

# Change the default shell to fish with:
chsh -s /usr/bin/fish
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                      Copy configuration files                      #

cd ~/Dots
make
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                      Power management with tlp                      #

sudo systemctl enable tlp.service
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
sudo systemctl enable NetworkManager-dispatcher.service
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                   Make them usable without sudo                    #

sudo chmod +s /usr/bin/light
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                             Setup git                              #

echo "[user]
	email = ahmedmohammed2429@gmail.com
	name  = IZenithy
" >> ~/.gitconfig

# Generate keys
ssh-keygen -o

# To make git work
echo "UserKnownHostsFile ~/.ssh/known_hosts" >> ~/.ssh/config
echo ;
echo "Dont Forget to add the public key to your github account"
echo ;
cat ~/.ssh/id_rsa.pub
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                             Setup dwm                              #

cd ~/Dots/programs/dwm
sudo make install
#--------------------------------------------------------------------#

#--------------------------------------------------------------------#
#                           Setup Redshift                           #

echo "Add this to /etc/geoclue/geoclue.conf"
echo ;
echo "[redshift]
allowed=true
system=false
users="
#--------------------------------------------------------------------#
