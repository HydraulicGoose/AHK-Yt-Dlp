#Requires AutoHotkey v2
#SingleInstance Force

; ---------- Code
if A_LineFile = A_ScriptFullPath {

    #include ahk.conf  ; Loads config file
	
	YtDlpChannelsList(ytDlpExe, ytDlpConfig, autoDownloadChannels)
	
}


; Functions ---------------------------

YtDlpChannelsList(ytdlp, config, urlList) {

	urls := ""
	for url in urlList{  ; Looks through list of urls and creates a string of urls "url1 url3 url3"
	
	    ; Checks if url is valid
	    if (RegExMatch(url, "i)^(https?|ftp)://[^\s/$.?#].[^\s]*$")) {
		    urls := urls . url . " "
			
		} else {  ; If a url is invalid, exit script
	        MsgBox "Url " url " isn't a url! Exiting app."
			ExitApp()
	    }
		
	}	
	
    ; If URLs are valid, run yt-dlp with the provided config
    Run(Format('"{}" --config-location "{}" ', ytdlp, config) . urls)
	
}