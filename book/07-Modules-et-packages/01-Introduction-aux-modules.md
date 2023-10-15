# Introduction aux Modules en PowerShell

PowerShell est une plateforme extensible, et l'une des principales méthodes pour étendre ses capacités est via les modules. Un module est un ensemble de commandes PowerShell regroupées, telles que des cmdlets, des providers, des fonctions, des variables, etc., que vous pouvez ajouter à PowerShell pour ajouter des fonctionnalités supplémentaires.

## Table des matières

- [Qu'est-ce qu'un module?](#quest-ce-quun-module)
- [Types de modules](#types-de-modules)
- [Découverte de modules](#découverte-de-modules)
- [Chargement de modules](#chargement-de-modules)
- [Conclusion](#conclusion)

## Qu'est-ce qu'un module?

Un module est un ensemble de ressources liées pour PowerShell. Ces ressources peuvent être des cmdlets, des fonctions, des variables, des providers, etc. Les modules sont utilisés pour regrouper des fonctionnalités liées afin de faciliter leur distribution et leur utilisation.

## Types de modules

Il existe plusieurs types de modules en PowerShell :

- **Modules script** : Ce sont des fichiers `.psm1` qui contiennent du code PowerShell.
- **Modules manifeste** : Fichiers `.psd1` qui contiennent des métadonnées sur un module.
- **Modules binaires** : Ce sont des assemblies .NET, généralement des fichiers `.dll`, qui contiennent des cmdlets compilés.

## Découverte de modules

Vous pouvez trouver les modules installés sur votre système en utilisant la cmdlet `Get-Module`. Pour charger un module, vous pouvez utiliser la cmdlet `Import-Module`.

## Chargement de modules

Lorsqu'un module est installé, il n'est pas nécessairement chargé dans votre session. Pour utiliser les commandes d'un module, vous devez le charger avec la cmdlet `Import-Module`. Une fois chargé, les commandes du module sont disponibles pour votre session actuelle.

```powershell
Import-Module -Name NomDuModule
```