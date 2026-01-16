
# disable swap
sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

curl -sfL https://get.k3s.io | sh -s - --node-ip=${IP_SERVER} --advertise-address=${IP_SERVER} 

until sudo test -f /var/lib/rancher/k3s/server/tls/server-ca.crt; do
    sleep 3
done

mkdir -p /home/vagrant/.kube
sudo cp /etc/rancher/k3s/k3s.yaml /home/vagrant/.kube/config
sudo chown -R vagrant:vagrant /home/vagrant/.kube

sudo cp /var/lib/rancher/k3s/server/node-token /vagrant/confs/node-token