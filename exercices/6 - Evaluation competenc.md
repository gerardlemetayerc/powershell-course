
# Exercice de Scripting PowerShell et DSC pour Mettalugic France

## Contexte

Mettalugic France, spécialisée dans la production de pièces métalliques, vise à renforcer la sécurité et la conformité de son infrastructure IT. En tant qu'ingénieur système, vous devez implémenter des solutions d'automatisation pour améliorer la sécurité et la conformité, et fournir un rapport détaillé sur l'état de la sécurité IT.

## Objectifs

- Déployer LAPS, désactiver TLS 1.0, 1.1 et SSL via DSC.
- Réinitialiser les ACLs pour les objets ayant appartenu à des groupes à privilèges.
- Générer un rapport HTML sur les membres des groupes à privilèges et les utilisateurs inactifs.
- Configurer une règle JEA pour la gestion des services AD par des non-administrateurs.

## Instructions

1. **Gestion de Conformité avec DSC**:
   - Utilisez DSC pour installer et configurer LAPS sur tous les serveurs, désactivez TLS 1.0, 1.1 et SSL.

2. **Audit de Sécurité**:
   - Écrivez un script PowerShell pour réinitialiser les ACLs des objets ayant été dans des groupes à privilèges.

3. **Reporting**:
   - Créez un rapport HTML avec PowerShell listant les membres des groupes à privilèges et les utilisateurs inactifs depuis plus de 90 jours.

4. **Configuration JEA sur le Contrôleur AD**:
   - Configurez un endpoint JEA permettant la gestion des services des contrôleurs de domaine par des utilisateurs non administrateurs.

## Livrables

- `DSCConfiguration.ps1`: Script DSC pour la sécurité.
- `Audit-ACLs.ps1`: Script d'audit des ACLs.
- `SecurityReport.html`: Rapport HTML sur la sécurité.
- `Configure-JEA.ps1`: Script pour la configuration JEA.

## Critères d'Évaluation

- Les scripts et configurations doivent appliquer précisément les paramètres de sécurité.
- Les scripts doivent être bien commentés, et les rapports, complets et compréhensibles.
- Les solutions doivent adhérer aux meilleures pratiques de sécurité, particulièrement pour JEA et la gestion des ACLs.