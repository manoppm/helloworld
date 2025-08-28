#!/bin/bash

# Ce script construit l'application iOS et génère un fichier .ipa.

# Assurez-vous que la signature du code est correctement configurée dans Xcode
# avant d'exécuter ce script. Voir INSTRUCTIONS_IOS.md pour plus de détails.

echo "Construction de l'application iOS..."

flutter build ipa

echo "
Construction terminée.

Le fichier .ipa se trouve dans le dossier build/ios/ipa/.

Prochaines étapes :
1. Téléversez le fichier .ipa sur App Store Connect pour le distribuer via TestFlight.
2. Ou installez-le manuellement en utilisant Apple Configurator ou Xcode (distribution Ad Hoc).

Consultez le fichier INSTRUCTIONS_IOS.md pour des instructions détaillées.
"
