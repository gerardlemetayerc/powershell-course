# TP 05 - Déploiement par DSC
```
Configuration InstallIIS
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration
    
    Node "ServerName"
    {
        WindowsFeature IIS
        {
            Ensure = "Present"
            Name = "Web-Server"
        }
        
        File DefaultWebPage
        {
            Ensure = "Present"
            Type = "Directory"
            Recurse = $true
            SourcePath = "C:\WebSite"
            DestinationPath = "C:\inetpub\wwwroot"
            DependsOn = "[WindowsFeature]IIS"
        }
    }
}

# Générer le fichier de configuration MOF
InstallIIS -OutputPath "C:\MOF"

# Appliquer la configuration sur le nœud cible
Start-DscConfiguration -Path "C:\MOF" -Wait -Verbose
``
