#!/bin/bash
address=$1
[ -z "$address" ] && echo "Null address is not allowed!" >&2 && exit 1
name="IPL$address"
sed -i.bak -e "s/127.0.1.1.*/127.0.1.1       $name/g" /etc/hosts
echo $name > /etc/hostname
hostname $name
#add sdn users
username="sdn"
useradd -s /bin/bash -m $username
echo "$username:123456"  | chpasswd
echo "User $username password is changed!"
touch /etc/sudoers.d/sdn && echo "sdn    ALL=(ALL:ALL) ALL" > /etc/sudoers.d/sdn
sudo chmod 440 /etc/sudoers.d/sdn
