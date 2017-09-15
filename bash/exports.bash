#=======================================================================
# Exports
#=======================================================================

# Make vim the default editor
export EDITOR="vim";

# Don’t clear the screen after quitting a manual page
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""
