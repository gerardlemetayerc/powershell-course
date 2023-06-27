TP 03 - Rédaction d'un module - Intermédiaire

Vous allez dans ce TP reprendre le module M2ICustom et améliorer l'écriture du module afin de rendre plus maintenable le code.

# Instruction

* Générez un répertoire "public" dans le répertoire M2ICustom de travail initial
* Ajoutez un fichier Write-Log.ps1, et collez la fonction Write-Log contenue dans le fichier M2ICustom.psm1
* Mettez à jour le code source de M2ICustom.psm1 avec le contenu suivant :

```
# Déclaration des répertoires potentiels
$paths = "private", "public"
$files = @()

foreach($path in $paths){
  if(Test-Path "$PSScriptRoot\$path\"){
    # Recherche des fichiers à charger
    $files = $files + $(Get-ChildItem "$PSScriptRoot\$path\")
  }
}

# Chargement des fichiers
$files | %{. $_.fullName}
```

* Générez le fichier de metadata grâce à la ligne de commande suivante :
```
New-moduleManifest -Path .\M2ICustom\M2ICustom.psd1 -Guid $(new-guid) -Author "Votre nom / prénom" -CompanyName "Votre socété" -RootModule "M2ICustom.psm1" -Description "Module M2ICustom" -FunctionsToExport @('Write-Log')
```

* Déployez la nouvelle version de votre module dans le répertoire Program Files
* Ouvrez une nouvelle console PowerShell et exécutez la commande suivante :
  
```
Get-Module M2Custom  -ListAvailable
```
