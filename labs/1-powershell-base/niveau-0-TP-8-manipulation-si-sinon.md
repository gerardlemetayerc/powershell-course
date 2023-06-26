# TP 8 – Manipulation de SI...SINON 

Vous allez dans ce TP réaliser des manipulations sur SI...SINON. 

A l’aide de PowerShell, exécutez le code suivant : 
```
$Service = Get-Service WinRM 
```

* La commande Get-Service permet de récupérer la liste des services et leurs états (équivalent de la console services.msc).
* La propriété statut peut avoir les valeurs suivantes (https://docs.microsoft.com/fr-fr/dotnet/api/system.serviceprocess.servicecontrollerstatus) : 

| Statut          | Description                                |
|-----------------|--------------------------------------------|
| ContinuePending | Le service est en attente.                 |
| Paused          | Le service est suspendu.                   |   
| PausePending    | La suspension du service est en attente.   | 
| Running         | Le service est en cours d'exécution.       | 
| StartPending    | Le service est en cours de démarrage.      | 
| Stopped         | Le service n'est pas en cours d'exécution. |  
| StopPending     | Le service est en cours d'arrêt.           | 

* Ecrivez la condition permettant : 
  * Démarrer le service s’il est arrêté ou en pause
  * Indiquer que le service est déjà en cours de fonctionnement si ce dernier est démarré
  * Sinon, indiquez que le service est en cours de changement d’état. 
