New-Item -Path "D:\Temp\Cache" -ItemType directory -Force | Out-Null

$package = @()
$package += ,@('amazongames', 'https://download.amazongames.com/AmazonGamesSetup.exe', '9DBB71CB9C4BCAD710768DB6493317CCF31702A6023AED8700209667F0FAE547')
$package += ,@('anystream.32', 'https://www.redfox.bz/download/SetupAnyStream32.exe', '844781EC754DB4E615D58657AF8FC2343C6ACA722D7814E7D8882EF8C4E27404')
$package += ,@('anystream.64', 'https://www.redfox.bz/download/SetupAnyStream64.exe', 'AFA378B12258165E26473B6E35DA68D1BE625C6BA268E06730C6A989058D132D')
$package += ,@('backupstartmenulayout', 'https://www.sordum.org/files/download/backup-start-menu-layout/BackupSML.zip', 'B73F68EE842E6E0E5EDCABD904C3AE5F34B35D993C4B88BAAF806D1C9E2EB53A')
$package += ,@('chia-network', 'https://download.chia.net/latest/Setup-Win64.exe', 'FCF99E15298901EA4F9C5C2FD4F39F6681FB94FD6139E1FD44656A8E7F8EE1FE')
$package += ,@('droidcam', 'https://files.dev47apps.net/win/DroidCam.Setup.6.4.3.exe', '8E71EAB54503389698604D796C18A3ED9B1B7A67817A7FAD74E86FB1B52EE500')
$package += ,@('encrypto', 'https://dl.devmate.com/com.macpaw.win.Encrypto/EncryptoforWin.exe', '841C55824F88B7FD6D1474ADB8E4F7AA854677DFAF1CE4542768DD99EB73AB59')
$package += ,@('ledger-live', 'https://download.live.ledger.com/latest/win', 'E306A6C51EA0C41B498AD93ABAD619DD9A455FE1368676591F6595F7C527DCFB')
$package += ,@('powerautomatedesktop', 'https://download.microsoft.com/download/b/d/8/bd8409df-7b80-4ef7-89c5-5a7a941a5093/Setup.Microsoft.PowerAutomate.exe', '67594CE3CA277AC4F9BF05315E716A73EDCFF57F6F2317BB706D86606E3E061B')
$package += ,@('thumbico', 'https://download.aurelitec.com/thumbico/windows/thumbico-install.exe', '4B7BE6842F95A3252633B30B2AFD292A25D5794FF7C7C1B03B382474B5A3D167')
$package += ,@('tiptoimanager', 'https://www.ravensburger.de/db/Installer/tiptoi_Manager_Installer.exe', '529E1B61DC60121FA0A72DD4CDDB4129F8DEF09ECBACE9F665BA2B5FB7953DC7')
$package += ,@('touchportal', 'https://www.touch-portal.com/downloads/TouchPortal_Setup_release.exe', 'E43016BC99F41A5AF7C09E9898057BB2C5ECC817F3A39857F5F7EC6AEF3635C0')

foreach($array in $package)
    {
    $a = $array[0]
	$dest = "D:\Temp\Cache\$a.dump"
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
