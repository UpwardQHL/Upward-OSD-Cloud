Write-Host -ForegroundColor Green "Starting Upward OSDCloud ZTI - QHL"
Start-Sleep -Seconds 5

Start-OSDCloud -OSVersion 'Windows 11' -OSEdition Pro -OSLanguage en-us -OSLicense Retail -ZTI

#Restart from WinPE

Write-Host -ForegroundColor Green “Restarting in 20 seconds!”

Start-Sleep -Seconds 20

wpeutil reboot
