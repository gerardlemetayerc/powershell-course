# Correctif - TP 7 – Manipulation de données

```
$eleves = Import-CSV -Delimiter "," -Path C:\Users\Administrateur\tp7_data.csv
```

## Solution 1 
```
foreach($eleve in $eleves){
    $eleve | Add-Member -MemberType NoteProperty -Name samaccountname -Value $($eleve.surname[0] + "." + $eleve.name)
}
```
## Solution 2
```
$eleves = Import-CSV -Delimiter "," -Path C:\Users\Administrateur\tp7_data.csv
$eleves | Add-Member -MemberType NoteProperty -Name samaccountname -Value $samAccountName
foreach($eleve in $eleves){
    $eleve.samaccountname =  $eleve.surname[0] + "." + $eleve.name
}
```


## Solution 3
```
$eleves = Import-CSV -Delimiter "," -Path C:\Users\Administrateur\tp7_data.csv
$eleves = $eleves | Select *, @{Name="samaccountname";Expression={$([string]$_.surname[0]).toLower() + "." + $($_.name.toLower().trim())}}
$eleves
```
