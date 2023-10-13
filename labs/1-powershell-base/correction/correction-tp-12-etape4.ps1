function Start-Game {
    param(
        $confFile = "https://raw.githubusercontent.com/gerardlemetayerc/powershell-course/main/labs/1-powershell-base/resources/tp12-conf.csv" 
    )
    
    # On assume que l'URL ou le chargement peut ne pas fonctionner. On capture l'erreur.
    try
    {
        $CSV = Invoke-RestMethod $confFile -ErrorAction Stop | ConvertFrom-CSV -Delimiter ";"
    }
    catch{
        Write-Error "Impossible de charger le fichier $csv. Chargement du fichier par défaut."
        $confFile = "https://raw.githubusercontent.com/gerardlemetayerc/powershell-course/main/labs/1-powershell-base/resources/tp12-conf.csv"
        $CSV = Invoke-RestMethod $confFile -ErrorAction Stop | ConvertFrom-CSV -Delimiter ";"
    }

    $GUID     = New-Guid
    $date     = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $username = Read-Host "Entrez votre nom de joueur"

    $tableauScore = [System.Collections.ArrayList]::new()

    foreach($line in $CSV){

        $monObject = [PSCustomObject]@{
            partyID  = $GUID
            username = $username
            date     = $date
            niveau   = 0
            nbEssai  = 0
        }

        [int]$maximum = $line.max
        [int]$minimum = $line.min
        [int]$nbEssai = $line.essais
        [int]$niveau  = $line.niveau

        $perdu = $true

        $nbAleatoire = Get-Random -Minimum $minimum -Maximum $maximum
        clear
        Write-Host -ForegroundColor Cyan "-- Niveau $niveau `n"
        do{
        
            [int]$reponse = Read-Host "Entrez le nombre à deviner (entre $minimum et $maximum - nb essai restant : $nbEssai)"
            if($reponse -gt $nbAleatoire){
                Write-Host -ForegroundColor Yellow "Le chiffre est plus petit."
            }elseif($reponse -lt $nbAleatoire)
            {
                Write-Host -ForegroundColor Yellow "Le chiffre est plus grand."
            }else{
                $perdu = $false
                Write-Host -ForegroundColor Green "Bravo, vous avez trouvé."
                $monObject.niveau  = $niveau
                $monObject.nbEssai = $line.essais - $nbEssai
                $tableauScore.Add($monObject)
            }
            $nbEssai--
        }while($nbEssai -gt 0 -and $nbAleatoire -ne $reponse)

        if($perdu)
        {
            Write-Host -ForegroundColor Red "Désolé, mais vous avez perdu."
            break;
        }

    }

    $tableauScore | Export-Csv -Delimiter ";" -Path "party_history.csv" -Append -NoTypeInformation
}