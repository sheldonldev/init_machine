#!/bin/bash

clone_repo() {
    local max_retries=$1
    local repo_url=$2
    local repo_name=$3
    if [ ! -d "$HOME/$repo_name" ]; then
        local retry=0
        while [ $retry -lt $max_retries ]; do
            git clone $repo_url $HOME/$repo_name && break
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
max_retries=3

clone_repo $max_retries https://github.com/sheldonldev/jampy_cli.git jampy_cli
clone_repo $max_retries https://github.com/sheldonldev/jampy_util_common.git jampy_util_common
clone_repo $max_retries git@github.com:sheldonldev/clash.git clash
clone_repo $max_retries git@github.com:sheldonldev/swift.git swift
clone_repo $max_retries git@github.com:sheldonldev/swift_workspace.git swift_workspace

echo "Done!"
