# Opérateurs arithmétiques dans PowerShell

Dans PowerShell, comme dans la plupart des langages de programmation, vous pouvez effectuer des opérations mathématiques à l'aide d'opérateurs arithmétiques. Ces opérateurs vous permettent d'effectuer des additions, soustractions, multiplications, et d'autres opérations courantes.

## Table des matières

- [Liste des opérateurs arithmétiques](#liste-des-opérateurs-arithmétiques)
- [Exemples d'utilisation](#exemples-dutilisation)
- [Ordre des opérations](#ordre-des-opérations)
- [Conclusion](#conclusion)

## Liste des opérateurs arithmétiques

Voici les opérateurs arithmétiques couramment utilisés dans PowerShell :

- **+** : Addition
- **-** : Soustraction
- **\*** : Multiplication
- **/** : Division
- **%** : Modulo (reste de la division)
- **-a** : Négation (inverse le signe)

## Exemples d'utilisation

```powershell
$addition = 5 + 3    # Résultat: 8
$soustraction = 5 - 3  # Résultat: 2
$multiplication = 5 * 3  # Résultat: 15
$division = 8 / 2    # Résultat: 4
$modulo = 7 % 3      # Résultat: 1
$négation = -(-5)    # Résultat: 5
```

## Ordre des opérations

L'ordre dans lequel les opérations sont effectuées peut affecter le résultat. PowerShell suit l'ordre mathématique standard des opérations (PEMDAS/BODMAS) :

1. Parenthèses/Brackets
2. Exponents/Orders (puissances et racines, etc.)
3. Multiplication et Division (de gauche à droite)
4. Addition et Soustraction (de gauche à droite)

```powershell
$resultat1 = 2 + 3 * 4  # Résultat: 14
$resultat2 = (2 + 3) * 4  # Résultat: 20
```

## Conclusion

Les opérateurs arithmétiques sont des outils essentiels pour effectuer des calculs mathématiques dans vos scripts PowerShell. Assurez-vous de comprendre l'ordre des opérations pour éviter des erreurs courantes dans vos calculs.
