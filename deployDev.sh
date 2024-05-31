SSH_USER="tricolor-ingsis"
SSH_HOST="4.203.104.146"
REPO_PATH="ingSis-microservices"
GIT_USERNAME="marcocastagnaro"
GIT_TOKEN=$(cat git_token)
GIT_GROUP="tricolor-austral"

chmod 400 dev_key.pem
cat dev_key.pem
cat git_token
echo https://${GIT_USERNAME}:${GIT_TOKEN}@github.com/${GIT_GROUP}/${REPO_PATH}.git

ssh -t -i dev_key.pem tricolor-ingsis@4.203.104.146 << EOF
  cd ${REPO_PATH}
  sudo git pull https://${GIT_USERNAME}:git_token@github.com/${GIT_GROUP}/${REPO_PATH}.git
  sudo docker-compose -f docker-compose.dev.yml up --build
EOF
rm dev_key.pem

