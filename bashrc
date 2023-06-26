#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# PS1='[\u@\h \W]\$ '
PS1='\W \$ '
#oh-my-bash
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias wget='wget -c'                        # Preferred 'wget' implementation (resume download)
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
#Custom alias
alias 7zx='7z x'
alias rat=bat
alias rustcc="rustc -O -C prefer-dynamic"   # compact compiled size like C
alias fz="fzf --algo=v1 -e | xsel -b"
alias tfz='thunar "$(fzf --algo=v1 -e)"'
#alias au='audacious "$(fzf -e +x)"'
alias ar='aria2c --summary-interval 5 --user-agent=Mozilla/5.0 --file-allocation=falloc -c -j 4 -x 4 -s 4 -k 5M'
alias cd..='cd ..'
alias chx='chmod +x'
alias cls='clear'
alias dc='cd "$(dirname "$(fzf --algo=v1 -e)")"'
alias gad='git add .'
alias gm='git commit -m'
alias gll='git pull'
alias gsh='git push'
alias ls='exa'
alias la='exa -a'
alias ll='exa -la'
alias mm='subl ~/.bashrc'
alias mpc="mpv --profile=1080p"
alias myip='curl ifconfig.me && echo -e ""'
alias off='sudo poweroff'
alias pack='7z a -m0=copy'
alias packx='7z a -m0=copy -p0000 -mhe'
alias rg='rg -i'
alias so='source ~/.bashrc'
alias wm='sudo nano /etc/X11/xinit/xinitrc'
#YT
alias yt="yt-dlp --restrict-filenames --cookies-from-browser chromium --downloader aria2c --external-downloader-args '-UMozilla/5.0 -c -j 3 -x 3 -s 3 -k 5M'"
alias ytx='yt-dlp -x --restrict-filenames'
alias ytf='yt-dlp -F'
alias ytd="yt-dlp --write-auto-subs --restrict-filenames --downloader aria2c --external-downloader-args '-UMozilla/5.0 -c -j 3 -x 3 -s 3 -k 1M'"
alias ytt="yt-dlp -f 'bestvideo[height<=1080]+251' --restrict-filenames --downloader aria2c --external-downloader-args '-UMozilla/5.0 -c -j 3 -x 3 -s 3 -k 5M'"
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
alias ipd='sudo ip link set enp2s0 down'
alias ipu='sudo ip link set enp2s0 up'
#Mount
alias mountt='sudo mount /dev/sdb1 ~/T -o noatime,umask=000'
alias umountt='sudo umount ~/T'
alias umountsd='sudo umount ~/sd'