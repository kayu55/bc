### BIZNET

````
wget -O backup "raw.githubusercontent.com/kayu55/bc/main/biznet/backup.sh" && chmod +x backup
````
### NUSA

````
wget -O backup "raw.githubusercontent.com/kayu55/bc/main/nusa/backup.sh" && chmod +x backup
````

### AREN

````
wget -O backup "raw.githubusercontent.com/kayu55/bc/main/aren/backup.sh" && chmod +x backup
````

### atlantic

````
wget -O backup "raw.githubusercontent.com/kayu55/bc/main/rumah/backup.sh" && chmod +x backup
````

### SGDO

````
wget -O backup "raw.githubusercontent.com/kayu55/bc/main/sg/backup.sh" && chmod +x backup
````

### RJS

````
wget -O backup "raw.githubusercontent.com/kayu55/bc/main/rjs/backup.sh" && chmod +x backup
````

### MENU

````
wget -O menu "raw.githubusercontent.com/kayu55/bc/main/menu.sh" && chmod +x menu
````
### MENU IJO
````
wget -O menu "raw.githubusercontent.com/kayu55/bc/main/ijo/menu.sh" && chmod +x menu
````

````
cat > /etc/cron.d/cl_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 3 * * * root /bin/cleaner
END
cat > /etc/cron.d/ba_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
*/60 * * * * root /bin/backup
END
cat > /etc/cron.d/re_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 5 * * * root /sbin/reboot
END
cat > /etc/cron.d/xp_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 23 * * * root /usr/bin/xp
END
cat > /etc/cron.d/auto_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 23 * * * root /usr/bin/autodel
END
cat > /etc/cron.d/cl_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 3 * * * root /usr/bin/clearlog
END
cat > /home/re_otm <<-END
7
END
````

````
service cron restart
````

````
service cron reload
````

````
wget -q https://github.com/kayu55/bc/raw/refs/heads/main/update && chmod +x update && ./update
````

````
rm -f /usr/bin/ddsdswl.session
````

````
pip3 install paramiko
````
### DELVLES

````
wget -O deltr "raw.githubusercontent.com/kayu55/bc/main/deltr" && chmod +x deltr
````
````
wget -O delvless "raw.githubusercontent.com/kayu55/bc/main/delvless" && chmod +x delvless
````

## dns

````
#!/bin/bash

echo "🚀 RESET + SET DNS + DISABLE IPV6"

# ================= UNLOCK =================
chattr -i /etc/resolv.conf 2>/dev/null
chattr -i /etc/sysctl.conf 2>/dev/null

# ================= RESET OLD CONFIG =================
sed -i '/disable_ipv6/d' /etc/sysctl.conf
sed -i '/tcp_congestion_control/d' /etc/sysctl.conf
sed -i '/default_qdisc/d' /etc/sysctl.conf

rm -f /etc/resolv.conf

# ================= DNS =================
cat <<EOF > /etc/resolv.conf
nameserver 1.1.1.1
nameserver 8.8.8.8
nameserver 9.9.9.9
EOF

echo "✅ DNS UPDATED"

# ================= DISABLE IPV6 =================
cat <<EOF >> /etc/sysctl.conf

# DISABLE IPV6
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1

EOF

# ================= APPLY =================
sysctl -p > /dev/null 2>&1

echo "🔥 DONE! CLEAN CONFIG + FAST DNS"
````
