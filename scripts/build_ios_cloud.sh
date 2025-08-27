#!/bin/bash

# =============================================
# Guide pour builder l'iOS via Codemagic
# =============================================

echo "📱 Pour builder l'application iOS sans Mac :"
echo "1. Créez un compte sur https://codemagic.io"
echo "2. Connectez votre dépôt Git (GitHub/GitLab/Bitbucket)"
echo "3. Configurez un workflow Flutter iOS avec ce YAML :"

cat << 'YAML'
workflows:
  ios-workflow:
    name: iOS Build
    instance_type: mac_mini_m1
    max_build_duration: 60
    environment:
      flutter: stable
      xcode: latest
    scripts:
      - flutter pub get
      - flutter build ios --release --no-codesign
    artifacts:
      - build/ios/iphoneos/*.app
YAML

echo ""
echo "4. Codemagic gérera la compilation et la signature."
echo "5. Téléchargez le .ipa depuis l'interface Codemagic."
