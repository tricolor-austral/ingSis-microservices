#!/bin/bash

SSH_USER="tricolor-ingsis"
SSH_HOST="4.203.104.146"
REPO_PATH="ingSis-microservices"
GIT_USERNAME="marcocastagnaro"
GIT_TOKEN=$(cat git_token)
GIT_GROUP="tricolor-austral"

chmod 400 dev_key.pem

cat dev_key.pem
cat git_token

ssh -o StrictHostKeyChecking=no -i dev_key.pem ${SSH_USER}@${SSH_HOST} << EOF
  cd ${REPO_PATH}
  sudo git pull https://${GIT_USERNAME}:${GIT_TOKEN}@github.com/${GIT_GROUP}/${REPO_PATH}.git
  sudo docker-compose -f docker-compose.dev.yml up --build
EOF

# Eliminar la clave privada por seguridad
rm dev_key.pem
