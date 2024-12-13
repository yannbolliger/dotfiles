alias gs="git status"

function branch_top {
    BRANCH=$(git_current_branch)
    gcm && gl && gco $BRANCH && grbm
}
alias bt=branch_top

function spr_land {
    BRANCH=$(git_current_branch)
    spr land && gcm && gl && gb --delete $BRANCH
}
alias sprl=spr_land

# by @ex0ns
function notify {
    text="$@"
    osascript -e "display notification \"$text\" sound name \"Basso\""
}

alias cb="cargo build"
alias ct="cargo test"
alias cct="cargo clippy && cargo test"