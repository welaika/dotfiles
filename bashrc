## Fancy prompt
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

PROMPT_INFO="${white}[\A] ${green}\u${NC} ${blue}\w"
PROMPT_RUBY="[\$(rbenv version-name)]"
PROMPT_GIT="${green}\$(__git_ps1)"
PROMPT_FOOTER="\n\$(is_vim_running && echo \"${red}\" || echo \"${white}\") ↳ ${green}\$ ${NC}"

PS1="${PROMPT_INFO} ${PROMPT_RUBY}${PROMPT_GIT} ${PROMPT_FOOTER}"

## Colored manpages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

## Aliases

alias ls='ls -hFG'
alias la='ls -lhAFG'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='colordiff'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -hc'
alias tree='tree -aAC'
alias tailf='tail -f'
alias update='brew update && brew upgrade && brew cleanup'
alias npm_update='npm install npm@latest -g'
alias recent='ls -Art | tail -n 10'

# Expand aliases with sudo too
alias sudo='sudo '

# Security
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias unlink='unlink -i'
alias rename='rename -i'


## Shopt options
shopt -s cdspell        # This will correct minor spelling errors in cd command.
shopt -s checkwinsize   # Check window size (rows, columns) after each command.
shopt -s cmdhist        # Save multi-line commands in history as single line.
shopt -s dotglob        # Include dotfile in path-name expansions.
shopt -s histappend     # Append to history rather than overwrite.
shopt -s nocaseglob     # Pathname expansion will be treated as case-insensitive.
stty -ixon              # Disable console start/stop: makes ^S and ^Q go through

## History
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL='ignoreboth'

## Other exports
export EDITOR='vim'
export PAGER='less'
export RUBY_CONFIGURE_OPTS='--disable-install-doc'
export LESS='-R'
export DISABLE_SPRING='1'

## weLaika works paths
export WORDPRESS_WORKS_PATH="$HOME/Repos"

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

function ltree()
{
    tree -C $* | less -R
}

function echo_last_migration {
  migrate_path='db/migrate/'
  nth_migration=$((${1:-0}+1))
  echo "${migrate_path}$(ls -1t $migrate_path | head -$nth_migration | tail -1)"
}

function last_migration {
  vim $(echo_last_migration $*)
}

function view_coverage {
  report='coverage/index.html'
  if [ -f "$report" ]; then
    open "$report"
  fi
}

function view_critics {
  report='tmp/rubycritic/overview.html'
  if [ -f "$report" ]; then
    open "$report"
  fi
}

function rubies {
  for file in $(find . -type f -maxdepth 3 -name '.ruby-version'); do
    echo $(cat $file) -- $file;
  done | sort -n
}

function ports {
  lsof -i -Pn | grep -i "listen"
}

function hosts_in_lan {
  arp -a -n | grep -v "incomplete"
}

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

source `brew --prefix`/etc/profile.d/z.sh
