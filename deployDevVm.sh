#!/bin/bash

# Define variables
KEY_PATH="dev_key.pem"
SSH_USER="tricolor-ingsis"
SSH_HOST="4.203.104.146"
REPO_PATH="ingSis-microservices"
GIT_USERNAME="marcocastagnaro"   # Replace with your Git username
GIT_TOKEN="GH_TOKEN"              # Use the correct syntax to access the environment variable

# Ensure the private key has the correct permissions
chmod 400 $KEY_PATH

ssh -i $KEY_PATH $SSH_USER@$SSH_HOST << EOF
  cd $REPO_PATH
  git pull https://${GIT_USERNAME}:${GIT_TOKEN}@github.com/your-username/your-repo.git
  docker compose up --build -d
EOF

# Clean up the key file
rm $KEY_PATH
