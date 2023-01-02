New-Item -Path "D:\Temp\Cache" -ItemType directory -Force | Out-Null

$package = @()
$package += ,@('amazongames', 'https://download.amazongames.com/AmazonGamesSetup.exe', '9DBB71CB9C4BCAD710768DB6493317CCF31702A6023AED8700209667F0FAE547')
$package += ,@('anystream.64', 'https://www.redfox.bz/download/SetupAnyStream64.exe', '6C1336C31FCCE39F51AC2C9E64936BE8A621027119B0F0D997EBDEA29462F09D')
$package += ,@('anystream.32', 'https://www.redfox.bz/download/SetupAnyStream32.exe', '2FBE2A338A3CFE09320E70077B94292678216A7339D36BBBD6AF7F54D5D605E0')
$package += ,@('backupstartmenulayout', 'https://www.sordum.org/files/download/backup-start-menu-layout/BackupSML.zip', 'AC79D94460B189784B3ACDD30BCCC1FBC3CF49CE0942426FCB263F5E5957C6A4')
$package += ,@('encrypto', 'https://dl.devmate.com/com.macpaw.win.Encrypto/EncryptoforWin.exe', '841C55824F88B7FD6D1474ADB8E4F7AA854677DFAF1CE4542768DD99EB73AB59')
$package += ,@('powerautomatedesktop', 'https://download.microsoft.com/download/b/d/8/bd8409df-7b80-4ef7-89c5-5a7a941a5093/Setup.Microsoft.PowerAutomate.exe', 'C4A93D1AFE0DE3A5713275994830DF88757AB5E7C7F5F4834D49735D4FA380F9')
$package += ,@('thumbico', 'https://download.aurelitec.com/thumbico/windows/thumbico-install.exe', '4B7BE6842F95A3252633B30B2AFD292A25D5794FF7C7C1B03B382474B5A3D167')
$package += ,@('tiptoimanager', 'https://www.ravensburger.de/db/Installer/tiptoi_Manager_Installer.exe', '4B7BE6842F95A3252633B30B2AFD292A25D5794FF7C7C1B03B382474B5A3D167')
$package += ,@('touchportal', 'https://www.touch-portal.com/downloads/TouchPortal_Setup_release.exe', '9190AE58AB8315C1C2592948718811A334493489D1DE56121F7C40A399F1839E')
$package += ,@('droidcam', 'https://files.dev47apps.net/win/DroidCam.Setup.6.4.3.exe', '8E71EAB54503389698604D796C18A3ED9B1B7A67817A7FAD74E86FB1B52EE500')
$package += ,@('hasleobackupsuite', 'https://www.easyuefi.com/backup-software/downloads/Hasleo_Backup_Suite_Free.exe', '13246E554D2AA46E83763AF2B398637B6C5AD727BD826DBD1A216735138634DB')
$package += ,@('tiptoimanager', 'https://www.ravensburger.de/db/installer_flat/tiptoi_Manager_Installer.exe', 'C0BA379CDDB67A1BEC9867170AD42140A994FE60B4FC3F5543F379BCA2BBA49E')

foreach($array in $package)
    {
    $a = $array[0]
	$dest = "D:\Temp\Cache\$a.dump"
    Write-host "Check:" $array[0] -NoNewline
	# Start-BitsTransfer -Source $array[1] -Destination $dest
	$WebClient = New-Object System.Net.WebClient
	$WebClient.DownloadFile($array[1],$dest);  
	
	if((Get-FileHash $dest).hash  -ne ($array[2]))
		{
        $hash = (Get-FileHash $dest).hash
		Write-host " - " -NoNewline
		Write-host "Es gibt ein Update" -Foreground Magenta -NoNewline
		Write-host " - " $hash
		}
		else
		{
		Write-host ""
		}		
	Remove-Item $dest
    }
