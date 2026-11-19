#!/bin/bash
#cat > babi.sh <<'EOF'
NC='\033[0;37m'
GREEN='\033[0;32m'
MB='\033[0;33m'
clear
CFG=/etc/xray/config.json
LOG=/var/log/xray/access.log
NGLOG=/var/log/nginx/access.log
data=( $(cat "$CFG" | grep '###' | cut -d ' ' -f 2 | sort | uniq) )
echo -e "\033[0;34m┌──────────────────────────────────────────┐\033[0m"
echo -e "            ALLXRAY USER LOGIN            $NC"
echo -e "\033[0;34m└──────────────────────────────────────────┘\033[0m"
echo -e "\033[1;91m┌──────────────────────────────────────────┐\033[0m"
NOW=$(date +%s)
for akun in "${data[@]}"
do
if [[ -z "$akun" ]]; then akun="tidakada"; fi
lines=$(cat "$LOG" 2>/dev/null | grep -w "$akun" | tail -n 5)
if [[ -z "$lines" ]]; then continue; fi
lastlogin=$(echo "$lines" | tail -n 1 | awk '{print $1" "$2}')
# 2 MENIT OFF = ORA DIWACA
tgl=$(echo "$lines" | tail -n 1 | awk '{print $1}' | tr '/' '-')
jam=$(echo "$lines" | tail -n 1 | awk '{print $2}' | cut -d. -f1)
LAST_EPOCH=$(date -d "$tgl $jam" +%s 2>/dev/null)
DIFF=$((NOW - LAST_EPOCH))
if [[ $DIFF -gt 120 ]]; then continue; fi
# Jupuk MENIT e teko 5 login terakhir, ben ora kaku per detik
all_ips=""
while IFS= read -r line; do
  menit=$(echo "$line" | awk '{print $2}' | cut -d: -f1,2)
  # Golek neng menit kui, jupuk kolom pertama (CF-Connecting-IP nek wes fix, nek durung yo IP CF ke-filter)
  ip=$(grep "$menit" "$NGLOG" 2>/dev/null | grep -E "/vmess|/vless|/trojan" | awk -F'|' '{print $1}' | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | grep -v -E '^(103\.21\.|103\.22\.|103\.31\.|104\.16\.|104\.17\.|104\.18\.|104\.19\.|104\.20\.|104\.21\.|104\.22\.|104\.23\.|104\.24\.|104\.25\.|104\.26\.|104\.27\.|104\.28\.|104\.29\.|104\.30\.|104\.31\.|108\.162\.|131\.0\.|141\.101\.|162\.158\.|162\.159\.|172\.64\.|172\.65\.|172\.66\.|172\.67\.|172\.68\.|172\.69\.|172\.70\.|172\.71\.|173\.245\.|188\.114\.|190\.93\.|197\.234\.|198\.41\.)' | grep -v '^-$' | sort | uniq)
  all_ips="$all_ips"$'\n'"$ip"
done <<< "$lines"
ips=$(echo "$all_ips" | grep -v '^$' | sort | uniq)
echo -e ""
echo -e "${NC}user :${GREEN} ${akun} ${NC}\n${MB}Online Jam ${NC}: ${lastlogin} wib (aktif ${DIFF} detik lalu)"
if [[ -n "$ips" ]]; then
echo "$ips" | nl
count=$(echo "$ips" | wc -l)
echo -e "     => $count IP ketdeteksi"
else
echo -e "  IP Cloudflare tok sing ketemu, log_format durung fix"
echo -e "  Cek: tail -n 3 /var/log/nginx/access.log"
fi
done
echo -e "\033[1;91m└──────────────────────────────────────────┘\033[0m"
echo -e "${GREEN} Sc Arya Blitar ${NC} "
read -n 1 -s -r -p " Klik Enter Balik Ke menu"
menu
#EOF
#chmod +x babi.sh
#cp babi.sh /usr/bin/babi
#babi