#!/bin/bash

# Se placer dans le folder de l'infra
cd ../infra
# Exécuter Terraform init et apply
terraform init
terraform apply -auto-approve

# Vérifier si la création a réussi
if [ $? -eq 0 ]; then
    echo "Infrastructure Docker déployée avec succès."
else
    echo "Erreur lors du déploiement de l'infrastructure Docker."
fi
