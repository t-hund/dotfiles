#=======================================================================
# Prompt style
#=======================================================================

# Basic
PROMPT_STYLE_RESET="$(tput sgr0)"
PROMPT_STYLE_BOLD="$(tput bold)"
PROMPT_STYLE_USER="$(tput setaf 30)"
PROMPT_STYLE_ROOT="$(tput setaf 196)"
PROMPT_STYLE_HOST="$(tput setaf 131)"
PROMPT_STYLE_DIRECTORY="$(tput setaf 214)"
PROMPT_STYLE_SEPERATOR="$(tput setaf 240)"
PROMPT_STYLE_SYMBOL="$(tput setaf 240)"
PROMPT_STYLE_COMMAND="$(tput setaf 255)"

# Git
PROMPT_STYLE_GIT_BRANCH="$(tput setaf 30)"
PROMPT_STYLE_GIT_STATUS="$(tput setaf 166)"
PROMPT_STYLE_GIT_STATUS_STAGED="$(tput setaf 166)"
PROMPT_STYLE_GIT_STATUS_MODIFIED="$(tput setaf 166)"
PROMPT_STYLE_GIT_STATUS_UNTRACKED="$(tput setaf 166)"
PROMPT_STYLE_GIT_STATUS_STASH="$(tput setaf 166)"

# Vim
PROMPT_STYLE_VIM="$(tput setaf 172)"

# Exit status
PROMPT_STYLE_EXIT_STATUS="$(tput setaf 196)"


# Highlight username when logged in as root.
if [[ "${USER}" == "root" ]]; then
    PROMPT_STYLE_USER="${PROMPT_STYLE_ROOT}"
fi
