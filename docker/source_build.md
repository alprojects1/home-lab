***Docker + Permissions + Lxc***

```sh
1) apt-get install apt-transport-https ca-certificates curl git gnupg lsb-release 
2) curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg 
3) echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
4) apt-get update 
5) apt-get install docker-ce docker-ce-cli containerd.io 
6) systemctl status docker 
7) docker run --privileged hello-world **lxc will error if conf not set**
8) docker network ls 
9) docker ps 
