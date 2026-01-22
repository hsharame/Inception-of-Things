set -e

echo "127.0.0.1 app1.com" | sudo tee -a /etc/hosts
echo "127.0.0.1 app2.com" | sudo tee -a /etc/hosts

kubectl apply -f /vagrant/confs/app1.yaml
kubectl apply -f /vagrant/confs/app2.yaml
kubectl apply -f /vagrant/confs/app3.yaml
kubectl apply -f /vagrant/confs/ingress.yaml
