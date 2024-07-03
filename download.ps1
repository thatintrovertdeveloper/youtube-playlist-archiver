# Create a file if youtube-dl-playlists.txt does not exist
if (-not (Test-Path -Path "youtube-dl-playlists.txt")) {
    New-Item -ItemType File -Path "youtube-dl-playlists.txt" -Force
}

# Get input from user
$videoUrl = Read-Host -Prompt "Enter URL"

# Check if videourl is already in the file
$content = Get-Content -Path "youtube-dl-playlists.txt"
if ($content -contains $videoUrl) {
    Write-Host "Video already in file"
} else {
    Add-Content -Path "youtube-dl-playlists.txt" -Value $videoUrl
}

# Execute command
:menu
Write-Host "Choose an option:"
Write-Host "1. video"
Write-Host "2. audio"
Write-Host "3. playlist"
Write-Host "4. audio-playlist"

$choice = Read-Host
switch ($choice) {
    1 {
        Write-Host "Downloading video"
        yt-dlp --config-location "$PSScriptRoot\config\video.conf"
        break
    }
    2 {
        Write-Host "Downloading audio"
        yt-dlp --config-location "$PSScriptRoot\config\audio.conf"
        break
    }
    3 {
        Write-Host "Downloading video playlist"
        yt-dlp --config-location "$PSScriptRoot\config\video-playlist.conf"
        break
    }
    4 {
        Write-Host "Downloading audio playlist"
        yt-dlp --config-location "$PSScriptRoot\config\audio-playlist.conf"
        break
    }
    default {
        Write-Host "Invalid option"
        goto menu
    }
}
