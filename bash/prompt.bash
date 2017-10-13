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
PROMPT_STYLE_USER="$(tput setaf 66)"
PROMPT_STYLE_ROOT="$(tput setaf 196)"
PROMPT_STYLE_HOST="$(tput setaf 131)"
PROMPT_STYLE_DIRECTORY="$(tput setaf 178)"
PROMPT_STYLE_SEPERATOR="$(tput setaf 240)"
PROMPT_STYLE_SYMBOL="$(tput setaf 240)"
PROMPT_STYLE_COMMAND="$(tput setaf 255)"

PROMPT_STYLE_GIT_BRANCH="$(tput setaf 66)"
PROMPT_STYLE_GIT_STATUS="$(tput setaf 166)"

PROMPT_STYLE_VIM="$(tput setaf 172)"

PROMPT_STYLE_EXIT_STATUS="$(tput setaf 196)"

# Highlight username when logged in as root.
if [[ "${USER}" == "root" ]]; then
    PROMPT_STYLE_USER="${PROMPT_STYLE_ROOT}"
fi

# Display information about the current git repository
prompt_git() {
    EXIT_STATUS=$?
    local s=""
    local branch_name=""

    # Check if the current directory is in a Git repository.
    if [ $(git rev-parse --is-inside-work-tree &>/dev/null; echo "${?}") == "0" ]; then

        # check if the current directory is in .git before running git checks
        if [ "$(git rev-parse --is-inside-git-dir 2> /dev/null)" == "false" ]; then

            # Ensure the index is up to date.
            git update-index --really-refresh -q &>/dev/null

            # Check for uncommitted changes in the index.
            if ! $(git diff --quiet --ignore-submodules --cached); then
                s+="+"
            fi

            # Check for unstaged changes.
            if ! $(git diff-files --quiet --ignore-submodules --); then
                s+="!"
            fi

            # Check for untracked files.
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s+="?"
            fi

            # Check for stashed files.
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s+="$"
            fi
        fi

        # Get the short symbolic ref.
        # If HEAD isn’t a symbolic ref, get the short SHA for the latest commit
        # Otherwise, just give up.
        branch_name="$(git symbolic-ref --quiet --short HEAD 2> /dev/null || \
            git rev-parse --short HEAD 2> /dev/null || \
            echo '(unknown)')"

        [ -n "${s}" ] && s=" [${s}]"

        echo -e "$PROMPT_STYLE_SEPERATOR on ${PROMPT_STYLE_GIT_BRANCH}${branch_name}${PROMPT_STYLE_GIT_STATUS}${s}"
    fi
    return $EXIT_STATUS
}

# Please tell me when shell is running from vim
prompt_vim() {
    EXIT_STATUS=$?
    env | grep VIMRUNTIME > /dev/null
    if [ $? -eq 0 ]; then
        echo -e "${PROMPT_STYLE_SEPERATOR} from ${PROMPT_STYLE_VIM}vim"
    fi
    return $EXIT_STATUS
}


# Display the exit status of the most recently executed foreground pipeline
prompt_exit_status() {
    EXIT_STATUS=$?
    NEWLINE="\n"
    [ $EXIT_STATUS -ne 0 ] && echo -e "${PROMPT_STYLE_SEPERATOR} exit status ${PROMPT_STYLE_EXIT_STATUS}${EXIT_STATUS}"

}

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
