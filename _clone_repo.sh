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
            echo "repo $repo_name clone FAILED!"
        else
            echo "repo $repo_name clone successfully."
        fi
    else
        echo "$HOME/$repo_name already exists."
    fi
}
max_retries=3
