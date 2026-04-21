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

### rumahweb

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
0 2 * * * root /usr/bin/xp
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
