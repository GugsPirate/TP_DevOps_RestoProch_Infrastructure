# **TP DevOps - Automatisation du Déploiement d’une Infrastructure Cloud

## **Description du projet**

Ce projet vise à automatiser la création d'une infrastructure cloud pour la chaîne de restauration rapide **RestoProch**, dont l'activité repose uniquement sur la commande en ligne et le retrait en restaurant. L'objectif est de fournir une infrastructure scalable, avec des serveurs frontend et backend, afin d'assurer une haute disponibilité et une meilleure performance pendant les périodes de forte affluence.

Le projet repose sur les principes suivants :
- **Backend** : Deux machines virtuelles avec un Load Balancer pour gérer les requêtes de l'application Java.
- **Frontend** : Deux machines virtuelles pour l'application React.js avec un Load Balancer.
- **Sauvegarde** : Mise en place de snapshots automatiques de la base de données toutes les 12 heures pour garantir la sécurité des données.

Les scripts Terraform sont utilisés pour automatiser la création de cette infrastructure.

## **Structure du projet**

Le dépôt contient les fichiers suivants :
- **backend_infrastructure/** : Contient le script Terraform pour déployer les serveurs backend.
- **frontend_infrastructure/** : Contient le script Terraform pour déployer les serveurs frontend.
- **README.md** : Fichier de documentation expliquant le projet.

### **Fichiers et dossiers**

- **backend_infrastructure/main.tf** : Ce fichier Terraform contient les configurations pour créer deux machines virtuelles pour le backend (avec une application Java) et un Load Balancer pour équilibrer le trafic.
  
- **frontend_infrastructure/main.tf** : Ce fichier Terraform contient les configurations pour déployer deux machines virtuelles pour le frontend (avec une application React.js) et un Load Balancer.

- **README.md** : Ce fichier, qui fournit une explication détaillée du projet et des instructions pour l'exécuter.

## **Prérequis**

Avant de pouvoir exécuter les scripts Terraform, assurez-vous d'avoir les éléments suivants installés sur votre machine :
1. **Terraform** : Vous pouvez télécharger et installer Terraform depuis [ce lien](https://www.terraform.io/downloads).
2. **Un compte AWS** (ou autre fournisseur cloud) avec les permissions nécessaires pour créer des instances EC2, des Load Balancers et des bases de données RDS.
3. **AWS CLI** : Pour vous authentifier sur AWS si nécessaire. Téléchargez depuis [AWS CLI](https://aws.amazon.com/cli/).

## **Instructions d'installation**

### **1. Cloner le dépôt**

Commencez par cloner le dépôt dans votre répertoire local en utilisant Git :

```bash
git clone https://github.com/username/TP_DevOps_RestoProch_Infrastructure.git
cd TP_DevOps_RestoProch_Infrastructure
```

### **2. Exécution des scripts Terraform**

#### **a. Déploiement du backend**

1. Accédez au dossier **backend_infrastructure** :
   ```bash
   cd backend_infrastructure
   ```

2. Initialisez Terraform dans ce répertoire :
   ```bash
   terraform init
   ```

3. Appliquez le script Terraform pour déployer l'infrastructure :
   ```bash
   terraform apply
   ```

4. Suivez les instructions et confirmez avec **yes** lorsque demandé. Cela va créer les deux machines virtuelles pour le backend et configurer le Load Balancer.

#### **b. Déploiement du frontend**

1. Accédez au dossier **frontend_infrastructure** :
   ```bash
   cd ../frontend_infrastructure
   ```

2. Initialisez Terraform :
   ```bash
   terraform init
   ```

3. Appliquez le script Terraform pour déployer l'infrastructure frontend :
   ```bash
   terraform apply
   ```

4. Confirmez avec **yes** pour lancer le déploiement.

### **3. Surveillance et gestion de l'infrastructure**

- **Load Balancer** : Les Load Balancers assurent la distribution équitable du trafic entre les serveurs backend et frontend. Vous pouvez vérifier leur statut via la console AWS ou en utilisant AWS CLI.

- **Snapshots de la base de données** : Les sauvegardes automatiques (snapshots) des bases de données sont configurées pour être prises toutes les 12 heures. Vous pouvez ajuster cette configuration dans le script si nécessaire.

## **Configuration personnalisée**

Vous pouvez personnaliser certaines configurations (comme les types d'instance ou les régions AWS) en modifiant les variables dans les fichiers **main.tf**. Par exemple, pour changer le type d'instance EC2, remplacez `t2.micro` par un autre type d'instance compatible dans les blocs `instance_type`.

## **Dépannage**

- Si vous rencontrez des erreurs lors de l'exécution des scripts Terraform, vérifiez que vos **AWS credentials** sont correctement configurés.
- Assurez-vous que les quotas AWS ne sont pas atteints, en particulier pour le nombre maximum d'instances EC2 par région.
- En cas de problème de connectivité entre les serveurs et le Load Balancer, vérifiez les règles de sécurité des groupes (ports ouverts).

## **Contributions**

Si vous souhaitez contribuer à ce projet, n'hésitez pas à faire un **fork** du dépôt, puis soumettez une **pull request** avec vos modifications.

---

### **Conclusion**
Ce fichier README explique les objectifs du projet, les composants de l'infrastructure déployée avec Terraform, et les étapes détaillées pour répliquer l'infrastructure sur AWS. Si vous avez besoin d'aide supplémentaire ou souhaitez ajouter des fonctionnalités, veuillez suivre les instructions de contribution.
