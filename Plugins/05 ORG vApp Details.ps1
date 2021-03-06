# Start of Settings 
# End of Settings

$AllDetails = @()
Foreach ($IndividualOrg in $Org){
	$Report = ""| Select Org, NumvApp, PoweredOnvApps, PoweredOffvApps, NumVMs, NumVMsQuota, PoweredOnVMs, PoweredOffVMs
	$OrgvApps = $CIvApp | Where { $_.Org -eq $IndividualOrg }
	$OrgVMs = $CIVM | Where { $_.Org -eq $IndividualOrg }
	$Report.Org = $IndividualOrg.Name
	$Report.NumvApp = ($OrgvApps | Measure-Object).Count
	$Report.PoweredOnvApps = @($OrgvApps | Where {$_.Status -eq "PoweredOn" }).Count
	$Report.PoweredOffvApps = @($OrgvApps | Where {$_.Status -eq "PoweredOff" }).Count
	$Report.NumVMs = @($OrgVMs).Count
	$Report.NumVMsQuota = $IndividualOrg.DeployedVMQuota
	$Report.PoweredOnVMs = @($OrgVMs | Where {$_.Status -eq "PoweredOn" }).Count
	$Report.PoweredOffVMs = @($OrgVMs | Where {$_.Status -eq "PoweredOff" }).Count
	$AllDetails += $Report
}
$AllDetails

$Title = "Org vApp Details"
$Header =  "List of all Orgs and vApp Details"
$Comments = ""
$Display = "Table"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCDAudit"
