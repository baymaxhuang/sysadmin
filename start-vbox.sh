#!/bin/bash
LISTVMs=$(VBoxManage list vms | awk '{print $NF}')
for VM in $LISTVMs; do
  UUID=$(VBoxManage list runningvms | awk '{print $NF}'| grep $VM | grep -v grep)
  #echo "$UUID is already running"
  [ -z "$UUID" ] && VBoxManage startvm $VM -type vrdp
done
VBoxManage list runningvms | awk '{print $0,"is running"}'
