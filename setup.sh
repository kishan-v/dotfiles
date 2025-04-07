#!/bin/zsh

# Get the absolute path of the current git repo
repo_path=$(git rev-parse --show-toplevel 2>/dev/null)

if [ $? -ne 0 ]; then
  echo "[ERROR] Not inside a Git repository."
  exit 1
fi

# Prompt for setting up each tool e.g. NeoVim (Y/n), iterm2 (Y\n), etc.

# Check stow is installed else quit
if which stow >/dev/null 2>&1; then
  echo "[DEBUG] Stow is installed"
else
  echo "[ERROR] Stow is NOT installed"
  exit 1
fi

# For each tool, check if the host already has a configuration in the default location, and if so say to backup and clear this configuration, then cancel setting up this tool, and proceed to the next

# Function to backup a path with timestamp suffix
backup_path() {
  local path="$1"
  local timestamp=$(date +%Y%m%d_%H%M%S)
  local backup="${path}.bak.${timestamp}"

  if [ -e "$path" ]; then
    echo "Backing up $path to $backup..."
    mv "$path" "$backup"
    return $?
  else
    echo "No existing $path found, skipping backup."
    return 0
  fi
}

# -----------------------------------------------------------------------

## Neovim setup symlinks

cd "$repo_path" || {
  echo "[ERROR] Failed to cd into repo path"
  exit 1
}

backup_path ~/.config/nvim  # tilde is not expanded when enclosed in quotes

if [ $? -ne 0 ]; then
  echo "[ERROR] Failed to backup existing nvim config"
  exit 1
else
  echo "[DEBUG] Successfully backed up existing nvim config"
fi

stow nvim

if [ $? -ne 0 ]; then
  echo "[ERROR] Failed to stow nvim"
  exit 1
else
  echo "[DEBUG] Successfully stowed nvim"
fi

# install plugins and run Copilot Auth if possible
# Set export EDITOR='nvim' export VISUAL='nvim'
# git config --global core.editor nvim

# -----------------------------------------------------------------------

## iterm2 setup symlink

# -----------------------------------------------------------------------

## zsh / oh-my-zsh setup

# -----------------------------------------------------------------------

## tmux setup
cd "$repo_path" || {
  echo "[ERROR] Failed to cd into repo path"
  exit 1
}

# Symlink tmux config using stow
if command -v stow >/dev/null 2>&1; then
  stow tmux
else
  echo "Stow not installed, falling back to manual symlinks"
  ln -sf "$repo_path/tmux/.tmux.conf" ~/.tmux.conf
  ln -sfn "$repo_path/tmux/.tmux" ~/.tmux
fi

if [ $? -ne 0 ]; then
  echo "[ERROR] Failed to stow tmux"
  exit 1
else
  echo "[DEBUG] Successfully stowed tmux"
fi

# Install TPM plugins
if [ -d ~/.tmux/plugins/tpm ]; then
  ~/.tmux/plugins/tpm/bin/install_plugins
else
  echo "Installing TPM..."
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  ~/.tmux/plugins/tpm/bin/install_plugins
fi

# -----------------------------------------------------------------------

## karabiner setup

cd "$repo_path" || {
  echo "[ERROR] Failed to cd into repo path"
  exit 1
}

backup_path ~/.config/karabiner  # tilde is not expanded when enclosed in quotes

if [ $? -ne 0 ]; then
  echo "[ERROR] Failed to backup existing karabiner config"
  exit 1
else
  echo "[DEBUG] Successfully backed up existing karabiner config"
fi

stow karabiner

if [ $? -ne 0 ]; then
  echo "[ERROR] Failed to stow karabiner"
  exit 1
else
  echo "[DEBUG] Successfully stowed karabiner"
fi

