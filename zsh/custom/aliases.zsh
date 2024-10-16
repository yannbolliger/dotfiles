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

function approve_many {
    if [ $# -ne 2 ]; then 
        echo "approve_many <first pr id> <number of prs>"
        return 1
    fi
    for i in {$1..$(($1 + $2 - 1))}; do 
        gh pr review -a $i
    done
}
alias apm=approve_many

# by @ex0ns
function notify {
    text="$@"
    osascript -e "display notification \"$text\" sound name \"Basso\""
}

alias cb="cargo build"
alias ct="cargo test"
alias cct="cargo clippy && cargo test"