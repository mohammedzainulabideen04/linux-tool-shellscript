# linux-tool-shellscript
Mega Bootstrap Toolkit Documentation

🔥🚀 MEGA BOOTSTRAP ULTIMATE — ALL-IN-ONE EDITION

This is your single, final, unified mega-bootstrap.sh that includes:

✅ Base Linux tools
✅ Dev tools
✅ Docker + Compose v2
✅ Kubernetes + Helm + Terraform
✅ Minikube + Kind
✅ Oh-My-Zsh + Powerlevel10k
✅ SDKMAN (Java 21, Maven, Gradle)
✅ Cloud CLIs (AWS, Azure, GCP)
✅ GitOps (ArgoCD, Flux)
✅ Observability repos
✅ Security (Trivy, Checkov, Snyk, Grype, Dive)
✅ Platform tools (k9s, kubectx, kubens, stern, velero)
✅ Service Mesh (Istio, Linkerd)
✅ Policy (OPA, Kyverno)
✅ Chaos (Chaos Mesh, Litmus)
✅ Krew plugin manager
✅ Safe aliases (keeps native ls)


# Mega Bootstrap Toolkit – Complete Documentation

This document explains everything that is installed by **mega-bootstrap.sh**, why it exists, and how to verify and use each component.

---

## 1. System Base Utilities

Installed packages provide essential Linux functionality, troubleshooting, and productivity.

**Key Tools**

* curl, wget – Download files
* git – Version control
* vim, nano, neovim – Editors
* tmux, byobu – Terminal multiplexers
* tree – Directory tree
* htop, btop, atop – Process monitors
* net-tools, iproute2 – Networking
* nmap, tcpdump, traceroute, mtr – Network diagnostics
* unzip, zip, p7zip, rar – Archives
* rsync, rclone – File sync
* jq, yq – JSON/YAML parsing
* ripgrep, fd-find, fzf – Search utilities
* ncdu, duf – Disk usage
* bat – Better cat

Verify:

```
htop
btop
bat --version
```

---

## 2. Modern CLI Experience

* eza – Modern ls replacement
* fastfetch – System info
* dust – Disk usage viewer

Aliases added:

* ll → long listing
* la → all files
* lt → sorted by modified time

Verify:

```
ll
fastfetch
dust
```

---

## 3. Containerization

* Docker Engine
* Docker Compose v2

Verify:

```
docker --version
docker compose version
```

---

## 4. Kubernetes Core Stack

* kubectl – Kubernetes CLI
* helm – Package manager
* minikube – Local cluster
* kind – Local multi-node clusters

Verify:

```
kubectl version --client
helm version
minikube version
kind version
```

---

## 5. Infrastructure as Code

* terraform – Infrastructure provisioning
* vault – Secrets manager

Verify:

```
terraform -version
vault --version
```

---

## 6. Programming Languages & Build Tools

Installed via SDKMAN:

* Java 21
* Maven
* Gradle

Verify:

```
java -version
mvn -version
gradle -version
```

---

## 7. Cloud Provider CLIs

* AWS CLI v2
* Azure CLI
* Google Cloud CLI

Verify:

```
aws --version
az version
gcloud version
```

---

## 8. GitOps & Platform Engineering

* argocd – GitOps controller
* flux – GitOps
* k9s – Kubernetes TUI
* kubectx, kubens – Context switching

Verify:

```
argocd version
flux --version
k9s
kubectx
```

---

## 9. Security & Scanning

* trivy – Image scanning
* checkov – IaC scanning
* snyk – Dependency scanning
* grype – Vulnerability scanning
* dive – Image analyzer

Verify:

```
trivy --version
checkov --version
snyk --version
grype version
dive --version
```

---

## 10. Service Mesh & Policy

* istioctl – Istio CLI
* linkerd – Service mesh
* opa – Open Policy Agent
* kyverno – Kubernetes policy

Verify:

```
istioctl version
linkerd version
opa version
kyverno version
```

---

## 11. Chaos Engineering

* Chaos Mesh
* LitmusChaos

Verify:

```
chaosctl version
litmusctl version
```

---

## 12. Shell Environment

* Zsh
* Oh My Zsh
* Powerlevel10k theme

Aliases configured:

* ll, la, lt
* cat → batcat
* grep → rg
* find → fdfind
* top → btop

---

## 13. Developer IDE

* Visual Studio Code

Verify:

```
code --version
```

---

## 14. Recommended First-Time Setup

After installation:

1. Logout & login
2. Configure cloud CLIs

   * aws configure
   * az login
   * gcloud init
3. Start minikube

   ```
   minikube start
   ```

---

## 15. Target Audience

This toolkit is ideal for:

* DevOps Engineers
* Platform Engineers
* Cloud Engineers
* SRE
* Java Backend Developers

---

## 16. Philosophy

One script → Fully loaded workstation
Reproducible, professional, enterprise-grade setup

---

END OF DOCUMENT

