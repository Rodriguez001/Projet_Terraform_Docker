#!/bin/bash

# Se placer dans le folder de l'infra
path_infra="$PWD/infra"
if [ -d path_infra ]; then        
        cd path_infra        
else
        echo "Directory does not exist: $path_infra"
fi
# Exécuter Terraform init et apply
terraform init
# Check the syntax
terraform fmt -check
# We plan 
terraform plan -input=false
# We apply 
terraform apply -auto-approve -input=false

# Vérifier si la création a réussi
if [ $? -eq 0 ]; then
    echo "Infrastructure Docker déployée avec succès."
else
    echo "Erreur lors du déploiement de l'infrastructure Docker."
fi
