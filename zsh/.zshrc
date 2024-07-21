# Turn off all beeps
unsetopt BEEP


# Functions
parse_git_branch() {
   git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}


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
alias config="cd ~/.config"
alias notes="cd ~/Google\ Drive/My\ Drive/Obsidian"
alias vim="nvim"
alias zshrc="nvim ~/.zshrc"

alias gits="git status"
alias gitlog="git log --graph --oneline --pretty='%C(magenta)%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset'"
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


# Nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# psql
export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"


# fzf
eval "$(fzf --zsh)"

## fzf fleoxi color theme
export FZF_DEFAULT_OPTS="
    --color=fg:#878580,bg:#100F0F,hl:#FFFCF0
    --color=fg+:#878580,bg+:#1C1B1A,hl+:#FFFCF0
    --color=border:#AF3029,header:#FFFCF0,gutter:#100F0F
    --color=spinner:#24837B,info:#24837B,separator:#1C1B1A
    --color=pointer:#AD8301,marker:#AF3029,prompt:#AD8301"
