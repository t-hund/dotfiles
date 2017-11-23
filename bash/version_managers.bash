#=======================================================================
# Version managers
#=======================================================================

# Load pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# Ruby
if [[ -s "/usr/local/share/chruby/chruby.sh" ]]; then
    source /usr/local/share/chruby/chruby.sh
    source /usr/local/share/chruby/auto.sh
    chruby 2.4
fi

# Load nvm
# WHY DOES THIS LOAD SO SLOOOOOOWWWLYYY?!
#export NVM_DIR="/home/tova/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
