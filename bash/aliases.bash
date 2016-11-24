#=======================================================================
# Bash aliases
#=======================================================================

# Allow aliases to be sudo’ed
alias sudo='sudo '

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# cat with beautiful colors.
alias c='pygmentize -O style=native -f console256 -g'

# Abbreviations and shortcuts
alias q="exit"
alias Q="exit"
alias e="$EDITOR"
alias v="view"
alias g="git"
alias j="z"

# Get week number
alias week='date +%V'

# Load alias modules
source $DOTFILES/bash/list_files_and_directories.bash
