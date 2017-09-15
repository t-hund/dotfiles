#=======================================================================
# Exports
#=======================================================================

# Remember more history (allow 32³ entries)
export HISTSIZE=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignoredups;

# Make some commands not show up in history
export HISTIGNORE="ls:cd:cd -:cd..:..:pwd:q:exit:date:* --help";

# Make vim the default editor
export EDITOR="vim";

# Don’t clear the screen after quitting a manual page
export MANPAGER="/bin/sh -c \"col -b | vim -c 'set ft=man ts=8 nomod nolist nonu noma' -\""

# Use US English and UTF-8
export LANG="en_US.UTF-8";
export LC_ALL="en_US.UTF-8";

# Always enable colored `grep` output
export GREP_OPTIONS="--color=auto";
