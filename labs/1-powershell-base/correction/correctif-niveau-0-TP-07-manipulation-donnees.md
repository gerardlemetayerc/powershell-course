# Correctif - TP 07 – Manipulation de données

```powershell
$eleves = Import-CSV -Delimiter "," -Path C:\Users\Administrateur\tp7_data.csv
```

## Solution 1 
```powershell
foreach($eleve in $eleves){
    $eleve | Add-Member -MemberType NoteProperty -Name samaccountname -Value $($eleve.surname[0] + "." + $eleve.name)
}
```
## Solution 2
```powershell
$eleves = Import-CSV -Delimiter "," -Path C:\Users\Administrateur\tp7_data.csv
$eleves | Add-Member -MemberType NoteProperty -Name samaccountname -Value $samAccountName
foreach($eleve in $eleves){
    $eleve.samaccountname =  $eleve.surname[0] + "." + $eleve.name
}
```


## Solution 3
```powershell
$eleves = Import-CSV -Delimiter "," -Path C:\Users\Administrateur\tp7_data.csv
$eleves = $eleves | Select *, @{Name="samaccountname";Expression={$([string]$_.surname[0]).toLower() + "." + $($_.name.toLower().trim())}}
$eleves
```

## Solution 4

```powershell
$CSV = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/gerardlemetayerc/powershell-course/main/labs/1-powershell-base/resources/tp7_data.csv" | ConvertFrom-Csv
$CSV = $CSV | Select-Object *, SamAccountname
foreach($line in $CSV){
    
    # Solution 1
    #$line.SamAccountname = $line.surname[0] + "." + $line.name

    # Solution 2 
    #$line.SamAccountname = "{0}.{1}" -f $line.surname[0], $line.name
}
```

## Solution 5

```powershell
#$CSV = Invoke-RestMethod -Uri "https://raw.githubusercontent.com/gerardlemetayerc/powershell-course/main/labs/1-powershell-base/resources/tp7_data.csv" | ConvertFrom-Csv
$CSV = $CSV | Select-Object *, @{Name="SamAccountname";Expression={"{0}.{1}" -f $_.surname[0], $_.name}}
```
