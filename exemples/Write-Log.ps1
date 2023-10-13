 param(
        [Parameter(Mandatory = $true)]
        $message,

        [Parameter(Mandatory = $true)]
        [ValidateSet("info", "warning", "error")]
        $level,

        [Parameter(Mandatory = $true)]
        $path


    )

    # Définition de la couleur par niveau de message
    $textcolor = "White"
    
    if($level -like "warning"){
        $textcolor = "yellow"
    }
    elseif($level -like "error"){
        $textcolor = "red"
    }



    Write-Verbose "Génération du timestamp"
    # Récupération du timestamp
    $timeStamp = Get-Date -Format "yyyy-MM-dd hh:mm:ss"
    
    # Construction de la chaîne du message
    Write-Verbose "Construction de la chaîne du message"
    ## Ecriture 1
    $stringMsg = "{0} - {1} - {2}" -f $timeStamp, $level, $message
    ## Ecriture 2
    $stringMsg = "$timeStamp - $level - $message"


    Write-Host $stringMsg -ForegroundColor $textcolor

    Write-Verbose "Ecrite tu fichier $path avec argument Append"
    $stringMsg | Out-File $path -Append