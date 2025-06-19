Set-ExecutionPolicy RemoteSigned -Force
 
Install-Module OSD -Force
 
Import-Module OSD -Force
 
New-OSDCloudTemplate
 
New-OSDCloudWorkspace -WorkspacePath C:\OSDCloud
 
New-OSDCloudUSB
 
Edit-OSDCloudwinPE -workspacepath C:\OSDCloud -CloudDriver * -WebPSScript https://raw.githubusercontent.com/UpwardQHL/Upward-OSD-Cloud/refs/heads/main/osdcloud_config.ps1 -Verbose
 
New-OSDCloudISO
 
Update-OSDCloudUSB
