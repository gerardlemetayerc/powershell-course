# TP 01 - Manipulation de JEA

## Etape 0 : Création du groupe AD

* Executez sur le contrôleur de domaine

```
New-ADGroup JEAAdmins Global
Get-ADGroup JEAADmins | Add-ADGroupMember -Members Administrator
```

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


## Etape 4 - Définition des autorisations

```
Set-PSSessionConfiguration -Name 'JEAProfile' -ShowSecurityDescriptorUI
# Ajoutez le groupe "JEAAdmins" avec le droit "Read" dans les permissions
```
