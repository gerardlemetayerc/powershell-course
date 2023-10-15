## 03-CredSSP et délégation des identifiants

### Introduction à CredSSP

CredSSP (Credential Security Support Provider) est un mécanisme d'authentification qui permet à une application client de déléguer ses identifiants à un serveur pour exécuter une tâche en tant que cet utilisateur. Dans le contexte de PowerShell, il permet la délégation des identifiants lors de l'utilisation de PSRemoting.

### Pourquoi utiliser CredSSP ?

Dans certaines situations, lors de l'utilisation de PSRemoting, vous pourriez rencontrer une erreur "double saut" (double-hop). Cela se produit lorsque votre script tente d'accéder à une ressource sur une troisième machine à partir de la machine distante sur laquelle il s'exécute. Par défaut, votre session distante n'a pas les droits pour transmettre vos identifiants à cette troisième machine.

CredSSP est l'une des solutions pour résoudre ce problème de double saut.

### Activer CredSSP

Avant de pouvoir utiliser CredSSP avec PSRemoting, il doit être activé sur la machine client et sur la machine serveur.

Pour activer CredSSP sur la machine **client** :

```powershell
Enable-WSManCredSSP -Role Client -DelegateComputer NOM_DU_SERVEUR
```

Pour activer CredSSP sur la machine **serveur** :

```powershell
Enable-WSManCredSSP -Role Server
```

### Utiliser CredSSP avec PSRemoting

Lors de l'établissement d'une session PSRemoting, spécifiez l'authentification CredSSP :

```powershell
Enter-PSSession -ComputerName NOM_DU_SERVEUR -Credential NOM_UTILISATEUR -Authentication Credssp
```

Ou avec `Invoke-Command` :

```powershell
Invoke-Command -ComputerName NOM_DU_SERVEUR -ScriptBlock { ... } -Credential NOM_UTILISATEUR -Authentication Credssp
```

### Préoccupations de sécurité

L'utilisation de CredSSP présente des risques de sécurité. Lorsqu'il est activé, un attaquant qui compromet le serveur pourrait utiliser CredSSP pour accéder à d'autres systèmes en utilisant les identifiants délégués. Il est donc essentiel d'évaluer le besoin réel de CredSSP et de l'utiliser judicieusement.

### Conclusion

CredSSP offre une solution au problème de double saut en PSRemoting. Cependant, en raison des préoccupations liées à la sécurité, son utilisation doit être soigneusement considérée et correctement configurée.
