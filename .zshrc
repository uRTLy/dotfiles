# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

. $HOME/.asdf/asdf.sh

# Example aliases
alias vim="nvim"

# Path to your oh-my-zsh installation.
export ZSH=~/.oh-my-zsh
ZSH_THEME="jovial"
ZSH_DISABLE_COMPFIX="true"

plugins=(
  git
  zsh-autosuggestions
  zsh-nvm
  fzf
)

[  -f ~/.fzf.zsh ] && source ~/.fzf.zsh


export NVM_DIR=~/.nvm

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH" 
# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi


# Path to your oh-my-zsh installation.
source $ZSH/oh-my-zsh.sh
export ZSH=~/.oh-my-zsh
