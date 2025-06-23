Set-ExecutionPolicy RemoteSigned -Force
 
Install-Module OSD -Force
 
Import-Module OSD -Force
 
New-OSDCloudTemplate
 
New-OSDCloudWorkspace -WorkspacePath C:\OSDCloud

#Cleanup Languages
$KeepTheseDirs = @('boot','efi','en-us','sources','fonts','resources')
Get-ChildItem "$(Get-OSDCloudWorkspace)\Media" | Where {$_.PSIsContainer} | Where {$_.Name -notin $KeepTheseDirs} | Remove-Item -Recurse -Force
Get-ChildItem "$(Get-OSDCloudWorkspace)\Media\Boot" | Where {$_.PSIsContainer} | Where {$_.Name -notin $KeepTheseDirs} | Remove-Item -Recurse -Force
Get-ChildItem "$(Get-OSDCloudWorkspace)\Media\EFI\Microsoft\Boot" | Where {$_.PSIsContainer} | Where {$_.Name -notin $KeepTheseDirs} | Remove-Item -Recurse -Force

New-OSDCloudWorkSpaceSetupCompleteTemplate
Edit-OSDCloudwinPE -workspacepath C:\OSDCloud -CloudDriver * -StartURL https://raw.githubusercontent.com/UpwardQHL/Upward-OSD-Cloud/refs/heads/main/osdcloud_config.ps1 -Verbose

#Edit the template file, insert the auto attend
#Maybe do it in the automate folderm maybe edit the confied files

New-OSDCloudISO
New-OSDCloudUSB

Update-OSDCloudUSB
