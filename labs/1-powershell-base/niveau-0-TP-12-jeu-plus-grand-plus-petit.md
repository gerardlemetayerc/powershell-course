# TP 12 - Jeu "devinez le chiffre"

## Etape 1

* Générez un code qui réalise les actions suivantes :
  * Initialise deux variables :
    * La valeur maximale à deviner (borne maximale) : 30
    * La valeur minimale (borne minimale) : 1
    * Le nombre d'essais : 7
  * Initialisez une valeur aléatoire comprise entre la borne minimale et la borne maximale (tips : utilisez la commande ```Get-Random```)
  * Bouclez sur la condition suivante : tant que l'utilisateur n'a pas trouvé la valeur, et qu'il reste des essais :
    * Affichez "plus petit" si le nombre rentré par l'utilisateur est plus grand que le nombre initialisé par le jeu
    * Affichez "plus grand" si le nombre rentré par l'utilisateur est plus petit que le nombre initialisé par le jeu


* La correction de cet exercice est disponible [ici](./correction/correction-tp-12-etape1.ps1).

## Etape 2

* Mettez à jour votre code afin de rajouter les options suivantes :
  * Téléchargez le fichier de configuration [tp12-conf.csv](./resources/tp12-conf.csv)
  * Ajoutez une nouvelle variable initialisée en début script : ```$perdu```
  * Chargez le fichier CSV dans une variable $niveaux
  * Pour chaque itération du fichier CSV, 
    * réalisez la boucle précédente avec les configurations du fichier CSV
    * Affichez un message en début de jeu résumant la configuration actuelle
    * Si l'utilisateur perd dans son niveau, la boucle d'itération du fichier CSV doit cesser avec un message "Perdu. :("

### Rappels / Tips

* La ligne de commande permettant de charger un fichier CSV est ```Import-CSV -path <chemin> -delimiter ';'```
* Il est possible de faire l'import CSV directement depuis le stockage GitHub, à l'aide du code ci-dessous :
```
$CSV = Invoke-RestMethod https://raw.githubusercontent.com/gerardlemetayerc/powershell-course/main/labs/1-powershell-base/resources/tp12-conf.csv | ConvertFrom-CSV -Delimiter ";"
```


## Etape 3

* Reprenez le code de l'étape 2
* Mettez à jour le code PowerShell afin de : 
  * Générez un identifiant de partie (unique) (la ligne de commande ```New-GUID``` permet d'obtenir des identifiants uniques au format GUID)
  * Générez un objet Powershell personnalisé contenant les informations suivantes :
    * ID de partie
    * Date de partie au format yyyy-MM-dd hh:mm
    * Nom du joueur (qui sera demandé en début de partie)
    * Niveau
    * Nombre d'essai
  * Exportez les informations de parties dans un fichier CSV appelé "party_history.csv" 

### Rappel / Tips

* Pour générer un objet PowerShell, vous avez la ligne de commande suivante :

```powershell
$monObject = [PSCustomObject]@{
    Prop1 = "Value"
    Prop2 = "Value2"
}
```

* Pour générer un arrayList, vous avez la ligne de commande suivante :

```
$maCollection = [System.Collections.ArrayList]::new() 
$maCollection.Add($monObject)
```

* L'ID de partie, la date et le nom du jour sont à générer avant la boucle foreach
* Le niveau, le nombre d'essai dans la boucle, lors d'une réussite
