#=======================================================================
# Prompt plugin: Vim
#=======================================================================

# Please tell me when shell is running from vim
prompt_vim() {
    EXIT_STATUS=$?
    env | grep VIMRUNTIME > /dev/null
    if [ $? -eq 0 ]; then
        echo -e "${PROMPT_STYLE_SEPERATOR} from ${PROMPT_STYLE_VIM}vim"
    fi
    return $EXIT_STATUS
}

