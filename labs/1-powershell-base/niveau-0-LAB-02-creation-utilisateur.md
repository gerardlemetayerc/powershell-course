# LAB 02 – Création de comptes utilisateurs dans Active Directory

Dans ce LAB, vous allez apprendre à créer un script PowerShell permettant de générer des comptes utilisateurs dans Active Directory à partir d'un fichier CSV.

## Objectifs

1. Lire un fichier CSV contenant les informations des utilisateurs.
2. Générer des noms d'utilisateur uniques.
3. Créer des comptes utilisateurs dans Active Directory.
4. Exporter un fichier CSV contenant les informations des comptes créés.

---

## Étape 1 : Préparation du fichier CSV

Créez un fichier CSV contenant les informations des utilisateurs. Ce fichier doit inclure les colonnes suivantes :

- `username` : Nom d'utilisateur souhaité.
- `surname` : Prénom de l'utilisateur.
- `name` : Nom de famille de l'utilisateur.
- `password` : Mot de passe pour le compte.

### Exemple de fichier CSV

Enregistrez ce fichier sous le nom `tp7_data.csv` :

```csv
username,surname,name,password
jdoe,John,Doe,Password123!
asmith,Alice,Smith,Password456!
bwhite,Bob,White,Password789!
```

---

## Étape 2 : Chargement des données CSV dans PowerShell

Utilisez la commande suivante pour lire les données du fichier CSV dans PowerShell :

```powershell
$csvData = Import-CSV -Delimiter "," -Path 'C:\Users\Administrator\Desktop\tp7_data.csv'
```

### Points importants :
- Assurez-vous que le chemin du fichier CSV est correct.
- Vérifiez que le fichier CSV est bien formaté et ne contient pas de lignes vides.

---

## Étape 3 : Création d'une fonction pour gérer les noms d'utilisateur

Ajoutez une fonction pour limiter la longueur des noms d'utilisateur à 20 caractères. Cela garantit que les noms respectent les contraintes d'Active Directory.

```powershell
function reduceUserName([string]$userName) {
    if ($username.Length -gt 20) {
        return $username.Substring(0, 20) # Tronque le nom à 20 caractères
    } else {
        return $username # Retourne le nom tel quel si sa longueur est inférieure ou égale à 20
    }
}
```

### Conseils :
- Testez cette fonction avec différents noms pour vérifier qu'elle fonctionne correctement.
- Ajoutez des commentaires dans votre script pour expliquer son rôle.

---

## Étape 4 : Génération de noms d'utilisateur uniques

Active Directory n'autorise pas les doublons pour les noms d'utilisateur (`SamAccountName`). Ajoutez une boucle pour vérifier si un nom d'utilisateur existe déjà et générez un nouveau nom si nécessaire.

```powershell
$i = 2
while (Get-ADUser -LdapFilter "(samaccountname=$username)" -ErrorAction SilentlyContinue) {
    $username = ("{0}.{1}" -f $user.surname.ToLower().Substring(0, $i), $user.Name.ToLower())
    $username = reduceUserName($username)
    $i++
}
```

### Explications :
- **`Get-ADUser` :** Vérifie si le nom d'utilisateur existe déjà dans Active Directory.
- **`$i` :** Incrémente un compteur pour générer un nom unique.
- **`reduceUserName` :** Assure que le nom généré respecte la limite de 20 caractères.

---

## Étape 5 : Création des comptes utilisateurs

Utilisez la commande `New-ADUser` pour créer les comptes utilisateurs dans Active Directory. Voici un exemple de hashtable contenant les arguments nécessaires :

```powershell
$userArguments = @{
    Name = $username
    DisplayName = $user.surname + " " + $user.name.ToUpper()
    AccountPassword = $secureStringPassword
    GivenName = $user.surname
    Surname = $user.name
    SamAccountName = $username
    EmailAddress = $mail
    UserPrincipalName = $mail
    Path = "OU=CompanyUsers,DC=domain,DC=local"
}
New-ADUser @userArguments -ErrorAction Stop
```

### Conseils :
- Assurez-vous que le chemin LDAP (`Path`) est correct.
- Testez la commande `New-ADUser` avec un utilisateur fictif avant d'exécuter le script complet.

---

## Étape 6 : Gestion des erreurs

Ajoutez une gestion des erreurs pour capturer les échecs lors de la création des comptes. Cela permet de savoir quels comptes n'ont pas été créés.

```powershell
try {
    New-ADUser @userArguments -ErrorAction Stop
    $user | Add-Member -MemberType NoteProperty -Name "Status" -Value "Created"
} catch {
    $user | Add-Member -MemberType NoteProperty -Name "Status" -Value "Failed"
}
```

### Conseils :
- Ajoutez des messages d'erreur clairs pour faciliter le débogage.
- Vérifiez les permissions de l'utilisateur exécutant le script.

---

## Étape 7 : Exportation des résultats

Exportez les données mises à jour (avec le statut de création) dans un nouveau fichier CSV pour conserver une trace des comptes créés.

```powershell
$csvData | Export-Csv -Path "created_users.csv" -NoTypeInformation -Encoding UTF8
```

### Conseils :
- Vérifiez que le fichier `created_users.csv` contient bien toutes les informations nécessaires.
- Ajoutez une colonne `Status` pour indiquer si le compte a été créé ou non.

---

## Étape 8 : Exécution du script complet

Assemblez toutes les étapes dans un script PowerShell complet et exécutez-le. Assurez-vous d'avoir les permissions nécessaires pour créer des comptes dans Active Directory.

---

## Résultat attendu

À la fin de ce LAB, vous aurez :
1. Un script PowerShell fonctionnel pour créer des comptes utilisateurs.
2. Un fichier CSV `created_users.csv` contenant les informations des comptes créés et leur statut (`Created` ou `Failed`).

---

## Remarque

- Ce script nécessite le module Active Directory. Assurez-vous qu'il est installé et importé avec la commande suivante :

```powershell
Import-Module ActiveDirectory
```

- Exécutez PowerShell avec des privilèges administratifs pour garantir l'accès à Active Directory.

Bonne chance avec ce LAB !