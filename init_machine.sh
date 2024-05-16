#!/bin/bash

user_name=sheldonldev
user_email=xiadanli0320@gmail.com

sudo apt -y update
sudo apt -y install proxychains
apt install -y build-essential

source ~/.bashrc
# Check if conda command is available
if ! command -v conda &>/dev/null; then
    echo "conda not found. Installing miniconda..."

    mkdir -p ~/miniconda3
    wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
    bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
    rm -rf ~/miniconda3/miniconda.sh

    ~/miniconda3/bin/conda init bash
    source ~/.bashrc
    echo "miniconda installed successfully!"
else
    echo "conda already installed."
fi

source ~/.bashrc

# Check if git command is available
if ! command -v git &>/dev/null; then
    echo "git not found. Installing git..."

    apt -y install git
else
    echo "git already installed"
fi

# install my dev tools
max_retries=3

git config --global user.name $user_name
git config --global user.email $user_email

ssh-keygen -t rsa -C $user_email
cat ~/.ssh/id_rsa.pub

echo ">>> Finished. Do following steps manually >>>"
echo "  - add SSH-KEY to your remote repo."
echo "  - modify and run 'clone_repos.sh' for your target repos."
