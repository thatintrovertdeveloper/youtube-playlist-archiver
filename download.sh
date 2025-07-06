#!/bin/bash

# Create a file if youtube-dl-playlists.txt does not exist
[[ -f youtube-dl-playlists.txt ]] || touch youtube-dl-playlists.txt

# Get input from user
read -rp "Enter URL: " videourl

# Check if videourl is already in the file
if grep -Fxq "$videourl" youtube-dl-playlists.txt; then
  printf "Video already in file\n"
else
  printf "%s\n" "$videourl" >> youtube-dl-playlists.txt
fi

# Ensure youtube-dl-archive.txt exists
[[ -f $(dirname "$0")/youtube-dl-archive.txt ]] || touch "$(dirname "$0")/youtube-dl-archive.txt"

# Menu options
prompt="Choose an option:"
formats=("video" "audio" "playlist" "audio-playlist")
PS3="$prompt "

select format in "${formats[@]}"; do
  case $format in
    "video"|"audio"|"playlist"|"audio-playlist")
      printf "Downloading %s\n" "$format"
      case $format in
        "video") conf="video.conf" ;;
        "audio") conf="audio.conf" ;;
        "playlist") conf="video-playlist.conf" ;;
        "audio-playlist") conf="audio-playlist.conf" ;;
      esac
      config_path="$(dirname "$0")/config/$conf"
      if [[ ! -f "$config_path" ]]; then
        printf "Error: config file %s does not exist\n" "$config_path"
        exit 1
      fi
      yt-dlp --config-location "$config_path"
      sed -i '' -e '$s/$/ '"$format"'/' "$(dirname "$0")/youtube-dl-archive.txt"
      exit 0
      ;;
    *)
      printf "Invalid option\n"
      exit 1
      ;;
  esac
  break
done
