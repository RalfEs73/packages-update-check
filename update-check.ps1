New-Item -Path "D:\Temp\Cache" -ItemType directory -Force | Out-Null

$package = @()
$package += ,@('amazongames', 'https://download.amazongames.com/AmazonGamesSetup.exe', 'E663BB9116EF2CB557657504623C0DE7C597A3B89A061DA43AE8148655664226')
$package += ,@('anystream', 'https://www.redfox.bz/download/SetupAnyStream64.exe', 'A7D200DBBB7C1BD8E6FD70FEC06B3F6D617D9535790A8F54DF52881F1D9CDDFA')
$package += ,@('encrypto', 'https://dl.devmate.com/com.macpaw.win.Encrypto/EncryptoforWin.exe', '841C55824F88B7FD6D1474ADB8E4F7AA854677DFAF1CE4542768DD99EB73AB59')
$package += ,@('movaviscreenrecorder', 'https://files.movavi.com/x64/MovaviScreenRecorderSetupE.exe', '01225B8E0DCEF16185264F07499C7883EA5363336332EB76C5FCD45AD8F41F83')
$package += ,@('movavislideshowmaker', 'https://files.movavi.com/x64/MovaviSlideshowMakerSetup.exe', 'FFE4DFBBF5C68E0EC66B03E485D4F4577B298C0AEA464EEDB0B89CDEA1BFB725')
$package += ,@('movavivideoconverter', 'https://files.movavi.com/x64/MovaviVideoConverterSetupE.exe', '9EE8481A7F96D15BE3BA4C443AC7124A5A068BF8311D41BB402691042854DCE0')
$package += ,@('movavivideoeditorplus', 'https://cdn.movavi.com/x64/MovaviVideoEditorPlusSetupE.exe', '18D21082AA7B78EF72FE91DD6117AF9FCBB62FD652CD84F150B19F4C99D800D3')
$package += ,@('powerautomatedesktop', 'https://download.microsoft.com/download/b/d/8/bd8409df-7b80-4ef7-89c5-5a7a941a5093/Setup.Microsoft.PowerAutomate.exe', 'D3F7392ACEBB8189ECCCF43E477553CBDB34B2CFD9A4D6F1B9F6E9669A23CFBC')
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
