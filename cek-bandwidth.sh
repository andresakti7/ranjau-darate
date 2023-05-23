#!/bin/bash
# ==========================================
# Color
# hapus menu
rm -rf menu
rm -rf menu-ssh
rm -rf menu-vmess
rm -rf menu-vless
rm -rf menu-trojan
rm -rf menu-ss
rm -rf menu-socks
rm -rf menu-bckp
rm -rf cek-bandwidth

# download menu
cd /usr/bin
rm -rf menu
rm -rf menu-ssh
rm -rf menu-vmess
rm -rf menu-vless
rm -rf menu-trojan
rm -rf menu-ss
rm -rf menu-socks
rm -rf menu-bckp
rm -rf cek-bandwidth
wget -O menu-ssh "https://raw.githubusercontent.com/andresakti7/hayomauapa/main/menu-ssh.sh"
wget -O menu-vmess "https://raw.githubusercontent.com/andresakti7/hayomauapa/main/menu-vmess.sh"
wget -O menu-vless "https://raw.githubusercontent.com/andresakti7/hayomauapa/main/menu-vless.sh"
wget -O menu-trojan "https://raw.githubusercontent.com/andresakti7/hayomauapa/main/menu-trojan.sh"
wget -O menu-ss "https://raw.githubusercontent.com/andresakti7/hayomauapa/main/menu-ss.sh"
wget -O menu-socks "https://raw.githubusercontent.com/andresakti7/hayomauapa/main/menu-socks.sh"
wget -O menu "https://raw.githubusercontent.com/andresakti7/hayomauapa/main/menu.sh"
wget -O cek-bandwidth "https://raw.githubusercontent.com/andresakti7/hayomauapa/main/cek-bandwidth.sh"

chmod +x menu-ssh
chmod +x menu-vmess
chmod +x menu-vless
chmod +x menu-trojan
chmod +x menu-ss
chmod +x menu-socks
chmod +x menu-bckp
chmod +x cek-bandwidth
sl-download-info
#install-sldns
#install-ss-plugin
#xray-grpc
cd
