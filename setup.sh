#!/usr/bin/env bash

USER_NAME=$1

sudo apt-get update && sudo apt install unzip ufw ssh libgomp1 -y

echo y | sudo ufw enable
sudo ufw allow "OpenSSH" && sudo ufw allow 33824

mkdir -p /home/$USER_NAME/.komodo/MCL
sudo chown $USER_NAME: /home/$USER_NAME/.komodo
sudo chown $USER_NAME: /home/$USER_NAME/.komodo/MCL

wget http://www.marmara.io/guifiles/Linux-MCL-HF.zip
unzip Linux-MCL-HF.zip
sudo chmod +x komodod komodo-cli fetch-params.sh
./fetch-params.sh
rm -f Linux-MCL-HF.zip

sudo ln -s /home/$USER_NAME/komodod /usr/local/bin/komodod
sudo ln -s /home/$USER_NAME/komodo-cli /usr/local/bin/komodo-cli

# remove apt-cache
sudo apt-get clean

# clear the Bash History
cat /dev/null > ~/.bash_history && history -c
