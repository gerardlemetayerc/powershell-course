# TP 4 – Manipulation de commandes 

Dans ce TP, vous allez manipuler différentes fonctions et réaliser une première approche sur cette fonctionnalité dans PowerShell. 

## Utilisation du module d’aide 

La commande Get-Help permet d’obtenir de l’aide sur différentes commandes. 

Utilisez la ligne de commande  

```
Get-Help Install-WindowsFeature 
```

Le détail de l’utilisation de l’aide de la commande « Install-WindowsFeature » apparaît. 

Comparez avec le résultat de la commande suivante : 

```
Get-Help Install-WindowsFeature -Examples 
```

Puis  

```
Get-Help Install-WindowsFeature -Full
```

Mise à jour du module d’aide 

Il est possible de mettre à jour votre module d’aide dans PowerShell. 

Utilisez la ligne de commande à l’aide de PowerShell, en tant qu’administrateur, afin de procéder à la mise à jour : 

```
Update-Help 
```

## Listez les verbes disponibles sur votre machine 

PowerShell dispose d’une liste de « verbes » par défaut autorisés sur les fonctions. 

Lancez la ligne de commande suivante afin d’en obtenir la liste. 

```
Get-Verb 
```

Observez la commande « Group ». Celle-ci indique les différents cas d’usages possibles pour ces verbes. 

* Par exemple : 
  * Compare et Convert sont associés à de la manipulation de données 
  * Connect et Read sont liés à de la communication 

 

## Interaction avec un utilisateur 

La commande Read-Host permet d’obtenir une information d’un utilisateur de manière interactive. 

Exécutez la ligne de commande suivante : 

```
$monEntree = Read-Host "Entrez votre nom de processus" 
Write-Host "Vous avez demandé $monEntree" 

Write-Host permet d’afficher une information dans la console de PowerShell. 
```
 

## Utilisation de paramètres 

Nous avons vu dans le cours que PowerShell pouvait prendre en compte des paramètres au niveau des lignes de commande. Ces paramètres permettent de spécifier des informations à la fonction exécutée par PowerShell. 

Exécutez la ligne de commande suivante, en entrant la valeur PowerShell lorsque l’invitation vous demandera une valeur : 

```
$monEntree = Read-Host "Entrez votre nom de processus" 
Write-Host "Vous avez demandé $monEntree" 
Get-Process -Name $monEntree
```
