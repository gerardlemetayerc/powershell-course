# TP 6 – Utilisation de Select-Object 

Vous allez dans ce TP utiliser la ligne de commande Select-Object. 

* A l’aide de PowerShell, lancez la ligne de commande : 

```
Get-EventLog -LogName Application 
```

Un grand nombre de résultat est renvoyé. Sélectionnez à présent la première ligne : 

```
Get-EventLog -LogName Application | Select -First 1 
```

* Les propriétés sont à présent plus facile à lire. A présent, affichez toutes les priorités disponibles pour cet objet : 

```
Get-EventLog -LogName Application | Select -First 1 * 
```

Pour permettre la lecture, PowerShell a automatiquement basculé l’affichage en mode « liste » plutôt que « tabulaire ».  

* A présent, on va considérer que la colonne MachineName, Site, Data et Container ne sont pas nécessaire. 

```
Get-EventLog -LogName Application | Select -First 1 * -ExcludeProperty Container,Site,MachineName,Data 
```

* A présent, sélectionnez l’ensemble des résultats, mais en basculant le mode d’affichage en mode "Grid" (affichage graphique) : 

```
Get-EventLog -LogName Application | Select * -ExcludeProperty Container,Site,MachineName,Data | Out-GridView 
```

Une fenêtre, vous permettant de filtrer les résultats directement en mode graphique, est apparue. Cliquez sur « Ajouter des critères » afin d’afficher les options possibles. Filtrer les évènements sur la date d’aujourd’hui. 

* A présent, ajoutez une colonne supplémentaire, appelée « JourDeLaSemaine ». Cette colonne contiendra une extrapolation du jour de la semaine au regard de la date de l’évènement : 
```
Get-EventLog -LogName Application | Select -First 1 TimeGenerated, @{Name="JourDeLaSemaine";Expression={$_.TimeGenerated.DayOfWeek}} 
```

TimeGenerated est objet de type « DateTime ».  

## Hors-sujet sur les dates :

* Les objets de type DateTime disposent de différentes fonctions (méthodes), permettant de réaliser des manipulations d’information sur la date :
  * Obtenir le jour de la semaine : **DayOfWeek()**
  * Obtenir x jour en plus (ou en moins si x est négatif) : **AddDays(x)**
  * La classe DateTime est documentée sur le site de Microsoft ici : [DateTime Structure](https://docs.microsoft.com/fr-fr/dotnet/api/system.datetime). Sur la gauche, la liste des méthodes et propriétés est disponible

  
