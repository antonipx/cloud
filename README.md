Shell hacks to manage cloud instances
=====================================

Scripts
-------
* az - azure
* ec2 - aws ec2
* esx - vmware esx (unfinished)
* gcp - google
* gke - googke k8s


Usage
-----
```
./script create|delete|ssh|list|setup <name>

create - creates instance with owner tag
delete - deletes instance
ssh    - ssh to instance
list   - list owned instances
setup  - installs the cloud provider
```

Examples
--------
```
./ec2 create foobar
./ec2 list
./ec2 ssh foobar
./ec2 delete foobar
```

## To create specific instance / disk type
`type="m5.4xlarge" data_size="256" data_type="io1" data_iops="1500" ./ec2 create foobar`

## Create instance with 4 disks
`data_size="200 200 200 220" ./ec2 create foobar`

## If you don't want any data disks set it to empty string ""
`disks="" ./ec2 create foobar`

## Use specific owner
`owner="bob" ./ec2 create foobar`
`owner="bob" ./ec2 list`

## To run specific commands on a node
`./ec2 ssh foobar cat /etc/passwd`

## To install Portworx on a bunch of nodes
`for n in {0..7}; do ./ec2 ssh foobar$n < run/instpx; done`

## To install Kubernetes cluster with Portworx
see [k8s](https://github.com/antonipx/cloud/blob/master/k8s) example script


Remarks
-------
* esx is not finished (TODO)
* delete command will delete any node regardless of ownership
* az does not support multiple disks (TODO)
