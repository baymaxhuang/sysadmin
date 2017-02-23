#!/bin/bash
user="sdn"
password="123456"
for ip in $(cat host | awk '{print $0}'); do
    remote="$user@$ip"
    sshpass -p $password ssh -o StrictHostKeyChecking=no $remote  "
        echo "ssh to host $ip successfully!"
        echo $password | sudo -S touch test-file 1> /dev/null
    "
    echo -e "\n$?"
done
