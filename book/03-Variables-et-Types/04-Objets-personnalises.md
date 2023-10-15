# Objets personnalisés dans PowerShell

PowerShell est fortement axé sur les objets, ce qui le différencie de nombreux autres langages de script. Parfois, vous souhaiterez peut-être créer des objets personnalisés pour mieux organiser vos données ou pour interagir plus efficacement avec d'autres commandes PowerShell.

## Création d'un objet personnalisé avec `New-Object`

```powershell
$monObjet = New-Object PSObject -Property @{
    Nom = "John"
    Age = 25
    Profession = "Ingénieur"
}
```

## Ajout de propriétés à un objet existant

Vous pouvez ajouter des propriétés à un objet après sa création:

```powershell
$monObjet | Add-Member -Type NoteProperty -Name "Taille" -Value 180
```

## Création d'un objet avec `[PSCustomObject]`

Une autre manière, plus concise, de créer un objet personnalisé:

```powershell
$monObjet = [PSCustomObject]@{
    Nom = "John"
    Age = 25
    Profession = "Ingénieur"
}
```

Cette méthode est particulièrement utile dans les versions récentes de PowerShell et est généralement préférée pour sa lisibilité.

## Utiliser les objets personnalisés dans les pipelines

Les objets personnalisés sont parfaits pour être utilisés dans les pipelines PowerShell:

```powershell
$utilisateurs = @(
    [PSCustomObject]@{Nom="John"; Age=25; Profession="Ingénieur"},
    [PSCustomObject]@{Nom="Jane"; Age=28; Profession="Designer"}
)

$utilisateurs | Where-Object { $_.Age -lt 30 }
```

## Conversion en d'autres types

Les objets personnalisés peuvent être facilement convertis en d'autres formats comme JSON, CSV, etc., grâce aux cmdlets natifs de PowerShell comme `ConvertTo-Json` ou `Export-Csv`.

```powershell
$monObjet | ConvertTo-Json
```

## Conclusion

Les objets personnalisés sont un outil puissant dans votre arsenal PowerShell, vous permettant de structurer et de manipuler vos données de manière flexible et efficace.
