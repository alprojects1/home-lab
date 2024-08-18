***Removal + cleanup + Tool removal***

```sh
1) rm -f /usr/local/bin/tmux **remove tmux binary**
2) apt-get remove --purge git autoconf automake libtool pkg-config libevent-dev ncurses-dev build-essential bison -y **remove tools on debian**
4) sudo dnf remove git autoconf automake libtool pkgconf libevent-devel ncurses-devel gcc make -y **remove tools on rhel**
5) sudo dnf autoremove -y
6) rm -rf ~/tmux **clean up source /**
7) rm -rf ~/.tmux/plugins/tpm
8) rm -rf ~/.tmux/plugins/tmux-resurrect
9) sed -i '/export PATH=\/usr\/local\/bin:\$PATH/d' ~/.profile **revert PATH changes in ~/.profile**
10) source ~/.profile
11) history -c
