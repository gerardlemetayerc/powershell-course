# Déclaration de variables dans PowerShell

Les variables sont essentielles dans tout langage de programmation ou de script, et PowerShell ne fait pas exception. Elles permettent de stocker et de manipuler des informations de manière temporaire ou permanente. Dans ce chapitre, nous allons explorer comment déclarer et utiliser des variables dans PowerShell.

## Table des matières

- [Qu'est-ce qu'une variable ?](#quest-ce-quune-variable)
- [Déclaration de variables](#déclaration-de-variables)
- [Affectation de valeurs](#affectation-de-valeurs)
- [Types de données](#types-de-données)
- [Conclusion](#conclusion)

## Qu'est-ce qu'une variable ?

Une variable est un espace mémoire dans lequel nous pouvons stocker une valeur. Cette valeur peut être un nombre, du texte, une date, une liste d'éléments, ou même un objet plus complexe.

## Déclaration de variables

Dans PowerShell, une variable est toujours précédée du symbole `$`. Pour déclarer une variable, il suffit de lui attribuer une valeur :

```powershell
$maVariable = "Ceci est une chaîne de caractères"
```

## Affectation de valeurs

Vous pouvez affecter n'importe quel type de données à une variable, et la modifier à tout moment :

```powershell
$nombre = 10
$estVrai = $true
$texte = "Bonjour le monde"
$dateDuJour = Get-Date
```

## Types de données

PowerShell est un langage à typage dynamique, ce qui signifie que vous n'avez pas besoin de définir le type de données lors de la déclaration d'une variable. Cependant, PowerShell déterminera automatiquement le type de données basé sur la valeur attribuée. Vous pouvez vérifier le type d'une variable à l'aide de la méthode `.GetType()` :

```powershell
$nombre.GetType().Name  # Renvoie "Int32"
$texte.GetType().Name   # Renvoie "String"
```

## Conclusion

La compréhension des variables est fondamentale pour travailler efficacement avec PowerShell. Elles sont la base sur laquelle s'appuient de nombreux scripts et automatisations. Dans les chapitres suivants, nous explorerons comment utiliser ces variables avec d'autres constructions de PowerShell pour réaliser des tâches plus complexes.
