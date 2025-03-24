# Install Vim
sudo apt install vim-gtk3 --yes

# Clone Vundle
# TODO: Check if we need to install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

