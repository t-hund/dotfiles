#=======================================================================
# Install script
#=======================================================================

DOTFILES=/home/tova/Dropbox/dotfiles

# Git
ln -sf $DOTFILES/git/config.git $HOME/.gitconfig

# Bash
ln -sf $DOTFILES/bash/init.bash $HOME/.bashrc
ln -sf $DOTFILES/bash/init.bash $HOME/.bash_profile

# EditorConfig
ln -sf $DOTFILES/.editorconfig $HOME/.editorconfig

# Tmux
ln -sf $DOTFILES/.tmux.conf $HOME/.tmux.conf

# Screen
ln -sf $DOTFILES/.screenrc $HOME/.screenrc

# Ag
ln -sf $DOTFILES/.agignore $HOME/.agignore

# Zathura
ln -sf $DOTFILES/zathurarc $HOME/.config/zathura/zathurarc

# xmodmap
ln -sf $DOTFILES/.xmodmap $HOME/.xmodmap

# ghci
ln -sf $DOTFILES/.ghci $HOME/.ghci
