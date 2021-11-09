#
Set-Alias -Name gim -Value Get-InstalledModule

function b{
	vim $PROFILE
}

function sb {
	. $profile
}
	
function .win {
	cd ($powershell_work_directory)
}

function pb {
        vim.exe ($powershell_work_directory + "public_profile.ps1")
}


function install_vbh_modules
{
	Install-Module -Name AzureAD
	Install-Module -Name ExchangeOnlineManagement
	Install-Module -Name Microsoft.Graph
}

function me {
		#(iwr ifconfig.me).content
	myip
}

function myip{
	$pubip = wget ifconfig.me
	$prvip = Test-Connection -ComputerName (hostname) -Count 1	
	$prvip = $prvip.IPV4Address.IPAddressToString
	$h = hostname
	Write-Host "IPv4 Public: $pubip" -ForegroundColor green -BackgroundColor blue
	Write-Host "IPv4 Local: $prvip" -ForegroundColor green -BackgroundColor blue
	Write-Host ("Hostname: " + $h ) -ForegroundColor green -BackgroundColor blue
}

function ifconfig {
	ipconfig 
}


function fx {
	start firefox '-P'
}


function dt {
	cd  ($ENV:onedrive + "\Desktop")
}

function wp {
	cd  ($ENV:onedrive + "\Documents\WindowsPowerShell")

}

function azpass ($azUserID)
{
	Import-Module AzureAD
	Write-Host "Connecting to Azure AD"
	Connect-AzureAD
	$Secure = Read-Host "Enter New Password" -AsSecureString
	Set-AzureADUserPassword -ObjectId $azUserID -Password $Secure
}


function gitpush{
	git push origin main
}

function gitpull{
	git fetch
	git pull
}
