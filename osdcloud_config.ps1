Write-Host -ForegroundColor Green "Starting Upward OSDCloud ZTI - QHL"
Start-Sleep -Seconds 5

#Confirmed the one below this works
#Start-OSDCloud -OSVersion 'Windows 11' -OSEdition Pro -OSLanguage "en-us" -OSLicense Retail -ZTI 

#This is the current test
$Params = @{
    OSVersion   = "Windows 11"
    OSEdition   = "Pro"
    OSLanguage  = "en-us"
    OSLicense   = "Retail"
    ZTI         = $true
    Firmware    = $true
}
Start-OSDCloud @Params

#Install DAtto
#(New-Object System.Net.WebClient).DownloadFile("https://zinfandel.rmm.datto.com/download-agent/windows/2d46424b-3d1a-4182-8180-a850f3bc0c23", "$env:TEMP/AgentInstall.exe");start-process "$env:TEMP/AgentInstall.exe"
#Restart from WinPE

Write-Host -ForegroundColor Green “Restarting in 10 seconds!”

Start-Sleep -Seconds 10

wpeutil reboot
