#!/bin/bash

welcome(){
echo -e "
The package installation process will take 200-300mb to download files
and will take around 900mb of storage after unpack.
"
}

update(){
clear
if [ $HOME == "/data/data/com.termux/files/home" ]; then
  if [ $TERMUX_APK_RELEASE == "F_DROID" ]; then
    echo -e "1.Updating packages"
    echo -e "ATTENTION\nChange default termux mirror to Single North America."
    read -p "Press Enter to proceed
>"
    termux-change-repo
    yes|pkg upgrade
    apt update -y
    apt upgrade -y
    echo -e "- Done"
  else
    echo -e "Termux from Playstore not supported.\n(⁠ノ⁠ಠ⁠益⁠ಠ⁠)⁠ノ"
    exit
  fi
else
  echo -e "Not a termux env
  \nInstall python, pip, git and then run command again if next part fails."
fi
}

install_py(){
clear
echo -e "2. Installing Python"
apt install -y python python-pip
pip install -q -U setuptools wheel tgcrypto
echo -e "- Done"
}

start_gen(){
clear
echo -e "4.Starting Generator"
python -c "$(curl -fsSL https://raw.githubusercontent.com/ux-termux/string/main/gen.py)"
}

clear
welcome
while true; do
    echo -e "Select an Option:
1. Update packages ( For termux )
2. Install Python and PIP
3. Do both and start Generator ( Recommended )
4. Skip Both and Start Generator
  ( Only skip if your termux installation is not fresh and Packages are installed already. )
5. Exit"
    read -p "> " inp
    if [ -z $inp ]; then
        pass
    elif [ $inp == "1" ]; then
        update
    elif [ $inp == "2" ]; then
        install_py
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