#!/bin/bash
#
# create 3 nodes kubernetes cluster + master on ec2
#

m="asm"
s="as1 as2 as3"

type="t2.micro" data_size="" ./ec2 create $m
./ec2 ssh $m < run/k8s-master.sh
join=$(./ec2 ssh $m "cat /tmp/kubeadm-join.sh")

for n in $s
do 
    type="t2.medium" ./ec2 create $n
    ./ec2 ssh $n < run/k8s-node.sh
    ./ec2 ssh $n "sudo $join"
done

./ec2 ssh $m < run/instk8spx
