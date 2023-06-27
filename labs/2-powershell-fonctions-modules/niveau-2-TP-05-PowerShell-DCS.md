# TP 05 - Déploiement par DSC

Depuis PoweShell en tant qu'administrateur

```
Configuration InstallIIS
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    
    Node "$(hostname)"
    {
        WindowsFeature IIS
        {
            Ensure = "Present"
            Name = "Web-Server"
        }

        File DefaultDirectory
        {
            Type = 'Directory'
            DestinationPath = "C:\WebSite"
            Ensure = "Present"
        }


        File DefaultWebPage
        {
            Ensure = "Present"
            Type = "Directory"
            Recurse = $true
            SourcePath = "C:\WebSite"
            DestinationPath = "C:\inetpub\wwwroot"
            DependsOn = "[WindowsFeature]IIS", "[File]DefaultDirectory"
        }
    }
}

# Générer le fichier de configuration MOF
InstallIIS -OutputPath "C:\MOF"

# Appliquer la configuration sur le nœud cible
Start-DscConfiguration -Path "C:\MOF" -Wait -Verbose
```
