# Start of Settings 
# End of Settings

$CIvApp | Select Org, Name, Description, Enabled, CPUCount, SizeGB, MemoryAllocationMB | Sort Org, Name

$Title = "vApp Details per Org"
$Header =  "List of all vApps per Org"
$Comments = ""
$Display = "Table"
$Author = "Alan Renouf"
$PluginVersion = 1.0
$PluginCategory = "vCDAudit"
