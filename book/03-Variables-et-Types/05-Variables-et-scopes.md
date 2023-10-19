# Variables et Scopes dans PowerShell

## Sommaire

- [Introduction](#introduction)
- [Déclaration de variables](#déclaration-de-variables)
- [Types de variables](#types-de-variables)
- [Scopes des variables](#scopes-des-variables)
- [Modification du scope d'une variable](#modification-du-scope-dune-variable)

## Introduction

Dans PowerShell, comme dans de nombreux autres langages de programmation, une variable est utilisée pour stocker des données que vous pouvez ensuite référencer et manipuler dans vos scripts.

## Déclaration de variables

En PowerShell, vous déclarez une variable en utilisant le signe `$` suivi du nom de la variable. Par exemple:

```powershell
$maVariable = "Bonjour, PowerShell!"
```

## Types de variables

PowerShell est un langage orienté objet, ce qui signifie que même les types de données les plus simples sont des objets. Par exemple:

```powershell
$nombre = 25
$phrase = "Ceci est une chaîne de caractères"
$date = Get-Date
```

Dans les exemples ci-dessus, `$nombre` est un objet de type `Int32`, `$phrase` est un objet de type `String`, et `$date` est un objet de type `DateTime`.

## Scopes des variables

Le scope d'une variable détermine où une variable est visible et accessible dans votre script ou session PowerShell. Les scopes disponibles sont:

- **Global**: Accessible partout.
- **Script**: Accessible seulement dans le script courant.
- **Local**: Accessible seulement dans la fonction ou le bloc de code courant.
- **Private**: Accessible seulement à l'intérieur d'un bloc ou d'une fonction spécifique, et non à ses enfants.

## Modification du scope d'une variable

Vous pouvez modifier le scope d'une variable lors de sa déclaration. Par exemple, pour déclarer une variable avec un scope global:

```powershell
$global:maVariableGlobale = "Cette variable est globale"
```

De même, pour une variable de script:

```powershell
$script:maVariableDeScript = "Cette variable est propre au script"
```
