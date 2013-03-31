## Prompt colors
red='\[\e[0;31m\]'
RED='\[\e[1;31m\]'
blue='\[\e[0;34m\]'
BLUE='\[\e[1;34m\]'
cyan='\[\e[0;36m\]'
CYAN='\[\e[1;36m\]'
black='\[\e[0;30m\]'
BLACK='\[\e[1;30m\]'
green='\[\e[0;32m\]'
GREEN='\[\e[1;32m\]'
yellow='\[\e[0;33m\]'
YELLOW='\[\e[1;33m\]'
magenta='\[\e[0;35m\]'
MAGENTA='\[\e[1;35m\]'
white='\[\e[0;37m\]'
WHITE='\[\e[1;37m\]'
NC='\[\e[0m\]'

function is_vim_running {
  jobs | grep -o 'vim' &> /dev/null
}

PROMPT_INFO="${WHITE}[\A] ${GREEN}\u${WHITE}(${GREEN}\h${WHITE})${NC} ${BLUE}\w"
PROMPT_RUBY="[\$(rvm-prompt)]"
PROMPT_GIT="${YELLOW}\$(__git_ps1)"
PROMPT_FOOTER="\n\$(is_vim_running && echo \"${RED}\" || echo \"${BLACK}\")↳ ${GREEN}\$ ${NC}"

PS1="\n${PROMPT_INFO} ${PROMPT_RUBY} ${PROMPT_GIT} ${PROMPT_FOOTER}"

## Aliases

alias l='ls -CF'
alias ls='ls -hF --color=auto'
alias la='ls -lhAF --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='colordiff'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -hc'

alias recent='ls -lhAFt --color=auto'
alias ports='netstat -tulanp'
alias apache2_restart='sudo service apache2 restart'
alias mysql_restart='sudo service mysql restart'

# Expand aliases with sudo too
alias sudo='sudo '

# Security
alias rm='rm -i --preserve-root'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Add an "alert" alias for long running commands.  Use like so:
# sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

## Shopt options
shopt -s cdspell        # This will correct minor spelling errors in cd command.
shopt -s checkwinsize   # Check window size (rows, columns) after each command.
shopt -s cmdhist        # Save multi-line commands in history as single line.
shopt -s dotglob        # Include dotfile in path-name expansions.
shopt -s histappend     # Append to history rather than overwrite.
shopt -s nocaseglob     # Pathname expansion will be treated as case-insensitive.

## Bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi

## Colored manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

## RVM
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
alias rgs='rvm gemset'

## Exports
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL="ignoreboth"
export EDITOR="vim"

## Extract files: depends on zip, unrar and p7zip
function ex {
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
        *)     echo "'$1' cannot be extracted via ex()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

