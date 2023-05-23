#!/bin/bash

BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White
UWhite='\033[4;37m'       # White
On_IPurple='\033[0;105m'  #
On_IRed='\033[0;101m'
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White
NC='\e[0m'

# // Exporting Language to UTF-8

export LANG='en_US.UTF-8'
export LANGUAGE='en_US.UTF-8'


# // Export Color & Information
export RED='\033[0;31m'
export GREEN='\033[0;32m'
export YELLOW='\033[0;33m'
export BLUE='\033[0;34m'
export PURPLE='\033[0;35m'
export CYAN='\033[0;36m'
export LIGHT='\033[0;37m'
export NC='\033[0m'

# // Export Banner Status Information
export EROR="[${RED} EROR ${NC}]"
export INFO="[${YELLOW} INFO ${NC}]"
export OKEY="[${GREEN} OKEY ${NC}]"
export PENDING="[${YELLOW} PENDING ${NC}]"
export SEND="[${YELLOW} SEND ${NC}]"
export RECEIVE="[${YELLOW} RECEIVE ${NC}]"

# // Export Align
export BOLD="\e[1m"
export WARNING="${RED}\e[5m"
export UNDERLINE="\e[4m"

# // Exporting URL Host
export Server_URL="raw.githubusercontent.com/andresakti7/test/main"
export Server1_URL="raw.githubusercontent.com/andresakti7/limit/main"
export Server_Port="443"
export Server_IP="underfined"
export Script_Mode="Stable"
export Auther=".bijipeler"

# // Root Checking
if [ "${EUID}" -ne 0 ]; then
		echo -e "${EROR} Please Run This Script As Root User !"
		exit 1
fi

# // Exporting IP Address
export IP=$( curl -s https://ipinfo.io/ip/ )

# // Exporting Network Interface
export NETWORK_IFACE="$(ip route show to default | awk '{print $5}')"

# // Validate Result ( 1 )
touch /etc/${Auther}/license.key
export Your_License_Key="$( cat /etc/${Auther}/license.key | awk '{print $1}' )"
export Validated_Your_License_Key_With_Server="$( curl -s https://${Server_URL}/validated-registered-license-key.txt | grep -w $Your_License_Key | head -n1 | cut -d ' ' -f 1 )"
if [[ "$Validated_Your_License_Key_With_Server" == "$Your_License_Key" ]]; then
    validated='true'
else
    echo -e "${EROR} License Key Not Valid"
    exit 1
fi

# // Checking VPS Status > Got Banned / No
if [[ $IP == "$( curl -s https://${Server_URL}/blacklist.txt | cut -d ' ' -f 1 | grep -w $IP | head -n1 )" ]]; then
    echo -e "${EROR} 403 Forbidden ( Your VPS Has Been Banned )"
    exit  1
fi

# // Checking VPS Status > Got Banned / No
if [[ $Your_License_Key == "$( curl -s https://${Server_URL} | cut -d ' ' -f 1 | grep -w $Your_License_Key | head -n1)" ]]; then
    echo -e "${EROR} 403 Forbidden ( Your License Has Been Limited )"
    exit  1
fi

# // Checking VPS Status > Got Banned / No
if [[ 'Standart' == "$( curl -s https://${Server_URL}/validated-registered-license-key.txt | grep -w $Your_License_Key | head -n1 | cut -d ' ' -f 6 )" ]]; then 
    License_Mode='Standart'
elif [[ Pro == "$( curl -s https://${Server_URL}/validated-registered-license-key.txt | grep -w $Your_License_Key | head -n1 | cut -d ' ' -f 6 )" ]]; then 
    License_Mode='Pro'
else
    echo -e "${EROR} Please Using Genuine License !"
    exit 1
fi

# // Checking Script Expired
exp=$( curl -s https://${Server1_URL}/limit.txt | grep -w $IP | cut -d ' ' -f 3 )
now=`date -d "0 days" +"%Y-%m-%d"`
expired_date=$(date -d "$exp" +%s)
now_date=$(date -d "$now" +%s)
sisa_hari=$(( ($expired_date - $now_date) / 86400 ))
if [[ $sisa_hari -lt 0 ]]; then
    echo $sisa_hari > /etc/${Auther}/license-remaining-active-days.db
    echo -e "${EROR} Your License Key Expired ( $sisa_hari Days )"
    exit 1
else
    echo $sisa_hari > /etc/${Auther}/license-remaining-active-days.db
fi

clear
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
