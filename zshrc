# Exports {{{
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export EDITOR="vim"
export BUNDLER_EDITOR="vim"
export MANPAGER="less -X" # Don’t clear the screen after quitting a manual page
export TERM="screen-256color"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# }}}


# oh-my-zsh {{{
export ZSH=$HOME/.oh-my-zsh
export UPDATE_ZSH_DAYS=7
COMPLETION_WAITING_DOTS="true"

plugins=(git pow vagrant)

source $ZSH/oh-my-zsh.sh
# }}}


# Aliases {{{

# Vim specific
alias vi="vim"
alias ct='ctags -R --languages=ruby --exclude=.git --exclude=log . $(bundle list --paths)'

# Jump to quick edits
alias ez='vim ~/.zshrc'
alias ed='vim ~/dotfiles'
alias ev='vim ~/.vimrc'

# General UNIX
alias mv='mv -iv'
alias cp='cp -iv'
alias rm='rm -iv'
alias df='df -h'
alias du='du -h'
alias mkdir='mkdir -pv'
alias src='source ~/.zshrc'
alias pi='ping -Anc 5 8.8.8.8'
alias path='echo -e ${PATH//:/\\n}'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .2='cd ../../'
alias .3='cd ../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias lsa='ls -lahF'
alias l='ls -lahF'
alias ll='ls -lhF'
alias la='ls -lAhF'
alias lf='ls -F'
alias lh='ls -d .*'

# Tree
alias t2='tree -FL 2'
alias t3='tree -FL 3'
alias t4='tree -FL 4'

alias t2a='tree -FLa 2'
alias t3a='tree -FLa 3'
alias t4a='tree -FLa 4'

# Upgrade Oh My Zshell
alias upz='upgrade_oh_my_zsh'

# Show/Hide hidden files in Finder
alias saf='defaults write com.apple.finder AppleShowAllFiles TRUE; killall Finder'
alias haf='defaults write com.apple.finder AppleShowAllFiles FALSE; killall Finder'

# Rails
alias rc='rails console'
alias rg='rails generate'
alias rs='rails server'
alias rsp='rspec . --format documentation' #Run full test suite using Rspec
alias rdb='rake db:migrate'
alias rtp='rake test:prepare'
alias bx='bundle exec'

# Postgres
alias startpost='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'
alias stoppost='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log stop'
alias statpost='ps aux | ag postgres'

# Homebrew
alias bu='brew update'
alias bg='brew upgrade'
alias bo='brew outdated'
alias bd='brew doctor'
alias bc='brew cleanup'

# rbenv
alias rbu='cd $HOME/.rbenv/plugins/ruby-build && git pull && cd'
alias rbv='rbenv versions'
alias rbl='rbenv install -l'

# Finder
alias o='open . &'

# Check for OS X updates
alias upc='softwareupdate -l'

# Download and install OS X updates
alias upd='softwareupdate -i -a'

# Speedtest
alias speedtest='wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
# }}}


# Ruby {{{
function get_ruby_version() {
  if command -v ruby >/dev/null; then
    ruby -v | awk '{print $1 " " $2}'
  else
    echo "Ruby not installed"
  fi
}
# }}}


# Prompt {{{
ZSH_THEME_GIT_PROMPT_PREFIX=" ["
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN="]"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}+%{$fg[white]%}]"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[red]%}*%{$fg[white]%}]"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}-%{$fg[white]%}]"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[magenta]%}>%{$fg[white]%}]"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[yellow]%}═%{$fg[white]%}]"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%}#%{$fg[white]%}]"

local user='%{$fg[green]%}%m:%{$reset_color%}'
local ssh_user='%{$fg[magenta]%}%n@%m:%{$reset_color%}'
local pwd='%{$fg[blue]%}%~%{$reset_color%}'
local git='%{$fg[white]%}$(git_prompt_info)$(git_prompt_status)%{$reset_color%}'

_rubyprompt() {
  if [ $COLUMNS -gt 80 ]; then
    echo "$(get_ruby_version)"
  fi
}

if [[ -n $SSH_CONNECTION ]]; then
  PROMPT="${ssh_user}${pwd}${git} %% "
else
  PROMPT="${user}${pwd}${git} %% "
fi

setopt transient_rprompt # only show the rprompt on the current prompt

RPROMPT='$(_rubyprompt)'
# }}}


# Tmux {{{
# Makes creating a new tmux session (with a specific name) easier
function tn() {
  tmux new -s $1
}

# Makes attaching to an existing tmux session (with a specific name) easier
function ta() {
  tmux attach -t $1
}

# Makes deleting a tmux session easier
function tk() {
  tmux kill-session -t $1
}

# List tmux sessions
alias tl='tmux ls'

# Create a new session named for current directory, or attach if exists.
alias tna='tmux new-session -As $(basename "$PWD" | tr . -)'

# Source .tmux.conf
alias tsrc="tmux source-file ~/.tmux.conf"

# Kill all tmux sessions
alias tka="tmux ls | cut -d : -f 1 | xargs -I {} tmux kill-session -t {}" # tmux kill all sessions

# }}}


# History {{{
HISTSIZE=20000
SAVEHIST=20000
HISTFILE=~/.zsh_history
# }}}


# cdpath {{{
setopt auto_cd
cdpath=($HOME/code $HOME/Developer $HOME/Sites $HOME/vms $HOME/Dropbox $HOME)
# }}}


# functions {{{
randpw() {
  openssl rand -base64 4 | md5 | head -c8 ; echo
}

# Determine size of a file or total size of a directory
# Thank you, Mathias! https://raw.githubusercontent.com/mathiasbynens/dotfiles/master/.functions
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* *;
	fi;
}
# }}}


# Rbenv {{{
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
# }}}


# Include local settings {{{
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
# }}}
