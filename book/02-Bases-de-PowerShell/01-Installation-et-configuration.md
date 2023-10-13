# Installation et Configuration de PowerShell

PowerShell est une interface en ligne de commande (CLI) et un langage de script développé par Microsoft. Il est conçu pour automatiser les tâches du système d'exploitation et gérer les configurations. Dans ce chapitre, nous couvrirons l'installation de PowerShell et ses configurations de base.

## Table des matières

- [Prérequis](#prérequis)
- [Installation sur Windows](#installation-sur-windows)
  - [Windows PowerShell](#windows-powershell)
  - [PowerShell 7](#powershell-7)
- [Installation sur macOS](#installation-sur-macos)
- [Installation sur Linux](#installation-sur-linux)
- [Configuration initiale](#configuration-initiale)
- [Conclusion](#conclusion)

## Prérequis

- Un système d'exploitation Windows 7 ou ultérieur pour Windows PowerShell.
- Pour PowerShell Core (maintenant appelé PowerShell 7), vous pouvez également l'installer sur macOS et Linux.

## Installation sur Windows

### Windows PowerShell

Windows PowerShell est préinstallé sur la plupart des versions modernes de Windows. Pour vérifier la version installée :

```powershell
$PSVersionTable.PSVersion
```

### PowerShell 7

1. Accédez à la page [GitHub releases de PowerShell](https://github.com/PowerShell/PowerShell/releases).
2. Téléchargez le package MSI correspondant à votre architecture (x86 ou x64).
3. Exécutez le fichier téléchargé pour démarrer l'installation.

## Installation sur macOS

Utilisez Homebrew pour installer PowerShell :

```bash
brew cask install powershell
```

## Installation sur Linux

La méthode d'installation varie en fonction de la distribution Linux. Pour des instructions spécifiques à votre distribution, consultez la [documentation officielle](https://docs.microsoft.com/fr-fr/powershell/scripting/install/installing-powershell-core-on-linux).

## Configuration initiale

Après avoir installé PowerShell, il est recommandé de :

- Configurer votre profil pour personnaliser votre environnement.
- Mettre à jour le module `PSReadline` pour améliorer l'expérience de saisie.
- Explorer les modules disponibles et envisager d'installer des modules supplémentaires selon vos besoins.

## Conclusion

L'installation et la configuration de base de PowerShell sont simples. Une fois que vous avez PowerShell en place, vous êtes prêt à plonger dans le monde passionnant de l'automatisation et de la gestion des scripts !
