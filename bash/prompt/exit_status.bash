#=======================================================================
# Prompt plugin: Exit Status
#=======================================================================

# Display the exit status of last command
prompt_exit_status() {
    EXIT_STATUS=$?
    [ $EXIT_STATUS -ne 0 ] && echo -e "${PROMPT_STYLE_SEPERATOR} exit status ${PROMPT_STYLE_EXIT_STATUS}${EXIT_STATUS}"
}
