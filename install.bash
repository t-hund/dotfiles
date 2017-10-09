#=======================================================================
# Install script
#=======================================================================

DOTFILES=$HOME/Dropbox/dotfiles

# Git
ln -sf $DOTFILES/git/config.git $HOME/.gitconfig

# Bash
ln -sf $DOTFILES/bash/init.bash $HOME/.bashrc
ln -sf $DOTFILES/bash/init.bash $HOME/.bash_profile

# EditorConfig
ln -sf $DOTFILES/.editorconfig $HOME/.editorconfig

# Tmux
ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf

# Ag
ln -sf $DOTFILES/.agignore $HOME/.agignore

# Zathura
ln -sf $DOTFILES/zathurarc $HOME/.config/zathura/zathurarc
