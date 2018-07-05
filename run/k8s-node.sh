sudo -i
apt-get update && apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF
apt-get update
#apt-get install -y kubelet kubeadm kubectl
apt-get install -y kubelet=1.9.3-00 kubeadm=1.9.3-00 kubectl=1.9.3-00
sed -i "s/KUBELET_KUBECONFIG_ARGS=/KUBELET_KUBECONFIG_ARGS=--cgroup-driver=cgroupfs /g" /etc/systemd/system/kubelet.service.d/10-kubeadm.conf
systemctl daemon-reload
systemctl restart kubelet
