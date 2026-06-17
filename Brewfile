# Brewfile — packages the dotfiles configs depend on.
#
# Install with:  brew bundle   (./install.sh runs this for you)
#
# This is a CURATED subset, not a full `brew bundle dump`. It covers only what the
# committed configs (zsh, nvim, tmux, ghostty, aerospace, borders, bat) need to work.
# Broader dev tooling (docker, deno, php, GUI apps, VS Code extensions, etc.) is left
# out on purpose — add your own, or run `brew bundle dump` for a full machine mirror.
#
# Not handled here (see install.sh): zsh-autosuggestions / zsh-syntax-highlighting are
# git-cloned into ~/.zsh, and tmux's tpm is git-cloned into ~/.config/tmux/plugins.

# --- taps ---
tap "nikitabobko/tap"       # aerospace
tap "felixkratz/formulae"   # borders (JankyBorders)

# --- core / dotfiles management ---
brew "git"
brew "stow"                 # symlink farm manager used to install these dotfiles

# --- shell (zsh) ---
brew "fzf"                  # shell keybindings, tmux session popup, gst/ghpr fns
brew "eza"                  # ls / ll / lla / tree aliases
brew "bat"                  # cat alias + ~/.config/bat
brew "gh"                   # ghpr / ghrw aliases

# --- editor (neovim) ---
brew "neovim"
brew "ripgrep"              # telescope live_grep
brew "fd"                   # telescope find_files
brew "node"                 # runtime for mason-installed LSP servers / formatters
brew "nvm"                  # node version manager (sourced in .zshrc)

# --- multiplexer ---
brew "tmux"

# --- database (referenced by .zshrc PATH) ---
brew "postgresql@15", restart_service: :changed

# --- GUI / window management ---
cask "ghostty"
cask "aerospace"
brew "felixkratz/formulae/borders"

# --- fonts (Nerd Font for nvim/lualine/oil icons) ---
cask "font-meslo-lg-nerd-font"
