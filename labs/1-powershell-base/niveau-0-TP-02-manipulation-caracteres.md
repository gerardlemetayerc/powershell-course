# TP 2 – Manipulation de chaînes de caractères à l’aide de PowerShell 

| Niveau   | Titre                      |
|----------|----------------------------|
|   0      | Manipulation de caractères |

**Démarrez PowerShell.**

## Initialisation simple d’une variable 

Dans PowerShell, lancez la ligne de commande suivante : 

```
$maVariable = 'PowerShell' 
$maVariable 
```

Notez le retour de la ligne de commande. Exécutez ensuite : 

```
$maVariable = "C'est génial $maVariable" 
$maVariable 
```

Constatez le retour de la ligne de commande. Vous venez de réaliser une opération de concaténation : la chaîne de caractères contenue dans $maVariable a été intégrée dans votre chaîne de caractères. 

Exécutez à présent : 

```
$maVariable = 'Génial $maVariable' 
$maVariable 
```

L’usage de simples quotes ne permet pas l’interprétation de code dans la chaîne de caractères. 

 

## Intégration du résultat d’une ligne de commande dans une chaîne de caractères. 

L’usage d’une ligne de commande dans une chaîne de caractères peut être réalisé de plusieurs manières. La méthode la plus simple est la suivante :  

```
$maVariable = "$(hostname) est le nom actuel de votre machine."
# Usage de l'opérateur de formattage de chaîne
$maVariable2 = "{0} est le nom actuel de votre machine" -f $(hostname)
# Usage de la classe PowerShell de formattage
$maVariable3 = [string]::Format("{0} est le nom actuel de votre machine",$(hostname))
$maVariable
$maVariable2
```
L’usage de ```$()``` permet d’exécuter une commande et de retourner le contenu dans une chaîne de caractères. 
