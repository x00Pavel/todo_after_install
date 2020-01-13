#!/bin/sh

# add VS code pakages installation (see google)
# add setting up Vim (vimrc file) in /usr/share/vim/vimrc 
# in future extende for modes such as "verbose" where ask user if isntall and add ability to choose programs 

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
(snap --version >> /dev/null && echo "${bold}------------ Snap is installed ------------${offbold}") || apt install snap

#       install Visual Studio code
echo "\n${bold}------------ Insall Visual Studio code ------------${offbold}"
# download Microsoft GPG key
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
#  install the key 
mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
# Add the VS Code repository to your system
sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
# installin vs code
apt update
snap install code 

#       Install Chromium
echo "\n${bold}------------ Install Chromium ------------${offbold}"
apt install -y chromium-browser
#       Install Skype
echo; echo "\n${bold}------------ Install Skype ------------${offbold}"
apt install gdebi-core
cd apps
wget https://repo.skype.com/latest/skypeforlinux-64.deb
gdebi -y skypeforlinux-64.deb

#       Install SMplayer
echo; echo "------------ Install SMplayer ------------${offbold}"
apt install -y smplayer

#       Install virtual box 
echo; echo "------------ Insall VirtualBox ------------${offbold}"
apt install -y virtualbox
# install extantion pack 
wget https://download.virtualbox.org/virtualbox/6.1.0/virtualbox-6.1_6.1.0-135406~Ubuntu~bionic_amd64.deb && dpkg -i virtualbox-6.1_6.1.0-135406_Ubuntu_bionic_amd64.deb
apt autoremove

#       Install Discord
echo; echo "------------ Insall Discord ------------${offbold}"
snap install -y discord

#       Install vim 
echo; echo "------------ Insall Vim ------------${offbold}"
apt install -y vim
vim /usr/share/vim/vimrc

#       Install Python3
echo; echo "------------ Insall Python3 ------------${offbold}"
(python3 --version && "------------ Python3 is installed ------------${offbold}" ) || apt install python3

#       Install CMake
echo; echo "${bold}------------ Insall CMake ------------${offbold}"
wget https://github.com/Kitware/CMake/releases/download/v3.15.2/cmake-3.15.2.tar.gz
tar -zxvf cmake-3.15.2.tar.gz ~/apps
mv cmake-3.15.2.tar.gz ~/apps
cd apps && cd cmake-3.15.2 && ./bootstrap && make -j4 && make install
cd ~/

#       Install telegram 
echo "\n${bold}------------ Insall Telegram ------------"
apt install -y telegram-desktop

#       Install Sticker notes
echo "\n${bold}------------ Insall Sticker notes ------------"
apt instal -yl indicator-stickynotes

#       Insall Flatpack for more applications
echo "\n${bold}------------ Insall Flatpack ------------${offbold}" 
# check if Flatpak support is enabled or not
apt install -y flatpak
#  install the Flatpak plugin for GNOME Software Center.
apt install -y gnome-software-plugin-flatpak
#  add the Flathub repository that will give you access to all the applications available on Flathub website
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#       Install tweak tool
echo; echo "\n${bold}------------ Install Tweak tools ------------${offbold}" 
apt install -y gnome-tweak-tool

#        Prolong your battery and prevent overheating
echo; echo "\n${bold}------------ Install for batary ------------${offbold}" 
# install TLP
apt install -y tlp tlp-rdw
# start tlp
tlp start

#       Inable night mode
echo "\n${bold}------------ Inable night-mode ------------${offbold}" 
gsettings set org.gnome.settings-daemon.plugins.color night-light-enabled true

#       
apt autoremove
