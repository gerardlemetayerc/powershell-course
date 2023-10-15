# Paramètres et retours de fonctions en PowerShell

Dans PowerShell, les fonctions peuvent accepter des entrées (paramètres) et retourner des valeurs. La compréhension des mécanismes de gestion des paramètres et des valeurs de retour est essentielle pour créer des fonctions flexibles et puissantes.

## Table des matières

- [Définition des paramètres](#définition-des-paramètres)
- [Types de paramètres](#types-de-paramètres)
- [Retour de valeurs](#retour-de-valeurs)
- [Conclusion](#conclusion)

## Définition des paramètres

Les paramètres sont définis dans un bloc `param` au début de la fonction.

```powershell
function Salutation {
    param($nom)
    Write-Output "Bonjour, $nom!"
}

Salutation -nom "Alice"
```

## Types de paramètres

PowerShell propose plusieurs manières de définir les paramètres pour offrir plus de flexibilité.

### Paramètres obligatoires

```powershell
function AfficherMessage {
    param(
        [Parameter(Mandatory=$true)]
        [string]$message
    )
    Write-Output $message
}
```

### Valeurs par défaut

```powershell
function AfficherMessage {
    param(
        [string]$message = "Hello, World!"
    )
    Write-Output $message
}

AfficherMessage  # affichera "Hello, World!"
```

### Paramètres positionnels

```powershell
function Multiplier {
    param(
        [Parameter(Position=0)]
        [int]$a,
        [Parameter(Position=1)]
        [int]$b
    )
    return $a * $b
}

Multiplier 3 4  # retournera 12
```

## Retour de valeurs

Comme nous l'avons vu précédemment, les fonctions retournent la dernière valeur ou le dernier ensemble de valeurs qui n'est pas assigné à une variable ou envoyé à une commande spécifique. Le mot-clé `return` est optionnel.

```powershell
function Diviser {
    param($a, $b)
    if ($b -eq 0) {
        Write-Error "La division par zéro n'est pas autorisée!"
        return $null
    }
    return $a / $b
}
```

## Conclusion

La gestion correcte des paramètres et des valeurs de retour est cruciale pour la création de fonctions utiles en PowerShell. Les paramètres permettent à vos fonctions d'être flexibles et réutilisables, tandis que les valeurs de retour permettent une interaction fluide entre les fonctions et le reste de votre script.
