
* Générez un fichier CSV avec les en-têtes suivantes, et ajoutez votre nom, votre prenom, ainsi que celui d'une connaissance.
```
prenom;nom;mdp
```

* Importez ce fichier CSV dans une variable au nom de votre choix (par exemple, ```$userList```)
* A l'aide d'une boucle **foreach**, générez :
  * L'adresse email de l'utilisateur au format ```prenom.nom@lab.local```
  * Le SamAccountname de l'utilisateur au format suivant ```USXXXXXXXXXX```, où XXXXXXXXX représente l'année, le mois, le jour et un compteur sur 2 digit
    * Par exemple : US2023100301
* Pour itération, exécutez le scriptblock suivant :

```powershell
  New-ADUser -SamAccoutName $samaccountname -surname $prenom -GivenName $nom -Name "$prenom $nom"
  Set-ADAccountPassword test -NewPassword (ConvertTo-SecureString -AsplainText -Force $password)
```
