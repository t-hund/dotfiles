#=======================================================================
# Install script
#=======================================================================

DOTFILES=$HOME/dotfiles

# Git
ln -sf $DOTFILES/git/config.git $HOME/.gitconfig

## Install dependencies
#source $DOTFILES/install_dependencies.bash
