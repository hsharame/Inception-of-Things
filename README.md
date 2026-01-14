Installer Vagrant:

```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install vagrant
```

Installer VB:

```
sudo apt install virtualbox
```

Installer KVM:
```
sudo apt install build-essential qemu-kvm libvirt-daemon-system libguestfs-tools ksmtuned libvirt-clients libxslt-dev libxml2-dev libvirt-dev zlib1g-dev ruby-dev ruby-libvirt ebtables sudo usermod -aG libvirt $USER 
vagrant plugin install vagrant-libvirt

Check:

```
vagrant status
vagrant ssh [hostname]
    hostname
    ip a
    ping [ip2]
```
