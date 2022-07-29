#Main entry point, loads public_profile.ps1 for various functions and Aliases 
if (Get-Variable 'powershell_work_directory' -ErrorAction 'Ignore') {
	  #Write-Host "loading.." + $powershell_work_directory
} else {
	Write-Host "powershell_work_directory needs defined in your $PROFILE settings file."
	Exit
}

#Alias Defined Here
Set-Alias -Name gim -Value Get-InstalledModule

function b{
	if ($local_profile_script){
		vim $local_profile_script
	}
	else {
		vim $PROFILE
	}
	
}

function sb {
	#. $profile
	Write-Host("Type .$profile to reload your profile settings. I belive this is a security setting and I've not been able to make this work from a script, sorry!")
}
	
function .win {
	cd ($powershell_work_directory)
}

function pb {
        vim.exe ($powershell_work_directory + "public_profile.ps1")
}

function install_vbh_modules
{
	Install-Module -Name AzureAD -Scope CurrentUser
	Install-Module -Name ExchangeOnlineManagement -Scope CurrentUser
	Install-Module -Name Microsoft.Graph -Scope CurrentUser
        Install-Module MSOnline -Scope CurrentUser
}

function search_module_path($name)
{
	(Get-Module -ListAvailable $name*).path
}

function me {
	myip
}

function myip{
	$pubip = wget ifconfig.me
	$prvip = Test-Connection -ComputerName (hostname) -Count 1	
	$prvip = $prvip.IPV4Address.IPAddressToString
	$h = hostname
	Write-Host "IPv4 Public: $pubip" -ForegroundColor Black -BackgroundColor Green
	Write-Host "IPv4 Local: $prvip" -ForegroundColor Black -BackgroundColor Green
	Write-Host ("Hostname: " + $h ) -ForegroundColor Black -BackgroundColor Green
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

function doc {
	        cd  ($ENV:onedrive + "\Documents")
}

function wp {
	cd  ($ENV:onedrive + "\Documents\WindowsPowerShell")

}

#Git commands here
function gitgo ($note) {
	git commit -m $note
	gitpush
}

function gitpush{
	git push origin main
}

function gitpull{
	git fetch
	git pull
}

function gillpull_allow_unrelated_histories{

	git pull --allow-unrelated-histories
}

#Pull latest public profile script from github
function update_env()
{
	Write-Host "Welcome back $env:UserName don't work too hard.." -ForegroundColor green
	Write-Host "Updating .win powershell scripts." -ForegroundColor red
	cd  $powershell_work_directory
	gitpull
}

function add_pub_key($hostatserver)
{
	type $env:USERPROFILE\.ssh\id_rsa.pub | ssh $hostatserver "cat >> .ssh/authorized_keys"
	
}


#Azure Functions here


function azpass ($azUserID)
{
	Import-Module AzureAD
	Write-Host "Connecting to Azure AD"
	Connect-AzureAD
	$Secure = Read-Host "Enter New Password" -AsSecureString
	Set-AzureADUserPassword -ObjectId $azUserID -Password $Secure
}

function azcon{
	Connect-AzureAD 
}

function az_check_liscense{
	$valSkuPartNo = @('ENTERPRISEPACK','EXCHANGEDESKLESS','AAD_PREMIUM_P2','INTUNE_A','SPE_E3','SPE_E3')
	#Get-AzureADSubscribedSku | Select -Property Sku*,ConsumedUnits -ExpandProperty PrepaidUnits |  Where-Object { $_.SkuPartNumber -in $valSkuPartNo } | Format-Table -AutoSize
	$azu_license_counts = Get-AzureADSubscribedSku |Select -Property SkuPartNumber,ConsumedUnits -ExpandProperty PrepaidUnits |  Where-Object { $_.SkuPartNumber -in $valSkuPartNo } | Out-String
	Get-AzureADSubscribedSku | Select -Property SkuPartNumber,ConsumedUnits -ExpandProperty PrepaidUnits |  Where-Object { $_.SkuPartNumber -in $valSkuPartNo } | Format-Table -AutoSize
	Write-Host ($azu_license_counts)
}

function az_install_modules
{
        Install-Module -Name AzureAD
        Install-Module -Name ExchangeOnlineManagement
        #Install-Module -Name Microsoft.Graph
}

#Wirelss Functions Here
function get_ssid_creds($ssid) {
	netsh wlan show profile name=$ssid key=clear

}


function get_hash($file, $algorithm)
{
	#MD2	MD2 message-digest algorithm
	#MD4	MD4 message-digest algorithm
	#MD5	MD5 message-digest algorithm
	#SHA1	SHA-1 secure hash algorithm 1 (160 bit)
	#SHA256	SHA-2 256-bit secure hash algorithm
	#SHA384	SHA-2 384-bit secure hash algorithm
	#SHA512	SHA-2 512-bit secure hash algorithm
	if($algorithm -eq $null)
	{
		$algorithm = "MD5"
	}

	certutil -hashfile $file $algorithm
}


function getDNSCache()
{

        Get-DnsClientCache | Format-Table -AutoSize
}

function resolve_txt($domain)
{
	Resolve-DnsName $domain -Type TXT
}
