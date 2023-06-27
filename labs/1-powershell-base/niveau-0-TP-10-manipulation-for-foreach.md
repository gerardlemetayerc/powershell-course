# TP 10 – Manipulation de "Foreach" et de "for"

Vous allez dans ce TP réaliser une manipulation courante de la commande “foreach”. Vous aurez besoin de nouveau du fichier Excel du TP 8. 

* Chargez le contenu du fichier à l’aide de la commande Import-CSV 
```
$mesEleves = Import-CSV -Delimiter ","  -path xxx.csv 
```

* Réalisez une boucle qui ajoute les propriétés suivantes pour chaque élève : 
  * Son nom d’utilisateur (format p.nom) 
  * Son adresse email (format p.nom@cfa-insta.local) 
  * Son mot de passe 
      * Pour la génération du mot de passe, appuyez-vous sur une boucle for afin d’automatiser la génération d’un mot de passe sur 10 caractères
      * Une classe "native" sur les OS à partir de Windows Server 2016/2019
   
```
function Get-RandomPassword {
    param (
        [Parameter(Mandatory)]
        [int] $length,
        [int] $amountOfNonAlphanumeric = 1
    )
    Add-Type -AssemblyName 'System.Web'
    return [System.Web.Security.Membership]::GeneratePassword($length, $amountOfNonAlphanumeric)
}
 
```



Exportez le résultat dans un nouveau fichier CSV. 

* Tips pour la boucle for : 
   * La commande Get-Random permet d’obtenir un nombre aléatoire entre deux bornes 
   * Il existe une table, appelée table ASCII, associant une valeur numérique à un caractère (exemple de table : https://www.asciitable.com/)
   * Il est possible en PowerShell de récupérer un caractère en fonction de sa valeur décimale (Dec), en réalisant un cast explicite  
      * Exemple : **[char]46** équivaut au caractère **.** 
