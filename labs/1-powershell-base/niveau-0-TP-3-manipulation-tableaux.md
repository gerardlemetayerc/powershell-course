# TP 3 – Manipulation de tableaux

| Niveau   | Titre                      |
|----------|----------------------------|
|   0      | Manipulation de tableaux   |

 **Démarrez PowerShell.**

## Création d'un tableau de type "array"

Dans PowerShell, lancez la ligne de commande suivante : 

```
$maVariable = 1,1 
$maVariable 
$maVariable = 1, 1, (1+5) 
$maVariable 
$maVariable += 7
$maVariable 
$maVariable += "PowerShell c'est génial", $false 
$maVariable.Add(1) # Doit retourner une erreur
$maVariable.GetType()
```

Notez le retour de la ligne de commande. Les valeurs dans un tableau sont séparées par un symbole « , ». Il est possible de mélanger différents types d’information dans un tableau. 

```
# Récupération du premier élément du tableau
$maVariable[0]
# Récupération de l'élément d'index 1 du tableau
$maVariable[1]
# Récupération du dernier élément du tableau
$maVariable[-1] 
$maVariable[100] 
```` 

Il est possible d’obtenir une valeur d’un élément du tableau en utilisant son index. L’appel à un index inexistant ne retourne rien. 

Exécutez à présent : 

```
$maVariable[0] += 1  
$maVariable[4] += 1 
$maVariable[-1] += 1 
$maVariable
```

Notez le résultat de l’usage d’un opérateur d’affectation sur les différents types. 

* Sur un type numérique, l’affectation a additionné les deux nombres
* Sur un type chaîne de caractères, l’affectation a ajouté le caractère en fin de chaîne
* Sur un type de booléen, la valeur vaut désormais 1. 

D’un point de vue logique, faux est équivalent à 0, vrai est équivalent à 1  

Par conséquent, PowerShell a additionné la valeur numérique de $false (0) à 1. 

```
$maVariable[1] = ( 1 + 1 - 5 ) * 3 
$maVariable[100] = 5 
```

!! Notez qu’il n’est pas possible d’attribuer une valeur à un index non initialisé d’un tableau. !!

## Création d'un tableau de type "arrayList"

Dans PowerShell, lancez la ligne de commande suivante : 

```
[System.Collections.ArrayList]$monNouveauTableau = @()
$monNouveauTableau += 7
$monNouveauTableau.Add(5)
$monNouveauTableau.Add(4)
$monNouveauTableau.Add(5)
$monNouveauTableau
```

## Opération sur des tableaux

Pour connaître le nombre d'élément dans un tableau (array ou arrayList), entrez la commande suivante :

```
$monNouveauTableau.count
$maVariable.count
```

Il est également possible de réaliser des opérations arythmétiques sur des tableaux à l'aide de la commande ```Measure-Object```

**Executez sur le résultat précédent les commandes suivante :**

```
$monNouveauTableau | Measure-Object -Sum -Maximum -Minimum -Average
$maVariable | Measure-Object -Sum -Maximum -Minimum -Average
```

Vous devriez rencontrer une erreur sur la deuxième ligne de commande. PowerShell n'a pas été en capacité de traiter la somme ansi que la moyenne, à cause de la valeur de type "chaîne".
