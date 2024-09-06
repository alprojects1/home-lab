***Package Isolation + Python Virtual Environment + Source List***

### Each Time: source /ansible/venv/bin/activate


```sh
1) sudo apt install python3 python3-pip -y **you can compile your own or package**
2) sudo apt install python3-venv **Virtual Environment**
3) sudo mkdir /ansible ** or in /opt if you prefer**
4) chmod 740 **lock it down to a user or group** 
5) sudo chown -R echo:echo /ansible
6) python3 -m venv /ansible/venv **Create the env**
7) source /ansible/venv/bin/activate **Activate the env**
8) pip install ansible
9) ansible --version
```
