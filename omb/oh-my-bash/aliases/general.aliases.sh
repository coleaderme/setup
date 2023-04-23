#! bash oh-my-bash.module
#------------------------------------------------------------------------------
# Note on copyright (2022-08-23): The aliases defined in this file seems to
# originally come from a blog post [1].  See also the comments in lib/base.sh.
#
# [1] Nathaniel Landau, "My Mac OSX Bash Profile",
#     https://natelandau.com/my-mac-osx-bash_profile/, 2013-07-02.
#
#------------------------------------------------------------------------------
#  Description:  This file holds all general BASH aliases
#
#  For your own benefit, we won't load all aliases in the general, we will
#  keep the very generic command here and enough for daily basis tasks.
#
#  If you are looking for the more sexier aliases, we suggest you take a look
#  into other core alias files which installed by default.
#
#------------------------------------------------------------------------------

#   -----------------------------
#   1.  MAKE TERMINAL BETTER
#   -----------------------------

# Preferred 'cp' implementation.  Determines the use of the option `-v' on the
# first call Ref. https://github.com/ohmybash/oh-my-bash/issues/351
function _omb_util_alias_select_cp {
  if (tmp=$(_omb_util_mktemp); trap 'rm -f "$tmp"{,.2}' EXIT; command cp -v "$tmp" "$tmp.2" &>/dev/null); then
    _omb_command='cp -iv'
  else
    _omb_command='cp -i'
  fi
}
_omb_util_alias_delayed cp force

# Preferred 'mv' implementation
function _omb_util_alias_select_mv {
  if (tmp=$(_omb_util_mktemp); trap 'rm -f "$tmp.2"' EXIT; command mv -v "$tmp" "$tmp.2" &>/dev/null); then
    _omb_command='mv -iv'
  else
    _omb_command='mv -i'
  fi
}
_omb_util_alias_delayed mv force

# Preferred 'mkdir' implementation
function _omb_util_alias_select_mkdir {
  if command mkdir -pv . &>/dev/null; then
    _omb_command='mkdir -pv'
  else
    _omb_command='mkdir -p'
  fi
}
_omb_util_alias_delayed mkdir force

# Preferred 'nano' implementation
function _omb_util_alias_select_nano {
  if LANG=C command nano --help 2>/dev/null | grep -q '^[[:space:]]*[-]W'; then
    _omb_command='nano -W'
  else
    _omb_command='nano'
  fi
}
_omb_util_alias_delayed nano force
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias wget='wget -c'                        # Preferred 'wget' implementation (resume download)
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias fix_term='echo -e "\033c"'            # fix_term:     Reset the conosle.  Similar to the reset command
alias cic='bind "set completion-ignore-case on"' # cic:          Make tab-completion case-insensitive
alias src='source ~/.bashrc'                # src:          Reload .bashrc file


# Custom alias
alias cd..='cd ..'
alias myip='curl ifconfig.me && echo -e ""'
alias ar='aria2c -x 16 -s 16'
alias arc='aria2c -x 16 -s 16 --load-cookies=/home/dra/.config/chromium/Default/Cookies'
alias swp='sudo swapoff -a'
alias fz='fzf --algo=v1 -m +x'
alias au='audacious "$(fzf --algo=v1 +x)"'
#YT
alias yt='yt-dlp --restrict-filenames'
alias ytx='yt-dlp -x --restrict-filenames -P ~/Downloads'
alias ytf='yt-dlp -F'
alias ytd='yt-dlp --restrict-filenames --downloader aria2c'
alias ytt='yt-dlp -f "bestvideo[height<=1080]+251" --restrict-filenames --downloader aria2c'
#Installs
alias 7zx='7z x'
alias pack='7z a -m0=copy'
alias packx='7z a -m0=copy -p0000 -mhe'
alias la='ls -a'
alias ll='ls -la'
alias cls='clear'
alias syy='sudo pacman -Syy'
alias syu='sudo pacman -Syu'
alias install='sudo pacman -S'
alias un='sudo pacman -Rns'
alias py='python'
alias pi='sudo pip install'
alias pu='sudo pip uninstall'
alias uwg='sudo wg-quick up wg'
alias dwg='sudo wg-quick down wg'
alias dwgg='sudo wg-quick down wgg'
alias uwgg='sudo wg-quick up wgg'
alias so='source ~/.bashrc'
alias mm='subl ~/.bashrc'
alias wm='sudo nano /etc/X11/xinit/xinitrc'
#Mount
alias mountt='sudo mount -o noatime /dev/sdb1 /home/dra/T'
alias umountt='sudo umount T'
alias clean='sudo pacman -Scc && sudo pacman -Sc'
