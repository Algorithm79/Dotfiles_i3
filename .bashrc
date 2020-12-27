# ██████╗  █████╗ ███████╗██╗  ██╗██████╗  ██████╗
# ██╔══██╗██╔══██╗██╔════╝██║  ██║██╔══██╗██╔════╝
# ██████╔╝███████║███████╗███████║██████╔╝██║     
# ██╔══██╗██╔══██║╚════██║██╔══██║██╔══██╗██║     
# ██████╔╝██║  ██║███████║██║  ██║██║  ██║╚██████╗
# ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝
#
# Bashrc Config 2020-08-04
#

# If not running interactively, don't do anything

[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias clock='tty-clock -c -B -D'
alias youtube='mpsyt'
alias musik='ncmpcpp'
alias tui='s-tui'
alias neo='neofetch --w3m ~/.config/terminal.png --xoffset 10 --yoffset 10 --size 200px 200px --loop'  
alias trim='sudo fstrim / -v'
alias kube='ckube -H 4.0 -m 0,1'
alias orphans='sudo pacman -Rns $(pacman -Qtdq)'
alias gtktheme='~/Colorizer-0.5-beta.1/./colorizer.sh --wal --gtk fantome --xfwm wendows'
alias tetris='yetris'

LANG="sv_SE.utf8"
export LANG

#PS1="\n\[\e[0;34m\]┌─[\[\e[1;36m\u\e[0;34m\]]──[\e[1;37m\w\e[0;34m]──[\[\e[1;36m\]${HOSTNAME%%.*}\[\e[0;34m\]]\[\e[1;35m\]: \$\[\e[0;34m\]\n\[\e[0;34m\]└────╼ \[\e[1;35m\]>> \[\e[00;00m\]"


trap 'echo -ne "\e[0m"' DEBUG

[ -e "/etc/DIR_COLORS" ] && DIR_COLORS="/etc/DIR_COLORS"
[ -e "$HOME/.dircolors" ] && DIR_COLORS="$HOME/.dircolors"
[ -e "$DIR_COLORS" ] || DIR_COLORS=""
eval "`dircolors -b $DIR_COLORS`"

#export PYTHONPATH=/usr/lib/python3.8/site-packages
#powerline-daemon -q
#POWERLINE_BASH_CONTINUATION=1
#POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.8/site-packages/powerline/bindings/bash/powerline.sh

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

[ -n "$XTERM_VERSION" ] && transset-df 0.8 --id "$WINDOWID" >/dev/null

source "${HOME}/.cache/wal/colors.sh"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh


pfetch

export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR='vim'
export VISUAL='vim'
export TERM='xterm'

if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
   exec startx
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(starship init bash)"
