#Requires AutoHotkey v2
#SingleInstance Force
TraySetIcon(".\yt-dlp.ico")


; ---------- Code
if A_LineFile = A_ScriptFullPath {

    #include ahk.conf  ; Loads config file

    ; Keybindings ---------------------------
    RControl::RunYtDlp(ytDlpExe, ytDlpConfig)
    ^RControl::Run(ytFolder)
}


; Functions ---------------------------
RunYtDlp(ytdlp, config) {

    url := A_Clipboard

    ; Check if clipboard contains a valid URL
    if (RegExMatch(url, "i)^(https?|ftp)://[^\s/$.?#].[^\s]*$")) {
        ; If URL is valid, run yt-dlp with the provided config
        Run(Format('"{}" --config-location "{}" "{}"', ytdlp, config, url))
    }
    else {
        ; Show an error if the clipboard doesn't contain a URL
        warningGui := Gui("+ToolWindow -Caption", "Error")
        warningGui.AddText(, "Copy a URL!")
        warningGui.Show("w82 h28")
        
        ; Auto-close the warning message after 1 second
        SetTimer(() => warningGui.Destroy(), -1000)
    }
}
