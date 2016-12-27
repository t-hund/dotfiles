#=======================================================================
# Bash prompt
#=======================================================================

# Display current working directory in terminal title
TERMINAL_TITLE="\w"
PS1="\033]0;$TERMINAL_TITLE\007"

# Basic prompt
PS1+="\n\u at \h in \w\n$ "

export PS1
