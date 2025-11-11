#/bin/zsh

# Git 'Mirror' Setup Script
# This script sets up a git repository to push to both origin and mirror repos

echo "=== Git 'Mirror' Setup ==="
if [ $# -eq 2 ]; then
    origin_repo="$1"
    mirror_repo="$2"
    echo "- Origin: $origin_repo"
    echo "- Mirror: $mirror_repo"
elif [ $# -eq 1 ]; then
    echo "Error: Please provide both origin and mirror URLs, or run without arguments for interactive mode."
    echo "Usage: $0 <origin_repo_url> <mirror_repo_url>"
    exit 1
elif [ $# -gt 2 ]; then
    echo "Error: Too many arguments provided."
    echo "Usage: $0 <origin_repo_url> <mirror_repo_url>"
    exit 1
else
    read -p "Enter the origin repository URL: " origin_repo
    if [ -z "$origin_repo" ]; then
        echo "Error: origin repository URL cannot be empty."
        exit 1
    fi
    read -p "Enter the mirror repository URL: " mirror_repo
    if [ -z "$mirror_repo" ]; then
        echo "Error: mirror repository URL cannot be empty."
        exit 1
    fi
fi

if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Error: Not in a git repository. Please run this script from within a git repository."
    exit 1
fi

echo
echo "Setting up git remotes..."

if git remote get-url origin > /dev/null 2>&1; then
    echo "removed existing origin remote..."
    git remote remove origin
fi

echo "adding remotes: $origin_repo"
git remote add origin "$origin_repo"
git remote set-url --add --push origin "$origin_repo"
git remote set-url --add --push origin "$mirror_repo"
echo "=== Setup Complete ==="
git remote -v
