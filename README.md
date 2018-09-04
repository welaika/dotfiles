weLaika's dotfiles configuration
===============================

## Prerequisites

1. Generic deps: `brew install bash-completion vim git multitail colordiff less tree ack moreutils the_silver_searcher watch wget curl z ssh-copy-id`
2. Install [ruby-build dependencies](https://github.com/rbenv/ruby-build/wiki) with brew
3. Install rbenv (and ruby-build): `brew install rbenv` (ruby-build will be installed within rbenv)
4. Install node: `brew install node`
5. Install yarn: `brew install yarn`

## Installation

1. Fork 
2. Clone your fork into ".dotfiles":
   `git clone https://github.com/YOURNAME/dotfiles.git ~/.dotfiles`
3. Install:
   `cd ~/.dotfiles && bash install.sh`
4. Update `[user]` section in `gitconfig` file
5. Edit to suit your needs

This will backup all the dotfiles that you are using in the `~/.dotfiles/backup`
directory and will install in your home symlinks to the dotfiles in the
`~/dotfiles` folder.

## Author

made with ❤️ and ☕️ by [weLaika](http://dev.welaika.com)
