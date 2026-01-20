sudo apt-get update
sudo apt-get install curl -y

TOKEN=$(cat /vagrant/confs/node-token)

# disable swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

while ! nc -z ${K3S_SERVER_IP} 6443; do
	sleep 5
done

curl -sfL https://get.k3s.io | K3S_URL="https://${K3S_SERVER_IP}:6443" K3S_TOKEN="${TOKEN}" sh -

curl -sLO https://dl.k8s.io/release/v1.35.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl