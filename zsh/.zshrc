# Turn off all beeps
unsetopt BEEP


# Functions
parse_git_branch() {
   git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

# cd into git worktree
wt() {
    cd "$(git worktree list | grep -v '/\.' | fzf --reverse | awk '{print $1}')"
}

# git stage selector for files
gst() {
  git status --short | grep '^ M\|^??' | sed 's/^.\{3\}//' | fzf --multi \
    --preview='if git status --short | grep "^?? {}$" > /dev/null; \
               then (command -v cat > /dev/null && cat --color=always {} || cat {}); else git diff -U1000 --color=always -- {} | delta --side-by-side -w $FZF_PREVIEW_COLUMNS; fi' \
    --preview-window="bottom,80%,border-top,nowrap" \
    --prompt="Select files to stage> " | xargs git add
}

# unstage selector
gunst() {
  git status --short | grep '^M\|^A' | sed 's/^.\{3\}//' | fzf --multi --preview="git diff --color=always --staged -- {}" --prompt="Select files to unstage> " | xargs git restore --staged
}

new-tmux-session() {
  if [ -z "$1" ]; then
    echo "Usage: new-tmux-session <session-name>"
    return 1
  fi

  if [ -n "$TMUX" ]; then
    echo "You are already inside a tmux session."
    echo "Starting a new session in a detached state."
    tmux new-session -d -s "$1"
    tmux switch-client -t "$1"
    return
  fi

  tmux has-session -t "$1" 2>/dev/null
  if [ $? -eq 0 ]; then
    echo "Session '$1' already exists. Attaching..."
    tmux attach-session -t "$1"
  else
    echo "Creating new tmux session: $1"
    tmux new-session -s "$1"
  fi
}

delete-tmux-session() {
  # Get the list of tmux sessions
  local session
  session=$(tmux list-sessions -F "#{session_name}" | fzf --prompt="Select a tmux session to delete> ")

  # Exit if no session is selected
  if [ -z "$session" ]; then
    echo "No session selected. Exiting."
    return 1
  fi

  # Confirm deletion
  echo -n "Are you sure you want to delete the session '$session'? [y/N]: "
  read confirm
  if [[ "$confirm" =~ ^[Yy]$ ]]; then
    tmux kill-session -t "$session"
    echo "Session '$session' deleted."
  else
    echo "Operation canceled."
  fi
}


alias tmxs="new-tmux-session"
alias tmxd="delete-tmux-session"

# Prompt
COLOR_DEF='%F{#eceff4}'
COLOR_USR='%F{#4c566a}'
COLOR_DIR='%F{#81a1c1}'
COLOR_GIT='%F{#b48ead}'
NEWLINE=$'\n'

setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}@%n ${COLOR_DIR}%d ${COLOR_GIT}$(parse_git_branch)${COLOR_DIR}${NEWLINE}$ ${COLOR_DEF}'


# Aliases
alias dev="cd ~/dev"
alias sofa="cd ~/dev/sofa"
alias ss="cd ~/dev/sofascore/frontend"
alias config="cd ~/dotfiles"
alias notes="cd ~/Library/Mobile\ Documents/iCloud~md~obsidian/Documents"
alias vim="nvim"
alias zshrc="nvim ~/.zshrc"

alias gits="git status"
alias gitlog="git log --graph --oneline --pretty='%C(magenta)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset'"
alias ghpr="gh pr list --search 'author:@me' --json number,title --jq '.[] | [.number, .title] | @tsv' | fzf --bind 'enter:execute(gh pr view {1} --web)'"
alias ghpr="( (echo -e 'Number\tTitle\tBranch\tCreated At\tState\tMergeable'; \
   gh pr list --search 'author:@me' --json number,title,headRefName,createdAt,state,mergeable \
   --jq '.[] | [.number, .title, .headRefName, .createdAt, .state, .mergeable] | @tsv') | column -t -s $'\t' \
) | fzf --header-lines=1 --bind 'enter:execute(gh pr view {1} --web)+abort'"
alias ghrw="( (echo -e 'Number\tAuthor\tTitle\tBranch\tCreated At\tState'; \
   gh pr list --search 'review-requested:@me' --json number,author,title,headRefName,createdAt,state \
   --jq '.[] | [.number, .author.name, .title, .headRefName, .createdAt, .state] | @tsv') | column -t -s $'\t' \
) | fzf --header-lines=1 --bind 'enter:execute(gh pr view {1} --web)+abort'"
## alias gitpr="gh pr list -H ${parse_git_branch} --json 'number'"

## prepare new sofascore worktree
alias ssprepare='yarn && yarn run prepare && yarn packages:build'


# Tab Autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:::::default' menu yes select
bindkey '^ ' autosuggest-accept # use Ctrl + space for accepting suggestion


# Plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh # https://github.com/zsh-users/zsh-autosuggestions
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # https://github.com/zsh-users/zsh-syntax-highlighting


# fzf - general-purpose command-line fuzzy finder
# https://github.com/junegunn/fzf
    # Set up fzf key bindings and fuzzy completion
    eval "$(fzf --zsh)" 

    ## fzf default options
    export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
        --reverse
        --bind ctrl-j:preview-down,ctrl-k:preview-up,ctrl-u:preview-page-up,ctrl-d:preview-page-down
        --color=fg:#e5e9f0,bg:-1,hl:#81a1c1
        --color=fg+:#81a1c1,bg+:-1,hl+:#81a1c1,gutter:-1
        --color=info:#b48dac,prompt:#b48dac,pointer:#b48dac
        --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

# eza - modern replacement for ls
# https://github.com/eza-community/eza
# Uses colors to distinguish file types and metadata. 
# It knows about symlinks, extended attributes, and Git.
    # If eza command is available, set up aliases
    if command -v eza &>/dev/null; then
        alias ls='eza'
        alias ll='eza -lhg'
        alias lla='eza -alhg'
        alias tree='eza --tree'
    fi

# bat - cat clone with syntax highlighting and Git integration
# https://github.com/sharkdp/bat
# Supports syntax highlighting for a large number of programming and markup languages
    # If bat command is available, set up aliases
    if command -v bat &>/dev/null; then
        alias cat='bat'
    fi

# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# psql
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"


# Created by `pipx` on 2024-08-25
export PATH="$PATH:/Users/tvrtko/.local/bin"
