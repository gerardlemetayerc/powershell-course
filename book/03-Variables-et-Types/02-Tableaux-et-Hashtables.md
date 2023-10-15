# Tableaux et Hashtables dans PowerShell

PowerShell offre plusieurs structures de données pour stocker et manipuler des ensembles d'éléments. Parmi les plus courantes, on trouve les tableaux (arrays) et les hashtables. Dans ce chapitre, nous explorerons comment créer, utiliser et manipuler ces structures.

## Table des matières

- [Les tableaux](#les-tableaux)
  - [Création d'un tableau](#création-dun-tableau)
  - [Accès aux éléments](#accès-aux-éléments)
  - [Manipulation de tableaux](#manipulation-de-tableaux)
- [Les hashtables](#les-hashtables)
  - [Création d'une hashtable](#création-dune-hashtable)
  - [Accès aux clés et valeurs](#accès-aux-clés-et-valeurs)
  - [Manipulation de hashtables](#manipulation-de-hashtables)
- [Conclusion](#conclusion)

## Les tableaux

### Création d'un tableau

Un tableau est une collection ordonnée d'éléments. Vous pouvez créer un tableau en utilisant la syntaxe suivante :

```powershell
$monTableau = 1, 2, 3, 4, 5
```

### Accès aux éléments

Pour accéder à un élément d'un tableau, utilisez son index :

```powershell
$premierElement = $monTableau[0]  # Les indices commencent à 0
```

### Manipulation de tableaux

Ajout d'un élément :

```powershell
$monTableau += 6
```

Suppression d'un élément (en utilisant une nouvelle affectation) :

```powershell
$monTableau = $monTableau | Where-Object { $_ -ne 3 }  # Supprime le 3
```

## Les hashtables

### Création d'une hashtable

Une hashtable est une collection de paires clé-valeur. Chaque clé est unique :

```powershell
$maHashtable = @{
    prenom = "Jean"
    nom    = "Dupont"
    age    = 30
}
```

### Accès aux clés et valeurs

```powershell
$nom = $maHashtable["nom"]
$maHashtable["age"] = 31  # Modifier la valeur d'une clé
```

### Manipulation de hashtables

Ajouter une paire clé-valeur :

```powershell
$maHashtable["profession"] = "Ingénieur"
```

Supprimer une paire clé-valeur :

```powershell
$maHashtable.Remove("age")
```

## Conclusion

Les tableaux et hashtables sont essentiels pour stocker des ensembles de données dans PowerShell. Alors que les tableaux sont parfaits pour les collections ordonnées, les hashtables offrent une manière efficace de stocker et d'accéder à des données avec des clés uniques. Bien maîtriser ces structures vous permettra de manipuler des données plus complexe avec facilité et efficacité.
