#=======================================================================
# Bash aliases
#=======================================================================

# Allow aliases to be sudo’ed
alias sudo='sudo '

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

# cat with beautiful colors.
alias c='pygmentize -O style=native -f console256 -g'

# Open pfds with zathura
alias openpdf="zathura"

# Abbreviations and shortcuts
alias q="exit"
alias Q="exit"
alias e="$EDITOR"
alias v="view"
alias g="git"
alias j="z"
alias r="R --no-save --quiet"
alias py="python"
alias r="ranger"

# Typos
alias celar="clear"
alias pyhton="python"

# Grep and friends
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Load alias modules
source $DOTFILES/bash/list_files_and_directories.bash
source $DOTFILES/bash/navigation.bash
source $DOTFILES/bash/create_directories.bash
source $DOTFILES/bash/time.bash
