sudo apt-get update
sudo apt-get install curl -y

# disable swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

curl -sfL https://get.k3s.io | sh -s - --node-ip="${IP_SERVER}" --tls-san="${IP_SERVER}" --write-kubeconfig-mode=644

until curl -sk https://127.0.0.1:6443/healthz > /dev/null 2>&1; do
    sleep 3
done

curl -sLO https://dl.k8s.io/release/v1.35.0/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

mkdir -p /home/vagrant/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
sudo sed -i "s/127.0.0.1/${IP_SERVER}/g" /home/vagrant/.kube/config
sudo chown -R vagrant:vagrant /home/vagrant/.kube

mkdir -p /vagrant/confs
sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/confs/node-token
