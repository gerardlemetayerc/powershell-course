# TP 7 – Utilisation de l'opérateur `-contains`

Dans ce TP, vous allez apprendre à utiliser l'opérateur `-contains` pour vérifier la présence d'éléments dans une collection.

## Étape 1 : Vérification d'un élément dans un tableau

* Lancez la commande suivante pour créer un tableau simple :

```powershell
$tableau = @("Pomme", "Banane", "Cerise")
```

* Vérifiez si le tableau contient l'élément "Banane" :

```powershell
if ($tableau -contains "Banane") {
    Write-Output "Le tableau contient 'Banane'."
} else {
    Write-Output "'Banane' n'est pas dans le tableau."
}
```

## Étape 2 : Sensibilité à la casse

* Testez la sensibilité à la casse en recherchant "banane" (en minuscules) :

```powershell
if ($tableau -contains "banane") {
    Write-Output "Correspondance trouvée."
} else {
    Write-Output "Pas de correspondance (sensible à la casse)."
}
```

## Étape 3 : Vérification d'un nombre dans une collection

* Créez un tableau de nombres :

```powershell
$numeros = @(1, 2, 3, 4, 5)
```

* Vérifiez si le tableau contient le nombre 3 :

```powershell
if ($numeros -contains 3) {
    Write-Output "Le tableau contient le nombre 3."
} else {
    Write-Output "Le nombre 3 n'est pas dans le tableau."
}
```

## Étape 4 : Utilisation avec des objets

* Créez une collection d'objets :

```powershell
$objets = @(
    [PSCustomObject]@{ Nom = "Alice"; Age = 30 },
    [PSCustomObject]@{ Nom = "Bob"; Age = 25 }
)
```

* Vérifiez si un objet spécifique existe dans la collection :

```powershell
if ($objets -contains [PSCustomObject]@{ Nom = "Alice"; Age = 30 }) {
    Write-Output "L'objet existe dans la collection."
} else {
    Write-Output "L'objet n'existe pas dans la collection."
}
```

## Étape 5 : Différences avec `-in`

* Testez l'opérateur `-in` pour vérifier si "Banane" est dans le tableau :

```powershell
if ("Banane" -in $tableau) {
    Write-Output "Le tableau contient 'Banane'."
} else {
    Write-Output "'Banane' n'est pas dans le tableau."
}
```

## Résumé

L'opérateur `-contains` est un outil puissant pour vérifier la présence d'éléments dans une collection. Prenez le temps de tester les différents cas pour bien comprendre son fonctionnement.
