# Boucles dans PowerShell

Les boucles sont un élément essentiel de la programmation qui permet d'exécuter un bloc de code plusieurs fois. PowerShell offre plusieurs structures de boucles qui vous aideront à automatiser et à répéter des tâches.

## Table des matières

- [La boucle `for`](#la-boucle-for)
- [La boucle `foreach`](#la-boucle-foreach)
- [La boucle `while`](#la-boucle-while)
- [La boucle `do-while` et `do-until`](#la-boucle-do-while-et-do-until)
- [Quitter une boucle avec `break` et `continue`](#quitter-une-boucle-avec-break-et-continue)
- [Conclusion](#conclusion)

## La boucle `for`

Utilisée pour exécuter un bloc de code un nombre spécifique de fois.

```powershell
for ($i = 0; $i -lt 10; $i++) {
    Write-Output "Numéro: $i"
}
```

## La boucle `foreach`

Parcoure chaque élément d'une collection ou d'un tableau.

```powershell
$nombres = 1..5
foreach ($nombre in $nombres) {
    Write-Output "Numéro: $nombre"
}
```

## La boucle `while`

Exécute un bloc de code tant qu'une condition est vraie.

```powershell
$i = 0
while ($i -lt 5) {
    Write-Output "Numéro: $i"
    $i++
}
```

## La boucle `do-while` et `do-until`

Exécute un bloc de code au moins une fois, puis continue de l'exécuter tant qu'une condition est vraie (`do-while`) ou tant qu'une condition est fausse (`do-until`).

```powershell
$i = 0
do {
    Write-Output "Numéro: $i"
    $i++
} while ($i -lt 5)

$j = 0
do {
    Write-Output "Numéro: $j"
    $j++
} until ($j -eq 5)
```

## Quitter une boucle avec `break` et `continue`

- `break` termine la boucle immédiatement.
- `continue` termine l'itération en cours et passe à la suivante.

```powershell
for ($i = 0; $i -lt 10; $i++) {
    if ($i -eq 5) {
        break
    }
    Write-Output "Numéro: $i"
}

foreach ($nombre in 1..10) {
    if ($nombre % 2 -eq 0) {
        continue
    }
    Write-Output "Nombre impair: $nombre"
}
```

## Conclusion

Les boucles sont un moyen puissant d'exécuter des tâches répétitives dans PowerShell. En comprenant comment fonctionnent ces structures, vous pouvez automatiser efficacement des tâches et rendre vos scripts plus efficaces.
