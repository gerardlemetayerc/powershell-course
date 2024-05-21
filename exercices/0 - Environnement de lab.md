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

