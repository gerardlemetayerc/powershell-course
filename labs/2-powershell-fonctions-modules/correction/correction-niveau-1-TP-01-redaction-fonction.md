```
function Write-Log {
    param(
        [Parameter(Mandatory=$true)]
        [ValidateSet("ERROR", "INFO", "DEBUG", "WARNING")]
        [string]$level,
        [Parameter(Mandatory=$true)]
        [string]$message,
        [Parameter(Mandatory=$true)]
        [string]$logfile
    )

    $logPath = Split-Path $logfile
    if(-not(Test-Path $logPath)){
        New-Item -Path $logPath -Force -ItemType Directory | Out-Null
    }

    $date = $(Get-Date -Format "dd/MM/yyyy HH:mm:ss").ToString()

    $messageToLog = "$date - $level - $message"

    Out-File -FilePath $logfile -Encoding utf8 -Append -Force -InputObject $messageToLog

}
```
