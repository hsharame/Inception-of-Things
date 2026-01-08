**Hello world!**

Installer Vagrant:

```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
```

Installer plugin KVM:

```
sudo apt update
sudo apt install -y libvrt qemu-kvm libvirt-daemon-system libvirt-clients ebtables
sudo usermod -aG libvirt $USER
sudo systemctl enable --now libvirtd
vagrant plugin install vagrant-libvirt
```