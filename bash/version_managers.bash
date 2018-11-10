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


# Call init_nvm to initialize nvm. To me, nvm is too slow to run during each shell
# startup.
init_nvm() {
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
}
