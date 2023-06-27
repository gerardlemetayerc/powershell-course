# TP 04 - Manipulation de JEA

## Étape 1 : Création d'un profil PowerShell JEA

Executez PowerShell en tant qu'administrateur.

```
$JeaConfig = @{
    SessionType = 'RestrictedRemoteServer'
    RunAsVirtualAccount = $true
    TranscriptDirectory = 'C:\JEA\Transcripts'
    VisibleCmdlets = @('Get-Process')
    Path = "C:\JEA\JEAConfig.pssc"
}
New-PSSessionConfigurationFile @JeaConfig 
```

## Etape 2 - Enregistrement du profil
```
Register-PSSessionConfiguration -Name 'JEAProfile' -Path 'C:\JEA\JEAConfig.pssc'
Restart-Service winRM
```


## Etape 3 - Connexion à JEA

```
New-PSSession -ConfigurationName JEAProfile | Enter-PSSession
```


## Etape 4 - Définition des autorisations (optionelle)

```
$Group = Get-ADGroup -Identity 'JEA-SyncAdmins’ 
Set-PSSessionConfiguration -Name 'JEAProfile' -ShowSecurityDescriptorUI 

$SDDL = (Get-PSSessionConfiguration -Name 'SyncProfile').SecurityDescriptorSddl $NewSDDL = $SDDL -replace 'S:(.*)', "S:$1;G:${Group.SID}(R)« 
Set-PSSessionConfiguration -Name 'SyncProfile' -SecurityDescriptorSddl $NewSDDL
```
