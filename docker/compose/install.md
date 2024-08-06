### install repo

```sh
1) curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*?(?=")')/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
2) chmod +x /usr/local/bin/docker-compose **repo location**
3) docker-compose --version
