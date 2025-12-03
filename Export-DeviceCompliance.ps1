Import-Module Microsoft.Graph.DeviceManagement
. .\Connect-Graph.ps1

Write-Host "Exporting device compliance state..." -ForegroundColor Cyan

$compliance = Get-MgDeviceManagementManagedDevice -All |
    Select-Object deviceName, operatingSystem, complianceState, jailbreakDetected, userPrincipalName

$compliance | Export-Csv "./Reports/Compliance-Report.csv" -NoTypeInformation

Write-Host "Compliance report saved to Reports/Compliance-Report.csv" -ForegroundColor Green
