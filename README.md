# Hellworld Flutter App

[![Android CI/CD](https://github.com/votre-utilisateur/helloworld/actions/workflows/flutter_android.yml/badge.svg)](https://github.com/votre-utilisateur/helloworld/actions/workflows/flutter_android.yml)
[![iOS CI/CD](https://github.com/votre-utilisateur/helloworld/actions/workflows/flutter_ios.yml/badge.svg)](https://github.com/votre-utilisateur/helloworld/actions/workflows/flutter_ios.yml)

## Description
Projet Flutter avec CI/CD automatisé pour Android et iOS.

## Prérequis
- Flutter 3.19.5
- Android SDK 33
- CocoaPods (pour iOS)

## Installation
1. Cloner le dépôt :
   \`\`\`bash
   git clone git@github.com:votre-utilisateur/helloworld.git
   cd helloworld
   \`\`\`

2. Installer les dépendances :
   \`\`\`bash
   flutter pub get
   cd ios && pod install && cd ..
   \`\`\`

3. Lancer l'app :
   \`\`\`bash
   flutter run -d all
   \`\`\`

## CI/CD
- **Android** : Build automatisé via GitHub Actions (APK généré à chaque push sur \`main\`).
- **iOS** : Build via Codemagic (IPA généré et envoyé par email).

## Artefacts
Les builds sont disponibles dans :
- [GitHub Actions (Android)](https://github.com/votre-utilisateur/helloworld/actions)
- [Codemagic (iOS)](https://codemagic.io/app/your-app-id)
