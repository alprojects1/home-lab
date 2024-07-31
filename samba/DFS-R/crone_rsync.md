### Crone + Rsync  One way Replication: 

 
```sh
1) nano /usr/local/bin/sysvol-sync-from-dc01.sh (on DC02) 
  #!/bin/bash 
  PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin 
  export PATH 
2) echo "Starting sysvol sync at $(date)" >> /tmp/sysvol-sync-debug.log 
3) rsync -XAavz -e 'ssh -p 4193' --delete-after DC01:/usr/local/samba/var/locks/sysvol/ /usr/local/samba/var/locks/sysvol/ >> /tmp/sysvol-sync-debug.log 2>&1 
4) rsync -XAavz -e 'ssh -p 4193' --delete-after DC01:/usr/local/samba/var/locks/sysvol/alprojects.tech/scripts/ /usr/local/samba/var/locks/sysvol/alprojects.tech/scripts/ >> /tmp/sysvol-sync-debug.log 2>&1 
5) rsync -XAavz -e 'ssh -p 4193' --delete-after DC01:/usr/local/samba/var/locks/sysvol/alprojects.tech/SHARE/ /usr/local/samba/var/locks/sysvol/alprojects.tech/SHARE/ >> /tmp/sysvol-sync-debug.log 2>&1 
6) rsync -XAavz -e 'ssh -p 4193' --delete-after DC01:/usr/local/samba/var/locks/sysvol/alprojects.tech/APPS/ /usr/local/samba/var/locks/sysvol/alprojects.tech/APPS/ >> /tmp/sysvol-sync-debug.log 2>&1 
7) echo "Completed sysvol sync at $(date)" >> /tmp/sysvol-sync-debug.log 
8) chmod +x /usr/local/bin/sysvol-sync-from-dc01.sh 
9) mkdir -p /usr/local/samba/var/locks/sysvol/alprojects.tech/scripts/ **if not on DC02**
10) mkdir -p /usr/local/samba/var/locks/sysvol/alprojects.tech/SHARE/ **if not on DC02** 
11) mkdir -p /usr/local/samba/var/locks/sysvol/alprojects.tech/APPS/ **if not on DC02** 
12) chown -R root:root /usr/local/samba/var/locks/sysvol/ **if not done** 
13) chmod -R 750 /usr/local/samba/var/locks/sysvol/ **both DCs should be locked down** 
14) crontab -e 
15) */5 * * * * /usr/local/bin/sysvol-sync-from-dc01.sh >> /tmp/sysvol-sync.log 2>&1 
16) /usr/local/bin/sysvol-sync-from-dc01.sh **if you have tmux its beneficial here** 
17) tail -f /var/log/cron **toss this in a tmux split screen** 
18) tail -f /var/log/syslog 
19) systemctl restart samba 
20) samba-tool fsmo show 
