#!/usr/bin/env bash
#
# Bootstrap these dotfiles on a fresh macOS machine.
# Idempotent — safe to re-run; existing pieces are skipped.
#
#   ./install.sh
#
set -euo pipefail

# Always run from the repo root (where this script lives).
cd "$(dirname "${BASH_SOURCE[0]}")"

info() { printf '\n\033[1;34m==>\033[0m %s\n' "$1"; }

clone_if_missing() { # url dest
  if [ ! -d "$2" ]; then
    info "Cloning $(basename "$2")"
    git clone --depth=1 "$1" "$2"
  fi
}

# 1. Homebrew
if ! command -v brew >/dev/null 2>&1; then
  info "Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"   # add brew to PATH for this session (Apple Silicon)
fi

# 2. Packages
info "Installing packages from Brewfile"
brew bundle --file=./Brewfile

# 3. zsh plugins (git-cloned, not brew — see .zshrc)
mkdir -p "$HOME/.zsh"
clone_if_missing https://github.com/zsh-users/zsh-autosuggestions     "$HOME/.zsh/zsh-autosuggestions"
clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting "$HOME/.zsh/zsh-syntax-highlighting"

# 4. tmux plugin manager (tpm)
clone_if_missing https://github.com/tmux-plugins/tpm "$HOME/.config/tmux/plugins/tpm"

# 5. secrets file (real values are gitignored)
if [ ! -f "$HOME/.secrets.zsh" ]; then
  info "Creating ~/.secrets.zsh from template"
  cp zsh/.secrets.zsh.example "$HOME/.secrets.zsh"
  chmod 600 "$HOME/.secrets.zsh"
fi

# 6. Symlink everything with GNU Stow
info "Stowing dotfiles into \$HOME"
stow --verbose --target="$HOME" --restow -- */

info "Done. Next steps:"
cat <<'EOF'
  - Start a new shell:            exec zsh
  - Fill in real tokens:          $EDITOR ~/.secrets.zsh
  - nvim plugins install on first launch (lazy.nvim); run :Lazy sync if needed
  - In tmux, press <prefix> + I to install tmux plugins (tpm)

  If stow reports conflicts, an unmanaged file already exists at that path —
  back it up and remove it, then re-run ./install.sh.
EOF
