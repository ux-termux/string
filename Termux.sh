#!/bin/bash

welcome(){
    if [ $HOME == "/data/data/com.termux/files/home" ]; then
        if ! [ $TERMUX_APK_RELEASE == "F_DROID" ]; then
            echo -e "Termux from Playstore not supported.\n(⁠ノ⁠ಠ⁠益⁠ಠ⁠)⁠ノ"
            exit
        fi
        termux_env=true
        echo -e "The package installation process will take 200-300mb to download files and will take around 900mb of storage after unpack."
    else
        echo -e "Not a termux env
Install python, pip if the script is unable to install in the next step."
    fi
}

update(){
    clear
    echo "1.Updating packages"
    echo -e "ATTENTION\nChange default termux mirror to Single North America."
    read -p "Press Enter to proceed
>"
    termux-change-repo
    yes|pkg upgrade
    apt update -y
    clear
    echo -e "- Done."
}

install_py(){
    echo -e "2. Installing Python"
    if [ $termux_env ] ; then
        apt install -y python python-pip
    else
        apt install -y python3 python3-pip
    fi
    echo -e "Installing Pypi packages."
    pip install -q -U setuptools wheel tgcrypto
    echo -e "- Done"
}

start_gen(){
    clear
    echo -e "4. Fetching Generator script."
    python3 -c "$(curl -fsSL https://raw.githubusercontent.com/ux-termux/string/main/gen.py)"
}

options(){
    echo -e "Select an Option :
1. Update packages ( For termux )
2. Install Python and PIP
3. Do Both and Start Generator ( Recommended )
4. Skip Both and Start Generator
5. Exit"
}

clear
welcome
options

while true; do
    read -p "> " inp
    if [ -z $inp ]; then
        :
    elif [ $inp == "1" ]; then
        update
        options
    elif [ $inp == "2" ]; then
        install_py
        options
    elif [ $inp == "3" ]; then
        update
        install_py
        start_gen
        exit 
    elif [ $inp == "4" ]; then 
        start_gen
        exit 
    elif [ $inp == "5" ];then
        exit
    else
        echo "Wrong Input."
    fi
done
