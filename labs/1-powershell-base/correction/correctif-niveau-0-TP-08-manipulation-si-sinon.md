# Solution 1

```powershell
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
```

# Solution 2

```powershell
$service = Get-Service Winmgmt

if($service.status -match '^(Stopped)|(Paused)$')
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
```

# Solution 3 

```powershell
$service = Get-Service winrm

switch ($service.Status)
{
    'Running' {
        Write-Host -ForegroundColor Green "Le service winRM est en cours de fonctionnement"
    }

    {$_ -in ("Stopped","Paused")}
    {
        Write-Host -ForegroundColor Yellow "Je démarre le service!"
        Start-Service -Name WinRM
    }
    Default {
        Write-Host -ForegroundColor Yellow "Le service change d'état."
    }
}
```
