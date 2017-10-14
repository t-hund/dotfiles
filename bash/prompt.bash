#=======================================================================
# Bash prompt
#=======================================================================

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
    export TERM="gnome-256color"
elif infocmp xterm-256color >/dev/null 2>&1; then
    export TERM="xterm-256color"
fi

source "$DOTFILES/bash/prompt/style.bash"
source "$DOTFILES/bash/prompt/git.bash"
source "$DOTFILES/bash/prompt/vim.bash"
source "$DOTFILES/bash/prompt/exit_status.bash"

# Restore colors before command output
PS0="${PROMPT_STYLE_RESET}\n"

# Display current working directory in terminal title
TERMINAL_TITLE="\w"
PS1="\[\033]0;${TERMINAL_TITLE}\007\]"
PS1+="\[${PROMPT_STYLE_RESET}\]"           # reset colors
PS1+="\[${PROMPT_STYLE_BOLD}\]\n"          # newline
PS1+="\[${PROMPT_STYLE_USER}\]\u"          # username
PS1+="\[${PROMPT_STYLE_SEPERATOR}\] at "   # at
PS1+="\[${PROMPT_STYLE_HOST}\]\h"          # host
PS1+="\[${PROMPT_STYLE_SEPERATOR}\] in "   # in
PS1+="\[${PROMPT_STYLE_DIRECTORY}\]\w"     # working directory
PS1+="\$(prompt_git)"                      # git info
PS1+="\$(prompt_vim)"                      # from vim
PS1+="\$(prompt_exit_status)"              # Display exit status if non-zero
PS1+="\n\[${PROMPT_STYLE_BOLD}\]"          # newline
PS1+="\[${PROMPT_STYLE_SYMBOL}\]∵ "        # prompt symbol
PS1+="\[${PROMPT_STYLE_COMMAND}\]"         # highlight command

PS2="\[$PROMPT_STYLE_SYMBOL\]│ \[$PROMPT_STYLE_COMMAND\]";

export PS0
export PS1
export PS2
