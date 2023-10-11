# TP 7 – Manipulation de données 

Vous allez dans ce TP manipuler des données. Vous allez avoir pour ce faire avoir besoin du fichier CSV lié à ce TP. 

Démarrez PowerShell et assurez-vous d’être dans le même répertoire que votre fichier CSV. Pour rappel, les commandes Set-Location (ou cd) permettent de se déplacer. 

* Exécutez la commande PowerShell suivante : 
```
Import-CSV -Delimiter "," -Path tp7_data.csv 
```
 
* **Votre fichier CSV est automatiquement transformé en objet PowerShell. Ajoutez une colonne supplémentaire à votre fichier CSV, prenant en charge la première lettre du prénom, suivi d’un point, suivi du nom de famille, appelée 'samaccountname'.**

* Indice :  
  * Le prénom peut être vu comme un tableau de caractère. Vous pouvez utiliser l’index pour récupérer le premier élément du tableau (donc la première lettre). 

Enregistrez le retour de votre ligne de commande dans la variable **$mesEleves**. 

 
* Exécutez maintenant la commande suivante : 
```
$mesEleves | Export-CSV -Delimiter "," -Path tp7_data.csv 
```

Vous disposez désormais d’un fichier Excel avec une nouvelle colonne, et une ligne d’en-tête d’information en trop qui ne vous intéresse pas. Exécutez de nouveau la ligne de commande : 
```
$mesEleves | Export-CSV -Delimiter "," -Path tp7_data.csv -Force -NoTypeInformation 
```
  
Les limites du CSV : vous ne pourrez pas exporter des propriétés contenant des tableaux d’informations. 

* Par exemple :  
  * La commande ```Get-Process | Select -First 1 Name, Modules``` 
  * **Modules** contient des données trop complexes pour être exportées simplement. 

* Il est également possible d’exporter les données sous un autre format : 
  * **ConvertTo-Json** : permet de convertir vos données au format JSON (utile si vous avez des informations complexes à exporter, par exemple un objet qui contient une propriété contenant elle-même un ensemble d’objet). 
  * **ConvertTo-Xml** : permet de convertir en XML (cas d’usage moins courant) 
  * **ConvertTo-HTML** : permet d’exporter les données au format HTML (génère un tableau) 
