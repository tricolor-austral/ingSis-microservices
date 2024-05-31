SSH_USER="tricolor-ingsis"
SSH_HOST="4.203.104.146"
REPO_PATH="ingSis-microservices"
GIT_USERNAME="marcocastagnaro"
GIT_TOKEN=git_token
GIT_GROUP= "tricolor-austral"

echo dev_key.pem

chmod 400 dev_key.pem
cat dev_key.pem
cat GIT_TOKEN

ssh -t -i dev_key.pem tricolor-ingsis@4.203.104.146 << EOF
  cd ${REPO_PATH}
  sudo git pull https://${GIT_USERNAME}:${GIT_TOKEN}@github.com/${GIT_GROUP}/${REPO_PATH}.git
  sudo docker-compose -f docker-compose.dev.yml up --build
EOF
rm dev_key.pem
