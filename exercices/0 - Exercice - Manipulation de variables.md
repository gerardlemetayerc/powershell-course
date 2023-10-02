# Exercice 0 : Manipulation de Hashtable en PowerShell

Supposons que vous ayez une Hashtable contenant des informations sur les étudiants, où chaque clé est le nom de l'étudiant et chaque valeur est une Hashtable contenant les clés suivantes : Nom, Age, Note. Voici un exemple de Hashtable :

```powershell
$Etudiants = @{
    "Alice" = @{
        "Nom" = "Alice Smith"
        "Age" = 25
        "Note" = 92
    }
    "Bob" = @{
        "Nom" = "Bob Johnson"
        "Age" = 22
        "Note" = 88
    }
    "Charlie" = @{
        "Nom" = "Charlie Brown"
        "Age" = 28
        "Note" = 78
    }
}
```

* Affichez le contenu de la Hashtable $Etudiants en utilisant une boucle ```ForEach-Object``` et la commande ```Select-Object```. Affichez les noms, âges et notes de chaque étudiant de manière lisible.
* Utilisez la commande ```Where-Object``` pour filtrer la liste des étudiants et afficher uniquement ceux qui ont obtenu une note supérieure ou égale à 90.
* Créez une nouvelle Hashtable appelée ```$MeilleursEtudiants``` qui contient uniquement les étudiants ayant obtenu une note supérieure ou égale à 90 à partir de la Hashtable ```$Etudiants```.
* Ajoutez un nouvel étudiant, "David", à la Hashtable $Etudiants avec ses informations (nom, âge, note).
* Utilisez la commande ForEach-Object pour calculer la moyenne des notes de tous les étudiants.
* Triez la Hashtable $Etudiants par ordre décroissant de notes.
* Affichez à nouveau la Hashtable triée.
* Utilisez la commande ForEach-Object pour afficher le nom et l'âge de chaque étudiant sous la forme "Nom: [Nom], Âge: [Âge]".
* Utilisez la commande ```Get-Member``` afin de récupérer la méthode permettant de supprimer un élément d'un hashtable
* Supprimez l'étudiant "Charlie" de la Hashtable ```$Etudiants```.
* Affichez à nouveau la Hashtable après avoir supprimé "Charlie".
