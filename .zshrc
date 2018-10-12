# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1024
SAVEHIST=1024
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/evnl/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# autoload -Uz promptinit
# promptinit

alias ls='ls -A --color=auto'

# Make gems easier to use
PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"
export GEM_HOME=$HOME/.gem
