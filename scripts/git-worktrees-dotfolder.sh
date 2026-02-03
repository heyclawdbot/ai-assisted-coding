#!/bin/bash
# Git worktree helpers - keeps worktrees in .trees/ folder
# Modified version that keeps worktrees inside the repo (cleaner)
#
# Usage:
#   ga <branch-name>  - Create new worktree in .trees/<branch>, cd into it
#   gd                - Remove current worktree and its branch (run from inside .trees/)
#   gl                - List all worktrees
#
# Add to your .bashrc or .zshrc:
#   source /path/to/git-worktrees-dotfolder.sh
#
# Don't forget to add .trees/ to your .gitignore!

# Get the main repo root (works from main repo or any worktree)
_git_main_root() {
  local git_common_dir
  git_common_dir="$(git rev-parse --git-common-dir 2>/dev/null)"

  if [[ -z "$git_common_dir" ]]; then
    return 1
  fi

  # git-common-dir returns the .git folder, get its parent
  dirname "$(cd "$git_common_dir" && pwd)"
}

# Create a new worktree and branch
ga() {
  if [[ -z "$1" ]]; then
    echo "Usage: ga [branch name]"
    return 1
  fi

  local branch="$1"
  local main_root
  main_root="$(_git_main_root)"

  if [[ -z "$main_root" ]]; then
    echo "Error: Not in a git repository"
    return 1
  fi

  mkdir -p "$main_root/.trees"
  git worktree add -b "$branch" "$main_root/.trees/$branch" && cd "$main_root/.trees/$branch"
}

# Remove worktree and branch (run from within a .trees/ worktree)
gd() {
  local cwd branch main_root

  cwd="$(pwd)"

  # Check if we're inside a .trees/ directory
  if [[ "$cwd" != *"/.trees/"* ]]; then
    echo "Error: Not in a .trees/ worktree directory"
    return 1
  fi

  branch="$(basename "$cwd")"
  main_root="$(_git_main_root)"

  echo "Remove worktree and branch '$branch'? (y/n)"
  read -r confirm
  if [[ "$confirm" == "y" ]]; then
    cd "$main_root" || return 1
    git worktree remove ".trees/$branch" --force
    git branch -D "$branch"
    echo "Removed worktree and branch: $branch"
  fi
}

# List all worktrees
gl() {
  local main_root
  main_root="$(_git_main_root)"
  git -C "$main_root" worktree list
}
