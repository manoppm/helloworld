# Instructions pour l'installation de l'application iOS via Codemagic

Ce fichier décrit les étapes nécessaires pour compiler et installer l'application sur un iPhone en utilisant le service de CI/CD Codemagic, sans avoir besoin d'un Mac localement.

## Prérequis

1.  **Compte développeur Apple** : Vous devez être inscrit au [programme pour développeurs Apple](https://developer.apple.com/programs/).
2.  **Compte Codemagic** : Vous devez avoir un compte sur [Codemagic](https://codemagic.io).
3.  **Dépôt Git** : Le code du projet doit être hébergé sur un fournisseur Git (GitHub, GitLab, Bitbucket) connecté à votre compte Codemagic.

## Étapes

### 1. Configuration de l'application dans Codemagic

1.  Connectez-vous à votre compte Codemagic.
2.  Ajoutez une nouvelle application et sélectionnez le dépôt Git de ce projet.
3.  Codemagic détectera automatiquement le fichier `codemagic.yaml` à la racine du projet, qui contient la configuration de build.

### 2. Configuration de la signature du code (Code Signing)

C'est l'étape la plus importante pour autoriser l'installation sur votre appareil.

1.  Dans les paramètres de votre application sur Codemagic, naviguez vers l'onglet **"Code signing"**.
2.  Vous devrez téléverser vos informations de signature Apple :
    *   **Certificat de Distribution** (un fichier `.p12`).
    *   **Profil de Provisionnement** (un fichier `.mobileprovision`) qui inclut l'UDID de votre iPhone.
3.  Codemagic stocke ces fichiers de manière sécurisée. Pour des instructions détaillées, consultez la [documentation de Codemagic sur la signature de code iOS](https://docs.codemagic.io/code-signing/ios-code-signing/).

### 3. Lancement de la compilation (Build)

1.  Une fois la signature configurée, cliquez sur le bouton **"Start new build"** sur la page de votre application.
2.  Sélectionnez le workflow `iOS Build` (défini dans `codemagic.yaml`) et lancez la compilation.

### 4. Installation de l'application

1.  Une fois la compilation terminée avec succès, Codemagic enverra un e-mail à l'adresse configurée dans le fichier `codemagic.yaml`.
2.  Ouvrez cet e-mail depuis votre iPhone.
3.  Cliquez sur le lien d'installation pour télécharger et installer l'application directement sur votre appareil.