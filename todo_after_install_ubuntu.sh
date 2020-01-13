#!/bin/sh

# add VS code pakages installation (see google)
# Configuring ttf-mscorefonts-installer see how to confirme from terminal


bold=`tput smso`
offbold=`tput rmso`

apt update #&& apt upgrade -y 

#       adding multivers and univers repositories 
echo -e "\n${bold}------------ Add repositories ------------${offbold}"
add-apt-repository universe
add-apt-repository multiverse
add-apt-repository restricted 

mkdir ~/apps
cd ~/apps
#       Install media codecs
echo -e "\n${bold}------------ Insall media codecs ------------${offbold}"
apt install -y ubuntu-restricted-extras 

#       Install preload for storing fiels on RAM
apt-get install preload

#       Install snap
echo -e "\n${bold}------------ Insall snap ------------${offbold}"
(snap --version >> /dev/null && echo "${bold}------------ Snap is installed ------------${offbold}") || sudo apt install snap

#       install Visual Studio code
echo -e"\n${bold}------------ Insall Visual Studio code ------------${offbold}"
apt install software-properties-common apt-transport-https wget 
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt update
apt install -y code

#       Install Chromium
echo -e "\n${bold}------------ Install Chromium ------------${offbold}"
apt install -y chromium-browser

#       Install Skype
echo -e "\n${bold}------------ Install Skype ------------${offbold}"
apt install gdebi-core

wget https://repo.skype.com/latest/skypeforlinux-64.deb
gdebi skypeforlinux-64.deb

#       Install SMplayer
echo -e "\n${bold}------------ Install SMplayer ------------${offbold}"
apt install -y smplayer

#       Install virtual box 
echo -e "\n${bold}------------ Insall VirtualBox ------------${offbold}"
apt install -y virtualbox-6.1
# install extantion pack 
#wget https://download.virtualbox.org/virtualbox/6.1.0/virtualbox-6.1_6.1.0-135406~Ubuntu~bionic_amd64.deb && dpkg -i virtualbox-6.1_6.1.0-135406_Ubuntu_bionic_amd64.deb
#apt autoremove
#https://download.virtualbox.org/virtualbox/6.1.0/Oracle_VM_VirtualBox_Extension_Pack-6.1.0.vbox-extpack

#       Install Discord
echo -e "\n${bold}------------ Insall Discord ------------${offbold}"
snap install discord

#       Install vim 
echo -e "\n${bold}------------ Insall Vim ------------${offbold}"
apt install -y vim
# setup for numbers of line and etc
echo -e "set showmatch\nset nu\nset mouse=a\nset smartcase\nset background=dark" >> /usr/share/vim/vimrc

#       Install Python3
echo -e "\n${bold}------------ Insall Python3 ------------${offbold}"
(python3 --version && "\n${bold}------------ Python3 is installed ------------${offbold}" ) || apt install python3

#       Install CMake
echo -e "\n${bold}------------ Insall CMake ------------${offbold}"
wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2.tar.gz
tar -zxvf cmake-3.15.2.tar.gz 
cd cmake-3.15.2 && ./bootstrap && make -j4 && make install
cd ..

#       Install telegram 
echo -e "\n${bold}------------ Insall Telegram ------------${offbold}"
apt install -y telegram-desktop

#       Install Sticker notes
echo -e "\n${bold}------------ Insall Sticker notes ------------${offbold}"
apt instal -yl indicator-stickynotes

#       Insall Flatpack for more applications
echo -e "\n${bold}------------ Insall Flatpack ------------${offbold}" 
# check if Flatpak support is enabled or not
apt install -y flatpak
#  install the Flatpak plugin for GNOME Software Center.
apt install -y gnome-software-plugin-flatpak
#  add the Flathub repository that will give you access to all the applications available on Flathub website
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#       Install tweak tool
echo -e "\n${bold}------------ Install Tweak tools ------------${offbold}" 
apt install -y gnome-tweak-tool

#        Prolong your battery and prevent overheating
echo -e "\n${bold}------------ Install for batary ------------${offbold}" 
# install TLP
apt install -y tlp tlp-rdw
# start tlp
tlp start

#       Inable night mode
echo -e "\n${bold}------------ Inable night-mode ------------${offbold}" 
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

#       
echo -e "\n${bold}------------ Autoremove unnessary packages ------------${offbold}"
apt autoremove

#	Exit from root 
echo -e "\n${bold}------------ Exit from root ------------${offbold}"
code --install-extension Shan.code-settings-sync
# code --install-extension ms-vscode.cpptools
# code --install-extansion ms-vscode.atom-keybindings
# code --install-extansion austin.code-gnu-global
# code --install-extansion streetsidesoftware.code-spell-checker
# code --install-extansion streetsidesoftware.code-spell-checker-czech
# code --install-extansion twxs.cmake-0.0.17


