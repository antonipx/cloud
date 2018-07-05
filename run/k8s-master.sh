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
kubeadm init | tee /tmp/kubeadm-init.log
grep 'kubeadm join' /tmp/kubeadm-init.log > /tmp/kubeadm-join.sh
mkdir -p $HOME/.kube
cp -fi /etc/kubernetes/admin.conf $HOME/.kube/config
chown $(id -u):$(id -g) $HOME/.kube/config
#kubectl apply -f https://docs.projectcalico.org/v3.0/getting-started/kubernetes/installation/hosted/kubeadm/1.7/calico.yaml
#kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
