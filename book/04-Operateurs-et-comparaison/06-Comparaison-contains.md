# L'opérateur `-contains` dans PowerShell

L'opérateur `-contains` est utilisé dans PowerShell pour vérifier si une collection contient un élément spécifique. Contrairement à `-like` ou `-match`, il ne fonctionne pas avec des motifs ou des expressions régulières, mais effectue une comparaison stricte.

## Table des matières

- [Introduction](#introduction)
- [Syntaxe de l'opérateur `-contains`](#syntaxe-de-lopérateur--contains)
- [Exemples d'utilisation](#exemples-dutilisation)
- [Différences avec `-in`](#différences-avec--in)
- [Conclusion](#conclusion)

## Introduction

L'opérateur `-contains` est un outil simple et efficace pour vérifier si un élément existe dans une collection. Il retourne `True` si l'élément est trouvé, sinon `False`.

## Syntaxe de l'opérateur `-contains`

La syntaxe de base de l'opérateur `-contains` est la suivante :

```powershell
<collection> -contains <élément>
```

- `<collection>` : Une collection d'éléments (tableau, liste, etc.).
- `<élément>` : L'élément à rechercher dans la collection.

## Exemples d'utilisation

### Exemple 1 : Vérification d'un élément dans un tableau

```powershell
$tableau = @("Pomme", "Banane", "Cerise")
if ($tableau -contains "Banane") {
    Write-Output "Le tableau contient 'Banane'."
}
```

### Exemple 2 : Vérification d'un nombre dans une collection

```powershell
$numeros = @(1, 2, 3, 4, 5)
if ($numeros -contains 3) {
    Write-Output "Le tableau contient le nombre 3."
}
```

### Exemple 3 : Comparaison insensible à la casse

L'opérateur `-contains` est sensible à la casse par défaut :

```powershell
$tableau = @("Pomme", "Banane", "Cerise")
if ($tableau -contains "banane") {
    Write-Output "Correspondance trouvée."
} else {
    Write-Output "Pas de correspondance (sensible à la casse)."
}
```

### Exemple 4 : Utilisation avec des objets

```powershell
$objets = @(
    [PSCustomObject]@{ Nom = "Alice"; Age = 30 },
    [PSCustomObject]@{ Nom = "Bob"; Age = 25 }
)
if ($objets -contains [PSCustomObject]@{ Nom = "Alice"; Age = 30 }) {
    Write-Output "L'objet existe dans la collection."
} else {
    Write-Output "L'objet n'existe pas dans la collection."
}
```

## Différences avec `-in`

L'opérateur `-in` est l'inverse de `-contains`. Il vérifie si un élément se trouve dans une collection, mais la syntaxe est inversée :

```powershell
if ("Banane" -in $tableau) {
    Write-Output "Le tableau contient 'Banane'."
}
```

| Opérateur   | Syntaxe                        | Description                              |
|-------------|--------------------------------|------------------------------------------|
| `-contains` | `<collection> -contains <élément>` | Vérifie si la collection contient l'élément |
| `-in`       | `<élément> -in <collection>`      | Vérifie si l'élément est dans la collection |

## Conclusion

L'opérateur `-contains` est un outil essentiel pour vérifier la présence d'un élément dans une collection en PowerShell. Il est particulièrement utile pour des comparaisons strictes et des vérifications rapides. Prenez le temps de comprendre ses différences avec `-in` pour l'utiliser efficacement dans vos scripts.
