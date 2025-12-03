Import-Module Microsoft.Graph.DeviceManagement
. .\Connect-Graph.ps1

Write-Host "Retrieving Intune devices..." -ForegroundColor Cyan

$devices = Get-MgDeviceManagementManagedDevice -All

$output = $devices | Select-Object deviceName, osVersion, complianceState, userPrincipalName, lastSyncDateTime
$output | Export-Csv "./Reports/Device-Inventory.csv" -NoTypeInformation

Write-Host "Device inventory exported to Reports/Device-Inventory.csv" -ForegroundColor Green
