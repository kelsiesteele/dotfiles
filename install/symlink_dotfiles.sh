#!/bin/sh

################################################################################
# symlink_dotfiles.sh
#
# This script backs up any old dotfiles on the system, and symlinks the new ones
# to their proper place in the home folder.
################################################################################

set -e # Terminate script if anything exits with a non-zero value
set -u # Prevent unset variables

################################################################################
# Set some variables
################################################################################

DOTFILES=$HOME/dotfiles
OLD_DOTFILES_BACKUP=$HOME/old_dotfiles_backup
files="gemrc gitignore gitconfig tmux.conf railsrc vimrc zshrc"

################################################################################
# Back up old dotfiles if needed
################################################################################

cd $HOME

if [[ -d $DOTFILES ]]; then
  fancy_echo "Backing up old dotfiles to $HOME/old_dotfiles_backup..."
  rm -rf $OLD_DOTFILES_BACKUP
  cp -R $DOTFILES $OLD_DOTFILES_BACKUP
fi


################################################################################
# Symklink new dotfiles to $HOME
################################################################################

git clone -b linux https://github.com/joshukraine/dotfiles.git $DOTFILES_DIR

fancy_echo "Creating symlinks..."
for file in $files; do
  if [ -f $HOME/$file ]; then
    echo ".$file already present. Backing up..."
    cp $HOME/$file "$HOME/${file}_backup"
    rm -f $HOME/$file
  fi
  fancy_echo "-> Linking $DOTFILES/$file to $HOME/.$file..."
  ln -nfs "$DOTFILES/$file" "$HOME/.$file"
done

