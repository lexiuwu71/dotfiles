#!/usr/bin/env bash
# notify when mpd music changed

# mpd music directory
MUSIC_DIR="$HOME/Music/CompleteAACs"

get_cover() {
	SONG_PATH="${MUSIC_DIR}/$(mpc current -f %file%)"
    COVER_PATH="${SONG_PATH%/*}/cover.bmp"

	echo "$COVER_PATH"
}

while "true"; do
    status="`mpc status`"
    if [[ ${status} == *"[playing]"* ]]; then
        SONG_INFO="$(mpc --format '%artist%-%album%-%title%' current)"
        IFS='-'
        read -ra parts <<< "$SONG_INFO"
        dunstify -a Music --replace=27072 -t 2000 -i "$(get_cover)" "${parts[2]}" "${parts[0]}\n${parts[1]}"
    fi
    mpc current --wait > /dev/null
done

#file="/path/to/your/file.txt"
#echo ${file#*/}      # Output: path/to/your/file.txt
#echo ${file##*/}     # Output: file.txt
#echo ${file%/*}      # Output: /path/to/your
#echo ${file%%/*}     # Output: /path
#echo ${file/\/path\//} # Output: to/your/file.txt
#echo ${file//\//} # Output: pathtoyourfile.txt
