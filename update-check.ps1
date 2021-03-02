New-Item -Path "F:\Temp\Cache" -ItemType directory -Force | Out-Null

$CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$CurrentUserName = $CurrentUser.split("\")[1]

$package = @()
$package += ,@('amazongames', 'https://download.amazongames.com/AmazonGamesSetup.exe', '1A99F1054E51FE86416C59E5C526D69776FDABD7BB9831DBAAB8582322121C7A')
$package += ,@('anystream', 'https://www.redfox.bz/download/SetupAnyStream64.exe', 'BB45B6117D2E5F0E365E40649F7DC112D438C2C7B2D653404B1F2B8C1E180846')
$package += ,@('movaviscreenrecorder', 'https://files.movavi.com/x64/MovaviScreenRecorderSetupE.exe', '85EB42B6CA47B1CD86AD1CB2FF06587642F14D2B4946BEF08B03FC353AB91D86')
$package += ,@('movavislideshowmaker', 'https://files.movavi.com/x64/MovaviSlideshowMakerSetup.exe', '4E68456FC7D36CCF035A684D427955CA9A7977B360321E8E6820ABC7028393F4')
$package += ,@('movavivideoconverter', 'https://files.movavi.com/x64/MovaviVideoConverterSetupE.exe', '9461CC9E137054998877E87F5099AB6CFEAF1128F345ED0725EE58A8136B7F3E')
$package += ,@('movavivideoeditorplus', 'https://cdn.movavi.com/x64/MovaviVideoEditorPlusSetupE.exe', 'FEEFBF754DCC9ED32329756D37D992939A9AF0547CF6C1074609869F91DDE1D1')
$package += ,@('thumbico', 'https://download.aurelitec.com/thumbico/windows/thumbico-install.exe', '4B7BE6842F95A3252633B30B2AFD292A25D5794FF7C7C1B03B382474B5A3D167')
$package += ,@('tiptoimanager', 'https://www.ravensburger.de/db/installer_flat/tiptoi_Manager_Installer.exe', 'C0BA379CDDB67A1BEC9867170AD42140A994FE60B4FC3F5543F379BCA2BBA49E')
$package += ,@('touchportal', 'https://www.touch-portal.com/downloads/TouchPortal_Setup.exe', '88379D1C3D37504673C9D7DC3CBA5F8371DC6FEBA010230F1B7698BA47AD2C8D')
$package += ,@('powerautomatedesktop', 'https://download.microsoft.com/download/b/d/8/bd8409df-7b80-4ef7-89c5-5a7a941a5093/Setup.Microsoft.PowerAutomateDesktop.exe', '72B66D74BDA932F7CF54362751487D61D36D2C0C2AEC7DE6FD14AC6152E124C4')

foreach($array in $package)
    {
    Write-host "Check:" $array[0] -NoNewline
	Start-BitsTransfer -Source $array[1] -Destination "F:\Temp\Cache\check.dump"
	if((Get-FileHash "F:\Temp\Cache\check.dump").hash  -ne ($array[2]))
		{
		Write-host " - " -NoNewline
		Write-host "Es gibt ein Update" -Foreground Magenta
		}
		else
		{
		Write-host ""
		}		
	Remove-Item "F:\Temp\Cache\check.dump"
    }
