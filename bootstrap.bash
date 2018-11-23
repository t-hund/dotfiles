#=======================================================================
# Install script
#=======================================================================

DOTFILES="$HOME/Dropbox/dotfiles"

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

# inputrc
ln -sf $DOTFILES/inputrc $HOME/.inputrc

# i3
ln -sf $DOTFILES/i3/config $HOME/.config/i3/config

# i3 blocks
ln -sf $DOTFILES/i3/i3blocks.conf $HOME/.i3blocks.conf

# rofi
ln -sf $DOTFILES/rofi/config $HOME/.config/rofi/config

# Xdefaults
ln -sf $DOTFILES/.Xdefaults $HOME/.Xdefaults
