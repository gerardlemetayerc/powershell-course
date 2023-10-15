# Conversion de types dans PowerShell

PowerShell, bien qu'étant un langage à typage dynamique, utilise des types de données sous-jacents. Il est courant d'avoir besoin de convertir une valeur d'un type à un autre, surtout lorsque vous travaillez avec différentes sources de données. Ce chapitre présente les méthodes et techniques courantes pour réaliser ces conversions.

## Table des matières

- [Pourquoi convertir les types?](#pourquoi-convertir-les-types)
- [Conversion explicite vs implicite](#conversion-explicite-vs-implicite)
- [Techniques courantes de conversion](#techniques-courantes-de-conversion)
- [Conclusion](#conclusion)

## Pourquoi convertir les types?

Dans de nombreux scénarios, la conversion de types se fait automatiquement. Par exemple, lorsque vous ajoutez un nombre à une chaîne, PowerShell convertit automatiquement le nombre en chaîne. Cependant, dans d'autres cas, vous devrez effectuer une conversion explicite pour éviter les erreurs.

## Conversion explicite vs implicite

**Conversion implicite** : PowerShell tente automatiquement de convertir le type si cela est nécessaire et possible.  
**Conversion explicite** : Vous dites explicitement à PowerShell de convertir une valeur d'un type à un autre.

```powershell
# Conversion implicite
$texte = "Le nombre est " + 10  # 10 est converti en chaîne

# Conversion explicite
$nombre = [int]"123"
```

## Techniques courantes de conversion

### Convertir en chaîne

```powershell
$chaine = 100.ToString()
$chaine = [string]100
```

### Convertir en nombre

```powershell
$int = [int]"123"
$double = [double]"123.45"
```

### Convertir entre types complexes

Supposons que vous ayez un objet avec différentes propriétés et que vous souhaitiez le convertir en hashtable :

```powershell
$monObjet = [PSCustomObject]@{
    Nom = "Jean"
    Age = 30
}
$hashtable = @{}
$monObjet.PSObject.Properties | ForEach-Object { $hashtable[$_.Name] = $_.Value }
```

## Conclusion

La conversion de types est une compétence essentielle lors de la manipulation de données dans PowerShell. Bien que de nombreuses conversions soient effectuées automatiquement, comprendre comment et quand effectuer des conversions explicites vous aidera à écrire des scripts plus robustes et évitera des erreurs inattendues.
