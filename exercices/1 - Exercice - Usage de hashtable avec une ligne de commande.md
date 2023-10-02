# Exercice : Utilisation d'une Hashtable pour initialiser les paramètres de New-Item

Assurez-vous que le répertoire ```C:\Tmp\``` existe au niveau de votre machine.

* Créez une Hashtable appelée $ParametresFichier contenant les valeurs de paramètres pour créer un nouveau fichier à l'emplacement de votre choix avec les informations suivantes :
  * ```Path``` **(chaîne)** : Le chemin du fichier que vous souhaitez créer (par exemple, ```"C:\Tmp\MonFichier.txt"```).
  * ```Value``` **(chaîne)** : Le contenu que vous souhaitez écrire dans le fichier (par exemple, "Ceci est le contenu de mon fichier.")
  * ```ItemType``` **(chaîne)** : Le type d'élément que vous souhaitez générer (ici, File)
* Exécutez la ligne de commande suivante : ```New-Item @ParametresFichier```
* Mettez à jour le chemin dans ```$ParametresFichier``` avec la valeur ```"C:\Tmp\MonFichier2.txt"``` et relancez la ligne de commande précédente.
