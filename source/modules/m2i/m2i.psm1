# Chargement des fonctions privées et publiques
$paths = "private", "public"
$files = @()

foreach($path in $paths){
  if(Test-Path "$PSScriptRoot\$path\"){
    $files = $files + $(Get-ChildItem "$PSScriptRoot\$path\")
  }
}

$files | %{. $_.fullName}
