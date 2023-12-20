New-Item -Path "C:\Temp\" -ItemType directory -Force | Out-Null

$package = @()
$package += ,@('amazongames', 'https://download.amazongames.com/AmazonGamesSetup.exe', '9DBB71CB9C4BCAD710768DB6493317CCF31702A6023AED8700209667F0FAE547')
$package += ,@('anystream.32', 'https://www.redfox.bz/download/SetupAnyStream32.exe', 'AE526B8EAD113029AF61D0D4BE00468618B693E546D1321FF430E89016CD281E')
$package += ,@('anystream.64', 'https://www.redfox.bz/download/SetupAnyStream64.exe', 'B629EDE3D85902928E67650DE15F4E2DB40BEC0EEDF42C2FE6E1884C6686B3A9')
$package += ,@('backupstartmenulayout', 'https://www.sordum.org/files/download/backup-start-menu-layout/BackupSML.zip', '5FF727D33FD48A7C5FED464701547CBD1C4818CE0C8D87ECDC9077361E0BC966')
$package += ,@('chia-network', 'https://download.chia.net/latest/Setup-Win64.exe', '77EEB501C4B97ACDF45B256DD826136884EF3DA67BA79A70C48C40A9BD28E597')
$package += ,@('droidcam', 'https://files.dev47apps.net/win/DroidCam.Setup.6.4.3.exe', '8E71EAB54503389698604D796C18A3ED9B1B7A67817A7FAD74E86FB1B52EE500')
$package += ,@('encrypto', 'https://dl.devmate.com/com.macpaw.win.Encrypto/EncryptoforWin.exe', '841C55824F88B7FD6D1474ADB8E4F7AA854677DFAF1CE4542768DD99EB73AB59')
$package += ,@('hasleobackupsuite', 'https://www.easyuefi.com/backup-software/downloads/Hasleo_Backup_Suite_Free.exe', '2F1304623113598528C0C3A49AC9E2D1DBDACD1A363D7E74E5059B70660B0206')
$package += ,@('ledger-live', 'https://download.live.ledger.com/latest/win', '3688E3BB359ECC2591431356D4DCF5C488EEE274297CC41AACBB8B2FF654D117')
$package += ,@('powerautomatedesktop', 'https://download.microsoft.com/download/b/d/8/bd8409df-7b80-4ef7-89c5-5a7a941a5093/Setup.Microsoft.PowerAutomate.exe', 'EF1CC5296AE2757C49DD052D9CCC4D7167764A0D0DD38B3BBEDE184D05B6CC53')
$package += ,@('thumbico', 'https://download.aurelitec.com/thumbico/windows/thumbico-install.exe', '4B7BE6842F95A3252633B30B2AFD292A25D5794FF7C7C1B03B382474B5A3D167')
$package += ,@('tiptoimanager', 'https://cdn.ravensburger.de/db/Installer/tiptoi_Manager_Installer.exe', '529E1B61DC60121FA0A72DD4CDDB4129F8DEF09ECBACE9F665BA2B5FB7953DC7')

foreach($array in $package)
    {
    $a = $array[0]
	$dest = "C:\Temp\$a.dump"
    Write-host "Check:" $array[0] -NoNewline
	
	# Start-BitsTransfer -Source $array[1] -Destination $dest
	# $WebClient = New-Object System.Net.WebClient
	# $WebClient.DownloadFile($array[1],$dest);  
	
	$ProgressPreference = 'SilentlyContinue' 
	Invoke-WebRequest -Uri $array[1] -OutFile $dest
	
	if((Get-FileHash $dest).hash -ne ($array[2]))
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
