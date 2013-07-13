# Start of Settings
# End of Settings
 
# Everything in this script will run at the end of vCheck
If ($CIConnection) {
  $CIConnection | Disconnect-CIServer -Confirm:$false
}

$Title = "Disconnecting from vCD"
$Display = "None"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCDAudit"
$Header = "Disconnect from vCD"
$Comments = "Disconnect Plugin for vCD"
