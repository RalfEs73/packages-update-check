New-Item -Path "D:\Temp\Cache" -ItemType directory -Force | Out-Null

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

$package = @()
$package += ,@('amazongames', 'https://download.amazongames.com/AmazonGamesSetup.exe', '1A99F1054E51FE86416C59E5C526D69776FDABD7BB9831DBAAB8582322121C7A')
$package += ,@('anystream', 'https://www.redfox.bz/download/SetupAnyStream64.exe', '469C21C37701A94525FE7A4B813214DD304A0E13C6FEDD211A996543A66E34B9')
$package += ,@('encrypto', 'https://dl.devmate.com/com.macpaw.win.Encrypto/EncryptoforWin.exe', '841C55824F88B7FD6D1474ADB8E4F7AA854677DFAF1CE4542768DD99EB73AB59')
$package += ,@('movaviscreenrecorder', 'https://files.movavi.com/x64/MovaviScreenRecorderSetupE.exe', '01225B8E0DCEF16185264F07499C7883EA5363336332EB76C5FCD45AD8F41F83')
$package += ,@('movavislideshowmaker', 'https://files.movavi.com/x64/MovaviSlideshowMakerSetup.exe', 'FFE4DFBBF5C68E0EC66B03E485D4F4577B298C0AEA464EEDB0B89CDEA1BFB725')
$package += ,@('movavivideoconverter', 'https://files.movavi.com/x64/MovaviVideoConverterSetupE.exe', '9CF78F71361EB6D696D266281115D02A9E4F86FF1E569281CDE03FDD42F545D1')
$package += ,@('movavivideoeditorplus', 'https://cdn.movavi.com/x64/MovaviVideoEditorPlusSetupE.exe', '18D21082AA7B78EF72FE91DD6117AF9FCBB62FD652CD84F150B19F4C99D800D3')
$package += ,@('powerautomatedesktop', 'https://download.microsoft.com/download/b/d/8/bd8409df-7b80-4ef7-89c5-5a7a941a5093/Setup.Microsoft.PowerAutomate.exe', '55E8B657E77C0A1FADBB6E10F373CEBF8B5574484CE7B98FB1E52E66D7B94694')
$package += ,@('thumbico', 'https://download.aurelitec.com/thumbico/windows/thumbico-install.exe', '4B7BE6842F95A3252633B30B2AFD292A25D5794FF7C7C1B03B382474B5A3D167')
$package += ,@('touchportal', 'https://www.touch-portal.com/downloads/TouchPortal_Setup.exe', 'BA07DCC69DD39C98F95E24B60C2B6F39E91E3B9C5224C32FDAE35BE2FE5CE021')
$package += ,@('droidcam', 'https://files.dev47apps.net/win/DroidCam.Setup.6.4.3.exe', '8E71EAB54503389698604D796C18A3ED9B1B7A67817A7FAD74E86FB1B52EE500')
$package += ,@('hasleobackupsuite', 'https://www.easyuefi.com/backup-software/downloads/Hasleo_Backup_Suite_Free.exe', '804AFD42D683938BFB10AD418A5B003DC861C3AF9097BB1E8322273E76404141')
$package += ,@('tiptoimanager', 'https://www.ravensburger.de/db/installer_flat/tiptoi_Manager_Installer.exe', 'C0BA379CDDB67A1BEC9867170AD42140A994FE60B4FC3F5543F379BCA2BBA49E')

foreach($array in $package)
    {
    Write-host "Check:" $array[0] -NoNewline
	Start-BitsTransfer -Source $array[1] -Destination "D:\Temp\Cache\check.dump"
	if((Get-FileHash "D:\Temp\Cache\check.dump").hash  -ne ($array[2]))
		{
		Write-host " - " -NoNewline
		Write-host "Es gibt ein Update" -Foreground Magenta
		}
		else
		{
		Write-host ""
		}		
	Remove-Item "D:\Temp\Cache\check.dump"
    }
