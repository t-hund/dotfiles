#=======================================================================
# Bash prompt
#=======================================================================

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM="gnome-256color"
elif infocmp xterm-256color >/dev/null 2>&1; then
    export TERM="xterm-256color"
fi

# Define prompt colors
PROMPT_STYLE_RESET="$(tput sgr0)"
PROMPT_STYLE_BOLD="$(tput bold)"
PROMPT_STYLE_USER="$(tput setaf 132)"
PROMPT_STYLE_HOST="$(tput setaf 202)"
PROMPT_STYLE_DIRECTORY="$(tput setaf 190)"
PROMPT_STYLE_SEPERATOR="$(tput setaf 240)"
PROMPT_STYLE_SYMBOL="$(tput setaf 240)"

# Highlight username when logged in as root.
if [[ "${USER}" == "root" ]]; then
    PROMPT_STYLE_USER="$(tput setaf 196)"
fi

# Display current working directory in terminal title
TERMINAL_TITLE="\w"
PS1="\[\033]0;${TERMINAL_TITLE}\007\]"

# Basic prompt
PS1+="\[${PROMPT_STYLE_RESET}\]"           # reset colors
PS1+="\[${PROMPT_STYLE_BOLD}\]\n"          # newline
PS1+="\[${PROMPT_STYLE_USER}\]\u"          # username
PS1+="\[${PROMPT_STYLE_SEPERATOR}\] at "   # at
PS1+="\[${PROMPT_STYLE_HOST}\]\h"          # host
PS1+="\[${PROMPT_STYLE_SEPERATOR}\] in "   # in
PS1+="\[${PROMPT_STYLE_DIRECTORY}\]\w\n"   # working directory
PS1+="\[${PROMPT_STYLE_SYMBOL}\]$ "        # prompt symbol
PS1+="\[${PROMPT_STYLE_RESET}\]"           # reset colors

export PS1
