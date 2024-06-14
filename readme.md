# YouTube Playlist Archiver

This is a forked version of [YouTube Channel Archiver](https://github.com/dmn001/youtube_channel_archiver) based on [Stephen304](https://www.reddit.com/user/Stephen304) post on [Data Hoarder](https://www.reddit.com/r/DataHoarder/comments/858ny5/my_youtubedl_config_downloading_entire_channels/) subreddit.

This fork now uses [YT-DLP](https://github.com/yt-dlp/yt-dlp) configuration and settings.

## Usage

1. Download or clone repository.
2. Navigate to extracted or cloned repository, e.g. `cd ~/youtube-playlist-archiver`.
3. Install [yt-dlp](https://github.com/yt-dlp/yt-dlp).
4. Install [aria2](https://aria2.github.io/) && [ffmpeg](http://www.ffmpeg.org/).
5. Run `./download.sh` for \*NIX or `./download.bat` for Windows.
6. Enter youtube playlist URL.
7. Wait...

**Note:** Empty file `youtube-dl-archive.txt` is used to store downloaded YouTube ids.
