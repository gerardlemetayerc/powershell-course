## 02-PSRemoting

### Qu'est-ce que PSRemoting ?

PSRemoting permet aux administrateurs d'exécuter des commandes PowerShell sur une machine distante ou un ensemble de machines distantes. Il s'appuie sur le protocole WS-Management pour permettre cette communication à distance.

### Activer PSRemoting

Avant de pouvoir utiliser PSRemoting, il doit être activé sur la machine cible. Cela se fait à l'aide de la commande :

```powershell
Enable-PSRemoting -Force
```

Cette commande doit être exécutée avec des privilèges d'administrateur.

### Établir une session

Pour démarrer une session distante, vous pouvez utiliser la cmdlet `Enter-PSSession` :

```powershell
Enter-PSSession -ComputerName NOM_DU_SERVEUR -Credential NOM_UTILISATEUR
```

Vous serez alors dans une session interactive sur la machine distante.

Pour quitter la session, utilisez simplement la commande `exit`.

### Exécution de commandes à distance

Si vous souhaitez exécuter une seule commande sans entrer dans une session interactive, utilisez la cmdlet `Invoke-Command` :

```powershell
Invoke-Command -ComputerName NOM_DU_SERVEUR -ScriptBlock { Get-Process } -Credential NOM_UTILISATEUR
```

Ceci exécutera la commande `Get-Process` sur la machine distante et affichera les résultats sur votre machine locale.

### Sécurité et PSRemoting

L'administration à distance avec PowerShell est sécurisée par défaut. Les communications sont cryptées, et vous devez disposer des autorisations appropriées pour vous connecter à une machine distante. Néanmoins, il est essentiel de comprendre les implications de sécurité et de s'assurer que votre environnement est correctement configuré.

### Conclusion

PSRemoting est un outil puissant pour l'administration à distance. Que ce soit pour gérer une seule machine ou un parc entier, il offre flexibilité et puissance. Comme toujours avec de tels outils, une utilisation judicieuse et une compréhension de la sécurité sont essentielles.
