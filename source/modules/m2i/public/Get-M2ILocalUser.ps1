<#
.Synopsis
   Permet de récupérer les utilisateurs locaux avec des informations supplémentaires
.DESCRIPTION
   Cette ligne de commande permet de récupérer un ou l'ensemble des utilisateurs locaux sur un poste de travail Windows
.EXAMPLE
   Get-M2ILocalUser
.EXAMPLE
   Get-M2ILocalUser -username Administrateur
.INPUTS
   username
.OUTPUTS
   Selected.Microsoft.PowerShell.Commands.LocalUser
.NOTES
   En cours de développement
.COMPONENT
   M2I
.ROLE
   User Management
.FUNCTIONALITY
   Cette ligne de commande permet de retourner les utilisateurs locaux d'un poste travail, avec les informations associées au chemin du profil.
#>
function Get-M2ILocalUser {
	param(
		$username
	)

	BEGIN {
		$commandParam = @{}
	
		# Si le paramètre "username" est donné, on initialise le paramètre
		if($username){$commandParam["Name"] = $username}
	}
	
	PROCESS  {
		# Requête via la commande "Get-LocalUser" pour récupérer les utilisateurs locaux
		$localUsers = Get-LocalUser @commandParam | Select-Object Name, Enabled, Description, LastLogon, PasswordExpires, SID
	
		Write-Verbose "Nombre d'objet récupérées : $($localUsers.count)"

		$newObjectProperty = @{
			memberType = "NoteProperty"
			value      = ""
			name       = "LocalPath"
		}

		# Pour chaque utilisateur, on récupère le chemin et on définit la valeur dans le tableau
		foreach($localUser in $localUsers){
			$data = Get-WmiObject win32_userprofile -Filter "SID='$($localUser.SID)'"
			if($data.localPath){$newObjectProperty["value"] = $data.localPath}
			else{$newObjectProperty["value"] = ""}	
			$localUser | Add-Member @newObjectProperty
		}
	}

	END {
		return $localUsers
	}

}
