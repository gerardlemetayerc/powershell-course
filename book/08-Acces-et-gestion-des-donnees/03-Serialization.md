# Sérialisation avec PowerShell

La sérialisation est le processus de conversion d'un objet en un format qui peut être transféré ou stocké, puis de reconversion (désérialisation) de ce format en objet. PowerShell fournit des outils natifs pour la sérialisation et la désérialisation des objets, principalement en XML et en JSON.

## Table des matières

1. [Sérialisation en JSON](#sérialisation-en-json)
2. [Sérialisation en XML](#sérialisation-en-xml)
3. [Désérialisation](#désérialisation)

### Sérialisation en JSON

PowerShell propose la cmdlet `ConvertTo-Json` pour la sérialisation en format JSON.

```powershell
$person = @{
    Nom   = "Jean"
    Age   = 30
    Ville = "Paris"
}

$personJson = $person | ConvertTo-Json
Write-Output $personJson
```

### Sérialisation en XML

De même, la cmdlet `ConvertTo-Xml` permet de sérialiser des objets en format XML.

```powershell
$personXml = $person | ConvertTo-Xml
$personXml.OuterXml
```

### Désérialisation

Inversement, pour convertir des données sérialisées en objets PowerShell :

**Depuis JSON :**

```powershell
$jsonData = '{"Nom":"Jean","Age":30,"Ville":"Paris"}'
$objectFromJson = $jsonData | ConvertFrom-Json
```

**Depuis XML :**

```powershell
$xmlData = @"
<?xml version="1.0"?>
<object>
  <property name="Nom">Jean</property>
  <property name="Age">30</property>
  <property name="Ville">Paris</property>
</object>
"@

$objectFromXml = [xml]$xmlData
```

## Conclusion

La sérialisation et la désérialisation sont des opérations essentielles pour stocker, transférer et manipuler des données. Grâce aux outils natifs de PowerShell, ces tâches sont simples et efficaces.
