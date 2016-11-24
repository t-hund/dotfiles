#=======================================================================
# openpdf
#=======================================================================

function openpdf() {
    if [ "$(uname -s)" == "Linux" ]; then
        evince "$@"
    else
        echo "$(printf '\033[0;33;1m')Warning - openpdf is not tested on macOS yet. Does it work? $(printf '\033[0m')"
        open "$@"
    fi
}
