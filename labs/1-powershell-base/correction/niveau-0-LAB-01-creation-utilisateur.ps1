# Chargement des données depuis un fichier CSV
# Le fichier contient les informations des utilisateurs à créer (nom, prénom, mot de passe)
$csvData = Import-CSV -Delimiter "," -Path 'C:\Users\Administrator\Desktop\tp7_data.csv'

# Fonction pour réduire la longueur du nom d'utilisateur à un maximum de 20 caractères
function reduceUserName([string]$userName)
{
    if($username.Length -gt 20){
        # Si le nom dépasse 20 caractères, on le tronque
        return $username.Substring(0,20)
    }else{
        # Sinon, on retourne le nom tel quel
        return $username
    }
}

# Initialisation du compteur pour le suivi de la progression
$count = 1

# Boucle pour traiter chaque utilisateur du fichier CSV
foreach($user in $csvData){
    # Affichage de la progression de la création des comptes
    Write-Progress -Activity "Création des comptes" -CurrentOperation "Traitement de $($user.name)" -PercentComplete ($count*100/$($csvData.Count))
    
    # Conversion du mot de passe en SecureString pour des raisons de sécurité
    $secureStringPassword = ConvertTo-SecureString -String $user.password -AsPlainText -Force
    
    # Vérification et ajustement du nom d'utilisateur pour respecter les contraintes
    $username = reduceUserName($user.username)
    $i = 2
    
    # Boucle pour générer un nom d'utilisateur unique en cas de conflit
    while(Get-ADUser -LdapFilter "(samaccountname=$username)" -ErrorAction SilentlyContinue)
    {
        # Génération d'un nouveau nom d'utilisateur basé sur le prénom et le nom
        $username = ("{0}.{1}" -f $user.surname.ToLower().Substring(0,$i), $user.Name.ToLower())
        $username = reduceUserName($username)
        $i++
    }
    
    # Génération de l'adresse e-mail basée sur le nom d'utilisateur
    $mail = "$username@cfa-insta.local"
    
    # Création d'un hashtable contenant les arguments pour la commande New-ADUser
    $userArguments = @{
        Name = $username
        DisplayName = $user.surname + " " + $user.name.ToUpper()
        AccountPassword = $secureStringPassword
        GivenName = $user.surname
        Surname = $user.name
        SamAccountName = $username
        EmailAddress = $mail
        UserPrincipalName = $mail
        Path = "OU=CompanyUsers,DC=domain,DC=local" # Chemin LDAP où le compte sera créé
    }
    
    # Création du compte utilisateur dans Active Directory
    try{
        New-ADUser @userArguments -ErrorAction Stop
        # Mise à jour des informations de l'utilisateur dans le CSV
        $user.username = $username
        $user.email = $mail
        $user | Add-Member -MemberType NoteProperty -Name "Status" -Value "Created"
    }catch{
        # Gestion des erreurs en cas d'échec de la création du compte
        $user | Add-Member -MemberType NoteProperty -Name "Status" -Value "Failed"
    }
    
    # Incrémentation du compteur pour la progression
    $count++
}

# Exportation des données mises à jour (avec le statut) dans un nouveau fichier CSV
$csvData | Export-Csv -Path "created_users.csv" -NoTypeInformation -Encoding UTF8