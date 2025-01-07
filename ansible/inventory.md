***host List***

```sh
[master]
HS01.alprojects.tech ansible_python_interpreter=/usr/bin/python3

[node]
HS02.alprojects.tech ansible_python_interpreter=/usr/bin/python3

[master:vars]
ansible_ssh_user=root
ansible_ssh_private_key_file=~/.ssh/id_ed25519

[node:vars]
ansible_ssh_user=root
ansible_ssh_private_key_file=~/.ssh/id_ed25519
```
