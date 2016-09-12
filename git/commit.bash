#!/usr/bin/env bash

git_commit() {
    if [ $# -eq 1 ]; then
        git commit --verbose -m "$1"
    else
        git commit --verbose "$@"
    fi
}
