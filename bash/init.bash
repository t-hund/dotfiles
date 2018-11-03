#=======================================================================
# Bash init
#=======================================================================

export DOTFILES="$HOME/Dropbox/dotfiles"

source "$DOTFILES/bash/path.bash"
source "$DOTFILES/bash/functions.bash"
source "$DOTFILES/bash/exports.bash"
source "$DOTFILES/bash/aliases.bash"
source "$DOTFILES/bash/prompt.bash"
source "$DOTFILES/bash/options.bash"
source "$DOTFILES/bash/autocomplete.bash"
source "$DOTFILES/bash/version_managers.bash"


# initialize z   (https://github.com/rupa/z)
source "$DOTFILES/bin/z.sh"

# Disable <c-s> permanently in terminal
stty -ixon
