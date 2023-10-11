# Lister les tâches planifiées avec PowerShell sur Windows

## Objectif 

Utiliser le module ScheduledTasks de PowerShell pour lister toutes les tâches planifiées.

## Prérequis

Avoir des droits d'administrateur.

## Découverte du fonctionnement de la ligne de commande :

* Lancer PowerShell en tant qu'administrateur
  * Recherchez "PowerShell" dans le menu Démarrer.
  * Faites un clic droit sur "Windows PowerShell" et choisissez "Exécuter en tant qu'administrateur".
  * Importer le module ScheduledTasks :
     * Avant de pouvoir utiliser les commandes associées aux tâches planifiées, vous devez vous assurer que le module est importé.

```powershell
Import-Module ScheduledTasks
```

* Lister les tâches planifiées
  * Utilisez la commande ```Get-ScheduledTask``` pour afficher toutes les tâches planifiées.
    * Cela vous donnera une liste des tâches avec leur nom, état, déclencheur, etc.

## Exercice :

* Le but de cet exercice sera de :
   1. Récupérer la liste des tâches dont le statut n'est pas ```disabled```
   2. A l'aide de la commande Get-ScheduledTaskInfo, récupérez pour chacun des jobs le dernier résultat
   3. Exporter le nom de la tâche, son chemin, le dernier statut et la dernière date d'exécution dans un fichier CSV.
 
* Astuce 1 : la commande Get-Date renvoie un objet de classe [DateTime]. Elle dispose d'une méthode .AddDays() qui peut prendre une valeur négative (ou positive)
