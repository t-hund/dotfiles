#=======================================================================
# Bootstrap vim
#=======================================================================

DOTFILES="$HOME/core/dotfiles"

# Symlink .vimrc
ln -sf $DOTFILES/vim/vimrc $HOME/.vimrc

ln -sf $DOTFILES/vim/ideavimrc $HOME/.ideavimrc
