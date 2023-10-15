# Sécurité et politiques d'exécution dans PowerShell

PowerShell est un outil puissant, et avec cette puissance vient la nécessité d'une sécurité appropriée. Dans cette section, nous allons explorer les politiques d'exécution de PowerShell et comment elles peuvent être utilisées pour sécuriser votre environnement.

## Table des matières

1. [Qu'est-ce qu'une politique d'exécution ?](#quest-ce-quune-politique-dexécution)
2. [Visualiser la politique d'exécution actuelle](#visualiser-la-politique-dexécution-actuelle)
3. [Configurer une politique d'exécution](#configurer-une-politique-dexécution)
4. [Les différents modes de politiques d'exécution](#les-différents-modes-de-politiques-dexécution)
5. [Politiques d'exécution par défaut selon l'OS](#politiques-dexecution-par-defaut-selon-los)

### Qu'est-ce qu'une politique d'exécution ?

Les politiques d'exécution de PowerShell déterminent les conditions dans lesquelles les scripts PowerShell peuvent être exécutés sur votre système. Elles sont conçues pour vous aider à protéger votre machine des scripts malveillants.

### Visualiser la politique d'exécution actuelle

Pour voir quelle politique d'exécution est actuellement en vigueur, utilisez la commande suivante :

```powershell
Get-ExecutionPolicy
```

### Configurer une politique d'exécution

Pour configurer une politique d'exécution, utilisez la commande `Set-ExecutionPolicy` suivie du mode souhaité. Par exemple :

```powershell
Set-ExecutionPolicy RemoteSigned
```

### Les différents modes de politiques d'exécution

- **Restricted**: Aucun script ne peut être exécuté. C'est le réglage par défaut.
- **AllSigned**: Seuls les scripts signés par un éditeur de confiance peuvent être exécutés.
- **RemoteSigned**: Les scripts téléchargés doivent être signés par un éditeur de confiance. Les scripts locaux peuvent s'exécuter sans être signés.
- **Unrestricted**: Tous les scripts peuvent être exécutés.

### Politiques d'exécution par défaut selon l'OS

Les paramètres par défaut pour les politiques d'exécution peuvent varier en fonction de la version de PowerShell et du système d'exploitation. Voici un aperçu de ces paramètres par défaut pour les principales versions de Windows :

- **Windows Server**:
  - PowerShell v2.0 - v4.0: `RemoteSigned`
  - PowerShell v5.0 et ultérieures: `RemoteSigned`
  
- **Windows Client (ex. Windows 10)**:
  - PowerShell v2.0: `Restricted`
  - PowerShell v3.0 - v4.0: `Restricted`
  - PowerShell v5.0 et ultérieures: `Restricted`
  
- **Windows RT**: 
  - PowerShell v3.0 et ultérieures: `Restricted`

- **macOS et Linux** (PowerShell Core):
  - Toutes les versions: `Unrestricted`, car ces OS ne reconnaissent pas les signatures de la même manière que Windows. Il est recommandé d'être particulièrement prudent lors de l'exécution de scripts sur ces plateformes.

## Conclusion

La compréhension des politiques d'exécution et leur utilisation appropriée est essentielle pour maintenir un environnement PowerShell sécurisé. Assurez-vous de choisir le niveau de sécurité qui convient le mieux à votre situation, tout en étant conscient des risques potentiels.
