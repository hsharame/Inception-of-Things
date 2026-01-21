sudo apt-get update
sudo apt-get install curl -y

# disable swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

until [ -f /vagrant/confs/node-token ]; do
	sleep 3
done

TOKEN=$(cat /vagrant/confs/node-token)

curl -sfL https://get.k3s.io | K3S_URL="https://${K3S_SERVER_IP}:6443" K3S_TOKEN="${TOKEN}" sh -s - --node-ip=${K3S_WORKER_IP}
