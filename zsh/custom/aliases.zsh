alias gs="git status"

function branch_top {
    BRANCH=$(git_current_branch)
    gcm && gl && gco $BRANCH && grbm
}
alias bt=branch_top

# by Guillaume Tournigand
function notify {
    text="$@"
    osascript -e "display notification \"$text\" sound name \"Basso\""
}
