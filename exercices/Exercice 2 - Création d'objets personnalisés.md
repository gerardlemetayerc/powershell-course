# Exercice : Création d'objets personnalisés avec PSCustomObject et stockage dans un ArrayList

* Créez un ArrayList appelé ```$ListeEmploye```s pour stocker des objets représentant des employés.
* Créez une Hashtable pour représenter les informations sur un employé. La Hashtable devrait contenir les clés suivantes : Nom, Poste et Salaire.
```powershell
$Employe1Data = @{
    "Nom" = "Alice Smith"
    "Poste" = "Développeur"
    "Salaire" = 60000
}
```

* Utilisez la Hashtable ```$Employe1Data``` pour créer un objet personnalisé (PSCustomObject) représentant cet employé.
* Ajoutez l'objet représentant le premier employé à l'ArrayList ```$ListeEmployes```.
* Mettez à jour la Hashtable ```$Employe1Data``` avec des informations différentes pour un deuxième employé (nom, poste et salaire).
* Utilisez la Hashtable mise à jour pour créer un nouvel objet personnalisé représentant le deuxième employé.
* Ajoutez l'objet représentant le deuxième employé à l'ArrayList ```$ListeEmployes```.
* Mettez à jour la Hashtable pour un troisième employé avec des informations différentes.
* Utilisez la Hashtable mise à jour pour créer un nouvel objet personnalisé représentant le troisième employé.
* Ajoutez l'objet représentant le troisième employé à l'ArrayList ```$ListeEmployes```.
* Utilisez une boucle ```ForEach-Object``` pour parcourir l'ArrayList ```$ListeEmployes``` et afficher le nom, le poste et le salaire de chaque employé.
