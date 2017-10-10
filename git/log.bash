#!/bin/bash

# This super fancy git log was copied from Gary Bernhardt's dotfiles and
# then refactored to make it easier to conceive.
#
# Example log output:
#
# * ca5d121  (2 months)  <Tommy Vagbratt>   This is where it all begins...
#

fancy_git_head() {
    fancy_git_log -1
    echo
    git show -p --pretty="tformat:"
}

# The time massaging regexes start with ^[^<]* because that ensures that they
# only operate before the first "<". That "<" will be the beginning of the
# author name, ensuring that we don't destroy anything in the commit message
# that looks like time.
reformat_timestamp() {
    # Replace (2 years ago) with (2 years)
    sed -Ee 's/(^[^<]*) ago\)/\1)/' |
    # Replace (2 years, 5 months) with (2 years)
    sed -Ee 's/(^[^<]*), [[:digit:]]+ .*months?\)/\1)/'
}

highlight_merge_commits() {
    local COLOR_RED="$(tput setaf 196)"
    local COLOR_RESET="$(tput sgr0)"
    sed -Ee "s/(Merge (branch|remote-tracking branch|pull request) .*$)/$(printf ${COLOR_RED})\1$(printf ${COLOR_RESET})/"
}

git_log() {
    local HASH="%C(yellow)%h%Creset"
    local RELATIVE_TIME="%C(green)(%ar)%Creset"
    local AUTHOR="%C(bold magenta)<%an>%Creset"
    local REFS="%C(bold red)%d%Creset"
    local SUBJECT="%s"

    local FORMAT="$HASH}$RELATIVE_TIME}$AUTHOR}$REFS $SUBJECT"
    git log --graph --pretty="tformat:${FORMAT}" $*
}

# Line columns up based on } delimiter. A } in the commit message or
# any other field will break this.
align_columns() {
    column -s '}' -t
}

# Page only if asked to.
page_or_not() {
    if [ -n "$GIT_NO_PAGER" ]; then
        cat
    else
        less --quit-if-one-screen --no-init --RAW-CONTROL-CHARS --chop-long-lines
    fi
}

fancy_git_log() {
    git_log $* |
    reformat_timestamp |
    align_columns |
    highlight_merge_commits |
    page_or_not
}
