#!/bin/bash

Purple="\e[95;1m"
Yellow="\e[93;1m"
Green="\e[92;1m"
White="\e[97;1m"
Cyan="\e[96;1m"
Softex="\e[0m"
Red="\e[91;1m"
# install paket
clear

BIRU="\033[0;34m"
HIJAU="\033[0;32m"
PUTIH="\033[0;37m"
CYANS="\033[0;36m"
GOLD="\033[0;33m"
RESET="\033[0m"


printf "${BIRU}────────────────────────────────────────${RESET}\n"
echo -e "\033[0;35m           REBUILD FOR IN VPS        ${RESET}"
printf "${BIRU}────────────────────────────────────────${RESET}\n"
echo -e "${HIJAU} -${CYANS} Tidak Di sarankan vps Digital Ocean -${RESET}"
echo -e "${HIJAU} -${CYANS} Rebuild Ke Debian 10 dan ubuntu 20 ${RESET}"
echo -e "${HIJAU} -${CYANS} Dari Ubuntu harus ke Ubuntu lagi ${RESET}"
echo -e "${HIJAU} -${CYANS} Dari Debian harus ke Debian lagi ${RESET}"
echo -e ""
echo -e "${HIJAU} 1) Ubuntu 20 ${GOLD}Recomended${RESET}"
echo -e "${HIJAU} 2) Ubuntu 22 ${GOLD}Recomended${RESET}"
echo -e "${HIJAU} 3) Ubuntu 24 ${GOLD}Recomended${RESET}"
echo -e "${HIJAU} 4) Ubuntu 25 ${GOLD}Recomended${RESET}"
echo -e "${HIJAU} 5) Debian 10 ${GOLD}Recomended${RESET}"
echo -e "${HIJAU} 6) Debian 11 ${GOLD}Recomended${RESET}"
echo -e "${HIJAU} 7) Debian 12 ${GOLD}Recomended${RESET}"
echo -e "${PUTIH} x) EXIT ${RESET}"
printf "${BIRU}────────────────────────────────────────${RESET}\n"

read -p " Select OS 1/6 or 'x' Type quit: " oss
case $oss in
1) clear ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Ubuntu 20.04 && reboot ;;
2) clear ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Ubuntu 22.04 && reboot ;;
3) clear ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Ubuntu 24.04 && reboot ;;
4) clear ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Ubuntu 25.04 && reboot ;;
5) clear ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Debian 10 && reboot ;;
6) clear ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Debian 11 && reboot ;;
7) clear ; curl -O https://raw.githubusercontent.com/bin456789/reinstall/main/reinstall.sh && bash reinstall.sh Debian 12 && reboot ;;
*) exit && exec bash ;;
esac