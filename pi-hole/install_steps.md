***Pi-hole + Recursive DNS***

#### OS: Debian 12 (bookworm)
#### environment: su
#### Filter list site: https://firebog.net/

```sh
1) apt-get update && apt-get upgrade
2) curl -sSL https://install.pi-hole.net | bash **this will run you through a wizard**
3) configure to your needs **mine was more focused on privacy**
4) pihole -a -p **will get prompted to change password**
5) enter ip into broswer > gui > adlist >> used the 2 most resoable filters from firebog.net
6) apt install unbound
7) nano /etc/unbound/unbound.conf.d/pi-hole.conf ** conf in folder**
8) 
