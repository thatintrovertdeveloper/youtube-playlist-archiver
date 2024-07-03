#!/bin/bash

# Create a file if youtube-dl-playlists.txt does not exist
if [[ ! -f youtube-dl-playlists.txt ]]; then
  touch youtube-dl-playlists.txt
fi

# Get input from user
printf "Enter URL: "
read -r videourl

# Check if videourl is already in the file
if grep -Fxq "$videourl" youtube-dl-playlists.txt; then
  printf "Video already in file\n"
else
  printf "%s\n" "$videourl" >> youtube-dl-playlists.txt
fi

# Execute command
prompt="Choose an option:"
formats=("video" "audio" "playlist" "audio-playlist")

PS3="$prompt "

select format in "${formats[@]}"; do
  case $format in
    "video")
      printf "Downloading video\n"
      yt-dlp --config-location "$(dirname "$0")/config/video.conf"
      sed i -e '$ s/$/ '"$format"' /' "$(dirname "$0)/youtube-dl-archive.txt)"
      exit 0
      ;;
    "audio")
      printf "Downloading audio\n"
      yt-dlp --config-location "$(dirname "$0")/config/audio.conf"
      sed i -e '$ s/$/ '"$format"' /' "$(dirname "$0)/youtube-dl-archive.txt)"
      exit 0
      ;;
    "playlist")
      printf "Downloading video playlist\n"
      yt-dlp --config-location "$(dirname "$0")/config/video-playlist.conf"
      sed i -e '$ s/$/ '"$format"' /' "$(dirname "$0)/youtube-dl-archive.txt)"
      exit 0
      ;;
    "audio-playlist")
      printf "Downloading audio playlist\n"
      yt-dlp --config-location "$(dirname "$0")/config/audio-playlist.conf"
      sed i -e '$ s/$/ '"$format"' /' "$(dirname "$0)/youtube-dl-archive.txt)"
      exit 0
      ;;
    *)
      printf "Invalid option\n"
      exit 1
      ;;
  esac
done
