# Les conditions dans PowerShell

Dans PowerShell, comme dans la plupart des langages de programmation, vous pouvez utiliser des structures conditionnelles pour exécuter du code en fonction de certaines conditions. Ces structures vous permettent de prendre des décisions dans vos scripts.

## Table des matières

- [L'instruction `if`](#linstruction-if)
- [L'instruction `else`](#linstruction-else)
- [L'instruction `elseif`](#linstruction-elseif)
- [L'opérateur ternaire](#loperateur-ternaire)
- [Conclusion](#conclusion)

## L'instruction `if`

La structure conditionnelle la plus basique est `if`. Elle exécute un bloc de code si une condition donnée est vraie.

```powershell
$age = 25

if ($age -ge 18) {
    Write-Output "Vous êtes majeur."
}
```

## L'instruction `else`

Vous pouvez utiliser `else` en combinaison avec `if` pour exécuter un bloc de code si la condition initiale est fausse.

```powershell
$age = 15

if ($age -ge 18) {
    Write-Output "Vous êtes majeur."
} else {
    Write-Output "Vous êtes mineur."
}
```

## L'instruction `elseif`

Si vous avez plusieurs conditions à vérifier, vous pouvez utiliser `elseif`.

```powershell
$age = 65

if ($age -lt 18) {
    Write-Output "Vous êtes mineur."
} elseif ($age -lt 65) {
    Write-Output "Vous êtes adulte."
} else {
    Write-Output "Vous êtes senior."
}
```

## L'opérateur ternaire

PowerShell 7 a introduit l'opérateur ternaire qui permet d'écrire des conditions courtes de manière concise.

```powershell
$age = 20
$status = $age -ge 18 ? "majeur" : "mineur"
Write-Output "Vous êtes $status."
```

## Conclusion

Les structures conditionnelles sont cruciales pour la logique de vos scripts. Elles vous offrent la flexibilité nécessaire pour exécuter différents blocs de code en fonction de diverses conditions. En maîtrisant ces structures, vous pouvez créer des scripts efficaces et adaptatifs.
