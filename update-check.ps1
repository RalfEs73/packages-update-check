New-Item -Path "D:\Temp\Cache" -ItemType directory -Force | Out-Null

$package = @()
$package += ,@('anystream.64', 'https://www.redfox.bz/download/SetupAnyStream64.exe', '09293B312CA80DAD2EC08FE9E0E5C35497EDBAAF040F8FEDFB652A3CB83B9BEF')
$package += ,@('anystream.32', 'https://www.redfox.bz/download/SetupAnyStream32.exe', '7D5A19EB229B3F4C9126B7900DEF25BA4F020E0DA566CC276772309AFFB0FBBF')
$package += ,@('backupstartmenulayout', 'https://www.sordum.org/files/download/backup-start-menu-layout/BackupSML.zip', '6455092ABCABBA7E46BC933C1909ADBFAEDD57096D0ED0D6ED38439DAF396C81')
$package += ,@('encrypto', 'https://dl.devmate.com/com.macpaw.win.Encrypto/EncryptoforWin.exe', '841C55824F88B7FD6D1474ADB8E4F7AA854677DFAF1CE4542768DD99EB73AB59')
$package += ,@('powerautomatedesktop', 'https://download.microsoft.com/download/b/d/8/bd8409df-7b80-4ef7-89c5-5a7a941a5093/Setup.Microsoft.PowerAutomate.exe', '69F0A9997DFCBCA028F59110156A3C0E805EEBAC5FC76DC8B39C16A85A545F29')
$package += ,@('thumbico', 'https://download.aurelitec.com/thumbico/windows/thumbico-install.exe', '4B7BE6842F95A3252633B30B2AFD292A25D5794FF7C7C1B03B382474B5A3D167')
$package += ,@('touchportal', 'https://www.touch-portal.com/downloads/TouchPortal_Setup_release.exe', '8B4D58F3E5561964CED4455F33E56823A7B321FF048B03C9A775AD3F3AF34A5F')
$package += ,@('droidcam', 'https://files.dev47apps.net/win/DroidCam.Setup.6.4.3.exe', '8E71EAB54503389698604D796C18A3ED9B1B7A67817A7FAD74E86FB1B52EE500')
$package += ,@('hasleobackupsuite', 'https://www.easyuefi.com/backup-software/downloads/Hasleo_Backup_Suite_Free.exe', '49C52FEEE345D6F295510059590A68E0B8081EBF371B2F579FDD3CE4809896AD')
$package += ,@('tiptoimanager', 'https://www.ravensburger.de/db/installer_flat/tiptoi_Manager_Installer.exe', 'C0BA379CDDB67A1BEC9867170AD42140A994FE60B4FC3F5543F379BCA2BBA49E')

foreach($array in $package)
    {
    $a = $array[0]
	$dest = "D:\Temp\Cache\$a.dump"
    Write-host "Check:" $array[0] -NoNewline
	Start-BitsTransfer -Source $array[1] -Destination $dest
	if((Get-FileHash $dest).hash  -ne ($array[2]))
		{
        $hash = (Get-FileHash $dest).hash
		Write-host " - " -NoNewline
		Write-host "Es gibt ein Update - " -Foreground Magenta -NoNewline
		Write-host $hash
		}
		else
		{
		Write-host ""
		}		
	Remove-Item $dest
    }
