clone_repo() {
    local repo_url=$1
    if [ -z $2 ]; then
        local repo_name=$(basename -s .git "$repo_url")
    else
        local repo_name=$2
    fi
    local max_retries=3
    if [ ! -d "$HOME/$repo_name" ]; then
        local retry=0
        while [ $retry -lt $max_retries ]; do
            git clone $repo_url $HOME/$repo_name && break
            retry=$((retry + 1))
            echo "Retry: $retry"
            sleep 3
        done
        if [ ! -d "$HOME/$repo_name" ]; then
            echo "repo $repo_name clone FAILED!"
        else
            echo "repo $repo_name clone successfully."
        fi
    else
        echo "$HOME/$repo_name already exists."
    fi
}
