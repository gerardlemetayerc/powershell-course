# Lecture et Écriture avec PowerShell

PowerShell est un outil formidable pour manipuler des fichiers et des données. Ce chapitre se concentre sur les bases de la lecture et de l'écriture de données à l'aide de PowerShell.

## Table des matières

1. [Lire des données depuis un fichier](#lire-des-données-depuis-un-fichier)
2. [Écrire des données dans un fichier](#écrire-des-données-dans-un-fichier)
3. [Manipuler des formats courants](#manipuler-des-formats-courants)

### Lire des données depuis un fichier

PowerShell propose plusieurs cmdlets pour lire des données depuis un fichier. Le plus couramment utilisé est `Get-Content`.

```powershell
# Lire le contenu d'un fichier
$contenu = Get-Content -Path 'C:\Chemin\Vers\Fichier.txt'
Write-Output $contenu
```

Pour lire les données sous forme de tableau (chaque ligne comme un élément du tableau) :

```powershell
$lines = Get-Content -Path 'C:\Chemin\Vers\Fichier.txt'
foreach ($line in $lines) {
    Write-Output $line
}
```

### Écrire des données dans un fichier

La cmdlet `Set-Content` est fréquemment utilisée pour écrire dans un fichier. Si le fichier n'existe pas, PowerShell le crée pour vous.

```powershell
# Écrire dans un fichier
Set-Content -Path 'C:\Chemin\Vers\Fichier.txt' -Value 'Ceci est un texte de test.'
```

Pour ajouter du contenu à un fichier existant sans écraser le contenu original, utilisez `Add-Content`.

```powershell
# Ajouter au fichier existant
Add-Content -Path 'C:\Chemin\Vers\Fichier.txt' -Value 'Ceci est ajouté au fichier existant.'
```

### Manipuler des formats courants

PowerShell prend en charge de nombreux formats courants, tels que CSV, XML et JSON.

**CSV :**

```powershell
# Lire un fichier CSV
$data = Import-Csv -Path 'C:\Chemin\Vers\Fichier.csv'

# Écrire dans un fichier CSV
$data | Export-Csv -Path 'C:\Chemin\Vers\NouveauFichier.csv' -NoTypeInformation
```

**JSON :**

```powershell
# Lire un fichier JSON
$jsonData = Get-Content -Path 'C:\Chemin\Vers\Fichier.json' | ConvertFrom-Json

# Écrire dans un fichier JSON
$jsonData | ConvertTo-Json | Set-Content -Path 'C:\Chemin\Vers\NouveauFichier.json'
```

## Conclusion

PowerShell offre une grande flexibilité pour lire et écrire des données dans différents formats. En maîtrisant ces bases, vous pourrez facilement automatiser de nombreux scénarios de manipulation de données.
