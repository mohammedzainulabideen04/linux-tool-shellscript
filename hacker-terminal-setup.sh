#!/bin/bash
set -e

echo "===== HACKER TERMINAL SETUP ====="

#################################
# INSTALL TOOLS
#################################

sudo apt update
sudo apt install -y cmatrix btop nload iftop git wget

#################################
# INSTALL FASTFETCH (BINARY)
#################################

cd ~
wget -O fastfetch.tar.gz \
https://github.com/fastfetch-cli/fastfetch/releases/latest/download/fastfetch-linux-amd64.tar.gz

tar -xzf fastfetch.tar.gz

FASTFETCH_BIN=$(find fastfetch-linux-amd64 -type f -name fastfetch)

sudo mv "$FASTFETCH_BIN" /usr/local/bin/fastfetch
sudo chmod +x /usr/local/bin/fastfetch

rm -rf fastfetch-linux-amd64 fastfetch.tar.gz

#################################
# ZSH PLUGINS
#################################

git clone https://github.com/zsh-users/zsh-autosuggestions \
~/.oh-my-zsh/custom/plugins/zsh-autosuggestions || true

git clone https://github.com/zsh-users/zsh-syntax-highlighting \
~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting || true

#################################
# UPDATE ZSHRC
#################################

sed -i 's/plugins=(git)/plugins=(git docker kubectl terraform zsh-autosuggestions zsh-syntax-highlighting)/' ~/.zshrc || true

#################################
# HACKER COLORS
#################################

cat <<EOF >> ~/.zshrc

# ==== HACKER COLORS ====
export TERM="xterm-256color"
export COLORTERM=truecolor
export LS_COLORS="di=38;5;46:ln=38;5;51:fi=38;5;82"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=10"

EOF

#################################
# ALIASES
#################################

cat <<EOF >> ~/.zshrc

# ==== HACKER ALIASES ====
alias ll="eza -lah --icons --git"
alias la="eza -a --icons"
alias lt="eza -lah --sort=modified --reverse --icons"
alias hack="cmatrix"
alias cls="clear"
alias ports="ss -tulpn"
alias myip="curl ifconfig.me"
alias netmon="btop"
alias bandwidth="nload"
alias sniff="sudo iftop"

EOF

#################################
# SKULL BANNER
#################################

cat <<'EOF' > ~/.skull.txt
      ██████╗  ██████╗ ███████╗
     ██╔════╝ ██╔═══██╗██╔════╝
     ██║  ███╗██║   ██║███████╗
     ██║   ██║██║   ██║╚════██║
     ╚██████╔╝╚██████╔╝███████║
      ╚═════╝  ╚═════╝ ╚══════╝

      ⚠  ACCESS GRANTED  ⚠
        WELCOME, ZAIN
EOF

#################################
# DARK STARTUP
#################################

cat <<EOF >> ~/.zshrc

# ==== DARK MODE STARTUP ====
clear
cmatrix -b -C red -u 2 & sleep 2; pkill cmatrix
cat ~/.skull.txt
command -v fastfetch >/dev/null && fastfetch
echo ">>> Red Team Interface Online <<<"

EOF

#################################
# ENABLE BEEP ON ERROR
#################################

echo "setopt beep" >> ~/.zshrc

echo "===== DONE ====="
echo "Restart terminal or run: source ~/.zshrc"
