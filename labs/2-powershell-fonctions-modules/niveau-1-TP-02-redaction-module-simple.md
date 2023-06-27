# TP 02 - Rédaction d'un module - Simple

Vous allez dans ce TP reprendre la fonction réalisée dans le TP précédent, et l'intégrer dans un nouveau module.

## Instruction

* Générez un répertoire "M2ICustom", et ajoutez un fichier M2ICustom.psm1
* Collez la fonction précédemment réalisée dans ce fichier
* Ajoutez la ligne d'instruction suivante :

```
Export-ModuleMember -Function * -Variable *
```

* Sauvegardez votre fichier.
* Copiez le répertoire MI2Custom dans le chemin suivant : **C:\Program Files\WindowsPowerShell\Modules**
* Ouvrez une nouvelle console PowerShell et entrez la ligne de commande suivante :

```
Get-Module M2ICustom -ListAvailable
Write-Host "-----"
# Notez le résultat
Import-Module M2ICustom
Get-Module M2ICustom -ListAvailable
Write-Host "-----"
```
