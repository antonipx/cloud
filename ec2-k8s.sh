#!/bin/bash
#
# create 3 nodes kubernetes cluster + master on ec2
#

m="asxm"
s="asx1 asx2 asx3"

type="t2.medium" data_size="" ./ec2 create $m
./ec2 ssh $m < run/k8s-master
join=$(./ec2 ssh $m "cat /tmp/kubeadm-join.sh")

for n in $s
do 
    type="t2.medium" ./ec2 create $n
    ./ec2 ssh $n < run/k8s-node
    ./ec2 ssh $n "sudo $join"
done

./ec2 ssh $m < run/instk8spx
