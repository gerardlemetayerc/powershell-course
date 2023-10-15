## 04-Utilisation de sessions persistantes

### Introduction aux sessions persistantes

Lorsque vous travaillez avec PowerShell Remoting, par défaut, chaque commande envoyée à la machine distante est exécutée dans une nouvelle session. Cela peut être inefficace si vous avez besoin d'exécuter plusieurs commandes qui dépendent les unes des autres ou de conserver un état entre les commandes. Pour résoudre ce problème, PowerShell fournit la possibilité de créer des sessions persistantes (ou "sessions PSSession").

### Création d'une PSSession

Pour créer une session persistante, utilisez la cmdlet `New-PSSession`. Une fois que vous avez une PSSession, vous pouvez l'utiliser pour envoyer plusieurs commandes à la machine distante sans avoir à établir une nouvelle connexion à chaque fois.

```powershell
$session = New-PSSession -ComputerName NOM_DU_SERVEUR
```

### Exécution de commandes dans une PSSession

Avec une PSSession créée, vous pouvez l'utiliser pour exécuter des commandes à l'aide de `Invoke-Command` :

```powershell
Invoke-Command -Session $session -ScriptBlock { Get-Process }
```

### Transfert de données entre la session locale et distante

L'utilisation de sessions persistantes facilite également le transfert de données entre la machine locale et la machine distante. Par exemple, vous pouvez utiliser la cmdlet `Copy-Item` pour copier des fichiers entre machines :

```powershell
Copy-Item -Path "C:\localpath\myfile.txt" -Destination "C:\remotepath\" -ToSession $session
```

### Fermeture d'une PSSession

Lorsque vous avez terminé avec une session persistante, il est important de la fermer pour libérer les ressources. Pour cela, utilisez la cmdlet `Remove-PSSession` :

```powershell
Remove-PSSession -Session $session
```

### Avantages des sessions persistantes

- **Efficacité** : Réutilisation d'une connexion existante plutôt que d'établir une nouvelle connexion pour chaque commande.
- **Conservation de l'état** : Les variables et les fonctions définies dans une session persistante sont conservées pour la durée de la session.
- **Transfert de données** : Facilite le transfert de données entre la session locale et distante.

### Conclusion

Les sessions persistantes en PowerShell offrent une flexibilité accrue lors de la connexion à des machines distantes, permettant une interaction plus fluide et un transfert de données plus facile. Cependant, il est essentiel de gérer correctement ces sessions pour éviter une surutilisation des ressources.
