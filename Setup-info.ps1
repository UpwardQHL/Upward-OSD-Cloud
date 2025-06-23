Set-ExecutionPolicy RemoteSigned -Force
 
Install-Module OSD -Force
 
Import-Module OSD -Force
 
New-OSDCloudTemplate
 
New-OSDCloudWorkspace -WorkspacePath C:\OSDCloud
 

Edit-OSDCloudwinPE -workspacepath C:\OSDCloud -CloudDriver * -StartURL https://raw.githubusercontent.com/UpwardQHL/Upward-OSD-Cloud/refs/heads/main/osdcloud_config.ps1 -Verbose
New-OSDCloudWorkSpaceSetupCompleteTemplate
#Edit the template file, insert the auto attend

New-OSDCloudISO
New-OSDCloudUSB

Update-OSDCloudUSB
