#!/bin/bash
echo "Will only work as root/sudo"
read -p "Enter new port number: " num
/bin/sed -i "s/^Port.*/Port $num/g" /etc/ssh/sshd_config
