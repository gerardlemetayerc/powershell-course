# TP 5 – Manipulation de Like et Match 

* Vous allez dans ce TP manipuler les commandes Like et Match 


A l’aide de PowerShell, exécutez la commande suivante : 

```
Get-Process 
```

Observez le nombre de résultat. 


* Maintenant, exécutez : 

```
Get-Process | Where-Object ProcessName -like 'powershell' 
```

* Démarrez l’application PowerShell ISE, et réexécutez la commande précédente. Constatez-vous une différence ? Exécutez maintenant : 

```
Get-Process | Where-Object ProcessName -like 'powershell*' 
```

* Le processus PowerShell ISE doit normalement apparaître. Comme indiqué, le ‘ ?’ permet d’indiquer un caractère inconnu. 

```
Get-Process | Where-Object ProcessName -like 'powershell_i?e' 
Get-Process | Where-Object ProcessName -like 'powershell_i??' 
```

* Lancez maintenant la commande à l’aide de match : 

```
Get-Process | Where-Object ProcessName -match 'powershell'
```

PowerShell retourne à la fois PowerShell.exe et PowerShell_ISE.exe. 

* Maintenant, prenons la regex suivante : ```^p.*```
  Essayez de décrypter la signification de ce modèle. Vous pouvez vous aider du site internet https://regex101.com/. La zone sur la droite « Explanation » donne une description complète du modèle.
  Exécutez la ligne de commande : 

```
Get-Process | Where-Object ProcessName -match '^p.*' 
```

PowerShell retourne l’ensemble des résultats liés au modèle.  

# Recherche multi-condition 

Il est possible d’utiliser plusieurs critères de recherche. Comment ça marche ?  

L’ensemble de votre critères de recherches doivent êtres encadrés par les symboles { et } 
Exemple : { CRITERE1 OU CRITERE2 OU CRITERE3 } 

* Les critères de recherches peuvent être séparés par : 
  * ET : signifie que le critère situé sur la gauche et la droite du ET doivent être respectés. ET est noté en tant que -and 
  * OU : signifie que le critère situé sur la droite, ou sur la gauche, ou bien les deux simultanément, doivent être respectés 

Il est possible de regrouper des conditions à l’aide de parenthèses 

La référence à la donnée est réalisée par la variable $_ 

* A l’aide de PowerShell, lancez la ligne de commande suivante : 

```
Get-Process | Where-Object {$_.Name -match "PowerShell" -and $_.ID -gt 1} 
```

* Cette ligne permet de rechercher les processus dont le nom correspond au modèle « PowerShell » et donc l’ID de processus est supérieur à 1. 
```
Get-Process | Where-Object {$_.Name -match "PowerShell" -or $_.Name -notlike "*ISE"} 
```
 
