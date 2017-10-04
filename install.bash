#=======================================================================
# Install script
#=======================================================================

DOTFILES=$HOME/Dropbox/dotfiles

# Git
ln -sf $DOTFILES/git/config.git $HOME/.gitconfig

# Bash
ln -sf $DOTFILES/bash/init.bash $HOME/.bashrc
ln -sf $DOTFILES/bash/init.bash $HOME/.bash_profile
