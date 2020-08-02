#!/bin/bash

# add VS code pakages installation (see google)
# Configuring ttf-mscorefonts-installer see how to confirme from terminal


bold=`tput smso`
dashs="------------"
offbold=`tput rmso`
all=true

install_app(){
    if $all ; then
        eval $2
    else
        while true; do
            read -p "Install {$1}?" yn
            case $yn in
                [Yy]* ) eval $2 break;;
                [Nn]* ) break;;
                * ) echo "Please answer yes or no.";;
            esac
        done
    fi
}

echo -e "\n${bold}${dashs} Update and upgrade all installed packages ${dashs}${offbold}"
sudo apt update && sudo apt upgrade -y 

#       adding multivers and univers repositories 
echo -e "\n${bold}${dashs} Add repositories ${dashs}${offbold}"
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo add-apt-repository restricted 

# mkdir ~/apps
# cd ~/apps
apps="Preload - program for storiing some data in RAM
Git - version controll system
Visual Studi Code - code editor
VSCode extansions:
\tC/C++ extansion
\tSpell cheker for english and czech language
\tTemplates for C language
Chromium - open-source Chrome brouser
Skype - everyone knows waht is this
VLC player - media player
Virtual Box - virtualization solution
Discord - sotial network for message and vouice chats
Vim - text editor in terminal
Python3.8 - interpret for Python language
Telegram - messenger
Gnome-tweak-tools - extansions to basic gnome settingn
Make - system for buildiong projects\n"


echo -e "${bold}This script is going to install following programs${offbold}\n${apps}"
while true; do
    read -p "Install all of this programs? " yn
    case $yn in
        [Yy]* ) all=true; break;;
        [Nn]* ) all=false; break;;
        * ) echo "Please answer yes or no.";;
    esac
done


#       Install preload for storing fiels on RAM
echo -e "\n${bold}${dashs} Install preload for storing fiels on RAM ${dashs}${offbold}"
install_app "Preload" "sudo apt-get install preload"


#       Install snap
echo -e "\n${bold}${dashs} Check Snap is installed ${dashs}${offbold}"
(snap --version >> /dev/null && echo "${bold}Snap is already installed${offbold}") || install_app "Snap" "sudo apt install -y snap"


#       install Git
echo -e "\n${bold}${dashs} Git ${dashs}${offbold}"
(git --version >> /dev/null && echo "${bold}Git is already installed${offbold}") || install_app "Git" "sudo apt install -y git"


#       install Visual Studio code
echo -e "\n${bold}${dashs} Visual Studio code ${dashs}${offbold}"
install_app "Visual Studio Code" "sudo snap install code --classic"
if $all ; then 
    code --install-extension ms-vscode.cpptools;
    code --install-extansion austin.code-gnu-global;
    code --install-extansion streetsidesoftware.code-spell-checker;
    code --install-extansion streetsidesoftware.code-spell-checker-czech;
    code --install-extansion streetsidesoftware.code-spell-checker-czech;
else
    while true; do
        read -p "Install basic exntasions for Visual Studio Code?" yn
        case $yn in
            [Yy]* ) code --install-extension ms-vscode.cpptools;
                    code --install-extansion austin.code-gnu-global;
                    code --install-extansion streetsidesoftware.code-spell-checker;
                    code --install-extansion streetsidesoftware.code-spell-checker-czech;
                    code --install-extansion streetsidesoftware.code-spell-checker-czech;
                    break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

if $all ; then 
    cp ~/todo_after_install/c.json ~/.vscode/extansions/
else
    while true; do
        read -p "Install templates for C language?" yn
        case $yn in
            [Yy]* ) cp ~/todo_after_install/c.json ~/.vscode/extansions/; break;;
            [Nn]* ) break;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

#       Install Chromium
echo -e "\n${bold}${dashs} Chromium ${dashs}${offbold}"
install_app "Chromium" "sudo snap install skype --classic"


#       Install Skype
echo -e "\n${bold}${dashs} Skype ${dashs}${offbold}"
install_app "Skype" "sudo snap install skype --classic"

#       Install SMplayer
echo -e "\n${bold}${dashs} VLC player ${dashs}${offbold}"
install_app "VLC player" "sudo snap install vlc"


#       Install virtual box 
echo -e "\n${bold}${dashs} VirtualBox ${dashs}${offbold}"
install_app "Virtual Box" "sudo apt install -y virtualbox"


#       Install Discord
echo -e "\n${bold}${dashs} Discord ${dashs}${offbold}"
install_app "Discord" "sudo snap install discord"


#       Install vim 
echo -e "\n${bold}${dashs} Insall Vim ${dashs}${offbold}"
install_app "Vim" "sudo snap install vim-editor"

# setup for numbers of line and etc

# echo -e "set showmatch\nset nu\nset mouse=a\nset smartcase\nset background=dark" >> 

#       Install Python3
echo -e "\n${bold}${dashs} Python3 ${dashs}${offbold}"
(python3 --version && "\n${bold}${dashs} Python3 is installed ${dashs}${offbold}" ) || install_app "Python3" "sudo snap install python38"

#       Install CMake
echo -e "\n${bold}${dashs} Make ${dashs}${offbold}"
install_app "Make" "sudo apt install -y make"
sudo apt install -y build-essential

#       Install telegram 
echo -e "\n${bold}${dashs} Telegram ${dashs}${offbold}"
install_app "Telegram" "sudo snap install telegram-desktop"


#       Install tweak tool
echo -e "\n${bold}${dashs} Tweak tools ${dashs}${offbold}" 
install_app "Gnome-tweak-tool" "sudo apt install -y gnome-tweak-tool"


echo -e "\n${bold}${dashs} Autoremove unnessary packages ${dashs}${offbold}"
sudo apt autoremove
sudo apt clean
