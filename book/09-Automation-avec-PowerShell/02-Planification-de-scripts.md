# Planification de scripts avec PowerShell

La planification de scripts est une composante essentielle de l'automatisation avec PowerShell, permettant d'exécuter des tâches à des moments déterminés ou en réponse à des événements spécifiques.

## Table des matières

1. [Le Planificateur de tâches de Windows](#le-planificateur-de-tâches-de-windows)
2. [Créer une tâche planifiée avec PowerShell](#créer-une-tâche-planifiée-avec-powershell)
3. [Gestion des tâches planifiées](#gestion-des-tâches-planifiées)

### Le Planificateur de tâches de Windows

Le Planificateur de tâches est un outil intégré à Windows qui permet d'exécuter des scripts ou des programmes à des heures précises, en réponse à des événements, ou selon une variété de déclencheurs.

- **Interface utilisateur** : Accessible via le Panneau de configuration ou en recherchant "Planificateur de tâches" dans la barre de recherche.
- **Intégration avec PowerShell** : PowerShell peut interagir avec le Planificateur de tâches pour créer, modifier, supprimer et exécuter des tâches planifiées.

### Créer une tâche planifiée avec PowerShell

Avec les cmdlets appropriés, vous pouvez facilement planifier une tâche avec PowerShell.

```powershell
# Exemple : Planifier un script PowerShell pour s'exécuter tous les jours à 10h00
$action = New-ScheduledTaskAction -Execute 'powershell' -Argument 'C:\chemin_vers_le_script\mon_script.ps1'
$trigger = New-ScheduledTaskTrigger -At 10am -Every 1 -Days
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "ScriptQuotidien" -Description "Script exécuté quotidiennement à 10 heures"
```

### Gestion des tâches planifiées

Une fois qu'une tâche est planifiée, vous pouvez également utiliser PowerShell pour la gérer.

```powershell
# Obtenir toutes les tâches planifiées
Get-ScheduledTask

# Démarrer une tâche planifiée
Start-ScheduledTask -TaskName "ScriptQuotidien"

# Désactiver une tâche planifiée
Disable-ScheduledTask -TaskName "ScriptQuotidien"

# Supprimer une tâche planifiée
Unregister-ScheduledTask -TaskName "ScriptQuotidien" -Confirm:$false
```

## Conclusion

La planification de scripts avec PowerShell offre un niveau supplémentaire d'automatisation, vous permettant d'exécuter des tâches à des moments précis ou en fonction de critères spécifiques. L'intégration avec le Planificateur de tâches de Windows rend cette tâche facile et efficace.
