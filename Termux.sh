welcome(){
echo -e "
The process will take 200-300mb to download files
and will take around 900mb of storage after unpack.
"
}

string(){
if [ $HOME == "/data/data/com.termux/files/home" ]; then
  if [ $TERMUX_APK_RELEASE == "F_DROID" ]; then
    echo -e "1.Updating packages"
    echo -e "    ATTENTION\NChange default termux mirror to Single North America."
    read -p "Press Enter to proceed
    >"
    termux-change-repo
    yes|pkg upgrade 2> /dev/null /dev/null
    apt -qq update -y 2> /dev/null /dev/null
    apt -qq upgrade -y 2> /dev/null /dev/null
    echo -e "- Done"
    echo -e "Installing Python"
    apt -qq install -y git python python-pip 2> /dev/null /dev/null
    pip install -q -U setuptools wheel tgcrypto
    echo -e "- Done"
  else
    echo -e "Termux from Playstore not supported.\n(⁠ノ⁠ಠ⁠益⁠ಠ⁠)⁠ノ"
    exit
  fi
else
  echo -e "Not a termux env
  \nInstall python, pip, git and then run command again if next part fails."
fi

echo -e "3.Clonning String Repo"
if [ -d "string" ]; then 
  echo -e "A folder named string exists.\nRun command again after deleting it"
  exit
fi
git clone -q https://github.com/ux-termux/string string
echo -e "- Done"

echo -e "4.Starting Generator"
cd string
bash gen
}

welcome
string
