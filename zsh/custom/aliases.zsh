
alias gs="git status"

# by Guillaume Tournigand
function notify {
    text="$@"
    osascript -e "display notification \"$text\""
}
