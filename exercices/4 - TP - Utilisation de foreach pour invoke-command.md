
# Configuration de winrm

* Avec CMD en tant qu'administrateur
```cmd
winrm quickconfig
winrm set winrm/config/client @{TrustedHosts="*"}
```

# Script 
```powershell
$credential = Get-Credential

# Déclaration d'un tableau "à la main"
# $monTableau = @("10.145.35.58")


$monTableau = Import-Csv -Delimiter ";" -Path .\maliste.csv

$scripblock = {
    $service = Get-Service winrm
    if(($service.status -like "Stopped") -or ($service.Status -like "Paused"))
    {
        Write-Host -ForegroundColor Yellow "Je démarre le service!"
        Start-Service -Name WinRM
    }
    elseif($service.Status -like "Running")
    {
        Write-Host -ForegroundColor Green "Le service winRM est en cours de fonctionnement"
    }
    else{
        Write-Host -ForegroundColor Yellow "Le service change d'état."
    }

}

foreach($ligne in $monTableau){
    try{    
        $name = $ligne.hostname
        $ip   = $ligne.serveur
        Write-host "Lancement du code sur : $name"
        Invoke-Command -ScriptBlock $scripblock -Credential $credential -ComputerName $ip
        $ligne.statut = "Up"
    }
    catch [System.Management.Automation.Remoting.PSRemotingTransportException]
    {
        Write-Host -ForegroundColor Red "Problème d'accès chef. :("
        $ligne.statut = "KO - mais pas d'accès"
        
    }
    catch  
    {
        Write-Host -ForegroundColor Red "J'ai glissé chef. :("
        $ligne.statut = "KO"
    }
}

 $monTableau | Export-Csv -Delimiter ";" -NoTypeInformation .\maliste.csv
```
