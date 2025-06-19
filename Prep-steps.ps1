Set-ExecutionPolicy RemoteSigned -Force
 
Install-Module OSD -Force
 
Import-Module OSD -Force
 
New-OSDCloudTemplate -SetInputLocale en-us
 
New-OSDCloudWorkspace -WorkspacePath C:\OSDCloud
 

#Edit-OSDCloudwinPE -CloudDriver * -StartOSDCloud "-OSVersion 'Windows 11' -OSEdition Pro -OSLanguage en-us -OSLicense Retail -ZTI -Restart" -Brand 'Upward - QHL' -StartPSCommand 
#Edit-OSDCloudwinPE -workspacepath C:\OSDCloud -CloudDriver * -WebPSScript https://raw.githubusercontent.com/UpwardQHL/Upward-OSD-Cloud/refs/heads/main/osdcloud_config.ps1 -Verbose
Edit-OSDCloudwinPE -CloudDriver * -StartURL "https://raw.githubusercontent.com/UpwardQHL/Upward-OSD-Cloud/refs/heads/main/osdcloud_config.ps1" -Verbose

New-OSDCloudUSB
New-OSDCloudISO
 
Update-OSDCloudUSB
