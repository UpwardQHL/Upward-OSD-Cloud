Set-ExecutionPolicy RemoteSigned -Force
 
Install-Module OSD -Force
 
Import-Module OSD -Force
 
New-OSDCloudTemplate -SetInputLocale en-us
 
New-OSDCloudWorkspace -WorkspacePath C:\OSDCloud
#Cleanup Languages
$KeepTheseDirs = @('boot','efi','en-us','sources','fonts','resources')
Get-ChildItem "$(Get-OSDCloudWorkspace)\Media" | Where {$_.PSIsContainer} | Where {$_.Name -notin $KeepTheseDirs} | Remove-Item -Recurse -Force
Get-ChildItem "$(Get-OSDCloudWorkspace)\Media\Boot" | Where {$_.PSIsContainer} | Where {$_.Name -notin $KeepTheseDirs} | Remove-Item -Recurse -Force
Get-ChildItem "$(Get-OSDCloudWorkspace)\Media\EFI\Microsoft\Boot" | Where {$_.PSIsContainer} | Where {$_.Name -notin $KeepTheseDirs} | Remove-Item -Recurse -Force


New-OSDCloudWorkSpaceSetupCompleteTemplate 
#So, I’ve put my autounattend.xml in this location. In my case, I’ve used $(Get-OSDCloudWorkspace)\Media\OSDCloud\Automate.
#So put your auto attend there

#then copy over the script files


#Edit-OSDCloudwinPE -CloudDriver * -StartOSDCloud "-OSVersion 'Windows 11' -OSEdition Pro -OSLanguage en-us -OSLicense Retail -ZTI -Restart" -Brand 'Upward - QHL' -StartPSCommand 
#Edit-OSDCloudwinPE -workspacepath C:\OSDCloud -CloudDriver * -WebPSScript https://raw.githubusercontent.com/UpwardQHL/Upward-OSD-Cloud/refs/heads/main/osdcloud_config.ps1 -Verbose
Edit-OSDCloudwinPE -CloudDriver * -StartURL "https://raw.githubusercontent.com/UpwardQHL/Upward-OSD-Cloud/refs/heads/main/osdcloud_config.ps1" -Verbose

New-OSDCloudUSB
New-OSDCloudISO
 
Update-OSDCloudUSB
