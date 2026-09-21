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

# cargo
alias cb="cargo build"
alias cl="cargo clippy"
alias ct="cargo nextest run"
alias clt="cargo clippy && cargo nextest run"

# yt-dl for music
alias ytmp3="yt-dlp -x --audio-format mp3 --embed-thumbnail --embed-metadata --ppa 'ThumbnailsConvertor:-vf crop=ih:ih'"