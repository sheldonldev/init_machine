#!/bin/bash

source ($pwd)/_clone_repo.sh

clone_repo $max_retries git@github.com:sheldonldev/clash.git clash
bash ~/clash/install.sh

echo "Done! You can call clash"
