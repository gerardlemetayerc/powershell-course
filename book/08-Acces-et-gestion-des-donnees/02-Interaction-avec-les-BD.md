# Interaction avec les Bases de Données via PowerShell

PowerShell est un outil polyvalent qui permet d'interagir avec plusieurs types de bases de données, telles que SQL Server, MySQL et d'autres. Cette section couvre les concepts de base pour établir une connexion et effectuer des opérations CRUD (Create, Read, Update, Delete) sur une base de données.

## Table des matières

1. [Se connecter à une base de données](#se-connecter-à-une-base-de-données)
2. [Effectuer des requêtes CRUD](#effectuer-des-requêtes-crud)
3. [Manipuler des résultats](#manipuler-des-résultats)

### Se connecter à une base de données

Pour interagir avec une base de données, il est nécessaire d'établir une connexion à celle-ci. Voici un exemple de connexion à une base de données SQL Server :

```powershell
# Charger le module SQLServer
Import-Module -Name SQLServer

# Établir la connexion
$connectionString = "Server=monServeur;Database=maBaseDeDonnées;Integrated Security=True;"
$connection = New-Object System.Data.SqlClient.SqlConnection $connectionString
$connection.Open()
```

### Effectuer des requêtes CRUD

Une fois connecté, vous pouvez effectuer des opérations CRUD :

**Create (Créer) :**

```powershell
$command = $connection.CreateCommand()
$command.CommandText = "INSERT INTO maTable (nom, age) VALUES ('Jean', 30)"
$command.ExecuteNonQuery()
```

**Read (Lire) :**

```powershell
$command = $connection.CreateCommand()
$command.CommandText = "SELECT * FROM maTable"
$reader = $command.ExecuteReader()

while ($reader.Read()) {
    $nom = $reader["nom"]
    $age = $reader["age"]
    Write-Output "Nom: $nom, Age: $age"
}
```

**Update (Mettre à jour) :**

```powershell
$command = $connection.CreateCommand()
$command.CommandText = "UPDATE maTable SET age = 31 WHERE nom = 'Jean'"
$command.ExecuteNonQuery()
```

**Delete (Supprimer) :**

```powershell
$command = $connection.CreateCommand()
$command.CommandText = "DELETE FROM maTable WHERE nom = 'Jean'"
$command.ExecuteNonQuery()
```

### Manipuler des résultats

Après avoir obtenu des résultats d'une requête, vous pouvez les manipuler comme n'importe quel autre objet PowerShell.

```powershell
$command = $connection.CreateCommand()
$command.CommandText = "SELECT nom, age FROM maTable WHERE age > 25"
$reader = $command.ExecuteReader()

$results = @()

while ($reader.Read()) {
    $result = @{
        Nom  = $reader["nom"]
        Age = $reader["age"]
    }

    $results += $result
}

$results | Format-Table -AutoSize
```

## Conclusion

L'interaction avec les bases de données est un aspect essentiel de nombreux scripts PowerShell. En maîtrisant ces concepts de base, vous pouvez créer des scripts puissants pour gérer et analyser vos données.
