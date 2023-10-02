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

$template = @{
    Nom = ""
    Age = ""
    Note = ""
}

# Conversion de Hashtable vers "Object" personnalisé
$etudiantsFaciles = $Etudiants.Keys | Foreach-Object {
   [PSCustomObject]$Etudiants[$_]
}

# Récupération des meilleurs élèves
$meilleursEtudiants = $etudiantsFaciles | Where-Object Note -ge 90 | ForEach-Object {
    @{
        Note = $_.Note
        Nom  = $_.Nom
        Age  = $_.Age

    }
}

# Ajout de David
$template["Age"] = 10
$template["Nom"] = "David"
$template["note"] = 100

# Organisation des élèves
$Etudiants.Keys | Sort-Object | Foreach-Object {$Etudiants[$_]}

# Supression de Charlie
$Etudiants.Remove("Charlie")
