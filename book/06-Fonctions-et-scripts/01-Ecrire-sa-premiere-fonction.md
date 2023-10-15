# Écrire sa première fonction en PowerShell

Dans PowerShell, les fonctions permettent de regrouper un ensemble d'instructions sous un nom spécifique, pour réaliser une tâche spécifique. Ceci est utile pour réutiliser du code et organiser vos scripts.

## Table des matières

- [Création d'une fonction simple](#creation-dune-fonction-simple)
- [Appel d'une fonction](#appel-dune-fonction)
- [Retour d'une fonction](#retour-dune-fonction)
- [Conclusion](#conclusion)

## Création d'une fonction simple

Une fonction est définie avec le mot-clé `function`, suivi de son nom et d'un bloc de code entre accolades.

```powershell
function Saluer {
    Write-Output "Bonjour tout le monde !"
}
```

## Appel d'une fonction

Une fois que vous avez défini une fonction, vous pouvez l'appeler par son nom.

```powershell
Saluer
```

## Retour d'une fonction

PowerShell retourne tout ce qui n'est pas affecté à une variable ou envoyé à une commande spécifique (comme `Write-Output`).

```powershell
function Additionner {
    param($a, $b)
    return $a + $b
}

$resultat = Additionner 3 4
Write-Output $resultat
```

Notez que `return` est optionnel. Si vous omettez `return`, la dernière valeur ou le dernier ensemble de valeurs dans la fonction sera retourné.

```powershell
function Soustraire {
    param($a, $b)
    $a - $b
}

$resultat = Soustraire 7 3
Write-Output $resultat
```

## Conclusion

Les fonctions sont l'un des éléments les plus puissants de PowerShell. Elles vous permettent de créer des blocs de code réutilisables qui peuvent être appelés de n'importe où dans votre script, rendant votre code plus lisible et plus facile à maintenir.
