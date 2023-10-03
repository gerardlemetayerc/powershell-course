# Exercice : Utilisation de la structure de contrôle SI-SINON en PowerShell

* Commencez par définir une variable contenant le chemin d'un répertoire à vérifier. Par exemple :

```powershell
$cheminDuRepertoire = "C:\tmp\Vers\Le\Repertoire"
```

* Utilisez la structure de contrôle "SI" pour vérifier si le répertoire existe. Si le répertoire existe, affichez un message indiquant que le répertoire existe. Sinon, affichez un message indiquant que le répertoire n'existe pas.

```powershell
if (Test-Path -Path $CheminDuRepertoire -PathType Container) {
    Write-Host "Le répertoire existe : $cheminDuRepertoire"
} else {
    Write-Host "Le répertoire n'existe pas : $cheminDuRepertoire"
    # Création du répertoire et de son arborescence
    New-Item -ItemType Directory -Path $cheminDuRepertoire -Force
}
```

* Testez le script en modifiant la valeur de la variable ```$CheminDuRepertoire``` pour un répertoire qui existe ou qui n'existe pas sur votre système.
