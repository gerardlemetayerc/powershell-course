# TP 04 - Manipulation de JEA

## Étape 1 : Création d'un profil PowerShell JEA

```
$JeaConfig = @{
    SessionType = 'RestrictedRemoteServer'
    RunAsVirtualAccount = $true
    TranscriptDirectory = 'C:\JEA\Transcripts'
    ModulesToImport = @('AzureAD')
    VisibleCmdlets = @('Start-ADSyncSyncCycle')
    SessionRoleCapabilities = @(
        @{
            RoleCapabilities = 'SyncAdmin'
            RoleName = 'AzureADSyncAdmin'
        }
    )
}
New-PSSessionConfigurationFile -Path 'C:\JEA\SyncProfile.pssc' -ConfigurationData $JeaConfig 
```

## Etape 2 - Enregistrement du profil
```
Register-PSSessionConfiguration -Name 'SyncProfile' -Path 'C:\JEA\SyncProfile.pssc'
```

## Etape 3 - Définitio des autorisations

```
$Group = Get-ADGroup -Identity 'JEA-SyncAdmins’ 
Set-PSSessionConfiguration -Name 'SyncProfile' -ShowSecurityDescriptorUI 

$SDDL = (Get-PSSessionConfiguration -Name 'SyncProfile').SecurityDescriptorSddl $NewSDDL = $SDDL -replace 'S:(.*)', "S:$1;G:${Group.SID}(R)« 
Set-PSSessionConfiguration -Name 'SyncProfile' -SecurityDescriptorSddl $NewSDDL
```
