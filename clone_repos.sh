#!/bin/bash

source _clone_repo.sh

max_retries=3
# # Add command like this example
# clone_repo $max_retries git@github.com:sheldonldev/clash.git clash

clone_repo $max_retries git@github.com:sheldonldev/jampy_util_common.git
clone_repo $max_retries git@github.com:sheldonldev/swift_workspace.git
clone_repo $max_retries git@github.com:sheldonldev/swift.git

echo "Done!"
