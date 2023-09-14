#
# /etc/bash.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

[[ $DISPLAY ]] && shopt -s checkwinsize

PS1='\W # '

if [[ -r /usr/share/bash-completion/bash_completion ]]; then
  . /usr/share/bash-completion/bash_completion
fi
alias path='echo -e ${PATH//:/\\n}'
alias cd..='cd ..'
alias cls='clear'
alias myip='curl icanhazip.com'
alias clean='pacman -Qtdq | pacman -Rns -'
alias la='ls -a'
alias ll='ls -la'