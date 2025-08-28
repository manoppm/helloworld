# Instructions pour l'installation de l'application iOS

Ce fichier décrit les étapes nécessaires pour installer l'application sur un iPhone.

## Prérequis

1.  **Compte développeur Apple** : Vous devez être inscrit au [programme pour développeurs Apple](https://developer.apple.com/programs/).
2.  **Xcode** : Xcode doit être installé sur votre Mac.
3.  **Appareil enregistré** : Votre iPhone doit être enregistré comme appareil de test dans votre compte développeur Apple.

## Étapes

### 1. Configuration de la signature du code dans Xcode

1.  Ouvrez le projet iOS dans Xcode :
    ```bash
    open ios/Runner.xcworkspace
    ```
2.  Sélectionnez `Runner` dans le navigateur de projet à gauche.
3.  Allez à l'onglet `Signing & Capabilities`.
4.  Sélectionnez votre équipe de développeur (Team).
5.  Assurez-vous que `Automatically manage signing` est coché. Xcode devrait gérer la création des certificats et des profils de provisionnement pour vous.

### 2. Construction de l'application

Vous pouvez construire l'application de deux manières :

#### a) Avec le script `build_ios.sh`

J'ai créé un script `build_ios.sh` qui exécute la commande de construction pour vous.

Pour l'utiliser, rendez-le d'abord exécutable :
```bash
chmod +x build_ios.sh
```

Puis, exécutez-le :
```bash
./build_ios.sh
```

Cette commande va créer un fichier `.ipa` dans le dossier `build/ios/ipa/`.

#### b) Manuellement avec Flutter

Vous pouvez également exécuter la commande de construction manuellement :
```bash
flutter build ipa
```

### 3. Installation de l'application

Une fois que vous avez le fichier `.ipa`, vous avez deux options principales pour l'installer :

#### a) TestFlight (Recommandé)

1.  Allez sur [App Store Connect](https://appstoreconnect.apple.com/) et connectez-vous.
2.  Allez dans la section `Mes apps` et sélectionnez votre application.
3.  Allez dans l'onglet `TestFlight`.
4.  Téléversez le fichier `.ipa` que vous avez créé. Vous pouvez utiliser l'application `Transporter` sur votre Mac pour cela.
5.  Une fois le téléversement et le traitement terminés, vous pouvez vous ajouter comme testeur interne et installer l'application via l'application TestFlight sur votre iPhone.

#### b) Ad Hoc

1.  Dans votre compte développeur Apple, créez un profil de provisionnement "Ad Hoc" qui inclut l'UDID de votre iPhone.
2.  Téléchargez ce profil et installez-le dans Xcode.
3.  Configurez le projet Xcode pour utiliser ce profil de provisionnement pour les builds "Release".
4.  Construisez l'application comme décrit à l'étape 2.
5.  Utilisez Apple Configurator 2 ou Xcode pour installer manuellement le fichier `.ipa` sur votre iPhone.

Pour des instructions plus détaillées, consultez la [documentation officielle de Flutter](https://docs.flutter.dev/deployment/ios).
