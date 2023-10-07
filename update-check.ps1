New-Item -Path "C:\Temp\" -ItemType directory -Force | Out-Null

$package = @()
$package += ,@('amazongames', 'https://download.amazongames.com/AmazonGamesSetup.exe', '9DBB71CB9C4BCAD710768DB6493317CCF31702A6023AED8700209667F0FAE547')
$package += ,@('anystream.32', 'https://www.redfox.bz/download/SetupAnyStream32.exe', '98BF8D13FE06B8A6951A6D3D8BB0727E6B84D38AE41EBD33764B6E81CAB4414C')
$package += ,@('anystream.64', 'https://www.redfox.bz/download/SetupAnyStream64.exe', 'A1C2DCC90271A5582D67E555CE1292D9E97CE133FFCE97C4164FFCD6BB58C4D5')
$package += ,@('backupstartmenulayout', 'https://www.sordum.org/files/download/backup-start-menu-layout/BackupSML.zip', 'CF79FE0E05003687427845B502E29B80E57FB2FD0AF350D90D047F5432B51997')
$package += ,@('chia-network', 'https://download.chia.net/latest/Setup-Win64.exe', '6BCA14CF13D496D65DA46777E1E4AA7A1ED61174FBB4947F82DC098F2110ECE8')
$package += ,@('droidcam', 'https://files.dev47apps.net/win/DroidCam.Setup.6.4.3.exe', '8E71EAB54503389698604D796C18A3ED9B1B7A67817A7FAD74E86FB1B52EE500')
$package += ,@('encrypto', 'https://dl.devmate.com/com.macpaw.win.Encrypto/EncryptoforWin.exe', '841C55824F88B7FD6D1474ADB8E4F7AA854677DFAF1CE4542768DD99EB73AB59')
$package += ,@('hasleobackupsuite', 'https://www.easyuefi.com/backup-software/downloads/Hasleo_Backup_Suite_Free.exe', 'FEFBF4336F5BBEA644735EE9B3C1E40E7F7BD9F13DBA00229032D10085BA957C')
$package += ,@('ledger-live', 'https://download.live.ledger.com/latest/win', '2BE36C60714B77B4F504AD8E66E408A87875B11BD0E0248723869A347E3D1A02')
$package += ,@('powerautomatedesktop', 'https://download.microsoft.com/download/b/d/8/bd8409df-7b80-4ef7-89c5-5a7a941a5093/Setup.Microsoft.PowerAutomate.exe', '70355B8671D9F1915F93B1C16008AD92417F47AEAC31EAAC50ECC4897D2BD073')
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
