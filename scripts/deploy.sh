#!/bin/bash

# Se placer dans le folder de l'infra
# Exécuter Terraform init et apply
terraform -chdir=../infra init
# Check the syntax
terraform -chdir=../infra fmt -check
# We plan 
# terraform -chdir=../infra plan -input=false 
# We apply 
terraform -chdir=../infra apply -auto-approve 

# Vérifier si la création a réussi
if [ $? -eq 0 ]; then
    echo "Infrastructure Docker déployée avec succès."
else
    echo "Erreur lors du déploiement de l'infrastructure Docker."
fi
