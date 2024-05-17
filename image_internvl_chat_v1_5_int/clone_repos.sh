#!/bin/bash

source $(pwd)/func/clone_repo.sh

# # Add command like this example
# clone_repo $max_retries git@github.com:sheldonldev/clash.git clash

clone_repo git@github.com:sheldonldev/jampy_cli.git
clone_repo git@github.com:sheldonldev/jampy_util_common.git
clone_repo git@github.com:sheldonldev/swift_workspace.git
clone_repo git@github.com:sheldonldev/swift.git

echo "Done!"
