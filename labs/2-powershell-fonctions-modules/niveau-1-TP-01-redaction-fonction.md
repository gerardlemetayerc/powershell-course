# TP 01 - Fonction de journalisation en PowerShell

Objectif : Créer une fonction PowerShell permettant de journaliser des messages dans un fichier de log pour faciliter le suivi et le débogage des scripts.

## Instruction

* Créez un nouveau script PowerShell et définissez une fonction nommée "Write-Log" qui prendra trois paramètres :
   * "Message" (le message à journaliser)
   * "LogFile" (le chemin du fichier de log)
   * "Level" (4 niveau possible : DEBUG, ERROR, WARNING, INFO

* À l'intérieur de la fonction "Write-Log", ajoutez du code pour vérifier si le fichier de log existe.
   * S'il n'existe pas, créez-le. Si le fichier existe déjà, ouvrez-le en mode ajout pour ajouter les nouveaux messages à la fin.

* Utilisez la cmdlet "Get-Date" pour obtenir la date et l'heure actuelles et formatez-les selon vos préférences.
* Ajoutez cette information de date/heure au début de chaque message dans le format "HH:mm:ss - LEVEL - MESSAGE".

* Ajoutez le message complet (y compris la date/heure) à la fin du fichier de log.
* Testez votre fonction en l'appelant avec différents messages et vérifiez que les messages sont correctement ajoutés au fichier de log.

## Conseils

* Utilisez les cmdlets PowerShell telles que "Test-Path" pour vérifier si un fichier existe et "Out-File -Append" pour ajouter du contenu à un fichier existant.
* Veillez à gérer les erreurs potentielles, par exemple en affichant un message d'erreur si l'ouverture ou l'écriture dans le fichier de log échoue.
