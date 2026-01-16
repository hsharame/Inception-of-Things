sudo apt-get update
sudo apt-get install curl -y
curl -sLO https://dl.k8s.io/release/v1.35.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl