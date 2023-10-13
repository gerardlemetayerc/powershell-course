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

## Etape 2

* Mettez à jour votre code afin de rajouter les options suivantes :
  * Téléchargez le fichier de configuration [resources/tp12-conf.csv](tp12-conf.csv)
  * Ajoutez une nouvelle variable initialisée en début script : ```powershell $perdu```
  * Chargez le fichier CSV dans une variable $niveaux
  * Pour chaque itération du fichier CSV, 
    * réalisez la boucle précédente avec les configurations du fichier CSV
    * Affichez un message en début de jeu résumant la configuration actuelle
    * Si l'utilisateur perd dans son niveau, la boucle d'itération du fichier CSV doit cesser avec un message "Perdu. :("