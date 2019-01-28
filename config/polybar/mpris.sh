#!/bin/bash

# requires jq to work
if !hash jq 2>/dev/null; then
    echo "please install 'jq'";
fi
# Specifying the icon(s) in the script
# This allows us to change its appearance conditionally
icon="   "

GMPDIR="$(cat ${HOME}/.config/Google\ Play\ Music\ Desktop\ Player/json_store/playback.json)"

getitem() {
    item=$1
    echo "$(echo ${GMPDIR} | jq ${item} | sed 's/"//g')"
}

title="$(getitem '.song.title')"
artits="$(getitem '.song.artist')"
album="$(getitem '.song.album')"
liked="$(getitem '.rating.liked')"
if [[ $liked = 'true' ]]; then
    liked=""
else
    liked=""
fi
tcurrent="$(getitem '.time.current')"
ttotal="$(getitem '.time.total')"

mseconds="$(($ttotal - $tcurrent))"
seconds="$(($mseconds / 1000))"
tsec="$(($seconds%60))"
tsec="$(printf %02d $tsec)"
# (( $tsec < 10 )) && $tsec="0$tsec";
tmin="$(($seconds/60%60))"
remain="$tmin:$tsec"

player_status="$(getitem '.playing')"

#metadata="${title}  by  ${artits}  on  ${album} ${liked} ${remain}"
metadata="${title} - ${artits}  ${remain}  "

# Foreground color formatting tags are optional
if [[ $player_status = "true" ]]; then
    echo "%{F#F3F3BA}$icon $metadata"       # Orange when playing
elif [[ $player_status = "false" ]]; then
    echo "%{F#65737E}$icon"       # Greyed out info when paused
else
    echo "%{F#65737E}$icon"                 # Greyed out icon when stopped
fi

