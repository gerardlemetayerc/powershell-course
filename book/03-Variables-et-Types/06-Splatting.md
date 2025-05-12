# Splatting en PowerShell

## Sommaire

- [Introduction](#introduction)
- [Définition du splatting](#définition-du-splatting)
- [Utilisation du splatting avec des tableaux](#utilisation-du-splatting-avec-des-tableaux)
- [Utilisation du splatting avec des hashtables](#utilisation-du-splatting-avec-des-hashtables)
- [Avantages du splatting](#avantages-du-splatting)

## Introduction

Le splatting est une fonctionnalité de PowerShell qui permet de passer un ensemble de paramètres à une commande sous forme de tableau ou de hashtable. Cela rend les scripts plus lisibles et plus faciles à maintenir.

## Définition du splatting

En PowerShell, le splatting consiste à utiliser un tableau ou une hashtable pour regrouper les paramètres d'une commande. Les paramètres sont ensuite passés à la commande en utilisant le symbole `@`.

## Utilisation du splatting avec des tableaux

Un tableau peut être utilisé pour passer des paramètres positionnels à une commande. Par exemple :

```powershell
$parametres = @("param1", "param2", "param3")
Commande @parametres
```

Dans cet exemple, les paramètres positionnels "param1", "param2" et "param3" sont passés à la commande.

## Utilisation du splatting avec des hashtables

Une hashtable est utilisée pour passer des paramètres nommés à une commande. Par exemple :

```powershell
$parametres = @{
    Param1 = "Valeur1"
    Param2 = "Valeur2"
    Param3 = "Valeur3"
}
Commande @parametres
```

Dans cet exemple, les paramètres nommés `Param1`, `Param2` et `Param3` sont passés à la commande avec leurs valeurs respectives.

## Avantages du splatting

Le splatting présente plusieurs avantages :

- **Lisibilité** : Les paramètres sont regroupés dans une structure claire, ce qui rend le code plus lisible.
- **Réutilisabilité** : Les mêmes paramètres peuvent être réutilisés dans plusieurs commandes.
- **Maintenance** : Il est plus facile de modifier ou d'ajouter des paramètres dans une structure unique plutôt que dans plusieurs lignes de commande.
