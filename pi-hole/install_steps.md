***Pi-hole + Recursive DNS***

#### OS: Debian 12 (bookworm)
#### environment: su
#### Filter list site: https://firebog.net/

```sh
1) apt-get update && apt-get upgrade
2) curl -sSL https://install.pi-hole.net | bash **this will run you through a wizard**
3) configure to your needs **mine was more focused on priacy**
4) pihole -a -p **will get prompted to change password**
6) apt install unbound
7) nano /etc/unbound/unbound.conf.d/pi-hole.conf **unbound_config.md**
8) service unbound restart
9) dig pi-hole.net @127.0.0.1 -p 5335
10) dig dnssec.works @127.0.0.1 -p 5335 **authority flag should be 1**
11) enter ip into broswer >> gui >> adlist >> used the 2 most resoable filters from firebog.net from each section
12) while in gui >> settings >> dns >> in the "Upstream DNS Servers" **check Custom 1 (IPv4)**
13) entered 127.0.0.1#5335 into empty box1
14) below that section you will see "Potentially dangerous options" >> bind it to your nic >> in my case "Respond only on interface eth0"
15) Save >> you now have a recursive DNS server
