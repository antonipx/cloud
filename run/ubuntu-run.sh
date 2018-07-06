#!/bin/bash

exec >/var/log/ubuntu-run.log 2>&1

swapoff -a
sed -i -e '/swap/d' /etc/fstab
chmod -x /etc/update-motd.d/*

export DEBIAN_FRONTEND=noninteractive
apt-get -qy update
#apt-get -y -o DPkg::options::="--force-confdef" -o DPkg::options::="--force-confold"  install grub-pc
#apt -y upgrade

# utils
apt -yq install jq htop atop iotop iftop iperf3 dstat
# bwm bmon-ng cbm nethogs ntop
cd /usr/local/bin; curl https://getmic.ro | bash

# docker
curl https://get.docker.com/ | bash

# sysdig
#curl -s https://s3.amazonaws.com/download.draios.com/stable/install-sysdig | bash

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
#docker run --rm --privileged=true --entrypoint /runc-entry-point.sh -v /opt/pwx:/opt/pwx -v /etc/pwx:/etc/pwx portworx/px-enterprise:1.3.4
#/opt/pwx/bin/px-runc install -c $(cat /proc/sys/kernel/random/uuid | cut -f1 -d-) -k etcd://etcdv3-02.portworx.com:2379 -a -f
#/opt/pwx/bin/px-runc install -c asnw3457 -k etcd://etcdv3-02.portworx.com:2379 -a -f
#systemctl enable portworx
#systemctl start portworx

touch /var/lib/cloud/instance/user-init-finished

