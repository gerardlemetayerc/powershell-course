# TP 1 – Manipulation de chiffres à l’aide de PowerShell 

| Niveau   | Titre                    |
|----------|--------------------------|
|   0      | Manipulation de chiffres |


**Démarrez PowerShell.**

Dans PowerShell, lancez la ligne de commande suivante : 

```
$maVariable = 1 + 1 
$maVariable 
```

Notez le retour de la ligne de commande. Exécutez ensuite : 

```
$maVariable = 1 + 1 – 5 * 3 
$maVariable 
$maVariable = ( 1 + 1 - 5 ) * 3 
$maVariable 
```

Constatez le retour de la ligne de commande. PowerShell respecte l’ordre des opérations mathématique (parenthèses, multiplication, puis opérations). 

Exécutez à présent : 

```
$maVariable++  
$maVariable 
```

Réalisez une opération d’affectation : 

```
$maVariable += ( 1 + 1 - 5 ) * 3 
$maVariable
```

Si vous avez exécuté toutes ses lignes de commande à la suite, vous devriez observer pour résultat -17. 
