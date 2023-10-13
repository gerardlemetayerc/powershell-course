# Exercice - TP- 12 -Manipulation de liste avex Where-Object

* Toujours en vous appuyant sur le fichier [tp7_data.csv](https://github.com/gerardlemetayerc/powershell-course/blob/main/labs/1-powershell-base/resources/tp7_data.csv), réalisez les opérations suivantes :
  * Ajoutez une colonne ```password``` au tableau
  * Initialisez le mot de passe pour tous les utilisateurs dont le prénom est Aurore sur 13 caractères, avec deux caractères spéciaux.

# Astuces

* Vous pouvez vous appuyer sur la classe ```[System.Web.Security.Membership]::GeneratePassword($length, $amountOfNonAlphanumeric)``` pour générer le mot de passe
  * La documentation officielle de cette classe est disponible ici : [system.web.security.membership.generatepassword](https://learn.microsoft.com/en-us/dotnet/api/system.web.security.membership.generatepassword?view=netframework-4.8.1#parameters)
