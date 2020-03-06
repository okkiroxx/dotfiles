# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/okki/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

zstyle ':completion:*' menu select

autoload -Uz vcs_info
autoload -Uz colors
colors

setopt prompt_subst
setopt correct

zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "%F{green}!"
zstyle ":vcs_info:git:*" unstagedstr "%F{magenta}+"
zstyle ":vcs_info:*" formats "%F{cyan}%c%u(%b)%f"
zstyle ":vcs_info:*" actionformats "[%b|%a]"

precmd () { vcs_info }

PROMPT="
%{$fg[green]%}%n@%m %{$fg[yellow]%}[%~]%{$reset_color%}"
PROMPT=$PROMPT" \$vcs_info_msg_0_
%{${fg[cyan]%}%}[%D %T]%{${reset_color}%} %# "

# RPROMPT="%{${fg[green]}%}[%~]%{${reset_color}%}"

alias ls="ls -GF"
alias grep="grep --color"
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
