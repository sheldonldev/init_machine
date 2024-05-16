#!/bin/bash

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
clone_repo() {
    local max_retries=$1
    local repo_url=$2
    local repo_name=$3
    if [ ! -d "$HOME/$repo_name" ]; then
        local retry=0
        while [ $retry -lt $max_retries ]; do
            git clone $repo_url && break
            retry=$((retry + 1))
            echo "Retry: $retry"
            sleep 3
        done
        if [ ! -d "$HOME/$repo_name" ]; then
            echo "$repo_name clone FAILED!"
        else
            echo "$repo_name clone successfully."
        fi
    else
        echo "$repo_name already exists."
    fi
}

apt install tmux proxychains

max_retries=3
git config --global http.version HTTP/1.1
clone_repo $max_retries https://github.com/sheldonldev/jampy_cli.git jampy_cli
clone_repo $max_retries https://github.com/sheldonldev/jampy_util_common.git jampy_util_common

conda create -n jam python=3.10 -y
conda run -n jam pip install -e "$HOME/jampy_cli"
conda run -n jam pip install -e "$HOME/jampy_util_common"

echo "Generating SSH-KEY..."
conda run -n jam jam git ia

echo ">>> Finished. Do following steps manually >>>"
echo "  - add SSH-KEY to your remote repo."
