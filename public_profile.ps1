#
Set-Alias -Name gim -Value Get-InstalledModule

function b{
		vim $PROFILE
}

function sb {
		. $profile
}

function install_vbh_modules
{
		Install-Module -Name AzureAD
			Install-Module -Name ExchangeOnlineManagement
				Install-Module -Name Microsoft.Graph
}

function me {
		(iwr ifconfig.me).content
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
