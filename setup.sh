#!/usr/bin/env bash

USER_NAME=$1

sudo apt-get update && sudo apt install unzip -y

wget http://marmara.io/guifiles/Linux-MCL.zip
unzip Linux-MCL.zip
sudo chmod +x komodod komodo-cli fetch-params.sh
./fetch-params.sh

sudo ln -s /home/$USER_NAME/komodod /usr/local/bin/komodod
sudo ln -s /home/$USER_NAME/komodo-cli /usr/local/bin/komodo-cli

# remove apt-cache
sudo apt-get clean

# clear the Bash History
cat /dev/null > ~/.bash_history && history -c
