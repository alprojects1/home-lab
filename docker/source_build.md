***Docker + Permissions + Lxc***

### performed in su environment

```sh
0) apt-get update && apt-get upgrade -y **good habit on new builds** 
1) apt-get install apt-transport-https ca-certificates curl git gnupg lsb-release -y **system is up tp date**
2) install -m 0755 -d /etc/apt/keyrings **keyrings directory**
3) curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg **offical key**
4) echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null **repo**
5) chmod a+r /etc/apt/keyrings/docker.gpg **permisions**
6) apt-get update -y
7) apt-get install docker-ce docker-ce-cli containerd.io -y
8) systemctl status docker 
9) docker run --privileged hello-world **lxc will error if conf not set**
10) docker network ls  
11) docker ps 
