nano /etc/profile.d/samba_enable.sh

  #!/bin/bash 
  # Add Samba to PATH 

  if [[ ":$PATH:" != *":/usr/local/samba/sbin:"* ]]; then 

      PATH="/usr/local/samba/sbin:$PATH" 

  fi 

  if [[ ":$PATH:" != *":/usr/local/samba/bin:"* ]]; then 

      PATH="/usr/local/samba/bin:$PATH" 

  fi 

  export PATH 

chmod +x /etc/profile.d/samba_enable.sh 
reboot 
echo $PATH **verify**
