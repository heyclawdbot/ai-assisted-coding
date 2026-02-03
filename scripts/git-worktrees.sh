#!/bin/bash
# Git Worktree helpers for concurrent agent work
# Source: DHH (https://gist.github.com/dhh/18575558fc5ee10f15b6cd3e108ed844)
#
# Usage:
#   ga <branch-name>  - Create a new worktree and branch, cd into it
#   gd                - Remove current worktree and its branch
#
# Add to your .bashrc or .zshrc:
#   source /path/to/git-worktrees.sh

# Create a new worktree and branch from within current git directory.
ga() {
    if [[ -z "$1" ]]; then
        echo "Usage: ga [branch name]"
        return 1
    fi

    local branch="$1"
    local base="$(basename "$PWD")"
    local path="../${base}--${branch}"

    git worktree add -b "$branch" "$path"
    
    # Optional: trust mise config in new worktree (remove if not using mise)
    if command -v mise &> /dev/null; then
        mise trust "$path"
    fi

    cd "$path"
}

# Remove worktree and branch from within active worktree directory.
gd() {
    # Requires gum for confirmation prompt
    # Install: brew install gum (or remove the confirm for no prompt)
    
    if command -v gum &> /dev/null; then
        if ! gum confirm "Remove worktree and branch?"; then
            return 0
        fi
    else
        read -p "Remove worktree and branch? (y/N) " -n 1 -r
        echo
        if [[ ! $REPLY =~ ^[Yy]$ ]]; then
            return 0
        fi
    fi

    local cwd worktree root branch

    cwd="$(pwd)"
    worktree="$(basename "$cwd")"

    # Split on first `--`
    root="${worktree%%--*}"
    branch="${worktree#*--}"

    # Protect against accidentally nuking a non-worktree directory
    if [[ "$root" != "$worktree" ]]; then
        cd "../$root"
        git worktree remove "$worktree" --force
        git branch -D "$branch"
    else
        echo "Error: Not in a worktree (directory name doesn't contain '--')"
        return 1
    fi
}
