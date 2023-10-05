#!/bin/bash
sudo docker ps | grep container

if [ $? -eq 0 ]; then
    
    # On stop le container 
    sudo docker stop container

    # Et on le supprime
    sudo docker rm -f container

    # On supprime l'image
    sudo docker rmi -f ubuntu:18.04
else
    echo "Le container est en arret."
    exit 1
fi
# Exécuter Terraform destroy 
terraform destroy -auto-approve

# Vérifier si la création a réussi
if [ $? -eq 0 ]; then
    echo "Infrastructure Docker détruite avec succes."
else
    echo "Erreur lors de la destruction de l'infrastructure Docker."
fi
