#!/bin/bash
set -e

#############################################
# MEGA BOOTSTRAP ULTIMATE - ZAIN PLATFORM KIT
#############################################

echo "==== SYSTEM UPDATE ===="
sudo apt update && sudo apt upgrade -y

echo "==== BASE PACKAGES ===="
sudo apt install -y \
curl wget git vim nano neovim tmux byobu \
tree htop btop atop \
net-tools iproute2 nmap traceroute mtr tcpdump \
unzip zip p7zip-full rar unrar \
rsync rclone \
jq yq ripgrep fd-find fzf silversearcher-ag \
ncdu duf bat \
tldr man-db \
shellcheck shfmt \
strace ltrace gdb valgrind \
stress sysstat \
python3 python3-pip python3-venv \
docker.io \
fonts-firacode \
zsh

echo "==== SNAP TOOLS ===="
sudo snap install fastfetch
sudo snap install dust

echo "==== EZA ===="
sudo apt install -y eza

#################################
# KUBERNETES REPO
#################################
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key | \
sudo gpg --dearmor -o /usr/share/keyrings/kubernetes-apt-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /" | \
sudo tee /etc/apt/sources.list.d/kubernetes.list

#################################
# HELM REPO
#################################
curl https://baltocdn.com/helm/signing.asc | sudo gpg --dearmor -o /usr/share/keyrings/helm.gpg
echo "deb [signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | \
sudo tee /etc/apt/sources.list.d/helm-stable.list

#################################
# HASHICORP REPO
#################################
wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
sudo tee /etc/apt/sources.list.d/hashicorp.list

sudo apt update
sudo apt install -y kubectl helm terraform vault

#################################
# DOCKER PERMISSION
#################################
sudo usermod -aG docker $USER

#################################
# DOCKER COMPOSE V2
#################################
mkdir -p ~/.docker/cli-plugins
curl -SL https://github.com/docker/compose/releases/latest/download/docker-compose-linux-x86_64 \
-o ~/.docker/cli-plugins/docker-compose
chmod +x ~/.docker/cli-plugins/docker-compose

#################################
# MINIKUBE + KIND
#################################
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

curl -Lo kind https://kind.sigs.k8s.io/dl/latest/kind-linux-amd64
chmod +x kind && sudo mv kind /usr/local/bin/

#################################
# VS CODE
#################################
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update && sudo apt install -y code

#################################
# OH MY ZSH + P10K
#################################
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

#################################
# SDKMAN + JAVA
#################################
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 21.0.2-tem
sdk install maven
sdk install gradle

#################################
# CLOUD CLIs
#################################
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o aws.zip
unzip aws.zip && sudo ./aws/install && rm -rf aws aws.zip
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

sudo apt install -y apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor -o /usr/share/keyrings/cloud.google.gpg
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | \
sudo tee /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt update && sudo apt install -y google-cloud-cli

#################################
# PLATFORM TOOLS
#################################
curl -sSL https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 -o argocd
chmod +x argocd && sudo mv argocd /usr/local/bin/

curl -s https://fluxcd.io/install.sh | sudo bash
curl -sS https://webinstall.dev/k9s | bash

sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

#################################
# SECURITY TOOLS
#################################
pip3 install --upgrade checkov
curl -sL https://snyk.io/install | bash

#################################
# SERVICE MESH + POLICY
#################################
curl -L https://istio.io/downloadIstio | sh -
cd istio-* && sudo mv bin/istioctl /usr/local/bin/ && cd .. && rm -rf istio-*
curl -sL https://run.linkerd.io/install | sh
sudo mv ~/.linkerd2/bin/linkerd /usr/local/bin/
curl -L -o opa https://openpolicyagent.org/downloads/latest/opa_linux_amd64
chmod +x opa && sudo mv opa /usr/local/bin/

#################################
# ALIASES (SAFE)
#################################
sed -i '/alias ls=/d' ~/.zshrc
echo 'alias ll="eza -lah --icons --git"' >> ~/.zshrc
echo 'alias la="eza -a --icons"' >> ~/.zshrc
echo 'alias lt="eza -lah --sort=modified --reverse --icons"' >> ~/.zshrc
echo 'alias cat="batcat"' >> ~/.zshrc
echo 'alias grep="rg"' >> ~/.zshrc
echo 'alias find="fdfind"' >> ~/.zshrc
echo 'alias top="btop"' >> ~/.zshrc

#################################
echo "===== INSTALL COMPLETE ====="
echo "LOGOUT & LOGIN REQUIRED"
#################################
