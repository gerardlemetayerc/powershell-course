# TP 04 - Manipulation de JEA

## Étape 1 : Création d'un profil PowerShell JEA

```
$JeaConfig = @{
    SessionType = 'RestrictedRemoteServer'
    RunAsVirtualAccount = $true
    TranscriptDirectory = 'C:\JEA\Transcripts'
    ModulesToImport = @('AzureAD')
    VisibleCmdlets = @('Get-Process')
    Path = "C:\JEA\"
}
New-PSSessionConfigurationFile @JeaConfig 
```

## Etape 2 - Enregistrement du profil
```
Register-PSSessionConfiguration -Name 'JEAProfile' -Path 'C:\JEA\SyncProfile.pssc'
```

## Etape 3 - Définitio des autorisations

```
$Group = Get-ADGroup -Identity 'JEA-SyncAdmins’ 
Set-PSSessionConfiguration -Name 'JEAProfile' -ShowSecurityDescriptorUI 

$SDDL = (Get-PSSessionConfiguration -Name 'SyncProfile').SecurityDescriptorSddl $NewSDDL = $SDDL -replace 'S:(.*)', "S:$1;G:${Group.SID}(R)« 
Set-PSSessionConfiguration -Name 'SyncProfile' -SecurityDescriptorSddl $NewSDDL
```


## Etape 4 - Connexion à JEA

```
New-PSesssion -ConfigurationName JEAProfile | Enter-PSSession
```
