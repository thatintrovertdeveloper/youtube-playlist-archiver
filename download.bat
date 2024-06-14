@echo off
setlocal

:: Create a file if youtube-dl-playlists.txt does not exist
if not exist youtube-dl-playlists.txt (
    type nul > youtube-dl-playlists.txt
)

:: Get input from user
set /p videourl="Enter URL: "

:: Check if videourl is already in the file
find /i "%videourl%" youtube-dl-playlists.txt > nul
if %errorlevel%==0 (
    echo Video already in file
) else (
    echo %videourl% >> youtube-dl-playlists.txt
)

:: Execute command
:menu
echo Choose an option:
echo 1. video
echo 2. audio
echo 3. playlist
echo 4. audio-playlist

set /p choice=
if "%choice%"=="1" (
    echo Downloading video
    yt-dlp --config-location %~dp0config\video.conf
    exit /b 1
) else if "%choice%"=="2" (
    echo Downloading audio
    yt-dlp --config-location %~dp0config\audio.conf
    exit /b 1
) else if "%choice%"=="3" (
    echo Downloading video playlist
    yt-dlp --config-location %~dp0config\video-playlist.conf
    exit /b 1
) else if "%choice%"=="4" (
    echo Downloading audio playlist
    yt-dlp --config-location %~dp0config\audio-playlist.conf
    exit /b 1
) else (
    echo Invalid option
    goto menu
)
