#Requires AutoHotkey v2.0

; Execute the tscon command to switch the RDP session back to the console
Run("cmd.exe /c tscon 1 /dest:console")
