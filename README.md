# Dotfiles

This repository contains my personal configuration files (dotfiles) for various applications and tools. These configurations help set up a consistent development environment across different machines, specifically tailored for macOS.

## Contents

- **Zsh** - `.zshrc`
- **[Nvim](https://github.com/neovim/neovim)** - neovim configured with [lazy.nvim](https://github.com/folke/lazy.nvim) plugin manager
- **[Tmux](https://github.com/tmux/tmux)** - `.tmux.conf`
- **[Ghostty](https://github.com/ghostty-org/ghostty)** - `config`
- **[AeroSpace](https://github.com/nikitabobko/AeroSpace)** - `.aerospace.toml`
- [Borders](https://github.com/FelixKratz/JankyBorders) - `bordersrc`
- **[bat](https://github.com/sharkdp/bat)** - `config`

## Installation

The installation steps provided here assume you are using macOS and the Homebrew package manager.

### Quick start (automated)

```zsh
git clone https://github.com/Tvrtk0/dotfiles.git $HOME/dotfiles-tvrtk0
cd $HOME/dotfiles-tvrtk0
./install.sh
```

`install.sh` is idempotent and will: install Homebrew (if missing), install everything in the
[`Brewfile`](./Brewfile), git-clone the zsh plugins and tmux's `tpm`, create `~/.secrets.zsh`
from the template, and symlink all packages with `stow`. The manual steps below do the same
thing by hand.

### Prerequisites

1. If you don't have `Homebrew` installed, you can install it with the following command:

```zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

2. Install **Git:**

```zsh
brew install git
```

3. Install **GNU Stow:**

```zsh
brew install stow
```

### Using GNU Stow

GNU Stow is a symlink farm manager that simplifies the process of managing dotfiles. Follow these steps to set up the dotfiles on your machine:

- Clone the repository:

```zsh
git clone https://github.com/Tvrtk0/dotfiles.git $HOME/dotfiles-tvrtk0
cd $HOME/dotfiles-tvrtk0
```

- Run GNU Stow to create symlinks for all modules:

```zsh
stow */
```

- Run this command if you want to symlink only a specific module (_e.g. `zsh` module_):

```zsh
stow zsh
```

Each stow command will create symlinks for the corresponding application configuration files in your home directory.

## Secrets

API tokens and other secrets are **not** committed. `.zshrc` sources them from `~/.secrets.zsh`,
which is gitignored. Create it from the tracked template and fill in real values:

```zsh
cp zsh/.secrets.zsh.example ~/.secrets.zsh
chmod 600 ~/.secrets.zsh
$EDITOR ~/.secrets.zsh
```

(`install.sh` does the copy for you on first run.)
