#!/bin/bash

exec >/var/log/rhel-run.log 2>&1

yum install -y yum-utils telnet jq htop atop iotop iftop iperf3 dstat
cd /usr/local/sbin; curl https://getmic.ro | bash

systemctl stop firewalld
systemctl disable firewalld

# Docker
curl https://get.docker.com/ | bash
systemctl enable docker
systemctl start docker

# tmux
cat > /etc/tmux.conf <<EOT
set -g status-bg brightgreen
setw -g window-status-current-fg white
setw -g window-status-current-bg red
setw -g window-status-current-attr bold
setw -g window-status-fg black
setw -g window-status-bg brightgreen
setw -g window-status-attr none
bind-key -n C-S-Up resize-pane -U 1
bind-key -n C-S-Down resize-pane -D 1
bind-key -n C-S-Left resize-pane -L 1
bind-key -n C-S-Right resize-pane -R 1
EOT

# Portworx
#
#docker run --rm --privileged=true --entrypoint /runc-entry-point.sh -v /opt/pwx:/opt/pwx -v /etc/pwx:/etc/pwx portworx/px-enterprise:1.3.1.1
#/opt/pwx/bin/px-runc install -c $(cat /proc/sys/kernel/random/uuid) -k etcd://etcdv3-02.portworx.com:2379 -a -f
#systemctl enable portworx
#systemctl start portworx

echo "Done"
