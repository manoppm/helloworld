#!/bin/bash

# =============================================
# Script pour builder l'APK Android
# À exécuter depuis /projets/helloworld
# =============================================

cd /projets/helloworld

echo "🛠️ Nettoyage des anciens builds..."
flutter clean

echo "📦 Récupération des dépendances..."
flutter pub get

echo "🔨 Construction de l'APK (mode debug)..."
flutter build apk --debug

echo "✅ APK généré :"
echo "  $(pwd)/build/app/outputs/flutter-apk/app-debug.apk"
