$mesParametres = @{
  path     = 'C:\Tmp\MonFichier.txt'
  value    = 'Ceci est le contenu de mon fichier.'
  itemType = 'File'
}

New-Item @mesParametres

$mesParametres["path"] = 'C:\Tmp\MonFichier.txt'
New-Item @mesParametres
