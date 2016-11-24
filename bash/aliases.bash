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

alias tree="tree | less --quit-if-one-screen --no-init --RAW-CONTROL-CHARS --chop-long-lines"

alias r="R --no-save --quiet"

# Get week number
alias week='date +%V'

# Load alias modules
source $DOTFILES/bash/list_files_and_directories.bash
source $DOTFILES/bash/navigation.bash
source $DOTFILES/bash/openpdf.bash
source $DOTFILES/bash/create_directories.bash

# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

