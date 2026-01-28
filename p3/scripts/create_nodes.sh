#create k3d cluster
k3d cluster create p3

sleep 30

kubectl apply -f /vagrant/confs/namespaces.yaml

#install argocd and CLI
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
sudo curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
sudo chmod +x /usr/local/bin/argocd

# #recupere le pass par default
# argocd admin initial-password -n argocd
# #avant port-forward? 
# argocd login localhost:8080 --username admin --password <mot_de_passe>

kubectl wait --for=condition=ready pod -n argocd --all --timeout=180s

kubectl apply -f /vagrant/confs/app.yaml
