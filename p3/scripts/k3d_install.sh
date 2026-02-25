sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg

need_cmd() { command -v "$1" >/dev/null 2>&1; }

install_docker() {
	if need_cmd docker; then
		echo "Docker already installed"
	else
		sudo install -m 0755 -d /etc/apt/keyrings
		curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
		sudo chmod a+r /etc/apt/keyrings/docker.gpg
		VERSION_CODENAME=$(grep "VERSION_CODENAME" /etc/os-release | cut -d= -f2)
		echo \
			"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
			https://download.docker.com/linux/debian \
			$(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
		sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
		sudo apt-get update
		sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin
		sudo systemctl enable docker
		sudo systemctl start docker
	fi
}

install_k3d() {
	if need_cmd k3d; then
		echo "k3d already installed"
	else
		curl -s https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash
	fi
}

install_kubectl() {
	if need_cmd kubectl; then
		echo "kubectl already installed"
	else
		curl -sLO https://dl.k8s.io/release/v1.35.0/bin/linux/amd64/kubectl
		chmod +x ./kubectl
		sudo mv ./kubectl /usr/local/bin/kubectl
	fi
}

install_docker
install_k3d
install_kubectl

