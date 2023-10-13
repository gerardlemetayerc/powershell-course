# Commandes de base de PowerShell

PowerShell est une plateforme puissante pour l'automatisation des tâches sur Windows, macOS, et Linux. Avant de plonger dans des scripts complexes, il est crucial de comprendre les commandes de base. Dans ce chapitre, nous allons explorer les commandes fondamentales de PowerShell.

## Table des matières

- [Cmdlets](#cmdlets)
- [Aide intégrée](#aide-intégrée)
- [Gestion des fichiers et dossiers](#gestion-des-fichiers-et-dossiers)
- [Gestion des processus](#gestion-des-processus)
- [Conclusion](#conclusion)

## Cmdlets

Les commandes de PowerShell sont appelées "cmdlets" (prononcé "command-lets"). Chaque cmdlet est une commande simple qui effectue une action spécifique. Par exemple :

```powershell
Get-ChildItem - répertorie les éléments d'un répertoire.
Get-Content - affiche le contenu d'un fichier.
```

## Aide intégrée

PowerShell est livré avec un système d'aide intégré. Pour obtenir de l'aide sur n'importe quelle commande, utilisez la cmdlet `Get-Help` suivie du nom de la cmdlet :

```powershell
Get-Help Get-ChildItem
```

## Gestion des fichiers et dossiers

PowerShell fournit plusieurs cmdlets pour travailler avec le système de fichiers :

```powershell
New-Item - crée un nouveau fichier ou dossier.
Remove-Item - supprime un fichier ou un dossier.
Copy-Item - copie un fichier ou un dossier d'un emplacement à un autre.
Move-Item - déplace un fichier ou un dossier d'un emplacement à un autre.
```

## Gestion des processus

Vous pouvez également gérer les processus en cours d'exécution sur votre machine avec PowerShell :

```powershell
Get-Process - liste tous les processus en cours d'exécution.
Stop-Process - arrête un processus en cours d'exécution.
Start-Process - démarre un nouveau processus.
```

## Conclusion

Comprendre les commandes de base de PowerShell est la première étape pour devenir efficace dans l'automatisation des tâches et la gestion des systèmes. Dans les chapitres suivants, nous explorerons des fonctionnalités plus avancées et des techniques pour tirer le meilleur parti de PowerShell.
