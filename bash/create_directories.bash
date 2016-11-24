#=======================================================================
# Create directories
#=======================================================================

# Create new directories.
# if creating a single directory, enter it.
function create_directories() {
    if [ $# -eq 1 ]; then
        mkdir -p "$1" && cd "$1";
    else
        mkdir -p "$@"
    fi
}

alias md="create_directories"
