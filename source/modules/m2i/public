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
