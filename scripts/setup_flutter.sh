#!/bin/bash

# =============================================
# Script d'installation de Flutter + GitHub Privé
# À exécuter depuis /projets/helloworld/scripts
# =============================================

# Vérifier que le script n'est pas exécuté en root
if [ "$(id -u)" -eq 0 ]; then
    echo "❌ Ne pas exécuter ce script en root. Utilisez votre utilisateur normal."
    exit 1
fi

# 1. Configuration Git globale
echo "🔑 Configuration Git..."
git config --global user.name "Votre Nom"
git config --global user.email "votre.email@example.com"
git config --global init.defaultBranch main

# 2. Générer une clé SSH (si elle n'existe pas)
if [ ! -f ~/.ssh/id_ed25519 ]; then
    echo "🔐 Génération d'une clé SSH..."
    ssh-keygen -t ed25519 -C "votre.email@example.com" -f ~/.ssh/id_ed25519 -N ""
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_ed25519
    echo "✅ Clé SSH générée. Ajoutez-la à votre compte GitHub :"
    echo "https://github.com/settings/keys"
    cat ~/.ssh/id_ed25519.pub
    read -p "Appuyez sur Entrée après avoir ajouté la clé à GitHub..."
fi

# 3. Installer les dépendances système
echo "🛠️ Installation des dépendances..."
sudo apt update -qq && sudo apt upgrade -y -qq
sudo apt install -y -qq git curl wget unzip xz-utils zip libglu1-mesa-dev openjdk-17-jdk gh

# 4. Installer Flutter et Android SDK (comme avant)
echo "📥 Installation de Flutter et Android SDK..."
# ... [le reste de l'installation Flutter/Android reste identique à la version précédente] ...

# 5. Créer le projet Flutter
echo "🆕 Création du projet Flutter..."
cd /projets/helloworld
flutter create --org com.votrenom --project-name helloworld --platforms android,ios,web .

# 6. Initialiser Git et créer un dépôt PRIVÉ sur GitHub
echo "🔒 Initialisation Git avec dépôt privé..."
git init
gh auth login  # Suivez les instructions pour vous connecter à GitHub
gh repo create helloworld --private --source=. --push --remote=origin

# 7. Configuration .gitignore pour Flutter
echo "📝 Configuration de .gitignore..."
cat << 'GITIGNORE' > .gitignore
# Flutter/Dart
**.dart_tool/
.flutter-plugins
.flutter-plugins-dependencies
.pub/
/build/
/android/.gradle/
/android/app/build/

# Android
**/android/**/gradle-wrapper.properties

# iOS
**/ios/**/*.mode1v3
**/ios/**/*.moved-aside
**/ios/**/*.pbxuser
**/ios/**/*.perspectivev3
**/ios/**/Pods/
**/ios/**/*.xcworkspace

# Environnement
.env
GITIGNORE

# 8. Premier commit
echo "💾 Premier commit..."
git add .
git commit -m "🚀 Initial commit: Project setup with Flutter"
git push -u origin main

echo "🎉 Tout est prêt ! Votre dépôt privé est disponible sur :"
echo "https://github.com/$(gh api user --jq '.login')/helloworld"
