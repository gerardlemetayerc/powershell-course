$maximum = 30
$minimum = 1
$nbEssai = 7

$perdu = $true

$nbAleatoire = Get-Random -Minimum $minimum -Maximum $maximum
clear
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
    Write-Host -ForegroundColor Red "Désolé, vous avez perdu."
}
