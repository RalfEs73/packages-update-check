New-Item -Path "D:\Temp\Cache" -ItemType directory -Force | Out-Null

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

$package = @()
$package += ,@('amazongames', 'https://download.amazongames.com/AmazonGamesSetup.exe', '1A99F1054E51FE86416C59E5C526D69776FDABD7BB9831DBAAB8582322121C7A')
$package += ,@('anystream', 'https://www.redfox.bz/download/SetupAnyStream64.exe', '5E12B7DF196FC55FB8812036FAE692D4B4D8B34287A86577035093BDB84B8508')
$package += ,@('encrypto', 'https://dl.devmate.com/com.macpaw.win.Encrypto/EncryptoforWin.exe', '841C55824F88B7FD6D1474ADB8E4F7AA854677DFAF1CE4542768DD99EB73AB59')
$package += ,@('movaviscreenrecorder', 'https://files.movavi.com/x64/MovaviScreenRecorderSetupE.exe', '6A0F310D4633B7D25AE207873926294EDA13AD802A88AEBC751788B5A23302E0')
$package += ,@('movavislideshowmaker', 'https://files.movavi.com/x64/MovaviSlideshowMakerSetup.exe', '9257574C82062730A905F95B23D785A3C41E2FB45DBBDEB8BCD043D4A9B48915')
$package += ,@('movavivideoconverter', 'https://files.movavi.com/x64/MovaviVideoConverterSetupE.exe', '5B075B159162643A7A5548A45871F36B8C050CDDB10C0DE47EADD9338A8BE04C')
$package += ,@('movavivideoeditorplus', 'https://cdn.movavi.com/x64/MovaviVideoEditorPlusSetupE.exe', '02941990F5177DA5DC818A0F3BC30C53F5386916BB2F06FE0E4F1922F78E4551')
$package += ,@('powerautomatedesktop', 'https://download.microsoft.com/download/b/d/8/bd8409df-7b80-4ef7-89c5-5a7a941a5093/Setup.Microsoft.PowerAutomateDesktop.exe', 'E7700B49962AEB0F5AC2377E5F41D4D3DE1F972544AFDE1D7126F71123B09F62')
$package += ,@('thumbico', 'https://download.aurelitec.com/thumbico/windows/thumbico-install.exe', '4B7BE6842F95A3252633B30B2AFD292A25D5794FF7C7C1B03B382474B5A3D167')
$package += ,@('touchportal', 'https://www.touch-portal.com/downloads/TouchPortal_Setup.exe', 'BA07DCC69DD39C98F95E24B60C2B6F39E91E3B9C5224C32FDAE35BE2FE5CE021')
$package += ,@('droidcam', 'https://files.dev47apps.net/win/DroidCam.Setup.6.4.3.exe', '8E71EAB54503389698604D796C18A3ED9B1B7A67817A7FAD74E86FB1B52EE500')
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
