# Le Pipeline dans PowerShell

Le pipeline est l'une des caractéristiques les plus puissantes et distinctives de PowerShell. Il vous permet de prendre la sortie d'une commande (cmdlet) et de l'utiliser comme entrée pour une autre commande. Cela simplifie grandement le traitement des données et la réalisation de tâches complexes avec de simples commandes enchaînées.

## Table des matières

- [Qu'est-ce qu'un pipeline ?](#quest-ce-quun-pipeline)
- [Exemples de base](#exemples-de-base)
- [Filtrage avec `Where-Object`](#filtrage-avec-where-object)
- [Manipulation avec `ForEach-Object`](#manipulation-avec-foreach-object)
- [Conclusion](#conclusion)

## Qu'est-ce qu'un pipeline ?

Dans PowerShell, le pipeline est représenté par le symbole `|`. Il permet de transmettre la sortie d'une cmdlet à une autre pour un traitement supplémentaire.

## Exemples de base

Voici quelques exemples simples pour illustrer la puissance du pipeline :

```powershell
# Liste tous les fichiers dans le répertoire courant et les trie par taille :
Get-ChildItem | Sort-Object Length

# Affiche les 5 processus consommant le plus de mémoire :
Get-Process | Sort-Object WS -Descending | Select-Object -First 5
```

## Filtrage avec `Where-Object`

La cmdlet `Where-Object` permet de filtrer les objets basés sur leurs propriétés. Par exemple :

```powershell
# Liste seulement les dossiers du répertoire courant :
Get-ChildItem | Where-Object { $_.PSIsContainer }

# Affiche les processus dont la consommation de mémoire est supérieure à 100 MB :
Get-Process | Where-Object { $_.WS -gt 100MB }
```

## Manipulation avec `ForEach-Object`

La cmdlet `ForEach-Object` permet d'exécuter des actions sur chaque objet transmis dans le pipeline. Par exemple :

```powershell
# Multiplie chaque nombre dans une liste par 2 :
1..5 | ForEach-Object { $_ * 2 }

# Stop tous les processus nommés "notepad" :
Get-Process notepad | ForEach-Object { $_.Kill() }
```

## Conclusion

Le pipeline est un outil essentiel pour tout utilisateur de PowerShell. Il offre une manière fluide de traiter et manipuler des données, rendant les scripts plus lisibles et efficaces. Avec la pratique, vous découvrirez que l'utilisation du pipeline peut grandement simplifier vos tâches et améliorer votre productivité.
