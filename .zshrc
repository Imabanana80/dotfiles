export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:$PATH:/snap/bin/
export PATH=$HOME/scripts:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="nanotech"


plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Config aliases
alias dotfiles="cd ~/.dotfiles"

# Application aliases
alias vi="nvim"
alias py="python3"
alias cat="bat"
alias ls="eza -la --icons"
alias tree="eza --icons --tree"

# Git aliases
alias gl="git log --all --graph --pretty=format:'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n'"
alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gaa="git add ."
alias gap="git add --patch"
alias gc="git commit"
alias gp="git push"
alias gu="git pull --rebase"

# Misc aliases
alias cls="clear"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun
[ -s "/home/$HOME/.bun/_bun" ] && source "/home/$HOME/.bun/_bun"
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# golang
export PATH=$PATH:/usr/local/go/bin

fastfetch
