New-Item -Path "D:\Temp\Cache" -ItemType directory -Force | Out-Null

$package = @()
$package += ,@('amazongames', 'https://download.amazongames.com/AmazonGamesSetup.exe', '9DBB71CB9C4BCAD710768DB6493317CCF31702A6023AED8700209667F0FAE547')
$package += ,@('anystream.64', 'https://www.redfox.bz/download/SetupAnyStream64.exe', '47AE7F019F1E682348CC88386729C2604C24F858B7D7EB9150230D2064FAEB35')
$package += ,@('anystream.32', 'https://www.redfox.bz/download/SetupAnyStream32.exe', '084B912EE8DEEC4AC8B5A3EBBC0363B671322604CE4139A53C5AD22A0C61702E')
$package += ,@('backupstartmenulayout', 'https://www.sordum.org/files/download/backup-start-menu-layout/BackupSML.zip', 'AC79D94460B189784B3ACDD30BCCC1FBC3CF49CE0942426FCB263F5E5957C6A4')
$package += ,@('chia-network', 'https://download.chia.net/latest/Setup-Win64.exe', 'C38C3EF92E2F63766FC15515EBB5F65E985D54F55DF9CD7CE566ED8C91FBB629')
$package += ,@('encrypto', 'https://dl.devmate.com/com.macpaw.win.Encrypto/EncryptoforWin.exe', '841C55824F88B7FD6D1474ADB8E4F7AA854677DFAF1CE4542768DD99EB73AB59')
$package += ,@('powerautomatedesktop', 'https://download.microsoft.com/download/b/d/8/bd8409df-7b80-4ef7-89c5-5a7a941a5093/Setup.Microsoft.PowerAutomate.exe', '54C22E5A9342633465332194D97DE9984E5D7C20347166EEE0F955A2619F730A')
$package += ,@('thumbico', 'https://download.aurelitec.com/thumbico/windows/thumbico-install.exe', '4B7BE6842F95A3252633B30B2AFD292A25D5794FF7C7C1B03B382474B5A3D167')
$package += ,@('tiptoimanager', 'https://www.ravensburger.de/db/Installer/tiptoi_Manager_Installer.exe', '9190AE58AB8315C1C2592948718811A334493489D1DE56121F7C40A399F1839E')
$package += ,@('touchportal', 'https://www.touch-portal.com/downloads/TouchPortal_Setup_release.exe', 'E43016BC99F41A5AF7C09E9898057BB2C5ECC817F3A39857F5F7EC6AEF3635C0')
$package += ,@('droidcam', 'https://files.dev47apps.net/win/DroidCam.Setup.6.4.3.exe', '8E71EAB54503389698604D796C18A3ED9B1B7A67817A7FAD74E86FB1B52EE500')
$package += ,@('tiptoimanager', 'https://www.ravensburger.de/db/Installer/tiptoi_Manager_Installer.exe', '9190AE58AB8315C1C2592948718811A334493489D1DE56121F7C40A399F1839E')

foreach($array in $package)
    {
    $a = $array[0]
	$dest = "D:\Temp\Cache\$a.dump"
    Write-host "Check:" $array[0] -NoNewline
	## Start-BitsTransfer -Source $array[1] -Destination $dest
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
