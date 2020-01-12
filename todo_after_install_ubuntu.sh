#!/bin/sh

# add VS code pakages installation (see google)

alias echo='echo -e'

bold=`tput smso`
offbold=`tput rmso`

apt update && apt upgrade -y 

#       adding multivers and univers repositories 
echo "\n${bold}------------ Add repositories ------------${offbold}"
add-apt-repository universe
add-apt-repository multiverse
add-apt-repository restricted 

mkdir ~/apps

#       Install media codecs
echo "\n${bold}------------ Insall media codecs ------------${offbold}"
apt install -y ubuntu-restricted-extras 

#       Install snap
echo "\n${bold}------------ Insall snap ------------${offbold}"
(snap --version >> /dev/null && echo " ------------ Snap is installed ------------") || apt install snap

#       install Visual Studio code
echo "${bold}------------ Insall Visual Studio code ------------${offbold}"
apt install software-properties-common apt-transport-https wget 
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update
apt install code

#       Install Chromium
echo "${bold}------------ Install Chromium ------------${offbold}"
apt install -y chromium-browser

#       Install Skype
echo "${bold}------------ Install Skype ------------${offbold}"
apt install gdebi-core
cd apps
wget https://repo.skype.com/latest/skypeforlinux-64.deb
gdebi -y skypeforlinux-64.deb

#       Install SMplayer
echo; echo "------------ Install SMplayer ------------"
apt install -y smplayer

#       Install virtual box 
echo; echo "------------ Insall VirtualBox ------------"
apt install -y virtualbox
# install extantion pack 
wget https://download.virtualbox.org/virtualbox/6.1.0/virtualbox-6.1_6.1.0-135406~Ubuntu~bionic_amd64.deb && dpkg -i virtualbox-6.1_6.1.0-135406_Ubuntu_bionic_amd64.deb
apt autoremove

#       Install Discord
echo; echo "------------ Insall Discord ------------"
snap install -y discord

#       Install vim 
echo; echo "------------ Insall Vim ------------"
apt install -y vim
vim /usr/share/vim/vimrc

#       Install Python3
echo; echo "------------ Insall Python3 ------------"
(python3 --version && "------------ Python3 is installed ------------" ) || apt install python3

#       Install CMake
echo; echo "------------ Insall CMake ------------"
wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2.tar.gz
tar -zxvf cmake-3.15.2.tar.gz ~/apps
mv cmake-3.15.2.tar.gz ~/apps
cd apps && cd cmake-3.15.2 && ./bootstrap && make -j4 && make install
cd ~/

#       Install telegram 
echo; echo '"\n"------------ Insall Telegram ------------'
apt install -y telegram-desktop

#       Install Sticker notes
echo; echo " \n ------------ Insall Sticker notes ------------"
apt instal -yl indicator-stickynotes

#       Insall Flatpack for more applications
echo
echo "------------ Insall Flatpack ------------" 
# check if Flatpak support is enabled or not
apt install -y flatpak
#  install the Flatpak plugin for GNOME Software Center.
apt install -y gnome-software-plugin-flatpak
#  add the Flathub repository that will give you access to all the applications available on Flathub website
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#       Install tweak tool
echo; echo "------------ Install Tweak tools ------------" 
apt install -y gnome-tweak-tool

#        Prolong your battery and prevent overheating
echo; echo "------------ Install for batary ------------" 
# install TLP
apt install -y tlp tlp-rdw
# start tlp
tlp start

#       Inable night mode
echo; echo "------------ Inable night-mode ------------" 
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

#       
apt autoremove
