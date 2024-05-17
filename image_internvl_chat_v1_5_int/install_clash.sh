#!/bin/bash

source $(pwd)/func/clone_repo.sh

clone_repo git@github.com:sheldonldev/clash.git
bash ~/clash/install.sh

echo "Done! You can call clash"
