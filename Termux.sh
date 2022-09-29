outt() {
    { "$@" || return $?; } | while read -r line; do
        :
    done
}

welcome(){
echo -e "
The process will take 200-300mb to download files
and will take around 900mb of storage after unpack.
"
}

update(){
echo -e "1.Updating packages"
yes|outt apt update
yes|outt apt dist-upgrade
echo -e "- Done"
}

install(){
echo -e "2.Installing Requirements,
  This may take upto 5 minutes or more, depending 
  on your internet speed and device capabilities."

outt "$(
apt install -y git wget python
pip install python-dotenv
pip install wheel
pip install tgcrypto
pip install poetry-core==1.0.7
pip install --upgrade pip)"
echo -e "- Done"
}

clone(){
echo -e "3.Clonning String Repo"
outt rm -rf string
outt git clone -q https://github.com/ux-termux/string string
echo -e "- Done"
}

start(){
echo -e "4.Starting Generator"
cd string
sleep 2
bash gen
}

welcome
update 2> /dev/null
install 2> /dev/null
clone
start
