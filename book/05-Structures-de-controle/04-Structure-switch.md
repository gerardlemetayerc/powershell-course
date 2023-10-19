# Structure `switch` dans PowerShell

## Sommaire

- [Introduction](#introduction)
- [Syntaxe de base](#syntaxe-de-base)
- [Utilisation avec des motifs](#utilisation-avec-des-motifs)
- [L'utilisation du `default`](#lutilisation-du-default)

## Introduction

La structure `switch` est une alternative aux instructions conditionnelles `if-else` pour tester une variable contre plusieurs valeurs possibles. Elle est particulièrement utile lorsque vous avez de nombreuses conditions à évaluer.

## Syntaxe de base

La syntaxe de base de l'instruction `switch` est la suivante:

```powershell
switch (expression) {
    valeur1 { actions pour la valeur1 }
    valeur2 { actions pour la valeur2 }
    ...
}
```

Voici un exemple simple:

```powershell
$couleur = "rouge"

switch ($couleur) {
    "bleu"  { "La couleur est bleue."  }
    "vert"  { "La couleur est verte."  }
    "rouge" { "La couleur est rouge." }
}
```

## Utilisation avec des motifs

PowerShell prend en charge le filtrage par motifs avec `switch`. Cela signifie que vous pouvez utiliser des motifs comme des expressions régulières pour correspondre à des valeurs:

```powershell
$nom = "Alice"

switch -regex ($nom) {
    "^A"   { "Le nom commence par la lettre A." }
    "e$"   { "Le nom se termine par la lettre e." }
    "lic"  { "Le nom contient la séquence 'lic'." }
}
```

## L'utilisation du `default`

Dans certains cas, vous souhaiterez peut-être prendre des mesures si aucune des conditions de votre `switch` n'est vraie. Pour cela, vous pouvez utiliser l'instruction `default`:

```powershell
$animal = "girafe"

switch ($animal) {
    "chien"   { "C'est un mammifère domestique." }
    "poisson" { "Il vit dans l'eau." }
    default   { "Je ne sais pas grand-chose sur cet animal." }
}
```
