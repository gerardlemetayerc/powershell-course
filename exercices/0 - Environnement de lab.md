# Initialisation de l'environnement de lab (Hyper-V)

## Déploiement de Hyper-V 

* Exécutez Powershell en tant qu'administrateur, puis lancez les lignes de commandes suivantes :

```powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V, Microsoft-Hyper-V-Management-PowerShell -All -NoRestart
Invoke-WebRequest -Uri "https://software-static.download.prss.microsoft.com/sg/download/888969d5-f34g-4e03-ac9d-1f9786c66749/SERVER_EVAL_x64FRE_en-us.iso" -OutFile "SERVER_EVAL_x64FRE_en-us.iso"
```

> [!WARNING]  
> Un redémarrage du poste sera néccessaire.

## Initialisation des machines virtuelles

* Executez le code suivant :

```powershell
$ErrorActionPreference = 'Stop'
$ISOPath = 'C:\Temp\SERVER_EVAL_x64FRE_en-us.iso'
if(-not(Test-Path $ISOPath)){
    Write-Error "L'ISO d'installation ne peut pas être récupéré"
    return
}
$VMPaths = "C:\VMs"
$VMLists = "AD","Client"
if(!(Test-Path $VMPaths)){
    New-Item -Force -ItemType Directory -Path "C:\VMs"
}

if(-not(Get-VMSwitch -Name "Switch-Externe" )){
    $switch = New-VMSwitch -Name "Switch-Externe" -NetAdapterName (Get-NetAdapter | ? {$_.Status -eq "Up" -and $_.Name -notmatch "^v"} | Select-Object -First 1).Name -AllowManagementOS $true
}
foreach($VM in $VMLists){
    $VMName = "VM-$VM"
    if(-not(Get-VM -Name $VMName)){
        New-VM -Name $VMName -MemoryStartupBytes 2GB -Generation 2 -NewVHDPath "$VMPaths\$VMName\Virtual Hard Disks\VM-$VM.vhdx" -NewVHDSizeBytes 60GB -SwitchName $switch.Name
    }
    $VMDvdDrive = Get-VMDvdDrive -VMName $VMName
    if(-not($VMDvdDrive))
    {
        $VMDvdDrive = Add-VMDvdDrive -VMName $VMName
    }
    $VMDvdDrive = Get-VMDvdDrive -VMName $VMName
    if(-not($VMDvdDrive.Path)){
        Set-VMDvdDrive -VMName $VMName  -Path $ISOPath
    }
    Start-VM -Name $VMName
}
```


## Configuration réseau des différentes machines

* Sur le poste de travail exécutant HyperV

```powershell
Get-NetAdapter "vEthernet (Switch-Externe)" | New-NetIPAddress -IPAddress "10.0.0.1" -PrefixLength 24
Get-NetAdapter "Ethernet" | Enable-NetAdapterBinding  -DisplayName "*v4*"
Get-NetAdapter "Ethernet" | Disable-NetAdapterBinding  -DisplayName "*v6*"
```

* Sur la machine "Contrôleur de domaine"

```powershell
# Configuration du nom d'hôte
Rename-Computer "vm-ad"
# Récupération de l'interface réseau à configurer
$Adapter = Get-NetAdapter "Ethernet"
# Configuration de l'interface réseau
$Adapter | Get-NetIPAddress -AddressFamily IpV4 | Remove-NetIPAddress -confirm:$false
$Adapter | Remove-NetRoute -confirm:$false
Get-NetAdapter "Ethernet" | New-NetIPAddress -IPAddress "10.0.0.4" -PrefixLength 24
# Ajout de la configuration DNS
$Adapter | Set-DnsClientServerAddress -ServerAddresses "10.0.0.4"
Get-TimeZone -ListAvailable | ? DisplayName -match "Paris" | Set-TimeZone
Restart-Computer
```
* Sur la machine "Serveur Client"

```powershell
# Renommage de la machine
Rename-Computer "vm-client"
# Récupération de l'interface réseau à configurer
$Adapter = Get-NetAdapter "Ethernet"
# Configuration de l'interface réseau
$Adapter | Get-NetIPAddress -AddressFamily IpV4 | Remove-NetIPAddress -confirm:$false
$Adapter | Remove-NetRoute -confirm:$false
Get-NetAdapter "Ethernet" | New-NetIPAddress -IPAddress "10.0.0.5" -PrefixLength 24
# Ajout de la configuration DNS
$Adapter | Set-DnsClientServerAddress -ServerAddresses "10.0.0.4"
Get-TimeZone -ListAvailable | ? DisplayName -match "Paris" | Set-TimeZone
Restart-Computer
```


## Installation du contrôleur de domaine

* Sur la machine VM-AD

```powershell
Install-WindowsFeature -Name AD-Domain-Services -IncludeAllSubFeature -IncludeManagementTools
Install-ADDSForest -SkipPreChecks -DomainName 'domain.local' -InstallDns
Get-ADOptionalFeature -Filter * | Where Name -match "Recycle" | Enable-ADOptionalFeature -Scope ForestOrConfigurationSet -Target mangeney.local
```


* Sur la machine VM-Client


```powershell
# Rentrez vos identifiants au format administrator@domain.local lorsque c'est demandé
Add-Computer -DomainName 'domain.local'
Restart-Computer
```