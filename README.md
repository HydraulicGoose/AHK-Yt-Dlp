# ahk-yt-dlp
One button youtube downloads with yt-dlp and autohotkey

# Usage
1. Download [autohotkey](https://www.autohotkey.com/), [yt-dlp](https://github.com/yt-dlp/yt-dlp/releases), [ffmpeg](https://ffmpeg.org/download.html), and this repo
2. Create config files below
3. Run script, copy youtube url, then press the `right alt` key to download video. `ctrl + right alt` to open youtube folder

All files should be in the same directory.
By default videos are stored in `%USERPROFILE%\Videos\Youtube Videos`. To customize yt-dlp behavior, edit `yt-dlp.conf`.

# Config

### yt-dlp config

Create `yt-dlp.conf` for the script to use.

```
# Yt-dlp config that downloads videos at highest quality.
# Embeds thumbnail, manual subtitles, metadata, chapters, and sponserblock segments.
# Saves videos to path %USERPROFILE%\Videos\Youtube Videos\<channel name>\date - video title - [video id].mkv

--download-archive "%USERPROFILE%\Videos\Youtube Videos\yt-archive.txt"  # Saves downloaded videos to text file for auto downloading new videos
-P "%USERPROFILE%\Videos\Youtube Videos"                                 # Path to download videos to
-o "%(uploader)s/%(upload_date)s - %(title)s [%(id)s].mkv"               # Naming convention

-f bv+ba/b                  # Best video-only + best audio-only or best combined
--concurrent-fragments 8    # Downloads 8 chunks concurrently. Faster than default

--remux-video mkv           # Remux to mkv if not already
--embed-thumbnail           # Embed thumbnail into video
--embed-subs                # Embed subtitles into video
--embed-metadata            # Embed metadata (url, description, etc.)
--embed-chapters            # Embed chapters

--sub-langs all,-live_chat  # Downloads all subtitles except auto-generated and live chat
--convert-subs "ass"        # Convert subtitles to .ass format

--no-overwrites             # Won't overwrite existing files
--sponsorblock-mark "all"   # Marks sponsorblock segments in metadata
--windows-filenames         # Restricts filename characters to be windows compatible


#--cookies-from-browser chrome      # Gets cookies from browser to bypass authentication. Fails if chrome is open
```

### Example script config

Create `ahk.conf` and specify `yt-dlp.exe` or put yt-dlp in same dir as script.

```ahk
; yt-dlp ahk config

ytDlpExe := ".\yt-dlp.exe"
ytDlpConfig := ".\yt-dlp.conf"
ytFolder := "%USERPROFILE%\Videos\Youtube Videos\" ; Include trailing slash!


; For auto download script
autoDownloadChannels := [
        "https://www.youtube.com/@channel1",
        "https://www.youtube.com/@channel2",
        "https://www.youtube.com/@channel3",
    ]
```

# Automate downloads

Can optionally include a list of youtube channels in `ahk yt-dlp.conf` and run `yt-dlp Auto Download Videos.ahk` to auto download new videos from specified channels. Use task scheduler on windows to run daily.
