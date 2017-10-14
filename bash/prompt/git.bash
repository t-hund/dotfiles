#=======================================================================
# Prompt plugin: Git
#=======================================================================

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
                s+="${PROMPT_STYLE_GIT_STATUS_STAGED}+${PROMPT_STYLE_GIT_STATUS}"
            fi

            # Check for unstaged changes.
            if ! $(git diff-files --quiet --ignore-submodules --); then
                s+="${PROMPT_STYLE_GIT_STATUS_MODIFIED}!${PROMPT_STYLE_GIT_STATUS}"
            fi

            # Check for untracked files.
            if [ -n "$(git ls-files --others --exclude-standard)" ]; then
                s+="${PROMPT_STYLE_GIT_STATUS_UNTRACKED}?${PROMPT_STYLE_GIT_STATUS}"
            fi

            # Check for stashed files.
            if $(git rev-parse --verify refs/stash &>/dev/null); then
                s+="${PROMPT_STYLE_GIT_STATUS_STASH}\$${PROMPT_STYLE_GIT_STATUS}"
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
