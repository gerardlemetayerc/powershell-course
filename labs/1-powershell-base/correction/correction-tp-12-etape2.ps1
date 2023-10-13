$CSV = Invoke-RestMethod https://raw.githubusercontent.com/gerardlemetayerc/powershell-course/main/labs/1-powershell-base/resources/tp12-conf.csv | ConvertFrom-CSV -Delimiter ";"


foreach($line in $CSV){

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
        }
        $nbEssai--
    }while($nbEssai -gt 0 -and $nbAleatoire -ne $reponse)

    if($perdu)
    {
        Write-Host -ForegroundColor Red "Désolé, mais vous avez perdu."
        break;
    }

}