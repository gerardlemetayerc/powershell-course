# TP 9 – Manipulation de switch 

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

* Reprenez l’exercice précédent, en utilisant switch cette fois-ci :
  * Si le service est dans les status en "en attente de...”, indiquez que le service est en cours de changement d’état
  * Si le service est suspendu ou arrêté, démarrez-le
  * Si le service est démarré, retournez l’information sur le fait que le service soit bien démarré 

**Astuce** : vous pouvez envisager l’usage d’une comparaison de chaîne de caractères pour les statuts en “attente de”. 
