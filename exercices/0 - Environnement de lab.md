# Initialisation de l'environnement de lab

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
$ISOPath = "C:\Temp\SERVER_EVAL_x64FRE_en-us.iso"
$VMPaths = "C:\VMs"
$VMLists = "AD","Client"
New-Item -Force -ItemType Directory -Path "C:\VMs"
$switch = New-VMSwitch -Name "Switch-Externe" -NetAdapterName (Get-NetAdapter | ? {$_.Status -eq "Up"} | Select-Object -First 1).Name -AllowManagementOS $true
foreach($VM in $VMLists){
    $VMName = "VM-$VM"
    New-VM -Name $VMName -MemoryStartupBytes 2GB -Generation 2 -NewVHDPath "$VMPaths\$VMName\Virtual Hard Disks\VM-$VM.vhdx" -NewVHDSizeBytes 60GB -SwitchName $switch.Name
    Set-VMDvdDrive -VMName $VMName  -Path $ISOPath
    Start-VM -Name $VMName
}
```
