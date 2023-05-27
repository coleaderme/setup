#
# ~/.bashrc
#
bind "set completion-ignore-case on"
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='exa'
alias grep='grep --color=auto'
# PS1='[\u@\h \W]\$ '
PS1='\W \$ '
#oh-my-bash
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias wget='wget -c'                        # Preferred 'wget' implementation (resume download)
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias fix_term='echo -e "\033c"'            # fix_term:     Reset the conosle.  Similar to the reset command
alias so='source ~/.bashrc'
alias mm='subl ~/.bashrc'

#Custom alias
alias 7zx='7z x'
alias ar="aria2c -UMozilla/5.0 -c -j 3 -x 3 -s 3 -k 1M"
alias au='audacious "$(fzf +x)"'
alias cd..='cd ..'
alias chx='chmod +x'
alias cls='clear'
alias fz='fzf --algo=v1 -m +x'
alias la='exa -a'
alias ll='exa -la'
alias myip='curl ifconfig.me && echo -e ""'
alias off='sudo poweroff'
alias pack='7z a -m0=copy'
alias packx='7z a -m0=copy -p0000 -mhe'
alias swp='sudo swapoff -a'
alias wm='sudo nano /etc/X11/xinit/xinitrc'
#YT
alias yt='yt-dlp --restrict-filenames --cookies-from-browser chromium'
alias ytx='yt-dlp -x --restrict-filenames'
alias ytf='yt-dlp -F'
alias ytd="yt-dlp --restrict-filenames --downloader aria2c --external-downloader aria2c --external-downloader-args '-UMozilla/5.0 -c -j 3 -x 3 -s 3 -k 1M'"
alias ytt="yt-dlp -f 'bestvideo[height<=1080]+251' --restrict-filenames --external-downloader aria2c --external-downloader-args '-UMozilla/5.0 -c -j 3 -x 3 -s 3 -k 1M'"
#Installs
alias syy='sudo pacman -Syy'
alias syu='sudo pacman -Syu'
alias install='sudo pacman -S'
alias un='sudo pacman -Rns'
alias clean='sudo pacman -Scc && sudo pacman -Sc'
alias py='python'
alias pi='sudo pip install'
alias pu='sudo pip uninstall'
alias pl='sudo pip list'
alias sopy='source bin/activate'
alias uwg='sudo wg-quick up wg'
alias dwg='sudo wg-quick down wg'
alias dwgg='sudo wg-quick down wgg'
alias uwgg='sudo wg-quick up wgg'
#Mount
alias mountt='sudo mount -o noatime /dev/sdb1 ~/T'
alias umountt='sudo umount ~/T'
