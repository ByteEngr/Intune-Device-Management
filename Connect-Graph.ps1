<#
.SYNOPSIS
    Connect to Graph with Intune, Device, and Autopilot permissions
#>

param(
    [string[]]$Scopes = @(
        "Device.Read.All",
        "DeviceManagementManagedDevices.ReadWrite.All",
        "DeviceManagementConfiguration.ReadWrite.All",
        "DeviceManagementServiceConfig.ReadWrite.All",
        "Directory.Read.All"
    )
)

Write-Host "Connecting to Microsoft Graph..." -ForegroundColor Cyan

try {
    Connect-MgGraph -Scopes $Scopes -ErrorAction Stop
    Write-Host "Connected successfully." -ForegroundColor Green
}
catch {
    Write-Host "❌ Connection failed: $($_.Exception.Message)" -ForegroundColor Red
}
