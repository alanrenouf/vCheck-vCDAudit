$Title = "Connection settings for vCD"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCDAudit"
$Display = "List"
$Header = "Connection Settings"
$Comments = "Connection Plugin for connecting to vCD"

# Start of Settings 
# End of Settings

# Adding PowerCLI vCD snapin
if (!(get-pssnapin -name VMware.VimAutomation.Cloud -erroraction silentlycontinue)) {
	add-pssnapin VMware.VimAutomation.Cloud
}

Write-CustomOut "Connecting to CI Server"
$CIServer = $Server
$CIConnection = Connect-CIServer $CIServer -User Administrator -Password Ra1nb0w
if (-not $CIConnection.IsConnected) {
	Write-Host "Unable to connect to vCloud Director, please ensure you have altered the vCloud Director server address correctly "
	Write-Host " to specify a username and password edit the connection string in the 00 Connection Plugin"
	break
}

Write-CustomOut "Collecting CIVM Objects"
$CIVM = Get-CIVM | Sort Name
Write-CustomOut "Collecting Catalog Objects"
$Catalog = Get-Catalog | Sort Name
Write-CustomOut "Collecting vApp Objects"
$CIvApp = Get-CIVapp | Sort Name
Write-CustomOut "Collecting Org Objects"
$Org = Get-Org | Sort Name
Write-CustomOut "Collecting OrgVDC Objects"
$OrgvDC = Get-OrgvDC
Write-CustomOut "Collecting ProviderVDC Objects"
$ProviderVDC = Get-ProviderVdc
Write-CustomOut "Collecting User Objects"
$CIUser = Get-CIUser
Write-CustomOut "Collecting Role Objects"
$CIRole = Get-CIRole


