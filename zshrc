# ~/.zshrc

export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin
export EDITOR="vim"
export BUNDLER_EDITOR="vim"
export MANPAGER="less -X" # Don’t clear the screen after quitting a manual page
export TERM="screen-256color"
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export SOURCE_ANNOTATION_DIRECTORIES="spec"
export DISABLE_AUTO_TITLE=true
export _Z_OWNER=$USER

setopt auto_cd
cdpath=($HOME/code $HOME/Dropbox $HOME)

HISTSIZE=1000000
SAVEHIST=1000000
HISTFILE=~/.zsh_history
HIST_STAMPS="yyyy-mm-dd"

source $HOME/dotfiles/zsh/oh-my-zsh
source $HOME/dotfiles/zsh/aliases
source $HOME/dotfiles/zsh/prompt
source $HOME/dotfiles/zsh/tmux
source $HOME/dotfiles/zsh/functions
source $HOME/dotfiles/zsh/z.sh

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Travis CI
[ -f ~/.travis/travis.sh ] && source ~/.travis/travis.sh

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Include local settings
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
