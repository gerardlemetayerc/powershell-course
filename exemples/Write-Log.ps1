param(
    [Parameter(Mandatory = $true)]
    [string]$message,

    [Parameter(Mandatory = $true)]
    [ValidateSet("info", "warning", "error")]
    [string]$level,

    [Parameter(Mandatory = $true)]
    [string]$path
)

# Utilisation d'un switch pour déterminer la couleur en fonction du niveau
switch ($level) {
    "warning" { $textcolor = "Yellow" }
    "error"   { $textcolor = "Red" }
    default   { $textcolor = "White" }
}

Write-Verbose "Génération du timestamp"
# Récupération du timestamp
$timeStamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Construction de la chaîne du message
Write-Verbose "Construction de la chaîne du message"
$stringMsg = "$timeStamp - $level - $message"

Write-Host $stringMsg -ForegroundColor $textcolor

Write-Verbose "Ecriture au fichier $path avec argument Append"
$stringMsg | Out-File $path -Append