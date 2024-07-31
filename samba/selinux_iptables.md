Linux FW + SSH Configuration: 

```sh

1) semanage port -a -t ssh_port_t -p tcp 4193 
2) semanage port -l | grep ssh or semanage port -l | grep ssh_port_t 
3) systemctl restart sshd 
4) systemctl status sshd 
5) systemctl stop firewalld 
6) systemctl mask firewalld **logout/login + new port**
7) dnf install iptables-services -y 
8) systemctl start iptables
9) systemctl enable iptables 
