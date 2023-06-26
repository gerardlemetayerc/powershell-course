# Chargement des fonctions privées et publiques
$files = Get-ChildItem $PSScriptRoot\private\
$files += Get-ChildItem $PSScriptRoot\public\

$files | %{. $files.fullPath}
