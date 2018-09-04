# LOCALES
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# add homebrew
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# load up rbenv
[ -f `which rbenv` ] && eval "$(rbenv init -)"

# add dotfiles bins
export PATH="$HOME/.dotfiles/bin:$PATH"

# add binstubs folder
export PATH="./bin:./exe:.bundle/bin:$PATH"

# add node_modules
export PATH="./node_modules/.bin:$PATH"

# add YARN
export PATH="$PATH:`yarn global bin`"

# add kegonly paths
export PATH="/usr/local/opt/curl/bin:$PATH"

# erlang
export ERL_AFLAGS="-kernel shell_history enabled"

# load iterm2 integration
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# load .bashrc
source $HOME/.bashrc
