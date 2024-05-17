#/bin/bash

install_editable_repo() {
    repo_name=$1
    part=$2
    if [ ! -d "$HOME/$repo_name" ]; then
        echo ">>> $HOME/$repo_name NOT FOUND!"
        exit 1
    else
        if [ -z $part ]; then
            package="$HOME/$repo_name"
        else
            package="$HOME/$repo_name[$part]"
        fi
        echo ">>> Installing $package..."
        pip install -e $package
        echo "$repo_name installed!"
    fi
}

install_editable_repo jampy_cli
install_editable_repo jampy_util_common
install_editable_repo swift llm
install_editable_repo swift_workspace

