#
# ~/.bashrc
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias clock='tty-clock -c -B -D'
alias youtube='mpsyt'
alias tui='s-tui'
#alias trim='sudo fstrim / -v'

if [ -n "$SSH_CONNECTION" ]; then
export PS1="\[$(tput setaf 1)\]┌─╼ \[$(tput setaf 7)\][\w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼ \[$(tput setaf 7)\][ssh]\"; else echo \"\[$(tput setaf 1)\]└╼ \[$(tput setaf 7)\][ssh]\"; fi) \[$(tput setaf 7)\]"
else
export PS1="\[$(tput setaf 1)\]┌─╼ \[$(tput setaf 7)\][\w]\n\[$(tput setaf 1)\]\$(if [[ \$? == 0 ]]; then echo \"\[$(tput setaf 1)\]└────╼\"; else echo \"\[$(tput setaf 1)\]└╼\"; fi) \[$(tput setaf 7)\]"
fi

trap 'echo -ne "\e[0m"' DEBUG

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

export PYTHONPATH=/usr/lib/python3.7/site-packages
powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.7/site-packages/powerline/bindings/bash/powerline.sh

extract () {
if [ -f $1 ] ; then
  case $1 in
    *.tar.bz2)   tar xjf $1     ;;
    *.tar.gz)    tar xzf $1     ;;
    *.bz2)       bunzip2 $1     ;;
    *.rar)       unrar e $1     ;;
    *.gz)        gunzip $1      ;;
    *.tar)       tar xf $1      ;;
    *.tbz2)      tar xjf $1     ;;
    *.tgz)       tar xzf $1     ;;
    *.zip)       unzip $1       ;;
    *.Z)         uncompress $1  ;;
    *.7z)        7z x $1        ;;
    *)     echo "'$1' cannot be extracted via extract()" ;;
     esac
 else
     echo "'$1' is not a valid file"
 fi
}

[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
#(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
#cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
#source ~/.cache/wal/colors-tty.sh

#neofetch --w3m ~/Dotfiles/Icons/tentacle.png --size 300px 300px 
ufetch

export EDITOR='vim'
export VISUAL='vim'

#if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
#   exec startx
#fi
